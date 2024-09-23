@implementation VTUIEnrollTrainingIntelligentLightView

- (VTUIEnrollTrainingIntelligentLightView)initWithFrame:(CGRect)a3
{
  VTUIEnrollTrainingIntelligentLightView *v3;
  VTUIEnrollTrainingIntelligentLightView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingIntelligentLightView;
  v3 = -[VTUIEnrollTrainingIntelligentLightView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollTrainingIntelligentLightView _setupUI](v3, "_setupUI");
  return v4;
}

- (void)_setupUI
{
  void *v3;
  id v4;
  void *v5;
  BSUICAPackageView *v6;
  BSUICAPackageView *lightView;
  SUICIntelligentLightLayer *v8;
  SUICIntelligentLightLayer *lightLayer;
  SUICIntelligentLightLayer *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _TtC14VoiceTriggerUI27GMEnrollmentTextViewManager *v26;
  _TtC14VoiceTriggerUI27GMEnrollmentTextViewManager *enrollmentTextViewManager;
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *v32;
  void *v33;
  uint64_t v34;
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _TtC14VoiceTriggerUI21GMEnrollmentViewModel *v39;
  _TtC14VoiceTriggerUI21GMEnrollmentViewModel *enrollmentViewModel;
  void *v41;
  void *v42;
  UILabel *v43;
  UILabel *statusLabel;
  void *v45;
  void *v46;
  UIButton *v47;
  UIButton *skipButton;
  UIButton *v49;
  void *v50;
  UIButton *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _QWORD v124[2];
  _QWORD v125[3];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[6];

  v128[4] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView readableContentGuide](self, "readableContentGuide");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc(MEMORY[0x24BE0BF18]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (BSUICAPackageView *)objc_msgSend(v4, "initWithPackageName:inBundle:", CFSTR("BurstEffectForLightLayer"), v5);
  lightView = self->_lightView;
  self->_lightView = v6;

  -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", self->_lightView);
  v8 = (SUICIntelligentLightLayer *)objc_alloc_init(MEMORY[0x24BEA85D0]);
  lightLayer = self->_lightLayer;
  self->_lightLayer = v8;

  v10 = self->_lightLayer;
  -[BSUICAPackageView bounds](self->_lightView, "bounds");
  -[SUICIntelligentLightLayer setFrame:](v10, "setFrame:");
  -[SUICIntelligentLightLayer setIsQuicktationPill:](self->_lightLayer, "setIsQuicktationPill:", 0);
  LODWORD(v11) = 0;
  -[SUICIntelligentLightLayer setMinimumPowerLevel:](self->_lightLayer, "setMinimumPowerLevel:", v11);
  -[SUICIntelligentLightLayer setColorPalette:](self->_lightLayer, "setColorPalette:", 104);
  -[SUICIntelligentLightLayer setPaused:](self->_lightLayer, "setPaused:", 0);
  -[BSUICAPackageView publishedObjectWithName:](self->_lightView, "publishedObjectWithName:", CFSTR("lightlayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSublayer:above:", self->_lightLayer, v12);

  v121 = v12;
  objc_msgSend(v12, "removeFromSuperlayer");
  -[VTUIEnrollTrainingIntelligentLightView bounds](self, "bounds");
  v15 = v14;
  -[VTUIEnrollTrainingIntelligentLightView bounds](self, "bounds");
  *(float *)&v15 = (v15 - v16) * 0.5;
  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v110 = (void *)MEMORY[0x24BDD1628];
  -[BSUICAPackageView topAnchor](self->_lightView, "topAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView topAnchor](self, "topAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v115;
  -[BSUICAPackageView bottomAnchor](self->_lightView, "bottomAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView bottomAnchor](self, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v128[1] = v18;
  -[BSUICAPackageView trailingAnchor](self->_lightView, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, *(float *)&v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v128[2] = v21;
  -[BSUICAPackageView leadingAnchor](self->_lightView, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView leadingAnchor](self, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, (float)-*(float *)&v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v128[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "activateConstraints:", v25);

  v26 = (_TtC14VoiceTriggerUI27GMEnrollmentTextViewManager *)objc_opt_new();
  enrollmentTextViewManager = self->_enrollmentTextViewManager;
  self->_enrollmentTextViewManager = v26;

  v28 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  objc_msgSend(v123, "instructionPreAndPostfixFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_SAY_FIRST"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[GMEnrollmentTextModel initWithFont:label:hidden:](v28, "initWithFont:label:hidden:", v29, v30, 0);

  v32 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  objc_msgSend(v123, "instructionLabelFont");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[GMEnrollmentTextModel initWithFont:label:hidden:](v32, "initWithFont:label:hidden:", v33, &stru_24F340078, 0);

  v35 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  objc_msgSend(v123, "instructionPreAndPostfixFont");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_TO_FIRST"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[GMEnrollmentTextModel initWithFont:label:hidden:](v35, "initWithFont:label:hidden:", v36, v37, 0);

  v118 = (void *)v34;
  v120 = (void *)v31;
  v116 = (void *)v38;
  v39 = -[GMEnrollmentViewModel initWithPrelude:instruction:continuation:]([_TtC14VoiceTriggerUI21GMEnrollmentViewModel alloc], "initWithPrelude:instruction:continuation:", v31, v34, v38);
  enrollmentViewModel = self->_enrollmentViewModel;
  self->_enrollmentViewModel = v39;

  -[GMEnrollmentTextViewManager createViewControllerWithEnrollmentViewModel:](self->_enrollmentTextViewManager, "createViewControllerWithEnrollmentViewModel:", self->_enrollmentViewModel);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBackgroundColor:", v42);

  -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", v41);
  v43 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v43;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 1);
  objc_msgSend(v123, "instructionLabelFont");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_statusLabel, "setFont:", v45);

  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_statusLabel, "setTextColor:", v46);

  -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", self->_statusLabel);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v47 = (UIButton *)objc_claimAutoreleasedReturnValue();
  skipButton = self->_skipButton;
  self->_skipButton = v47;

  v49 = self->_skipButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v49, "setTitleColor:forState:", v50, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = self->_skipButton;
  objc_msgSend(v123, "VTUIDeviceSpecificString:", CFSTR("BUTTON_SET_UP_LATER"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v51, "setTitle:forState:", v52, 0);

  -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", self->_skipButton);
  v97 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v41, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "instructionOffsetFromTopTrainingForGM");
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v102);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v99;
  objc_msgSend(v41, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v55;
  objc_msgSend(v41, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "activateConstraints:", v59);

  LODWORD(v60) = 1148846080;
  objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 1, v60);
  v100 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_statusLabel, "topAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v41;
  objc_msgSend(v41, "topAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v103);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v61;
  -[UILabel leadingAnchor](self->_statusLabel, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v64;
  -[UILabel trailingAnchor](self->_statusLabel, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v67;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v126, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "activateConstraints:", v68);

  v98 = (void *)MEMORY[0x24BDD1628];
  -[UIButton leftAnchor](self->_skipButton, "leftAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "leftAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v104);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v101;
  -[UIButton rightAnchor](self->_skipButton, "rightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "rightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v71;
  -[UIButton bottomAnchor](self->_skipButton, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "footerSkipButtonBaselineFromBottom");
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, -v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "activateConstraints:", v77);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("radarBug"), v78, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "imageWithRenderingMode:", 2);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEA84F8], "buttonWithImageTemplate:style:", v109, 0);
    v80 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
    radarButton = self->_radarButton;
    self->_radarButton = v80;

    -[SiriUIContentButton setTranslatesAutoresizingMaskIntoConstraints:](self->_radarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "colorWithAlphaComponent:", 0.6);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setDefaultColorForTemplate:](self->_radarButton, "setDefaultColorForTemplate:", v83);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "colorWithAlphaComponent:", 0.2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setHighlightColorForTemplate:](self->_radarButton, "setHighlightColorForTemplate:", v85);

    -[VTUIEnrollTrainingIntelligentLightView setRadarButtonHidden:](self, "setRadarButtonHidden:", 0);
    -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", self->_radarButton);
    v108 = (void *)MEMORY[0x24BDD1628];
    -[SiriUIContentButton trailingAnchor](self->_radarButton, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingIntelligentLightView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "radarBtnHorizontalPadding");
    objc_msgSend(v86, "constraintEqualToAnchor:constant:", v88, -v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v124[0] = v90;
    -[SiriUIContentButton bottomAnchor](self->_radarButton, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingIntelligentLightView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "radarBtnVerticalPadding");
    objc_msgSend(v91, "constraintEqualToAnchor:constant:", v93, -v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v95;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "activateConstraints:", v96);

  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VTUIEnrollTrainingIntelligentLightView;
  -[VTUIEnrollTrainingIntelligentLightView dealloc](&v2, sel_dealloc);
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

  -[VTUIEnrollTrainingIntelligentLightView addSubview:](self, "addSubview:", self->_radarExitButton);
  v21 = (void *)MEMORY[0x24BDD1628];
  -[UIButton leftAnchor](self->_radarExitButton, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView readableContentGuide](self, "readableContentGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  -[UIButton rightAnchor](self->_radarExitButton, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView readableContentGuide](self, "readableContentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  -[UIButton bottomAnchor](self->_radarExitButton, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingIntelligentLightView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
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

- (void)setRadarButtonHidden:(BOOL)a3
{
  -[SiriUIContentButton setHidden:](self->_radarButton, "setHidden:", a3);
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__VTUIEnrollTrainingIntelligentLightView_slideInText_afterDelay_completion___block_invoke;
  block[3] = &unk_24F33E238;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

}

uint64_t __76__VTUIEnrollTrainingIntelligentLightView_slideInText_afterDelay_completion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "enrollmentViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIntructionLabel:", *(_QWORD *)(a1 + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)clearInstructionLabel
{
  id v2;

  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIntructionLabel:", &stru_24F340078);

}

- (void)setPreludeLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreludeLabel:", v4);

}

- (void)setContinuationLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContinuationLabel:", v4);

}

- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContinuationLabelHidden:", v3);

  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreludeLabelHidden:", v3);

}

