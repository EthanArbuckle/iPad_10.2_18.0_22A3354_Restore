@implementation UIContinuousPathIntroductionView

- (id)textTitleDescriptions
{
  return &unk_1E1A92930;
}

- (id)textBodyDescriptions
{
  void *v2;
  unint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "verticalSizeClass") == 1)
  {
    v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

    if (v3 != 1)
      return &unk_1E1A92948;
  }
  else
  {

  }
  _UILocalizedStringInSystemLanguage(CFSTR("Slide your finger across the letters to compose a word"), CFSTR("Speed up your typing by sliding your finger across the letters to compose a word."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mediaContents
{
  UIView *v3;
  UIView *textVideoContainer;
  UIView *v5;
  UIView *v6;
  UIView *keyboardView;
  UIColor *v8;
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
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  UILabel *v30;
  UILabel *landscapeTextBody;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIButton *v37;
  UIButton *landscapeButton;
  UIButton *v39;
  void *v40;
  UIButton *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  UILayoutGuide *v49;
  void *v50;
  UILayoutGuide *v51;
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
  void *v65;
  void *v66;
  void *v67;
  double v68;
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
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
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
  UILayoutGuide *v115;
  UILayoutGuide *v116;
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
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _QWORD v151[5];
  _QWORD v152[13];

  v152[11] = *MEMORY[0x1E0C80C00];
  -[UIContinuousPathIntroductionView setupConstraintData](self, "setupConstraintData");
  if (!self->_textVideoContainer)
  {
    v3 = objc_alloc_init(UIView);
    textVideoContainer = self->_textVideoContainer;
    self->_textVideoContainer = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textVideoContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  if (!self->_keyboardView)
  {
    v5 = [UIView alloc];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), self->_videoSize.width, self->_videoSize.height);
    keyboardView = self->_keyboardView;
    self->_keyboardView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_keyboardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.12);
    -[UIView setBackgroundColor:](self->_keyboardView, "setBackgroundColor:", v8);

    -[UIView layer](self->_keyboardView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 10.0);

    -[UIView layer](self->_keyboardView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_keyboardView);

    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIContinuousPathIntroductionView videoWidth](self, "videoWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToConstant:", self->_videoSize.width);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContinuousPathIntroductionView setVideoWidth:](self, "setVideoWidth:", v20);

      -[UIContinuousPathIntroductionView videoWidth](self, "videoWidth");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
    -[UIContinuousPathIntroductionView videoHeight](self, "videoHeight");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "heightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToConstant:", self->_videoSize.height);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContinuousPathIntroductionView setVideoHeight:](self, "setVideoHeight:", v25);

      -[UIContinuousPathIntroductionView videoHeight](self, "videoHeight");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

    }
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1144750080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 1, v28);

  }
  -[UIContinuousPathIntroductionView updateVideoLayerWithNewVideo:](self, "updateVideoLayerWithNewVideo:", 1);
  -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v30 = objc_alloc_init(UILabel);
    landscapeTextBody = self->_landscapeTextBody;
    self->_landscapeTextBody = v30;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_landscapeTextBody, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_landscapeTextBody, "setBackgroundColor:", v32);

    -[UIKBTutorialModalDisplay textBodyFont](self, "textBodyFont");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_landscapeTextBody, "setFont:", v33);

    -[UILabel setNumberOfLines:](self->_landscapeTextBody, "setNumberOfLines:", 4);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_landscapeTextBody, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](self->_landscapeTextBody, "setTextAlignment:", 4);
    _UILocalizedStringInSystemLanguage(CFSTR("Slide your finger across the letters to compose a word"), CFSTR("Speed up your typing by sliding your finger across the letters to compose a word."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_landscapeTextBody, "setText:", v34);

    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", self->_landscapeTextBody);

  }
  -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v37 = (UIButton *)objc_claimAutoreleasedReturnValue();
    landscapeButton = self->_landscapeButton;
    self->_landscapeButton = v37;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_landscapeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v39 = self->_landscapeButton;
    -[UIKBTutorialModalDisplay buttonTitle](self, "buttonTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v39, "setTitle:forState:", v40, 0);

    v41 = self->_landscapeButton;
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v41, "setTitleColor:forState:", v42, 0);

    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 18.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_landscapeButton, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFont:", v43);

    -[UIControl addTarget:action:forControlEvents:](self->_landscapeButton, "addTarget:action:forControlEvents:", self, sel_extraButtonTapAction, 64);
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", self->_landscapeButton);

    -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1144766464;
    objc_msgSend(v46, "setContentCompressionResistancePriority:forAxis:", 1, v47);

  }
  -[UIContinuousPathIntroductionView landscapeConstraints](self, "landscapeConstraints");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    v49 = objc_alloc_init(UILayoutGuide);
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addLayoutGuide:", v49);

    v51 = objc_alloc_init(UILayoutGuide);
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addLayoutGuide:", v51);

    -[UILayoutGuide topAnchor](v49, "topAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "topAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:", v144);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v142;
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "topAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v49;
    -[UILayoutGuide bottomAnchor](v49, "bottomAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "constraintEqualToAnchor:", v136);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v152[1] = v134;
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "leadingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "trailingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:constant:", v126, 24.0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v152[2] = v124;
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "widthAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "widthAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:multiplier:", v120, 1.1);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v152[3] = v119;
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "centerYAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "centerYAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:constant:", v113, 0.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v152[4] = v112;
    -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, 16.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v152[5] = v107;
    v116 = v51;
    -[UILayoutGuide topAnchor](v51, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v104);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v152[6] = v103;
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v51, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v152[7] = v99;
    -[UILayoutGuide heightAnchor](v51, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](v49, "heightAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v152[8] = v96;
    -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v152[9] = v55;
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:multiplier:", v59, 3.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v152[10] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 11);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView setLandscapeConstraints:](self, "setLandscapeConstraints:", v61);

  }
  -[UIContinuousPathIntroductionView portraitConstraints](self, "portraitConstraints");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
  {
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, self->_paddingAdjust);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v68) = 1132068864;
    v149 = v67;
    objc_msgSend(v67, "setPriority:", v68);
    v151[0] = v67;
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "topAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "topAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintLessThanOrEqualToAnchor:constant:", v141, self->_paddingAdjust);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v139;
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "topAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintGreaterThanOrEqualToAnchor:constant:", v131, 6.0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v129;
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "bottomAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v151[3] = v71;
    -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "widthAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v151[4] = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 5);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView setPortraitConstraints:](self, "setPortraitConstraints:", v77);

  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v78, "interfaceOrientation") - 3) > 1)
  {

    goto LABEL_21;
  }
  v79 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

  if (v79 == 1)
  {
LABEL_21:
    -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setHidden:", 1);

    -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setHidden:", 1);

    v88 = (void *)MEMORY[0x1E0D156E0];
    -[UIContinuousPathIntroductionView landscapeConstraints](self, "landscapeConstraints");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "deactivateConstraints:", v89);

    v84 = (void *)MEMORY[0x1E0D156E0];
    -[UIContinuousPathIntroductionView portraitConstraints](self, "portraitConstraints");
    v85 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setHidden:", 0);

  -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setHidden:", 0);

  v82 = (void *)MEMORY[0x1E0D156E0];
  -[UIContinuousPathIntroductionView portraitConstraints](self, "portraitConstraints");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "deactivateConstraints:", v83);

  v84 = (void *)MEMORY[0x1E0D156E0];
  -[UIContinuousPathIntroductionView landscapeConstraints](self, "landscapeConstraints");
  v85 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v90 = (void *)v85;
  objc_msgSend(v84, "activateConstraints:", v85);

  -[UIContinuousPathIntroductionView textVideoContainer](self, "textVideoContainer");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  return v92;
}

