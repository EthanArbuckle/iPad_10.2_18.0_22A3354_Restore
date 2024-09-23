@implementation UIKBMultilingualKeyboardIntroductionView

+ (BOOL)shouldShowIntroductionForInputMode:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  BOOL v13;
  int v14;

  v3 = a3;
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0
    || +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    v5 = 0;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isMinimized") & 1) != 0
      || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isPredictionViewControllerVisible"),
          v7,
          !v8))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v6, "keyboardStateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textInputTraits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isSecureTextEntry") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        v11 = objc_msgSend(v10, "keyboardType");
        v5 = 0;
        if ((v11 > 0xB || ((1 << v11) & 0x930) == 0) && v11 != 127)
        {
          if (_os_feature_enabled_impl())
          {
            objc_msgSend(v3, "multilingualSet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (unint64_t)objc_msgSend(v12, "count") > 1;

          }
          else
          {
            v13 = 0;
          }
          v14 = _os_feature_enabled_impl();
          if (v14)
            LOBYTE(v14) = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);
          v5 = v13 | v14;
        }
      }

    }
  }

  return v5;
}

+ (id)displayTitle:(id)a3
{
  id v3;
  char IsKoreanEnglishBilingual;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IsKoreanEnglishBilingual & 1) != 0)
  {
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[UIKeyboardInputMode _displayNameForMultilingualSet:forDisplayInLists:usingDeviceLanguage:](UIKeyboardInputMode, "_displayNameForMultilingualSet:forDisplayInLists:usingDeviceLanguage:", v6, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  _UILocalizedStringInSystemLanguage(CFSTR("Type %@"), CFSTR("Type %@"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)displayDescription:(id)a3
{
  id v3;
  void *v4;
  char IsKoreanEnglishBilingual;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "multilingualSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {

LABEL_4:
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = CFSTR("Type both languages on the same keyboard. Customize in Settings.");
LABEL_5:
    _UILocalizedStringInSystemLanguage(v7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);

  if ((IsKoreanEnglishBilingual & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v3, "isMultiscript"))
  {
    objc_msgSend(v3, "multilingualSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 5)
    {
      _UILocalizedStringInSystemLanguage(CFSTR("All on the same keyboard.\nTap to switch scripts."), CFSTR("All on the same keyboard.\nTap to switch scripts."));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = CFSTR("Type both languages on the same keyboard.\nTap to switch scripts.");
    goto LABEL_5;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Invalid Multilingual Configuration for Education UI", buf, 2u);
    }

  }
  else
  {
    v13 = displayDescription____s_category;
    if (!displayDescription____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&displayDescription____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Invalid Multilingual Configuration for Education UI", v16, 2u);
    }
  }
  v9 = &stru_1E16EDF20;
LABEL_6:

  return v9;
}

+ (id)displayArtwork:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIKBMultilingualKeyboardArtworkView *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v3 = a3;
  if (objc_msgSend(v3, "isMultiscript"))
  {
    objc_msgSend(v3, "multiscriptSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 <= 2)
      v6 = 1;
    else
      v6 = 2;
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5 > 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageWithRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageWithRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UIKBMultilingualKeyboardArtworkView initWithLanguage1:andLanguage2:]([UIKBMultilingualKeyboardArtworkView alloc], "initWithLanguage1:andLanguage2:", v8, v10);
  }
  else
  {
    objc_msgSend(v3, "multilingualSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v3, "multilingualSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 != 2)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "bilingual keyboard is only supported", buf, 2u);
          }

        }
        else
        {
          v27 = displayArtwork____s_category;
          if (!displayArtwork____s_category)
          {
            v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v27, (unint64_t *)&displayArtwork____s_category);
          }
          v28 = *(NSObject **)(v27 + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "bilingual keyboard is only supported", v30, 2u);
          }
        }
      }
      objc_msgSend(v3, "multilingualSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "languageWithRegion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "multilingualSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "languageWithRegion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[UIKBMultilingualKeyboardArtworkView initWithLanguage1:andLanguage2:]([UIKBMultilingualKeyboardArtworkView alloc], "initWithLanguage1:andLanguage2:", v18, v21);
    }
    else
    {
      objc_msgSend(v3, "multilingualLanguages");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "multilingualLanguages");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[UIKBMultilingualKeyboardArtworkView initWithLanguage1:andLanguage2:]([UIKBMultilingualKeyboardArtworkView alloc], "initWithLanguage1:andLanguage2:", v23, v25);
    }
  }

  return v11;
}

- (UIKBMultilingualKeyboardIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  UIKBMultilingualKeyboardIntroductionView *v9;
  UIKBMultilingualKeyboardIntroductionView *v10;
  _UIBackdropView *v11;
  void *v12;
  UILabel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *v38;
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
  double v50;
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
  objc_class *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  UIMultiscriptCandidateView *v72;
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
  double v83;
  double v84;
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
  double v95;
  double v96;
  void *v97;
  void *v98;
  UIView *v99;
  char v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
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
  UIKBMultilingualIntroductionArrowView *v122;
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
  uint64_t v135;
  uint64_t v136;
  uint64_t i;
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
  void *v151;
  void *v152;
  void *v153;
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
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  objc_super v219;
  _QWORD v220[5];
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  _BYTE v225[128];
  _QWORD v226[4];
  _QWORD v227[4];
  _QWORD v228[4];
  _QWORD v229[4];
  _QWORD v230[3];
  _QWORD v231[16];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v231[14] = *MEMORY[0x1E0C80C00];
  v214 = a3;
  v219.receiver = self;
  v219.super_class = (Class)UIKBMultilingualKeyboardIntroductionView;
  v9 = -[UIView initWithFrame:](&v219, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    -[UIKBMultilingualKeyboardIntroductionView setInputMode:](v9, "setInputMode:", v214);
    -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
    -[UIView _inheritedRenderConfig](v10, "_inheritedRenderConfig");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", objc_msgSend(v212, "backdropStyle"));
    -[UIKBMultilingualKeyboardIntroductionView setBackdropView:](v10, "setBackdropView:", v11);

    -[UIKBMultilingualKeyboardIntroductionView backdropView](v10, "backdropView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v12);

    objc_msgSend((id)objc_opt_class(), "displayTitle:", v214);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "displayDescription:", v214);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedStringInSystemLanguage(CFSTR("Continue"), CFSTR("Continue"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v212, "lightKeyboard") & 1) != 0)
      +[UIColor blackColor](UIColor, "blackColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [UILabel alloc];
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = -[UILabel initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
    -[UIKBMultilingualKeyboardIntroductionView setTitleLabel:](v10, "setTitleLabel:", v18);

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v211);

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextAlignment:", 1);

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v141);

    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 16.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v25);

    objc_msgSend((id)objc_opt_class(), "displayArtwork:", v214);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView setArtworkView:](v10, "setArtworkView:", v26);

    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v28);

    v29 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v14, v15, v16, v17);
    -[UIKBMultilingualKeyboardIntroductionView setDescriptionLabel:](v10, "setDescriptionLabel:", v29);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextColor:", v211);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextAlignment:", 1);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v140);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v34);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNumberOfLines:", 2);

    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v37);

    v38 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v14, v15, v16, v17);
    -[UIKBMultilingualKeyboardIntroductionView setContinueButton:](v10, "setContinueButton:", v38);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTitle:forState:", v139, 0);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTitleColor:forState:", v42, 0);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTitleColor:forState:", v44, 0);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addTarget:action:forControlEvents:", v10, sel_continueButtonTapped, 64);

    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v46);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v10, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v49, 35.0);
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v50) = 1148846080;
    objc_msgSend(v210, "setPriority:", v50);
    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "topAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v10, "topAnchor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "constraintGreaterThanOrEqualToAnchor:constant:", v201, 15.0);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v231[0] = v197;
    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "centerXAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v10, "centerXAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "constraintEqualToAnchor:", v185);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v231[1] = v181;
    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "heightAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "constraintEqualToConstant:", 150.0);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v231[2] = v176;
    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "widthAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v10, "widthAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:multiplier:", v173, 0.7);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v231[3] = v172;
    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "topAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView artworkView](v10, "artworkView");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "bottomAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:constant:", v169, 6.0);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v231[4] = v167;
    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "centerXAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v10, "centerXAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintEqualToAnchor:", v164);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v231[5] = v163;
    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "topAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView titleLabel](v10, "titleLabel");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "bottomAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintEqualToAnchor:constant:", v160, 6.0);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v231[6] = v158;
    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "centerXAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v10, "centerXAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:", v155);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v231[7] = v154;
    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "widthAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v10, "widthAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:multiplier:", v151, 0.9);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v231[8] = v150;
    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "topAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBMultilingualKeyboardIntroductionView descriptionLabel](v10, "descriptionLabel");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "bottomAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "constraintEqualToAnchor:constant:", v146, 15.0);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v231[9] = v145;
    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "centerXAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v10, "centerXAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v142);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v231[10] = v51;
    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v10, "widthAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:multiplier:", v54, 0.7);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v231[11] = v55;
    -[UIKBMultilingualKeyboardIntroductionView continueButton](v10, "continueButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToConstant:", 21.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v231[12] = v58;
    v231[13] = v210;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v231, 14);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "addObjectsFromArray:", v59);

    if (objc_msgSend(v214, "showsTransliterationCandidates"))
    {
      v221 = 0;
      v222 = &v221;
      v223 = 0x2050000000;
      v60 = (void *)_MergedGlobals_5_10;
      v224 = _MergedGlobals_5_10;
      if (!_MergedGlobals_5_10)
      {
        v220[0] = MEMORY[0x1E0C809B0];
        v220[1] = 3221225472;
        v220[2] = __getTUIPredictionViewClass_block_invoke;
        v220[3] = &unk_1E16B14C0;
        v220[4] = &v221;
        __getTUIPredictionViewClass_block_invoke((uint64_t)v220);
        v60 = (void *)v222[3];
      }
      v61 = objc_retainAutorelease(v60);
      _Block_object_dispose(&v221, 8);
      v62 = objc_alloc_init(v61);
      -[UIKBMultilingualKeyboardIntroductionView setPredictionView:](v10, "setPredictionView:", v62);

      -[UIView _inheritedRenderConfig](v10, "_inheritedRenderConfig");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBMultilingualKeyboardIntroductionView predictionView](v10, "predictionView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setRenderConfig:", v63);

      v65 = (void *)MEMORY[0x1E0DBDB48];
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", CFSTR("I"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v230[0] = v66;
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", CFSTR("Thanks"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v230[1] = v67;
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", CFSTR("I’m"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v230[2] = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v230, 3);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "listWithCorrections:predictions:", 0, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBMultilingualKeyboardIntroductionView predictionView](v10, "predictionView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setAutocorrectionList:", v70);

      v72 = objc_alloc_init(UIMultiscriptCandidateView);
      -[UIKBMultilingualKeyboardIntroductionView setMultiscriptCandidateView:](v10, "setMultiscriptCandidateView:", v72);

      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setUserInteractionEnabled:", 0);

      +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &__block_literal_global_436);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setAlternativeCandidateAction:", v75);

      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBMultilingualKeyboardIntroductionView predictionView](v10, "predictionView");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "reloadArrangedSubviews:", v78);

      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setAlpha:", 0.5);

      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v10, "addSubview:", v80);

      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "systemInputAssistantViewController");
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView traitCollection](v10, "traitCollection");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "preferredHeightForTraitCollection:", v82);
      v84 = v83;

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      {
        -[UIView traitCollection](v10, "traitCollection");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "_centerViewWidthForTraitCollection:", v94);
        v96 = v95;

        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "topAnchor");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](v10, "topAnchor");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "constraintEqualToAnchor:", v198);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v229[0] = v194;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "centerXAnchor");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](v10, "centerXAnchor");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "constraintEqualToAnchor:", v182);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v229[1] = v85;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "widthAnchor");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "constraintEqualToConstant:", v96);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v229[2] = v88;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "heightAnchor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "constraintEqualToConstant:", v84);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v229[3] = v91;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v229, 4);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "addObjectsFromArray:", v92);
      }
      else
      {
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "topAnchor");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](v10, "topAnchor");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "constraintEqualToAnchor:", v198);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v228[0] = v194;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "leadingAnchor");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v10, "leadingAnchor");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "constraintEqualToAnchor:", v182);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v228[1] = v85;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "trailingAnchor");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](v10, "trailingAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "constraintEqualToAnchor:", v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v228[2] = v89;
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "heightAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "constraintEqualToConstant:", v84);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v228[3] = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v228, 4);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "addObjectsFromArray:", v93);

      }
      -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "arrangedSubviews");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "lastObject");
      v209 = (void *)objc_claimAutoreleasedReturnValue();

      if (v209)
      {
        v99 = objc_alloc_init(UIView);
        -[UIKBMultilingualKeyboardIntroductionView setHighlight:](v10, "setHighlight:", v99);

        v100 = objc_msgSend(v212, "lightKeyboard");
        UIKeyboardGetLightCandidateHighlightColor();
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = (void *)v101;
        if ((v100 & 1) != 0)
        {
          v103 = (void *)v101;
        }
        else
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v104, "userInterfaceIdiom");

          if ((v105 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.337254902, 0.329411765, 0.333333333, 1.0);
          else
            +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.450980392, 0.450980392, 0.450980392, 1.0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setBackgroundColor:", v103);

        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v84 * 0.75;
        objc_msgSend(v108, "_setCornerRadius:", v109 * 0.5);

        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "setUserInteractionEnabled:", 0);

        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBMultilingualKeyboardIntroductionView multiscriptCandidateView](v10, "multiscriptCandidateView");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v111, v112);

        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "centerXAnchor");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "centerXAnchor");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "constraintEqualToAnchor:constant:", v195, -3.0);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        v227[0] = v191;
        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "centerYAnchor");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "centerYAnchor");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "constraintEqualToAnchor:constant:", v113, 2.0);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v227[1] = v114;
        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "widthAnchor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "constraintEqualToConstant:", v109);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v227[2] = v117;
        -[UIKBMultilingualKeyboardIntroductionView highlight](v10, "highlight");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "heightAnchor");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "constraintEqualToConstant:", v109);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v227[3] = v120;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v227, 4);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "addObjectsFromArray:", v121);

      }
      v122 = objc_alloc_init(UIKBMultilingualIntroductionArrowView);
      -[UIKBMultilingualKeyboardIntroductionView setArrowView:](v10, "setArrowView:", v122);

      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v10, "addSubview:", v124);

      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "topAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v10, "topAnchor");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:", v196);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v226[0] = v192;
      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "leadingAnchor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v10, "leadingAnchor");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "constraintEqualToAnchor:", v180);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v226[1] = v178;
      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "bottomAnchor");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v10, "bottomAnchor");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "constraintEqualToAnchor:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v226[2] = v128;
      -[UIKBMultilingualKeyboardIntroductionView arrowView](v10, "arrowView");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "trailingAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v10, "trailingAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:", v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v226[3] = v132;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v226, 4);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "addObjectsFromArray:", v133);

    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v213);
    -[UIView setSemanticContentAttribute:](v10, "setSemanticContentAttribute:", 3);
    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    -[UIView subviews](v10, "subviews");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v215, v225, 16);
    if (v135)
    {
      v136 = *(_QWORD *)v216;
      do
      {
        for (i = 0; i != v135; ++i)
        {
          if (*(_QWORD *)v216 != v136)
            objc_enumerationMutation(v134);
          objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * i), "setSemanticContentAttribute:", 3);
        }
        v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v215, v225, 16);
      }
      while (v135);
    }

  }
  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  BOOL v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[UIKBMultilingualKeyboardIntroductionView highlight](self, "highlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIKBMultilingualKeyboardIntroductionView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v24.receiver = self;
  v24.super_class = (Class)UIKBMultilingualKeyboardIntroductionView;
  -[UIView layoutSubviews](&v24, sel_layoutSubviews);
  -[UIKBMultilingualKeyboardIntroductionView _updateContainer](self, "_updateContainer");
  -[UIKBMultilingualKeyboardIntroductionView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  if (!CGRectEqualToRect(v25, v27))
  {

    goto LABEL_5;
  }
  -[UIKBMultilingualKeyboardIntroductionView highlight](self, "highlight");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  v23 = CGRectEqualToRect(v26, v28);

  if (!v23)
LABEL_5:
    -[UIKBMultilingualKeyboardIntroductionView _updatePath](self, "_updatePath");
}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return objc_msgSend(a3, "backdropStyle");
}

