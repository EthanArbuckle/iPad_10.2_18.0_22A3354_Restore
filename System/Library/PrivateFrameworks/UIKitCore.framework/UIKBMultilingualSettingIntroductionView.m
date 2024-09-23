@implementation UIKBMultilingualSettingIntroductionView

+ (BOOL)shouldShowIntroductionForInputMode:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v11;
  int v12;
  void *v13;
  int v14;

  v3 = a3;
  if (_os_feature_enabled_impl() && !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0)
    {
      LOBYTE(v4) = 0;
LABEL_17:

      goto LABEL_18;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isMinimized") & 1) != 0)
    {
      LOBYTE(v4) = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v6, "keyboardStateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "canShowPredictionBar"))
    {
      LOBYTE(v4) = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v7, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isSecureTextEntry") & 1) == 0)
    {
      v9 = objc_msgSend(v8, "keyboardType");
      LOBYTE(v4) = 0;
      if (v9 <= 0xB && ((1 << v9) & 0x930) != 0 || v9 == 127)
        goto LABEL_14;
      objc_msgSend(v3, "languageWithRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ko_KR"));

      if (v12)
      {
        if (_os_feature_enabled_impl() && (UIKeyboardInputModeIsKoreanEnglishBilingual(v3) & 1) == 0)
        {
          LOBYTE(v4) = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1;
          goto LABEL_14;
        }
      }
      else
      {
        objc_msgSend(v3, "languageWithRegion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("en_IN"));

        if (v14 && _os_feature_enabled_impl())
        {
          v4 = objc_msgSend(v3, "isMultiscript") ^ 1;
          goto LABEL_14;
        }
      }
    }
    LOBYTE(v4) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v4) = 0;
LABEL_18:

  return v4;
}

+ (id)displayTitle:(id)a3
{
  void *v3;
  int v4;
  __CFString *v5;

  objc_msgSend(a3, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ko_KR"));

  if (v4)
    v5 = CFSTR("Type Korean and English");
  else
    v5 = CFSTR("Type Multiple Languages");
  _UILocalizedStringInSystemLanguage(v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)displayDescription:(id)a3
{
  void *v3;
  int v4;
  __CFString *v5;

  objc_msgSend(a3, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ko_KR"));

  if (v4)
    v5 = CFSTR("Type both Korean and English on the same keyboard");
  else
    v5 = CFSTR("Type English and two other languages on the same keyboard");
  _UILocalizedStringInSystemLanguage(v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIKBMultilingualSettingIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIKBMultilingualSettingIntroductionView *v10;
  UIKBMultilingualSettingIntroductionView *v11;
  void *v12;
  _UIBackdropView *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  UILabel *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UILabel *v37;
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
  UIButton *v52;
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
  void *v68;
  void *v69;
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
  id v141;
  void *v142;
  objc_super v143;
  _QWORD v144[19];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v144[17] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v143.receiver = self;
  v143.super_class = (Class)UIKBMultilingualSettingIntroductionView;
  v10 = -[UIView initWithFrame:](&v143, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIKBMultilingualSettingIntroductionView setInputMode:](v10, "setInputMode:", v9);
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    -[UIView _inheritedRenderConfig](v11, "_inheritedRenderConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", objc_msgSend(v12, "backdropStyle"));
    -[UIKBMultilingualSettingIntroductionView setBackdropView:](v11, "setBackdropView:", v13);

    -[UIKBMultilingualSettingIntroductionView backdropView](v11, "backdropView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v14);

    objc_msgSend((id)objc_opt_class(), "displayTitle:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "displayDescription:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    _UILocalizedStringInSystemLanguage(CFSTR("Set Up in Settings"), CFSTR("Set Up in Settings"));
    v17 = objc_claimAutoreleasedReturnValue();
    _UILocalizedStringInSystemLanguage(CFSTR("Continue without Setting Up"), CFSTR("Continue without Setting Up"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v12;
    v141 = v9;
    if ((objc_msgSend(v12, "lightKeyboard") & 1) != 0)
      +[UIColor blackColor](UIColor, "blackColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = [UILabel alloc];
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v24 = -[UILabel initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
    -[UIKBMultilingualSettingIntroductionView setTitleLabel:](v11, "setTitleLabel:", v24);

    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v18);

    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextAlignment:", 1);

    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v15);

    objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 2, 2);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)v15;
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v138, 0.0);
    v137 = (void *)v18;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFont:", v29);

    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v31);

    v32 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v20, v21, v22, v23);
    -[UIKBMultilingualSettingIntroductionView setArtworkView:](v11, "setArtworkView:", v32);

    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    +[UIColor redColor](UIColor, "redColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:", v34);

    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v36);

    v37 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v20, v21, v22, v23);
    -[UIKBMultilingualSettingIntroductionView setDescriptionLabel:](v11, "setDescriptionLabel:", v37);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextColor:", v18);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTextAlignment:", 1);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)v16;
    objc_msgSend(v41, "setText:", v16);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFont:", v42);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setNumberOfLines:", 0);

    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v45);

    +[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setCornerStyle:", 3);
    v136 = v46;
    v98 = (void *)v17;
    objc_msgSend(v46, "setTitle:", v17);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView setSettingButton:](v11, "setSettingButton:", v47);

    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setConfiguration:", v46);

    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addTarget:action:forControlEvents:", v11, sel_settingButtonTapped, 64);

    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v51);

    v52 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v20, v21, v22, v23);
    -[UIKBMultilingualSettingIntroductionView setContinueButton:](v11, "setContinueButton:", v52);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTitle:forState:", v142, 0);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTitleColor:forState:", v56, 0);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTitleColor:forState:", v58, 0);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addTarget:action:forControlEvents:", v11, sel_continueButtonTapped, 64);

    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v60);

    v106 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "centerXAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:", v133);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v132;
    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "widthAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:multiplier:", v129, 0.7);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v128;
    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "topAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView titleLabel](v11, "titleLabel");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "bottomAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:constant:", v124, 6.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v123;
    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "centerXAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v120);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v144[3] = v119;
    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "widthAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:multiplier:", v116, 0.7);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v144[4] = v115;
    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "topAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView artworkView](v11, "artworkView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:constant:", v111, 6.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v144[5] = v110;
    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "centerXAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v107);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v144[6] = v105;
    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "widthAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:multiplier:", v102, 0.7);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v144[7] = v101;
    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView descriptionLabel](v11, "descriptionLabel");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:constant:", v95, 36.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v144[8] = v94;
    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "centerXAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v144[9] = v90;
    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "widthAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:multiplier:", v87, 0.7);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v144[10] = v86;
    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "heightAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToConstant:", 42.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v144[11] = v83;
    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView settingButton](v11, "settingButton");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 36.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v144[12] = v78;
    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "centerXAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v144[13] = v74;
    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:multiplier:", v71, 0.7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v144[14] = v61;
    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", 21.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v144[15] = v64;
    -[UIView bottomAnchor](v11, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualSettingIntroductionView continueButton](v11, "continueButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, 40.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v144[16] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 17);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "activateConstraints:", v69);

    v9 = v141;
  }

  return v11;
}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return objc_msgSend(a3, "backdropStyle");
}