- (UIView)textVideoContainer
{
  return self->_textVideoContainer;
}

- (UIView)keyboardView
{
  return self->_keyboardView;
}

- (UILabel)landscapeTextBody
{
  return self->_landscapeTextBody;
}

- (UIButton)landscapeButton
{
  return self->_landscapeButton;
}

- (NSLayoutConstraint)videoWidth
{
  return self->_videoWidth;
}

- (NSLayoutConstraint)videoHeight
{
  return self->_videoHeight;
}

- (NSArray)portraitConstraints
{
  return self->_portraitConstraints;
}

- (NSArray)landscapeConstraints
{
  return self->_landscapeConstraints;
}

- (void)updateVideoLayerWithNewVideo:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  AVQueuePlayer *v14;
  AVQueuePlayer *player;
  void *v16;
  id v17;
  AVPlayerLooper *v18;
  AVPlayerLooper *playerLooper;
  void *v20;
  objc_class *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  double width;
  double height;
  void *v38;
  AVQueuePlayer **p_player;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v4 = (void *)_MergedGlobals_3;
    v50 = _MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = (uint64_t)__getAVAssetClass_block_invoke;
      v45 = &unk_1E16B14C0;
      v46 = &v47;
      __getAVAssetClass_block_invoke((uint64_t)&v42);
      v4 = (void *)v48[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v47, 8);
    -[UIContinuousPathIntroductionView _introductionMovieAssetURL](self, "_introductionMovieAssetURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v8 = (void *)qword_1ECD7A480;
    v50 = qword_1ECD7A480;
    if (!qword_1ECD7A480)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = (uint64_t)__getAVPlayerItemClass_block_invoke;
      v45 = &unk_1E16B14C0;
      v46 = &v47;
      __getAVPlayerItemClass_block_invoke((uint64_t)&v42);
      v8 = (void *)v48[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v47, 8);
    objc_msgSend(v9, "playerItemWithAsset:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v11 = (void *)qword_1ECD7A488;
    v50 = qword_1ECD7A488;
    if (!qword_1ECD7A488)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = (uint64_t)__getAVQueuePlayerClass_block_invoke;
      v45 = &unk_1E16B14C0;
      v46 = &v47;
      __getAVQueuePlayerClass_block_invoke((uint64_t)&v42);
      v11 = (void *)v48[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v47, 8);
    v51[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queuePlayerWithItems:", v13);
    v14 = (AVQueuePlayer *)objc_claimAutoreleasedReturnValue();
    player = self->_player;
    self->_player = v14;

    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v16 = (void *)qword_1ECD7A490;
    v50 = qword_1ECD7A490;
    if (!qword_1ECD7A490)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = (uint64_t)__getAVPlayerLooperClass_block_invoke;
      v45 = &unk_1E16B14C0;
      v46 = &v47;
      __getAVPlayerLooperClass_block_invoke((uint64_t)&v42);
      v16 = (void *)v48[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v47, 8);
    objc_msgSend(v17, "playerLooperWithPlayer:templateItem:", self->_player, v10);
    v18 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
    playerLooper = self->_playerLooper;
    self->_playerLooper = v18;

    -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_player, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v20 = (void *)qword_1ECD7A498;
    v50 = qword_1ECD7A498;
    if (!qword_1ECD7A498)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = (uint64_t)__getAVAudioSessionClass_block_invoke;
      v45 = &unk_1E16B14C0;
      v46 = &v47;
      __getAVAudioSessionClass_block_invoke((uint64_t)&v42);
      v20 = (void *)v48[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v47, 8);
    v22 = (void *)objc_msgSend([v21 alloc], "initAuxiliarySession");
    v42 = 0;
    v43 = (uint64_t)&v42;
    v44 = 0x2020000000;
    v23 = (_QWORD *)qword_1ECD7A4A0;
    v45 = (void *)qword_1ECD7A4A0;
    if (!qword_1ECD7A4A0)
    {
      v24 = AVFoundationLibrary();
      v23 = dlsym(v24, "AVAudioSessionCategoryAmbient");
      *(_QWORD *)(v43 + 24) = v23;
      qword_1ECD7A4A0 = (uint64_t)v23;
    }
    _Block_object_dispose(&v42, 8);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVAudioSessionCategoryAmbient(void)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("UIContinuousPathIntroductionView.m"), 28, CFSTR("%s"), dlerror(), v42);

      __break(1u);
    }
    objc_msgSend(v22, "setCategory:error:", *v23, 0);
    -[AVQueuePlayer setAudioSession:](self->_player, "setAudioSession:", v22);
    -[UIContinuousPathIntroductionView videoLayer](self, "videoLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[UIContinuousPathIntroductionView videoLayer](self, "videoLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeFromSuperlayer");

    }
  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v27 = (void *)qword_1ECD7A4A8;
  v50 = qword_1ECD7A4A8;
  if (!qword_1ECD7A4A8)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = (uint64_t)__getAVPlayerLayerClass_block_invoke;
    v45 = &unk_1E16B14C0;
    v46 = &v47;
    __getAVPlayerLayerClass_block_invoke((uint64_t)&v42);
    v27 = (void *)v48[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v47, 8);
  objc_msgSend(v28, "playerLayerWithPlayer:", self->_player);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContinuousPathIntroductionView setVideoLayer:](self, "setVideoLayer:", v29);

  -[UIContinuousPathIntroductionView videoLayer](self, "videoLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superlayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v32)
  {
    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView videoLayer](self, "videoLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSublayer:", v35);

  }
  width = self->_videoSize.width;
  height = self->_videoSize.height;
  -[UIContinuousPathIntroductionView videoLayer](self, "videoLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", 0.0, 0.0, width, height);

  p_player = &self->_player;
  -[AVQueuePlayer advanceToNextItem](*p_player, "advanceToNextItem");
  -[AVQueuePlayer play](*p_player, "play");
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (int64_t)textBodyMaxLines
{
  return 3;
}

