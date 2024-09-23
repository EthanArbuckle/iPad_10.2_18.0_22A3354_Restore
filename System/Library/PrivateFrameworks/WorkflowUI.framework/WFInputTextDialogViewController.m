@implementation WFInputTextDialogViewController

- (void)loadView
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  NSString *v14;
  NSString *placeholder;
  void *v16;
  NSString *v17;
  NSString *localizedIncompleteHintString;
  void *v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
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
  id v39;
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
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  WFKeyboardToolbarAccessoryView *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
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
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  unsigned int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  unsigned int v136;
  void *v137;
  void *v138;
  unsigned int v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  __CFString *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  void *v172;
  _QWORD v173[4];
  id v174;
  _QWORD v175[4];
  id v176;
  id location;
  objc_super v178;
  _QWORD v179[2];
  _QWORD v180[3];
  _QWORD v181[5];
  _QWORD v182[6];
  _QWORD v183[2];
  _QWORD v184[5];
  _QWORD v185[6];

  v185[4] = *MEMORY[0x24BDAC8D0];
  v178.receiver = self;
  v178.super_class = (Class)WFInputTextDialogViewController;
  -[WFCompactDialogViewController loadView](&v178, sel_loadView);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "setSecondaryText:", v2);

  objc_msgSend(v165, "setHidesContentViewTopSeparator:", 1);
  objc_msgSend(v168, "textFieldConfiguration");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "prefix");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "text");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "placeholder");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v172, "isSecureTextEntry");
  v124 = objc_msgSend(v172, "allowsNegativeNumbers");
  v139 = objc_msgSend(v172, "smartQuotesDisabled");
  v136 = objc_msgSend(v172, "smartDashesDisabled");
  objc_msgSend(v172, "keyboardType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = WFKeyboardTypeFromString();

  objc_msgSend(v172, "clearButtonMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = WFClearButtonModeFromString();

  objc_msgSend(v172, "autocapitalizationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = WFAutocapitalizationTypeFromString();

  objc_msgSend(v172, "autocorrectionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = WFAutocorrectionTypeFromString();

  objc_msgSend(v172, "returnKeyType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = WFReturnKeyTypeFromString();

  objc_msgSend(v172, "textContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFTextContentTypeFromString();
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v172, "textAlignment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = WFTextAlignmentFromString();

  if (-[__CFString length](v3, "length"))
  {
    v11 = v3;
    goto LABEL_10;
  }
  if (v148 == 3)
  {
    v12 = CFSTR("URL");
LABEL_8:
    WFLocalizedString(v12);
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!-[WFInputTextDialogViewController actingAsNumberField](self, "actingAsNumberField"))
  {
    v12 = CFSTR("Text");
    goto LABEL_8;
  }
  v13 = CFSTR("0");
LABEL_9:

  v11 = (__CFString *)v13;
LABEL_10:
  v153 = v11;
  v14 = (NSString *)-[__CFString copy](v11, "copy");
  placeholder = self->_placeholder;
  self->_placeholder = v14;

  self->_focusImmediatelyOnAppear = objc_msgSend(v172, "focusImmediatelyWhenPresented");
  self->_initialInsertionIndex = objc_msgSend(v172, "initialInsertionIndex");
  objc_msgSend(v172, "localizedIncompleteHintString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSString *)objc_msgSend(v16, "copy");
  localizedIncompleteHintString = self->_localizedIncompleteHintString;
  self->_localizedIncompleteHintString = v17;

  v164 = (void *)objc_opt_new();
  objc_msgSend(v164, "view");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v170, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsGroupBlending:", 0);

  v20 = 25.0;
  if ((objc_msgSend(v172, "isMultiline") & 1) == 0)
  {
    if (-[WFInputTextDialogViewController actingAsNumberField](self, "actingAsNumberField"))
      v20 = 25.0;
    else
      v20 = 18.0;
  }
  v169 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorWithAlphaComponent:", 0.07);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v22, "CGColor");
  objc_msgSend(v169, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  objc_msgSend(v169, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", v20);

  objc_msgSend(v169, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCompositingFilter:", v27);

  objc_msgSend(v170, "addSubview:", v169);
  objc_msgSend(v169, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v128 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v169, "topAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v162);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v185[0] = v156;
  objc_msgSend(v169, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -3.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v185[1] = v31;
  objc_msgSend(v169, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 14.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v185[2] = v34;
  objc_msgSend(v169, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -14.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v185[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v185, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "activateConstraints:", v38);

  if (objc_msgSend(v172, "isMultiline"))
  {
    v39 = objc_alloc(MEMORY[0x24BEBDA88]);
    v40 = (void *)objc_msgSend(v39, "initWithFrame:textContainer:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v40, "setText:", v155);
    objc_msgSend(v40, "setDelegate:", self);
    objc_msgSend(v40, "setSmartQuotesType:", v139);
    objc_msgSend(v40, "setSmartDashesType:", v136);
    objc_msgSend(v40, "setKeyboardType:", v148);
    objc_msgSend(v40, "setKeyboardAppearance:", 1);
    objc_msgSend(v40, "setAutocapitalizationType:", v134);
    objc_msgSend(v40, "setAutocorrectionType:", v132);
    objc_msgSend(v40, "setReturnKeyType:", v130);
    objc_msgSend(v40, "setTextContentType:", v154);
    objc_msgSend(v40, "setTextAlignment:", v143);
    -[WFInputTextDialogViewController styledFontForTextStyle:](self, "styledFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFont:", v41);

    objc_msgSend(v40, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBackgroundColor:", v42);

    objc_msgSend(v40, "textContainer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v40, "setTextContainerInset:", 14.0, 16.0, 14.0, 16.0);
    objc_msgSend(v40, "setScrollIndicatorInsets:", 16.0, 0.0, 16.0, 0.0);
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v170, "addSubview:", v40);
    objc_storeWeak((id *)&self->_textView, v40);
    -[WFInputTextDialogViewController updateTextViewPlaceholder](self, "updateTextViewPlaceholder");
    v137 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v40, "leadingAnchor");
    v167 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "leadingAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:constant:", v163, 14.0);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v157;
    objc_msgSend(v40, "trailingAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "trailingAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:constant:", v144, -14.0);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v184[1] = v140;
    objc_msgSend(v40, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintGreaterThanOrEqualToConstant:", 114.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v184[2] = v45;
    objc_msgSend(v40, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v184[3] = v48;
    objc_msgSend(v40, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -3.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v184[4] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v184, 5);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "activateConstraints:", v52);

  }
  else
  {
    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "setDelegate:", self);
    objc_msgSend(v40, "setText:", v155);
    objc_msgSend(v40, "setPlaceholder:", v153);
    objc_msgSend(v40, "setSecureTextEntry:", v125);
    objc_msgSend(v40, "setSmartQuotesType:", v139);
    objc_msgSend(v40, "setSmartDashesType:", v136);
    objc_msgSend(v40, "setKeyboardType:", v148);
    objc_msgSend(v40, "setKeyboardAppearance:", 1);
    objc_msgSend(v40, "setClearButtonMode:", v126);
    objc_msgSend(v40, "setAutocapitalizationType:", v134);
    objc_msgSend(v40, "setAutocorrectionType:", v132);
    objc_msgSend(v40, "setReturnKeyType:", v130);
    objc_msgSend(v40, "setTextContentType:", v154);
    objc_msgSend(v40, "setTextAlignment:", v143);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFont:", v53);

    objc_msgSend(v40, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v40, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);
    objc_msgSend(v170, "addSubview:", v40);
    objc_storeWeak((id *)&self->_textField, v40);
    if (-[WFInputTextDialogViewController actingAsNumberField](self, "actingAsNumberField"))
    {
      v54 = *MEMORY[0x24BEBE210];
      objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE210]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "fontDescriptorWithSymbolicTraits:", 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "fontDescriptorWithDesign:", *MEMORY[0x24BEBB578]);
      v167 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v167, 0.0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFont:", v57);

      objc_msgSend(v40, "setAdjustsFontSizeToFitWidth:", 1);
      objc_msgSend(v40, "setTextAlignment:", 1);
      objc_msgSend(v40, "setClearButtonMode:", 0);
      v58 = (void *)MEMORY[0x24BEBB528];
      objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE0A8]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v54, v59);
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v163, "pointSize");
      objc_msgSend(v40, "setMinimumFontSize:");
      if (v124)
      {
        if (-[WFInputTextDialogViewController useNumberValidation](self, "useNumberValidation"))
        {
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "userInterfaceIdiom") == 0;

          if (v61)
          {
            objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 7);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "configurationByApplyingConfiguration:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setTintColor:", v66);

            objc_msgSend(v65, "setContentEdgeInsets:", 0.0, 50.0, 0.0, 50.0);
            objc_msgSend(v65, "setAdjustsImageWhenHighlighted:", 0);
            objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("plus.forwardslash.minus"), v64);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setImage:forState:", v67, 0);

            objc_msgSend(v65, "addTarget:action:forControlEvents:", self, sel_negateText, 64);
            v68 = objc_alloc_init(WFKeyboardToolbarAccessoryView);
            objc_msgSend(v40, "setInputAccessoryView:", v68);
            -[WFKeyboardToolbarAccessoryView flexibleSpaceItem](v68, "flexibleSpaceItem");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFKeyboardToolbarAccessoryView appendBarItem:](v68, "appendBarItem:", v69);

            v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v65);
            -[WFKeyboardToolbarAccessoryView appendBarItem:](v68, "appendBarItem:", v70);

            -[WFKeyboardToolbarAccessoryView flexibleSpaceItem](v68, "flexibleSpaceItem");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFKeyboardToolbarAccessoryView appendBarItem:](v68, "appendBarItem:", v71);

          }
        }
      }
      if (v126)
      {
        v72 = (void *)MEMORY[0x24BEBD640];
        objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 2);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v73);
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD430], "systemButtonWithImage:target:action:", v158, self, sel_clearText);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setTintColor:", v75);

        objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v74, "setContentEdgeInsets:", 30.0, 0.0, 30.0, 0.0);
        objc_msgSend(v170, "addSubview:", v74);
        objc_storeWeak((id *)&self->_clearButton, v74);
        -[WFInputTextDialogViewController updateClearButtonVisibility](self, "updateClearButtonVisibility");
        objc_msgSend(v158, "size");
        v77 = v76;
        v78 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v74, "centerYAnchor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "centerYAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -1.5);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v183[0] = v81;
        objc_msgSend(v74, "trailingAnchor");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "trailingAnchor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, -28.0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v183[1] = v84;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v183, 2);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "activateConstraints:", v85);

        v86 = v77 + 22.0 + 14.0;
      }
      else
      {
        v86 = 14.0;
      }
      v127 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v40, "leadingAnchor");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "leadingAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "constraintGreaterThanOrEqualToAnchor:constant:", v152, 14.0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v182[0] = v146;
      objc_msgSend(v40, "leadingAnchor");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "leadingAnchor");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "constraintLessThanOrEqualToAnchor:constant:", v138, v86);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v182[1] = v135;
      objc_msgSend(v40, "trailingAnchor");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "trailingAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "constraintEqualToAnchor:constant:", v131, -v86);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v182[2] = v129;
      objc_msgSend(v40, "heightAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "constraintEqualToConstant:", 87.0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v182[3] = v110;
      objc_msgSend(v170, "topAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "topAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v182[4] = v113;
      objc_msgSend(v170, "bottomAnchor");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bottomAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "constraintEqualToAnchor:", v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v182[5] = v116;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 6);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "activateConstraints:", v117);

    }
    else
    {
      objc_msgSend(v40, "_setPrefix:", v147);
      if (objc_msgSend(v172, "showsDateFormattingHint"))
      {
        -[WFCompactPlatterViewController setPlatterHeightAnimationsDisabled:](self, "setPlatterHeightAnimationsDisabled:", 1);
        v87 = (void *)objc_opt_new();
        objc_msgSend(v87, "setDateStyle:", objc_msgSend(v172, "dateFormatStyle"));
        objc_msgSend(v87, "setTimeStyle:", objc_msgSend(v172, "timeFormatStyle"));
        objc_msgSend(v87, "setDoesRelativeDateFormatting:", objc_msgSend(v172, "doesRelativeDateFormatting"));
        -[WFInputTextDialogViewController setDateFormatter:](self, "setDateFormatter:", v87);
        v167 = objc_alloc_init(MEMORY[0x24BEBD708]);
        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "setFont:", v88);

        objc_msgSend(v167, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v167, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE098]);
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "setTextColor:", v89);

        objc_msgSend(v167, "setNumberOfLines:", 1);
        objc_msgSend(v167, "setTextAlignment:", v143);
        objc_msgSend(v167, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v167, "sizeToFit");
        objc_msgSend(v170, "addSubview:", v167);
        objc_msgSend(v170, "sendSubviewToBack:", v167);
        -[WFInputTextDialogViewController setHintLabel:](self, "setHintLabel:", v167);

      }
      else
      {
        v167 = 0;
      }
      objc_msgSend(v170, "heightAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToConstant:", 67.0);
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      v141 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v40, "leadingAnchor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "leadingAnchor");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "constraintEqualToAnchor:constant:", v150, 30.0);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v181[0] = v145;
      objc_msgSend(v40, "trailingAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "trailingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92, -30.0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v181[1] = v93;
      objc_msgSend(v40, "topAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "topAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v181[2] = v96;
      objc_msgSend(v40, "heightAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToConstant:", 51.0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v181[3] = v98;
      v181[4] = v163;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v181, 5);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "activateConstraints:", v99);

      if (v167)
      {
        -[WFInputTextDialogViewController setContentViewHeightAnchor:](self, "setContentViewHeightAnchor:", v163);
        v151 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v167, "topAnchor");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bottomAnchor");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "constraintEqualToAnchor:constant:", v100, -10.0);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v180[0] = v101;
        objc_msgSend(v167, "leadingAnchor");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "leadingAnchor");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "constraintEqualToAnchor:", v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v180[1] = v104;
        objc_msgSend(v167, "trailingAnchor");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "trailingAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "constraintEqualToAnchor:", v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v180[2] = v107;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v180, 3);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "activateConstraints:", v108);

        -[WFInputTextDialogViewController updateDateFormattingHint](self, "updateDateFormattingHint");
      }
      else
      {
        v167 = 0;
      }
    }
  }

  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v164);
  objc_initWeak(&location, self);
  objc_msgSend(v168, "cancelButton");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = MEMORY[0x24BDAC760];
  v175[0] = MEMORY[0x24BDAC760];
  v175[1] = 3221225472;
  v175[2] = __43__WFInputTextDialogViewController_loadView__block_invoke;
  v175[3] = &unk_24E604D60;
  objc_copyWeak(&v176, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v118, v175);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v168, "doneButton");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v119;
  v173[1] = 3221225472;
  v173[2] = __43__WFInputTextDialogViewController_loadView__block_invoke_2;
  v173[3] = &unk_24E604D60;
  objc_copyWeak(&v174, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v121, v173);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v179[0] = v120;
  v179[1] = v122;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v179, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v123);

  objc_destroyWeak(&v174);
  objc_destroyWeak(&v176);
  objc_destroyWeak(&location);

}