- (void)settingButtonTapped
{
  void *v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMultilingualSettingTip");

  objc_msgSend(MEMORY[0x1E0DBDB40], "launchKeyboardSettings");
}

- (void)continueButtonTapped
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMultilingualSettingTip");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBMultilingualSettingIntroductionView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIKBMultilingualSettingIntroductionView _updateContainer](self, "_updateContainer");
}

- (void)_updateContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  id v40;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "_inputAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v5, "_inputAssistantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_showsScribbleIconsInAssistantView");

    if ((v12 & 1) == 0)
    {
      -[UIView _rootInputWindowController](self, "_rootInputWindowController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_inputAssistantView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {

  }
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_inputView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v14)
    objc_msgSend(v15, "_inputView");
  else
    objc_msgSend(v15, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = v7;
  objc_msgSend(v7, "topAnchor");
  v40 = (id)objc_claimAutoreleasedReturnValue();

  v17 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "_inputView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v22 = -fabs(v21);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v24 = fabs(v23);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v26 = -fabs(v25);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v28 = fabs(v27);
  }
  else
  {
    objc_msgSend(v18, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0.0;
    v22 = 0.0;
    v24 = 0.0;
    v28 = 0.0;
  }
  -[UIView topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v40, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIView bottomAnchor](self, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[UIView leftAnchor](self, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[UIView rightAnchor](self, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

}

- (UIKeyboardInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)settingButton
{
  return self->_settingButton;
}

- (void)setSettingButton:(id)a3
{
  objc_storeStrong((id *)&self->_settingButton, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_settingButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