- (void)setPreludeLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreludeLabelHidden:", v3);

}

- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;

  v4 = a3;
  if (a4)
  {
    v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
      -[VTUIEnrollTrainingIntelligentLightView setContinuationLabelHidden:animated:].cold.1(v6);
  }
  -[VTUIEnrollTrainingIntelligentLightView enrollmentViewModel](self, "enrollmentViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContinuationLabelHidden:", v4);

}

- (void)animateSuccessfulStepWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  -[BSUICAPackageView setState:animated:](self->_lightView, "setState:animated:", CFSTR("State 1"), 1);
  v5 = dispatch_time(0, 1000000000);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__VTUIEnrollTrainingIntelligentLightView_animateSuccessfulStepWithCompletion___block_invoke;
  v6[3] = &unk_24F33DA00;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);
  v4[2](v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __78__VTUIEnrollTrainingIntelligentLightView_animateSuccessfulStepWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "lightView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setState:animated:", CFSTR("State 2"), 0);

    WeakRetained = v3;
  }

}

- (BOOL)skipButtonHidden
{
  return self->_skipButtonHidden;
}

- (BOOL)radarButtonHidden
{
  return self->_radarButtonHidden;
}

- (SUICIntelligentLightLayer)lightLayer
{
  return self->_lightLayer;
}

