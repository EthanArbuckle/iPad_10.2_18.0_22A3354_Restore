@implementation UIKBUndoInteractionHUD

- (UIKBUndoInteractionHUD)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4 mode:(int64_t)a5 sceneBounds:(CGRect)a6
{
  _BOOL8 v7;
  double height;
  double width;
  UIKBUndoInteractionHUD *v11;
  UIKBUndoInteractionHUD *v12;
  void *v13;
  UIKBUndoStyling *v14;
  UIKBUndoStyling *style;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  UIKBUndoStyling *v34;
  UIKBUndoStyling *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  UIVisualEffectView *v41;
  UIVisualEffectView *shadowView;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
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
  UIKBUndoHUDContainerView *v67;
  UIView *containerView;
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
  UIVisualEffectView *v84;
  void *v85;
  void *v86;
  UIVisualEffectView *v87;
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
  UIVisualEffectView *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  UIVisualEffectView *backgroundEffectView;
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
  int64_t mode;
  UIKBUndoControl *v119;
  UIKBUndoControl *leftButtonView;
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
  UIKBUndoControl *v134;
  UIKBUndoControl *rightButtonView;
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
  UIKBUndoControl *v148;
  UIKBUndoControl *aCutButtonView;
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
  UIKBUndoControl *v170;
  UIKBUndoControl *aCopyButtonView;
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
  UIKBUndoControl *v196;
  UIKBUndoControl *v197;
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
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  UIKBUndoControl *v233;
  UIKBUndoControl *aPasteButtonView;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  UILabel *instructionalLabel;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  UIKBUndoInteractionHUD *v281;
  void *v283;
  void *v284;
  _BOOL4 v285;
  UIVisualEffectView *v286;
  _BOOL4 v287;
  objc_super v288;
  void *v289;
  uint64_t v290;
  _QWORD v291[3];

  v7 = a4;
  height = a6.size.height;
  width = a6.size.width;
  v291[1] = *MEMORY[0x1E0C80C00];
  v288.receiver = self;
  v288.super_class = (Class)UIKBUndoInteractionHUD;
  v11 = -[UIView initWithFrame:](&v288, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (!v11)
    goto LABEL_47;
  v11->_mode = a5;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    -[UIView traitCollection](v11, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "userInterfaceStyle") == 2)
      a3 = 1;
    else
      a3 = 2;

  }
  v14 = -[UIKBUndoStyling initWithKeyboardAppearance:isRTL:]([UIKBUndoStyling alloc], "initWithKeyboardAppearance:isRTL:", a3, v7);
  style = v12->_style;
  v12->_style = v14;

  if (width >= height)
    v16 = height;
  else
    v16 = width;
  v287 = v7;
  if (v16 < 425.0)
  {
    -[UIKBUndoStyling setUndoRedoIconOnly:](v12->_style, "setUndoRedoIconOnly:", 1);
    -[UIKBUndoStyling setCutCopyPasteIconOnly:](v12->_style, "setCutCopyPasteIconOnly:", v12->_mode == 0);
    -[UIKBUndoStyling setTooSmallForInstructionalText:](v12->_style, "setTooSmallForInstructionalText:", 1);
    v285 = width < 425.0;
    goto LABEL_36;
  }
  v290 = *(_QWORD *)off_1E1678D90;
  -[UIKBUndoStyling undoInteractiveControlLabelFont](v12->_style, "undoInteractiveControlLabelFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v291[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v291, &v290, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _UILocalizedStringInSystemLanguage(CFSTR("UNDO_BUTTON_TITLE_LABEL_IN_HUD"), CFSTR("Undo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeWithAttributes:", v18);
  v21 = v20 + 42.0 + 4.0 + 20.0;

  _UILocalizedStringInSystemLanguage(CFSTR("REDO_BUTTON_TITLE_LABEL_IN_HUD"), CFSTR("Redo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeWithAttributes:", v18);
  v24 = v23 + 42.0 + 4.0 + 20.0;

  _UILocalizedStringInSystemLanguage(CFSTR("Cut"), CFSTR("Cut"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeWithAttributes:", v18);
  v27 = v26;

  _UILocalizedStringInSystemLanguage(CFSTR("Copy"), CFSTR("Copy"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sizeWithAttributes:", v18);
  v30 = v29;

  _UILocalizedStringInSystemLanguage(CFSTR("Paste"), CFSTR("Paste"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeWithAttributes:", v18);
  v33 = v32;

  if (v21 >= v24)
    v24 = v21;
  if (v24 >= 94.0)
  {
    v34 = v12->_style;
    if (v24 > 94.0 && v24 < 120.0)
      -[UIKBUndoStyling setUndoRedoIconOnly:](v34, "setUndoRedoIconOnly:", 0);
    else
      -[UIKBUndoStyling setUndoRedoIconOnly:](v34, "setUndoRedoIconOnly:", 1);
  }
  else
  {
    -[UIKBUndoStyling setUndoRedoIconOnly:](v12->_style, "setUndoRedoIconOnly:", 0);
  }
  if (-[UIKBUndoStyling undoRedoIconOnly](v12->_style, "undoRedoIconOnly"))
  {
    v36 = v12->_style;
  }
  else
  {
    v37 = v27 + 20.0;
    if (v27 + 20.0 < v30 + 20.0)
      v37 = v30 + 20.0;
    if (v37 >= v33 + 20.0)
      v38 = v37;
    else
      v38 = v33 + 20.0;
    if (v38 < 55.0)
    {
      -[UIKBUndoStyling setCutCopyPasteIconOnly:](v12->_style, "setCutCopyPasteIconOnly:", 0);
      goto LABEL_35;
    }
    v36 = v12->_style;
    if (v38 > 55.0 && v38 < 61.0)
    {
      -[UIKBUndoStyling setCutCopyPasteIconOnly:](v36, "setCutCopyPasteIconOnly:", 0);
      goto LABEL_35;
    }
  }
  -[UIKBUndoStyling setCutCopyPasteIconOnly:](v36, "setCutCopyPasteIconOnly:", 1);
LABEL_35:

  v285 = 0;
LABEL_36:
  UICeilToViewScale(v12);
  -[UIKBUndoStyling setUndoControlMinWidth:](v12->_style, "setUndoControlMinWidth:");
  UICeilToViewScale(v12);
  -[UIKBUndoStyling setCutControlMinWidth:](v12->_style, "setCutControlMinWidth:");
  -[UIView heightAnchor](v12, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", 37.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  v41 = objc_alloc_init(UIVisualEffectView);
  shadowView = v12->_shadowView;
  v12->_shadowView = v41;

  +[UIVibrancyEffect _vibrantShadowEffect](UIVibrancyEffect, "_vibrantShadowEffect");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v289 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v289, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setContentEffects:](v12->_shadowView, "setContentEffects:", v44);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_shadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 0);
  -[UIView addSubview:](v12, "addSubview:", v12->_shadowView);
  +[UIColor separatorColor](UIColor, "separatorColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12->_shadowView, "setBackgroundColor:", v45);

  -[UIView layer](v12->_shadowView, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMasksToBounds:", 0);

  -[UIView layer](v12->_shadowView, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCornerRadius:", 18.5);

  -[UIKBUndoStyling HUDShadowColor](v12->_style, "HUDShadowColor");
  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v49 = objc_msgSend(v48, "CGColor");
  -[UIView layer](v12->_shadowView, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setShadowColor:", v49);

  -[UIView layer](v12->_shadowView, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setShadowOffset:", 0.0, 0.0);

  -[UIView layer](v12->_shadowView, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = 0.5;
  objc_msgSend(v52, "setShadowOpacity:", v53);

  -[UIView layer](v12->_shadowView, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setShadowRadius:", 15.0);

  -[UIView centerXAnchor](v12->_shadowView, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v12, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  -[UIView centerYAnchor](v12->_shadowView, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v12, "centerYAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  -[UIView widthAnchor](v12->_shadowView, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v12, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  -[UIView heightAnchor](v12->_shadowView, "heightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v12, "heightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  v67 = objc_alloc_init(UIKBUndoHUDContainerView);
  containerView = v12->_containerView;
  v12->_containerView = &v67->super;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v12, "addSubview:", v12->_containerView);
  -[UIView layer](v12->_containerView, "layer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setCornerRadius:", 18.5);

  -[UIView setClipsToBounds:](v12->_containerView, "setClipsToBounds:", 1);
  +[UIColor separatorColor](UIColor, "separatorColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "colorWithAlphaComponent:", 0.33);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12->_containerView, "setBackgroundColor:", v71);

  -[UIView centerXAnchor](v12->_containerView, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v12, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  -[UIView centerYAnchor](v12->_containerView, "centerYAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v12, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[UIView widthAnchor](v12->_containerView, "widthAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v12, "widthAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setActive:", 1);

  -[UIView heightAnchor](v12->_containerView, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v12, "heightAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setActive:", 1);

  v84 = [UIVisualEffectView alloc];
  -[UIKBUndoInteractionHUD style](v12, "style");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "backgroundBlurEffect");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = -[UIVisualEffectView initWithEffect:](v84, "initWithEffect:", v86);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v12->_containerView, "addSubview:", v87);
  -[UIView centerXAnchor](v87, "centerXAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v12, "centerXAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setActive:", 1);

  -[UIView centerYAnchor](v87, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v12, "centerYAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setActive:", 1);

  -[UIView heightAnchor](v87, "heightAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v12, "heightAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:multiplier:", v95, 1.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setActive:", 1);

  -[UIView widthAnchor](v87, "widthAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v12->_containerView, "widthAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:multiplier:", v98, 1.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setActive:", 1);

  v100 = [UIVisualEffectView alloc];
  -[UIKBUndoInteractionHUD style](v12, "style");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "backgroundVibrancyEffect");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = -[UIVisualEffectView initWithEffect:](v100, "initWithEffect:", v102);
  backgroundEffectView = v12->_backgroundEffectView;
  v12->_backgroundEffectView = (UIVisualEffectView *)v103;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_backgroundEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v286 = v87;
  -[UIVisualEffectView contentView](v87, "contentView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addSubview:", v12->_backgroundEffectView);

  -[UIView centerXAnchor](v12->_backgroundEffectView, "centerXAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v12, "centerXAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setActive:", 1);

  -[UIView centerYAnchor](v12->_backgroundEffectView, "centerYAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v12, "centerYAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setActive:", 1);

  -[UIView heightAnchor](v12->_backgroundEffectView, "heightAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](v12, "heightAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:multiplier:", v113, 1.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setActive:", 1);

  -[UIView widthAnchor](v12->_backgroundEffectView, "widthAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v12, "widthAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:multiplier:", v116, 1.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setActive:", 1);

  mode = v12->_mode;
  if (mode == 1)
  {
    v233 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 6, v12->_style);
    aPasteButtonView = v12->_aPasteButtonView;
    v12->_aPasteButtonView = v233;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_aPasteButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_aPasteButtonView);
    -[UIView trailingAnchor](v12->_aPasteButtonView, "trailingAnchor");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_containerView, "trailingAnchor");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "constraintEqualToAnchor:", v236);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "setActive:", 1);

    -[UIView topAnchor](v12->_aPasteButtonView, "topAnchor");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v12, "topAnchor");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "constraintEqualToAnchor:", v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setActive:", 1);

    -[UIView bottomAnchor](v12->_aPasteButtonView, "bottomAnchor");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v12, "bottomAnchor");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "constraintEqualToAnchor:", v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_aPasteButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    if (v285)
    {
      -[UIView leadingAnchor](v12->_aPasteButtonView, "leadingAnchor");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v12->_containerView, "leadingAnchor");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "constraintEqualToAnchor:", v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "setActive:", 1);

      -[UIView widthAnchor](v12->_aPasteButtonView, "widthAnchor");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "constraintEqualToConstant:", 116.0);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "setActive:", 1);
    }
    else
    {
      v247 = objc_opt_new();
      instructionalLabel = v12->_instructionalLabel;
      v12->_instructionalLabel = (UILabel *)v247;

      -[UIKBUndoStyling undoInteractiveControlLabelFont](v12->_style, "undoInteractiveControlLabelFont");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v12->_instructionalLabel, "setFont:", v249);

      _UILocalizedStringInSystemLanguage(CFSTR("PASTE_CONFIRMATION_LABEL_TEXT"), CFSTR("This application is trying to read the clipboard."));
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v12->_instructionalLabel, "setText:", v250);

      -[UILabel setTextAlignment:](v12->_instructionalLabel, "setTextAlignment:", 1);
      -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_instructionalLabel);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_instructionalLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView leadingAnchor](v12->_instructionalLabel, "leadingAnchor");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v12->_containerView, "leadingAnchor");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "constraintEqualToAnchor:constant:", v252, 16.0);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "setActive:", 1);

      -[UIView firstBaselineAnchor](v12->_instructionalLabel, "firstBaselineAnchor");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView firstBaselineAnchor](v12->_aPasteButtonView, "firstBaselineAnchor");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "constraintEqualToAnchor:", v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "setActive:", 1);

      -[UIKBUndoInteractionHUD createSeparatorView](v12, "createSeparatorView");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](v12->_backgroundEffectView, "contentView");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "addSubview:", v217);

      objc_msgSend(v217, "heightAnchor");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](v12->_containerView, "heightAnchor");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "constraintEqualToAnchor:", v259);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "setActive:", 1);

      objc_msgSend(v217, "leadingAnchor");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v12->_instructionalLabel, "trailingAnchor");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "constraintEqualToAnchor:constant:", v262, 16.0);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "setActive:", 1);

      -[UIView leadingAnchor](v12->_aPasteButtonView, "leadingAnchor");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "trailingAnchor");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "constraintEqualToAnchor:", v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "setActive:", 1);

      v232 = (void *)objc_opt_new();
      -[UIKBUndoStyling HUDbackgroundColor](v12->_style, "HUDbackgroundColor");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "setBackgroundColor:", v267);

      objc_msgSend(v232, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView insertSubview:below:](v12->_containerView, "insertSubview:below:", v232, v12->_instructionalLabel);
      objc_msgSend(v232, "leadingAnchor");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v12, "leadingAnchor");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "constraintEqualToAnchor:", v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "setActive:", 1);

      objc_msgSend(v232, "trailingAnchor");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "leadingAnchor");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "constraintEqualToAnchor:", v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "setActive:", 1);

      objc_msgSend(v232, "topAnchor");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v12, "topAnchor");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "constraintEqualToAnchor:", v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "setActive:", 1);

      objc_msgSend(v232, "bottomAnchor");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v12, "bottomAnchor");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v277, "constraintEqualToAnchor:", v278);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "setActive:", 1);

    }
    goto LABEL_42;
  }
  if (!mode)
  {
    v119 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 1, v12->_style);
    leftButtonView = v12->_leftButtonView;
    v12->_leftButtonView = v119;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_leftButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_leftButtonView);
    -[UIView leadingAnchor](v12->_leftButtonView, "leadingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v12, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setActive:", 1);

    -[UIView centerYAnchor](v12->_leftButtonView, "centerYAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setActive:", 1);

    -[UIView heightAnchor](v12->_leftButtonView, "heightAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12, "heightAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:multiplier:", v128, 1.0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setActive:", 1);

    -[UIView widthAnchor](v12->_leftButtonView, "widthAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoStyling undoControlMinWidth](v12->_style, "undoControlMinWidth");
    objc_msgSend(v130, "constraintGreaterThanOrEqualToConstant:");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setActive:", 1);

    -[UIView widthAnchor](v12->_leftButtonView, "widthAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintLessThanOrEqualToConstant:", 120.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_leftButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v12->_leftButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    -[UIControl addTarget:action:forControlEvents:](v12->_leftButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpOutside_, 128);
    v134 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 2, v12->_style);
    rightButtonView = v12->_rightButtonView;
    v12->_rightButtonView = v134;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_rightButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_rightButtonView);
    -[UIView trailingAnchor](v12->_rightButtonView, "trailingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12, "trailingAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setActive:", 1);

    -[UIView centerYAnchor](v12->_rightButtonView, "centerYAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setActive:", 1);

    -[UIView heightAnchor](v12->_rightButtonView, "heightAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12, "heightAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToAnchor:multiplier:", v143, 1.0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setActive:", 1);

    -[UIView widthAnchor](v12->_rightButtonView, "widthAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v12->_leftButtonView, "widthAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:multiplier:", v146, 1.0);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_rightButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v12->_rightButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    -[UIControl addTarget:action:forControlEvents:](v12->_rightButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpOutside_, 128);
    v148 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 3, v12->_style);
    aCutButtonView = v12->_aCutButtonView;
    v12->_aCutButtonView = v148;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_aCutButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_aCutButtonView);
    -[UIKBUndoInteractionHUD createSeparatorView](v12, "createSeparatorView");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v12->_backgroundEffectView, "contentView");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "addSubview:", v150);

    objc_msgSend(v150, "heightAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoInteractionHUD containerView](v12, "containerView");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "heightAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:", v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setActive:", 1);

    v284 = v150;
    objc_msgSend(v150, "leadingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_leftButtonView, "trailingAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setActive:", 1);

    -[UIView leadingAnchor](v12->_aCutButtonView, "leadingAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "trailingAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintEqualToAnchor:", v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setActive:", 1);

    -[UIView centerYAnchor](v12->_aCutButtonView, "centerYAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "constraintEqualToAnchor:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setActive:", 1);

    -[UIView heightAnchor](v12->_aCutButtonView, "heightAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12, "heightAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintEqualToAnchor:multiplier:", v166, 1.0);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setActive:", 1);

    -[UIView widthAnchor](v12->_aCutButtonView, "widthAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoStyling cutControlMinWidth](v12->_style, "cutControlMinWidth");
    objc_msgSend(v168, "constraintGreaterThanOrEqualToConstant:");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_aCutButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v12->_aCutButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    -[UIControl addTarget:action:forControlEvents:](v12->_aCutButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpOutside_, 128);
    v170 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 4, v12->_style);
    aCopyButtonView = v12->_aCopyButtonView;
    v12->_aCopyButtonView = v170;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_aCopyButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_aCopyButtonView);
    -[UIKBUndoInteractionHUD createSeparatorView](v12, "createSeparatorView");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v12->_backgroundEffectView, "contentView");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "addSubview:", v172);

    objc_msgSend(v172, "heightAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoInteractionHUD containerView](v12, "containerView");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "heightAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:", v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "setActive:", 1);

    v283 = v172;
    objc_msgSend(v172, "leadingAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_aCutButtonView, "trailingAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "constraintEqualToAnchor:", v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "setActive:", 1);

    -[UIView centerXAnchor](v12->_aCopyButtonView, "centerXAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v12, "centerXAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "constraintEqualToAnchor:", v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "setActive:", 1);

    -[UIView leadingAnchor](v12->_aCopyButtonView, "leadingAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "trailingAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintEqualToAnchor:", v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "setActive:", 1);

    -[UIView centerYAnchor](v12->_aCopyButtonView, "centerYAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "constraintEqualToAnchor:", v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "setActive:", 1);

    -[UIView heightAnchor](v12->_aCopyButtonView, "heightAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12->_aCutButtonView, "heightAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "constraintEqualToAnchor:multiplier:", v191, 1.0);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "setActive:", 1);

    -[UIView widthAnchor](v12->_aCopyButtonView, "widthAnchor");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v12->_aCutButtonView, "widthAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "constraintEqualToAnchor:multiplier:", v194, 1.0);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_aCopyButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v12->_aCopyButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    -[UIControl addTarget:action:forControlEvents:](v12->_aCopyButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpOutside_, 128);
    v196 = -[UIKBUndoControl initWithType:andStyling:]([UIKBUndoControl alloc], "initWithType:andStyling:", 5, v12->_style);
    v197 = v12->_aPasteButtonView;
    v12->_aPasteButtonView = v196;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_aPasteButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_aPasteButtonView);
    -[UIKBUndoInteractionHUD createSeparatorView](v12, "createSeparatorView");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v12->_backgroundEffectView, "contentView");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "addSubview:", v198);

    objc_msgSend(v198, "heightAnchor");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoInteractionHUD containerView](v12, "containerView");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "heightAnchor");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "constraintEqualToAnchor:", v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setActive:", 1);

    objc_msgSend(v198, "leadingAnchor");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_aCopyButtonView, "trailingAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "constraintEqualToAnchor:", v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setActive:", 1);

    -[UIView leadingAnchor](v12->_aPasteButtonView, "leadingAnchor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "trailingAnchor");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "constraintEqualToAnchor:", v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setActive:", 1);

    -[UIView centerYAnchor](v12->_aPasteButtonView, "centerYAnchor");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "constraintEqualToAnchor:", v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "setActive:", 1);

    -[UIView heightAnchor](v12->_aPasteButtonView, "heightAnchor");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12->_aCutButtonView, "heightAnchor");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "constraintEqualToAnchor:multiplier:", v214, 1.0);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "setActive:", 1);

    -[UIView widthAnchor](v12->_aPasteButtonView, "widthAnchor");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = v284;
    -[UIView widthAnchor](v12->_aCutButtonView, "widthAnchor");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "constraintEqualToAnchor:multiplier:", v218, 1.0);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v12->_aPasteButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v12->_aPasteButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpInside_forEvent_, 64);
    -[UIControl addTarget:action:forControlEvents:](v12->_aPasteButtonView, "addTarget:action:forControlEvents:", v12, sel_controlActionUpOutside_, 128);
    -[UIKBUndoInteractionHUD createSeparatorView](v12, "createSeparatorView");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v12->_backgroundEffectView, "contentView");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "addSubview:", v220);

    objc_msgSend(v220, "heightAnchor");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoInteractionHUD containerView](v12, "containerView");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "heightAnchor");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "constraintEqualToAnchor:", v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "setActive:", 1);

    objc_msgSend(v220, "leadingAnchor");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_aPasteButtonView, "trailingAnchor");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "constraintEqualToAnchor:", v227);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setActive:", 1);

    -[UIView leadingAnchor](v12->_rightButtonView, "leadingAnchor");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "trailingAnchor");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "constraintEqualToAnchor:", v230);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "setActive:", 1);

    v232 = v283;
    -[UIKBUndoControl configureSecurePasteButtonInRootView:](v12->_aPasteButtonView, "configureSecurePasteButtonInRootView:", v12);