- (void)finishWithInputtedText
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x24BEC1510]);
  -[WFInputTextDialogViewController textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[WFInputTextDialogViewController textView](self, "textView");
  else
    -[WFInputTextDialogViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithInputtedText:cancelled:", v5, 0);
  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogViewController;
  -[WFInputTextDialogViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (-[WFInputTextDialogViewController focusImmediatelyOnAppear](self, "focusImmediatelyOnAppear"))
  {
    -[WFInputTextDialogViewController setFocusImmediatelyOnAppear:](self, "setFocusImmediatelyOnAppear:", 0);
    v4 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__WFInputTextDialogViewController_viewWillAppear___block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
  }
}

- (void)finishEditing
{
  void *v3;
  id v4;

  -[WFInputTextDialogViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WFInputTextDialogViewController textField](self, "textField");
  else
    -[WFInputTextDialogViewController textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (BOOL)actingAsNumberField
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[WFCompactDialogViewController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFieldConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WFKeyboardTypeFromString();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(&unk_24E631898, "containsObject:", v6);

  return (char)v3;
}

- (BOOL)useNumberValidation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[WFCompactDialogViewController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFieldConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WFKeyboardTypeFromString();

  return v5 == 4 || v5 == 8;
}

- (BOOL)allowsDecimalNumbers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[WFCompactDialogViewController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFieldConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WFKeyboardTypeFromString();

  return v5 == 8;
}

- (void)negateText
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playInputClick");

  v4 = (void *)MEMORY[0x24BEC2F10];
  -[WFInputTextDialogViewController textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "negateTextInput:", v5);

}

- (void)clearText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[WFInputTextDialogViewController textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "replaceRange:withText:", v4, &stru_24E605650);
}

- (void)updateClearButtonVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[WFInputTextDialogViewController textField](self, "textField");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFieldConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearButtonMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFClearButtonModeFromString();

  v7 = objc_msgSend(v14, "isFirstResponder");
  objc_msgSend(v14, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = v7 ^ 1;
  if (v9)
  {
    v11 = v7;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (v6 != 1)
    v11 = v9 != 0;
  if (v6 != 2)
    v10 = v11;
  v12 = v10 ^ 1u;
  -[WFInputTextDialogViewController clearButton](self, "clearButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

}

- (void)updateTextViewPlaceholder
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  -[WFInputTextDialogViewController styledFontForTextStyle:](self, "styledFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputTextDialogViewController placeholder](self, "placeholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1458]);
    v9 = *MEMORY[0x24BEBB368];
    v12[0] = *MEMORY[0x24BEBB360];
    v12[1] = v9;
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v4);
  }
  else
  {
    v10 = 0;
  }
  -[WFInputTextDialogViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedPlaceholder:", v10);

  if (v7)
  {

  }
}

- (id)styledFontForTextStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFCompactDialogViewController request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEC1720]);

  if (v8)
  {
    v20 = *MEMORY[0x24BEBB548];
    v9 = *MEMORY[0x24BEBB598];
    v17[0] = *MEMORY[0x24BEBB5A0];
    v17[1] = v9;
    v18[0] = &unk_24E631248;
    v18[1] = &unk_24E631260;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontDescriptorByAddingAttributes:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFInputTextDialogViewController;
  v4 = a3;
  -[WFInputTextDialogViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFInputTextDialogViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[WFInputTextDialogViewController updateTextViewPlaceholder](self, "updateTextViewPlaceholder");
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD block[4];
  id v7;
  WFInputTextDialogViewController *v8;
  int64_t v9;

  v4 = a3;
  -[WFInputTextDialogViewController updateClearButtonVisibility](self, "updateClearButtonVisibility");
  v5 = -[WFInputTextDialogViewController initialInsertionIndex](self, "initialInsertionIndex");
  if ((v5 & 0x8000000000000000) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__WFInputTextDialogViewController_textFieldDidBeginEditing___block_invoke;
    block[3] = &unk_24E6048F8;
    v8 = self;
    v9 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)textFieldDidChange:(id)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[WFInputTextDialogViewController useNumberValidation](self, "useNumberValidation"))
  {
    v4 = -[WFInputTextDialogViewController allowsDecimalNumbers](self, "allowsDecimalNumbers");
    v5 = (void *)MEMORY[0x24BEC2F10];
    objc_msgSend(v13, "text");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringBySanitizingNumberString:allowDecimalNumbers:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v8, "isEqualToString:", v7);

    if ((v6 & 1) == 0)
    {
      -[WFInputTextDialogViewController textField](self, "textField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginningOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endOfDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "replaceRange:withText:", v12, v7);
    }
    -[WFInputTextDialogViewController updateClearButtonVisibility](self, "updateClearButtonVisibility");

  }
  else
  {
    -[WFInputTextDialogViewController updateDateFormattingHint](self, "updateDateFormattingHint");
  }

}