- (void)continueButtonTapped
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMultilingualKeyboardTip");

}

- (void)_updatePath
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  double MinX;
  double v11;
  double v12;
  void *v13;
  double MidY;
  void *v15;
  double MidX;
  void *v17;
  CGFloat v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[UIKBMultilingualKeyboardIntroductionView arrowView](self, "arrowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIKBMultilingualKeyboardIntroductionView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    if (v4)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v6);
      v11 = -15.0;
    }
    else
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v6);
      v11 = 15.0;
    }
    v12 = MinX + v11;

    -[UIKBMultilingualKeyboardIntroductionView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    MidY = CGRectGetMidY(v20);

    -[UIKBMultilingualKeyboardIntroductionView highlight](self, "highlight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    MidX = CGRectGetMidX(v21);
    -[UIKBMultilingualKeyboardIntroductionView highlight](self, "highlight");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v18 = CGRectGetMaxY(v22) + 5.0;

    -[UIKBMultilingualKeyboardIntroductionView arrowView](self, "arrowView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStartPoint:endPoint:", v12, MidY, MidX, v18);

  }
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

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIKBMultilingualIntroductionArrowView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowView, a3);
}

- (UIView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (UIMultiscriptCandidateView)multiscriptCandidateView
{
  return self->_multiscriptCandidateView;
}

- (void)setMultiscriptCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_multiscriptCandidateView, a3);
}

- (UIView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (TUIPredictionView)predictionView
{
  return self->_predictionView;
}

- (void)setPredictionView:(id)a3
{
  objc_storeStrong((id *)&self->_predictionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_multiscriptCandidateView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