LABEL_42:
  }
  if (v287)
    v280 = 4;
  else
    v280 = 3;
  -[UIView setSemanticContentAttribute:](v12->_rightButtonView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12->_leftButtonView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12->_aCutButtonView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12->_aCopyButtonView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12->_aPasteButtonView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12->_containerView, "setSemanticContentAttribute:", v280);
  -[UIView setSemanticContentAttribute:](v12, "setSemanticContentAttribute:", v280);
  -[NSObject setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("UIUndoInteractiveHUD"));
  v281 = v12;

LABEL_47:
  return v12;
}

- (id)createSeparatorView
{
  UIView *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(UIView);
  +[UIColor separatorColor](UIColor, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v4);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = 1.0 / v6;

  -[UIView widthAnchor](v2, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBUndoInteractionHUD;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 1)
    v4 = 2;
  else
    v4 = 1;

  -[UIKBUndoInteractionHUD style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", v4);

  -[UIView traitOverrides](self, "traitOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNSIntegerValue:forTrait:", v4, v7);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds", a4);
  v12.origin.x = v6 + -20.0;
  v12.size.width = v7 + 40.0;
  v12.origin.y = v8 + -20.0;
  v12.size.height = v9 + 40.0;
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(v12, v11);
}

- (id)controlForType:(int64_t)a3
{
  uint64_t v3;
  unint64_t v5;
  NSObject *v6;
  id result;
  NSObject *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      v3 = 432;
      goto LABEL_13;
    case 2:
      v3 = 440;
      goto LABEL_13;
    case 3:
      v3 = 448;
      goto LABEL_13;
    case 4:
      v3 = 456;
      goto LABEL_13;
    case 5:
    case 6:
      v3 = 464;
LABEL_13:
      result = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
    default:
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          v9 = 134217984;
          v10 = a3;
          _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected control type: %ld", (uint8_t *)&v9, 0xCu);
        }

      }
      else
      {
        v5 = controlForType____s_category;
        if (!controlForType____s_category)
        {
          v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&controlForType____s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v9 = 134217984;
          v10 = a3;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unexpected control type: %ld", (uint8_t *)&v9, 0xCu);
        }
      }
      result = 0;
      break;
  }
  return result;
}