- (void)updateDateFormattingHint
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;

  -[WFInputTextDialogViewController dateFormatter](self, "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFInputTextDialogViewController textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BE194C8], "detectedDatesInString:error:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "timeIsSignificant");
      if (v10)
      {
        -[WFCompactDialogViewController request](self, "request");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "textFieldConfiguration");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "timeFormatStyle");
      }
      else
      {
        v11 = 0;
      }
      -[WFInputTextDialogViewController dateFormatter](self, "dateFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeStyle:", v11);

      if (v10)
      {

      }
      if (v9)
      {
        -[WFInputTextDialogViewController dateFormatter](self, "dateFormatter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromDate:", v14);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[WFInputTextDialogViewController localizedIncompleteHintString](self, "localizedIncompleteHintString");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v18 = 0;
    }
    -[WFInputTextDialogViewController hintLabel](self, "hintLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v18);

    v16 = dbl_220336C40[objc_msgSend(v18, "length") == 0];
    -[WFInputTextDialogViewController contentViewHeightAnchor](self, "contentViewHeightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", v16);

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  char v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (-[WFInputTextDialogViewController useNumberValidation](self, "useNumberValidation"))
  {
    -[WFCompactDialogViewController request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFieldConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "allowsNegativeNumbers");

    objc_msgSend(v9, "text");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
      v14 = &stru_24E605650;
    -[__CFString stringByReplacingCharactersInRange:withString:](v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(MEMORY[0x24BEC2F10], "shouldChangeText:allowMinus:", v16, v13);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "returnKeyType"))
    -[WFInputTextDialogViewController finishWithInputtedText](self, "finishWithInputtedText");
  objc_msgSend(v4, "resignFirstResponder");

  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD block[4];
  id v7;
  WFInputTextDialogViewController *v8;
  int64_t v9;

  v4 = a3;
  v5 = -[WFInputTextDialogViewController initialInsertionIndex](self, "initialInsertionIndex");
  if ((v5 & 0x8000000000000000) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__WFInputTextDialogViewController_textViewDidBeginEditing___block_invoke;
    block[3] = &unk_24E6048F8;
    v8 = self;
    v9 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (UIButton)clearButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_clearButton);
}