- (void)setupConstraintData
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  id v18;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[UIKBTutorialModalDisplay safeAreaInsets](self, "safeAreaInsets");
  if (v7 > 0.0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v3, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9 > 0.0;

  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    self->_textMargin = 20.0;
    v11 = 512;
    v12 = 0x4018000000000000;
LABEL_15:
    *(Class *)((char *)&self->super.super.super.super.isa + v11) = (Class)v12;
LABEL_16:
    v16 = 149.0;
    goto LABEL_25;
  }
  if ((unint64_t)(objc_msgSend(v18, "interfaceOrientation") - 3) > 1
    || (-[UIView traitCollection](self, "traitCollection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "verticalSizeClass"),
        v13,
        v14 == 2))
  {
    v11 = 504;
    self->_textMargin = 50.0;
    if (v10)
      self->_paddingAdjust = 34.0;
    if (v6 <= 320.0)
    {
      v12 = 0x4034000000000000;
      goto LABEL_15;
    }
    if (v6 > 375.0)
    {
      v15 = !v10;
      v16 = 164.0;
      v17 = 207.0;
      goto LABEL_23;
    }
    v15 = !v10;
    v16 = 155.0;
  }
  else
  {
    if (v6 <= 568.0)
      goto LABEL_16;
    if (v6 <= 667.0)
    {
      v16 = 155.0;
      goto LABEL_25;
    }
    if (v6 > 812.0)
    {
      v16 = 207.0;
      goto LABEL_25;
    }
    v15 = !v10;
    v16 = 164.0;
  }
  v17 = 202.0;
LABEL_23:
  if (!v15)
    v16 = v17;
LABEL_25:
  self->_videoSize.width = v16;
  self->_videoSize.height = v16 * 0.6;

}