- (void)setLightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_lightLayer, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
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

- (SiriUIContentButton)radarButton
{
  return self->_radarButton;
}

- (void)setRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_radarButton, a3);
}

- (VTUIPagedLabel)instructionPagedLabel
{
  return self->_instructionPagedLabel;
}

- (void)setInstructionPagedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionPagedLabel, a3);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (_TtC14VoiceTriggerUI27GMEnrollmentTextViewManager)enrollmentTextViewManager
{
  return self->_enrollmentTextViewManager;
}

- (void)setEnrollmentTextViewManager:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentTextViewManager, a3);
}

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)enrollmentViewModel
{
  return self->_enrollmentViewModel;
}

- (void)setEnrollmentViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentViewModel, a3);
}

- (BSUICAPackageView)lightView
{
  return self->_lightView;
}

- (void)setLightView:(id)a3
{
  objc_storeStrong((id *)&self->_lightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightView, 0);
  objc_storeStrong((id *)&self->_enrollmentViewModel, 0);
  objc_storeStrong((id *)&self->_enrollmentTextViewManager, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radarExitButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_lightLayer, 0);
}

- (void)setContinuationLabelHidden:(os_log_t)log animated:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[VTUIEnrollTrainingIntelligentLightView setContinuationLabelHidden:animated:]";
  _os_log_error_impl(&dword_229EF7000, log, OS_LOG_TYPE_ERROR, "%s Hiding countinuation label with animation is not supported", (uint8_t *)&v1, 0xCu);
}

@end