- (void)setClearButton:(id)a3
{
  objc_storeWeak((id *)&self->_clearButton, a3);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (BOOL)focusImmediatelyOnAppear
{
  return self->_focusImmediatelyOnAppear;
}

- (void)setFocusImmediatelyOnAppear:(BOOL)a3
{
  self->_focusImmediatelyOnAppear = a3;
}

- (int64_t)initialInsertionIndex
{
  return self->_initialInsertionIndex;
}

- (void)setInitialInsertionIndex:(int64_t)a3
{
  self->_initialInsertionIndex = a3;
}

- (UILabel)hintLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_hintLabel);
}

- (void)setHintLabel:(id)a3
{
  objc_storeWeak((id *)&self->_hintLabel, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSString)localizedIncompleteHintString
{
  return self->_localizedIncompleteHintString;
}

- (void)setLocalizedIncompleteHintString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (NSLayoutConstraint)contentViewHeightAnchor
{
  return self->_contentViewHeightAnchor;
}

- (void)setContentViewHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_localizedIncompleteHintString, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_hintLabel);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_clearButton);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_textField);
}

uint64_t __59__WFInputTextDialogViewController_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", *(_QWORD *)(a1 + 48), 0);
  return objc_msgSend(*(id *)(a1 + 40), "setInitialInsertionIndex:", -1);
}

void __60__WFInputTextDialogViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "positionFromPosition:offset:", v3, *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v5, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", v4);

  objc_msgSend(*(id *)(a1 + 40), "setInitialInsertionIndex:", -1);
}

void __50__WFInputTextDialogViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "textField");
  else
    objc_msgSend(v3, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

void __43__WFInputTextDialogViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishEditing");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1510]), "initWithInputtedText:cancelled:", 0, 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __43__WFInputTextDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishEditing");
  objc_msgSend(WeakRetained, "finishWithInputtedText");

}

@end