- (BOOL)availableOfControl:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canUndo");
  }
  else if (objc_msgSend(v4, "type") == 2)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canRedo");
  }
  else if (objc_msgSend(v4, "type") == 3)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canCut");
  }
  else if (objc_msgSend(v4, "type") == 4)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canCopy");
  }
  else
  {
    if (objc_msgSend(v4, "type") != 5)
    {
      v7 = objc_msgSend(v4, "type") == 6;
      goto LABEL_12;
    }
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canPaste");
  }
  v7 = v6;

LABEL_12:
  return v7;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBUndoInteractionHUD setAppearanceDate:](self, "setAppearanceDate:", v4);

  }
  else
  {
    -[UIKBUndoInteractionHUD setAppearanceDate:](self, "setAppearanceDate:");
  }
}

- (void)updateHUDControlState
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;

  -[UIKBUndoInteractionHUD leftButtonView](self, "leftButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIKBUndoInteractionHUD availableOfControl:](self, "availableOfControl:", v3);
  -[UIKBUndoInteractionHUD leftButtonView](self, "leftButtonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  -[UIKBUndoInteractionHUD leftButtonView](self, "leftButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateUndoControlStyle");

  -[UIKBUndoInteractionHUD rightButtonView](self, "rightButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIKBUndoInteractionHUD availableOfControl:](self, "availableOfControl:", v7);
  -[UIKBUndoInteractionHUD rightButtonView](self, "rightButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

  -[UIKBUndoInteractionHUD rightButtonView](self, "rightButtonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateUndoControlStyle");

  -[UIKBUndoInteractionHUD aCutButtonView](self, "aCutButtonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIKBUndoInteractionHUD availableOfControl:](self, "availableOfControl:", v11);
  -[UIKBUndoInteractionHUD aCutButtonView](self, "aCutButtonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v12);

  -[UIKBUndoInteractionHUD aCutButtonView](self, "aCutButtonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateUndoControlStyle");

  -[UIKBUndoInteractionHUD aCopyButtonView](self, "aCopyButtonView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIKBUndoInteractionHUD availableOfControl:](self, "availableOfControl:", v15);
  -[UIKBUndoInteractionHUD aCopyButtonView](self, "aCopyButtonView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v16);

  -[UIKBUndoInteractionHUD aCopyButtonView](self, "aCopyButtonView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateUndoControlStyle");

  -[UIKBUndoInteractionHUD aPasteButtonView](self, "aPasteButtonView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[UIKBUndoInteractionHUD availableOfControl:](self, "availableOfControl:", v19);
  -[UIKBUndoInteractionHUD aPasteButtonView](self, "aPasteButtonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEnabled:", v20);

  -[UIKBUndoInteractionHUD aPasteButtonView](self, "aPasteButtonView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateUndoControlStyle");

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)performDelegateUndoAndUpdateHUDIfNeeded
{
  void *v3;
  id v4;

  -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undo:", 0);

  }
}

- (void)performDelegateRedoAndUpdateHUDIfNeeded
{
  void *v3;
  id v4;

  -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redo:", 0);

  }
}

- (void)controlActionDown:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") != 2)
  {
    if (objc_msgSend(v5, "type") == 5)
    {
      -[UIKBUndoInteractionHUD appearanceDate](self, "appearanceDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _UIPasteboardAnalyticsReportEvent(CFSTR("UndoHUD"), v4);

    }
    objc_msgSend(v5, "updateUndoControlStyle");
  }

}

- (void)controlActionUpInside:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  __CFString **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "state") != 2)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateIdleDetection:", 5);

    if (objc_msgSend(v13, "type") == 1)
    {
      -[UIKBUndoInteractionHUD performDelegateUndoAndUpdateHUDIfNeeded](self, "performDelegateUndoAndUpdateHUDIfNeeded");
      v8 = UIKBAnalyticsTextEditingOperationUndo;
    }
    else if (objc_msgSend(v13, "type") == 2)
    {
      -[UIKBUndoInteractionHUD performDelegateRedoAndUpdateHUDIfNeeded](self, "performDelegateRedoAndUpdateHUDIfNeeded");
      v8 = UIKBAnalyticsTextEditingOperationRedo;
    }
    else if (objc_msgSend(v13, "type") == 3)
    {
      -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cutOperation");

      v8 = UIKBAnalyticsTextEditingOperationCut;
    }
    else if (objc_msgSend(v13, "type") == 4)
    {
      -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "copyOperation");

      v8 = UIKBAnalyticsTextEditingOperationCopy;
    }
    else
    {
      if (objc_msgSend(v13, "type") != 5 && objc_msgSend(v13, "type") != 6)
        goto LABEL_14;
      objc_msgSend(v6, "_authenticationMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v11);

      -[UIKBUndoInteractionHUD actionDelegate](self, "actionDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pasteOperation");

      v8 = UIKBAnalyticsTextEditingOperationPaste;
    }
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", *v8, CFSTR("UndoHUDControl"));
LABEL_14:
    objc_msgSend(v13, "setHighlighted:", 0);
    objc_msgSend(v13, "updateUndoControlStyle");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)controlActionUpOutside:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") != 2)
  {
    objc_msgSend(v4, "updateUndoControlStyle");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateControlWithDirection:(int64_t)a3 travelProgress:(double)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a5;
  v7 = 0;
  switch(a3)
  {
    case 2:
      if (!a5)
        goto LABEL_5;
      goto LABEL_3;
    case 3:
      if (a5)
      {
LABEL_5:
        -[UIKBUndoInteractionHUD leftButtonView](self, "leftButtonView");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_3:
        -[UIKBUndoInteractionHUD rightButtonView](self, "rightButtonView");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_9;
    case 8:
      -[UIKBUndoInteractionHUD aCopyButtonView](self, "aCopyButtonView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 9:
      -[UIKBUndoInteractionHUD aCutButtonView](self, "aCutButtonView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 10:
      -[UIKBUndoInteractionHUD aPasteButtonView](self, "aPasteButtonView");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v8;
      break;
    default:
      break;
  }
  v9 = v7;
  objc_msgSend(v7, "updateCoverWithTavelProcess:isRTL:", v5, a4);

}

- (UIInteractiveUndoHUDActionDelegate)actionDelegate
{
  return (UIInteractiveUndoHUDActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (UIKBUndoControl)leftButtonView
{
  return self->_leftButtonView;
}

- (void)setLeftButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtonView, a3);
}

- (UIKBUndoControl)rightButtonView
{
  return self->_rightButtonView;
}

- (void)setRightButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtonView, a3);
}

- (UIKBUndoControl)aCutButtonView
{
  return self->_aCutButtonView;
}

- (void)setACutButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_aCutButtonView, a3);
}

- (UIKBUndoControl)aCopyButtonView
{
  return self->_aCopyButtonView;
}

- (void)setACopyButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_aCopyButtonView, a3);
}

- (UIKBUndoControl)aPasteButtonView
{
  return self->_aPasteButtonView;
}

- (void)setAPasteButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_aPasteButtonView, a3);
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (UIVisualEffectView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIKBUndoStyling)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (UILabel)instructionalLabel
{
  return self->_instructionalLabel;
}

- (void)setInstructionalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionalLabel, a3);
}

- (NSDate)appearanceDate
{
  return self->_appearanceDate;
}

- (void)setAppearanceDate:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_instructionalLabel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_aPasteButtonView, 0);
  objc_storeStrong((id *)&self->_aCopyButtonView, 0);
  objc_storeStrong((id *)&self->_aCutButtonView, 0);
  objc_storeStrong((id *)&self->_rightButtonView, 0);
  objc_storeStrong((id *)&self->_leftButtonView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
}

@end