- (void)setVideoWidth:(id)a3
{
  objc_storeStrong((id *)&self->_videoWidth, a3);
}

- (void)setVideoLayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoLayer, a3);
}

- (void)setVideoHeight:(id)a3
{
  objc_storeStrong((id *)&self->_videoHeight, a3);
}

- (void)setPortraitConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_portraitConstraints, a3);
}

- (void)setLandscapeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeConstraints, a3);
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[AVPlayerLooper disableLooping](self->_playerLooper, "disableLooping");
  -[AVQueuePlayer removeAllItems](self->_player, "removeAllItems");
  v3.receiver = self;
  v3.super_class = (Class)UIContinuousPathIntroductionView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (UIContinuousPathIntroductionView)initWithKeyboardAppearance:(int64_t)a3
{
  UIContinuousPathIntroductionView *v3;
  UIContinuousPathIntroductionView *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIContinuousPathIntroductionView;
  v3 = -[UIKBTutorialModalDisplay initWithKeyboardAppearance:](&v11, sel_initWithKeyboardAppearance_, a3);
  v4 = v3;
  if (v3)
  {
    -[NSObject setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UIContinuousPathIntroductionView"));
    +[UIColor labelColor](UIColor, "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContinuousPathIntroductionView landscapeTextBody](v4, "landscapeTextBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)(objc_msgSend(v7, "interfaceOrientation") - 3) <= 1
      && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1;
    -[UIKBTutorialModalDisplay button](v4, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

  }
  return v4;
}

- (id)_introductionMovieAssetURL
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("Artwork.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIKBTutorialModalDisplay appearance](self, "appearance") == 1)
    v6 = CFSTR("UIKeyboardContinuousPathIntroductionDark");
  else
    v6 = CFSTR("UIKeyboardContinuousPathIntroductionLight");
  objc_msgSend(v5, "URLForResource:withExtension:", v6, CFSTR("mov"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoHeight, 0);
  objc_storeStrong((id *)&self->_videoWidth, 0);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_landscapeConstraints, 0);
  objc_storeStrong((id *)&self->_portraitConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeButton, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_landscapeTextBody, 0);
  objc_storeStrong((id *)&self->_textVideoContainer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  double width;
  void *v7;
  double height;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  -[UIView constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[AVQueuePlayer pause](self->_player, "pause");
    -[UIContinuousPathIntroductionView setupConstraintData](self, "setupConstraintData");
    width = self->_videoSize.width;
    -[UIContinuousPathIntroductionView videoWidth](self, "videoWidth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", width);

    height = self->_videoSize.height;
    -[UIContinuousPathIntroductionView videoHeight](self, "videoHeight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", height);

    -[UIContinuousPathIntroductionView keyboardView](self, "keyboardView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasDifferentColorAppearanceComparedToTraitCollection:", v30);

    if ((_DWORD)v12)
    {
      -[UIView traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceStyle") == 2)
        v14 = 1;
      else
        v14 = 2;
      -[UIKBTutorialModalDisplay setAppearance:](self, "setAppearance:", v14);

    }
    else
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        || (-[UIView traitCollection](self, "traitCollection"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "verticalSizeClass"),
            v15,
            v16 != 1))
      {
        -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHidden:", 1);

        -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setHidden:", 1);

        -[UIKBTutorialModalDisplay button](self, "button");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setHidden:", 0);

        v27 = (void *)MEMORY[0x1E0D156E0];
        -[UIContinuousPathIntroductionView landscapeConstraints](self, "landscapeConstraints");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deactivateConstraints:", v28);

        v22 = (void *)MEMORY[0x1E0D156E0];
        -[UIContinuousPathIntroductionView portraitConstraints](self, "portraitConstraints");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UIContinuousPathIntroductionView landscapeTextBody](self, "landscapeTextBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHidden:", 0);

        -[UIContinuousPathIntroductionView landscapeButton](self, "landscapeButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHidden:", 0);

        -[UIKBTutorialModalDisplay button](self, "button");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHidden:", 1);

        v20 = (void *)MEMORY[0x1E0D156E0];
        -[UIContinuousPathIntroductionView portraitConstraints](self, "portraitConstraints");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deactivateConstraints:", v21);

        v22 = (void *)MEMORY[0x1E0D156E0];
        -[UIContinuousPathIntroductionView landscapeConstraints](self, "landscapeConstraints");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v23;
      objc_msgSend(v22, "activateConstraints:", v23);

      -[UIKBTutorialModalDisplay updateMediaViewTextAndPlacement](self, "updateMediaViewTextAndPlacement");
    }
    -[UIContinuousPathIntroductionView updateVideoLayerWithNewVideo:](self, "updateVideoLayerWithNewVideo:", v12);
  }

}

- (double)mediaLayoutWidthAdjustment
{
  void *v3;
  unint64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "verticalSizeClass") == 1)
  {
    v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

    if (v4 != 1)
      return self->_videoSize.width + self->_videoSize.width;
  }
  else
  {

  }
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    return -148.0;
  else
    return -(50.0 - self->_textMargin);
}

- (void)extraButtonTapAction
{
  void *v2;
  void *v3;

  -[UIContinuousPathIntroductionView removeFromSuperview](self, "removeFromSuperview");
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTriggerOneTimeAction:", *MEMORY[0x1E0DBDEE8]);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global);
}

void __56__UIContinuousPathIntroductionView_extraButtonTapAction__block_invoke()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissContinuousPathIntroductionView");

}

- (void)setTextVideoContainer:(id)a3
{
  objc_storeStrong((id *)&self->_textVideoContainer, a3);
}

- (void)setLandscapeTextBody:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeTextBody, a3);
}

- (void)setKeyboardView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardView, a3);
}

- (void)setLandscapeButton:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeButton, a3);
}

@end
