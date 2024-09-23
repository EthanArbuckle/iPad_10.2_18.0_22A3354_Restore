@implementation UIKBRenderFactoryiPhone

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __CFString **v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  __objc2_class **v30;
  void *v31;
  double v32;
  double x;
  double v34;
  double y;
  double v36;
  double width;
  double v38;
  double height;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  double MidY;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  int v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  double v151;
  double v152;
  void *v153;
  uint64_t v154;
  _UNKNOWN **v155;
  void *v156;
  int v157;
  void *v158;
  void *v159;
  int v160;
  int v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  double v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  void *v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  double v194;
  void *v195;
  __CFString **v196;
  __CFString *v197;
  void *v198;
  void *v199;
  const __CFString *v200;
  void *v201;
  UIKBDivotedEffect *v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  __CFString *v207;
  int v208;
  void *v209;
  int v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  __CFString *v216;
  void *v217;
  int v218;
  void *v219;
  int v220;
  __CFString **v221;
  void *v222;
  void *v223;
  int v224;
  void *v225;
  void *v226;
  int v227;
  __CFString **v228;
  void *v229;
  void *v230;
  int64_t v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t i;
  void *v240;
  int64_t v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  int v247;
  void *v248;
  int v249;
  void *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  void *v256;
  char v257;
  id v258;
  void *v259;
  int v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  int v267;
  id v268;
  CGFloat recta;
  CGFloat rect;
  _BOOL4 rect_12;
  void *rect_16;
  void *rect_24;
  void *v275;
  void *v276;
  void *v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  _QWORD v286[4];
  id v287;
  UIKBRenderFactoryiPhone *v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  objc_super v293;
  _BYTE v294[128];
  _BYTE v295[128];
  _BYTE v296[128];
  void *v297;
  void *v298;
  _QWORD v299[3];
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;

  v299[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v293.receiver = self;
  v293.super_class = (Class)UIKBRenderFactoryiPhone;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](&v293, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  objc_msgSend(v8, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoundRectCorners:", -1);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v10, "lightKeyboard") ^ 1);

  -[UIKBRenderFactory displayContentsForKey:](self, "displayContentsForKey:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = &off_1E167A000;
  -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbolStyle:", v14);

  objc_msgSend(v8, "symbolStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinFontSize:", 9.0);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "whiteText"))
    v17 = CFSTR("UIKBColorWhite");
  else
    v17 = CFSTR("UIKBColorBlack");
  objc_msgSend(v8, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  objc_msgSend(v8, "symbolStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactoryiPhone _customizeSymbolStyle:forKey:contents:](self, "_customizeSymbolStyle:forKey:contents:", v19, v6, v11);

  objc_msgSend(v8, "geometry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v276 = (void *)v11;
  -[UIKBRenderFactoryiPhone _customizeGeometry:forKey:contents:](self, "_customizeGeometry:forKey:contents:", v20, v6, v11);

  if (-[UIKBRenderFactoryiPhone _shouldConfigureSecondarySymbolStyleForSpaceKey:](self, "_shouldConfigureSecondarySymbolStyleForSpaceKey:", v6))
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v21, 12.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "lightKeyboard");
    v25 = UIKBColorBlack_Alpha20;
    if (!v24)
      v25 = UIKBColorWhite_Alpha30;
    objc_msgSend(v22, "setTextColor:", *v25);

    if ((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) == 0)
      objc_msgSend(v22, "setFontWidth:", *(double *)off_1E167DC88);
    objc_msgSend(v22, "setAlignment:", 2);
    objc_msgSend(v22, "setAnchorCorner:", 8);
    objc_msgSend(v22, "setTextOffset:", 5.0, 4.0);
    v299[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v299, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecondarySymbolStyles:", v26);

  }
  if (-[UIKBRenderFactoryiPhone _popupMenuStyleForKey:](self, "_popupMenuStyleForKey:", v6))
  {
    v27 = objc_msgSend(v6, "displayType");
    objc_msgSend(v8, "geometry");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPopupBias:", 40);

    objc_msgSend(v8, "geometry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTallPopup:", 0);

    v30 = off_1E167AF28;
    if (v27 != 5)
      v30 = off_1E167A978;
    -[__objc2_class sharedInstance](*v30, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "popupRect");
    x = v32;
    y = v34;
    width = v36;
    height = v38;
    if (objc_msgSend(v31, "mode") == 1)
    {
      objc_msgSend(v6, "paddedFrame");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_layout");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "convertRect:fromView:", v31, x, y, width, height);
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;

      v300.origin.x = v41;
      v300.origin.y = v43;
      v300.size.width = v45;
      v300.size.height = v47;
      v317.origin.x = v51;
      v317.origin.y = v53;
      v317.size.width = v55;
      v317.size.height = v57;
      v301 = CGRectUnion(v300, v317);
      x = v301.origin.x;
      y = v301.origin.y;
      width = v301.size.width;
      height = v301.size.height;
    }
    else
    {
      objc_msgSend(v8, "geometry");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setPopupBias:", 0);

    }
    v302.origin.x = x;
    v302.origin.y = y;
    v302.size.width = width;
    v302.size.height = height;
    v303 = CGRectInset(v302, -12.0, -5.0);
    v63 = v303.origin.x;
    v64 = v303.size.width;
    v65 = v303.size.height;
    v66 = v303.origin.y + -2.0;
    objc_msgSend(v8, "geometry");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setDisplayFrame:", v63, v66, v64, v65);

    -[UIKBRenderFactoryiPhone _customizePopupTraits:forKey:onKeyplane:](self, "_customizePopupTraits:forKey:onKeyplane:", v8, v6, v7);
    if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 10)
      objc_msgSend(v8, "removeAllRenderEffects");
    objc_msgSend(v8, "symbolStyle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTextColor:", CFSTR("UIKBColorClear"));

    v69 = v8;
    goto LABEL_188;
  }
  rect_12 = -[UIKBRenderFactoryiPhone _popupStyleForKey:](self, "_popupStyleForKey:", v6);
  if (rect_12)
    -[UIKBRenderFactoryiPhone _configureTraitsForPopupStyle:withKey:onKeyplane:](self, "_configureTraitsForPopupStyle:withKey:onKeyplane:", v8, v6, v7);
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v8, "symbolStyle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setTextOpacity:", 0.32);

  }
  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "keyboardType");

  rect_24 = v7;
  v277 = v8;
  if (objc_msgSend(v6, "displayTypeHint") == 10)
  {
    if (v60 == 12)
      v61 = objc_msgSend(v7, "isShiftKeyplane");
    else
      v61 = 0;
    v70 = v61 ^ 1;
  }
  else
  {
    v70 = 0;
  }
  objc_msgSend(v6, "stringForProperty:", CFSTR("KBhint"));
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v6, "supportsSupplementalDisplayString");
  rect_16 = (void *)v71;
  if (objc_msgSend(v6, "displayType") == 7 && (v70 & 1) == 0)
  {
    objc_msgSend(v277, "symbolStyle");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v73, "copy");

    objc_msgSend(v277, "geometry");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "symbolFrame");
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v83 = v82;

    v304.size.height = v83 * 0.275;
    v304.origin.y = v79 + v83 * 0.18;
    v304.origin.x = v77;
    v304.size.width = v81;
    v305 = CGRectIntegral(v304);
    recta = v305.origin.x;
    v84 = v305.origin.y;
    v85 = v305.size.width;
    v86 = v305.size.height;
    v305.origin.y = v79 + v83 * 0.455;
    v305.origin.x = v77;
    v305.size.width = v81;
    v305.size.height = v83 * 0.315;
    v306 = CGRectIntegral(v305);
    v87 = v306.origin.x;
    v88 = v306.origin.y;
    v89 = v306.size.width;
    v90 = v306.size.height;
    v306.origin.x = recta;
    v306.origin.y = v84;
    v306.size.width = v85;
    v306.size.height = v86;
    v307 = CGRectInset(v306, -3.0, -3.0);
    v91 = v307.origin.x;
    v92 = v307.origin.y;
    v93 = v307.size.width;
    v94 = v307.size.height;
    v307.origin.x = v87;
    v307.origin.y = v88;
    v307.size.width = v89;
    v307.size.height = v90;
    v308 = CGRectInset(v307, -3.0, -3.0);
    rect = v308.origin.x;
    v95 = v308.origin.y;
    v96 = v308.size.width;
    v97 = v308.size.height;
    if (objc_msgSend(v6, "BOOLForProperty:", CFSTR("slide-down")))
      v95 = v92 + v94;
    v309.origin.x = v91;
    v309.origin.y = v92;
    v309.size.width = v93;
    v309.size.height = v94;
    MidY = CGRectGetMidY(v309);
    objc_msgSend(v277, "geometry");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "symbolFrame");
    v100 = MidY - CGRectGetMidY(v310);

    objc_msgSend(v277, "geometry");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "symbolFrame");
    CGRectGetMinX(v311);
    v312.origin.x = v91;
    v312.origin.y = v92;
    v312.size.width = v93;
    v312.size.height = v94;
    CGRectGetMinX(v312);

    objc_msgSend(v277, "geometry");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "symbolFrame");
    CGRectGetMaxX(v313);
    v314.origin.x = rect;
    v314.origin.y = v95;
    v314.size.width = v96;
    v314.size.height = v97;
    CGRectGetMaxX(v314);

    v315.origin.x = rect;
    v315.origin.y = v95;
    v315.size.width = v96;
    v315.size.height = v97;
    v103 = CGRectGetMidY(v315);
    objc_msgSend(v277, "geometry");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "symbolFrame");
    v105 = CGRectGetMidY(v316);

    -[UIKBRenderFactoryiPhone dualStringBottomAdditionalOffsetForDisplayContents:](self, "dualStringBottomAdditionalOffsetForDisplayContents:", v276);
    v107 = v106;
    objc_msgSend(v74, "setTextOffset:", 0.0, v100 + 1.5);
    if (((-[UIKBRenderFactoryiPhone iPadFudgeLayout](self, "iPadFudgeLayout") | v72) & 1) != 0)
      goto LABEL_34;
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v153, "shiftState");
    if (v154 == 4
      || (-[UIKBRenderFactory renderingContext](self, "renderingContext"),
          v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "shiftState") != 1))
    {
      -[UIKBRenderFactory renderingContext](self, "renderingContext");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "shiftState") != 4 || !objc_msgSend(rect_24, "isShiftKeyplane"))
      {
        v161 = 0;
        goto LABEL_76;
      }
      v155 = v12;
      v156 = v6;
      v157 = 1;
    }
    else
    {
      v155 = v12;
      v156 = v6;
      v157 = 0;
    }
    if ((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0)
      v160 = 1;
    else
      v160 = objc_msgSend(v156, "supportsSupplementalDisplayString");
    v161 = v160 ^ 1;
    if (!v157)
    {
      v6 = v156;
      v12 = v155;
      if (v154 == 4)
      {
LABEL_77:

        if (v161)
          goto LABEL_81;
        goto LABEL_34;
      }
LABEL_80:

      if ((v161 & 1) != 0)
      {
LABEL_81:
        objc_msgSend(v277, "symbolStyle");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = (void *)objc_msgSend(v162, "copy");
        v298 = v163;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v298, 1);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "setSecondarySymbolStyles:", v164);

        v108 = v277;
        objc_msgSend(v277, "setSymbolStyle:", 0);
LABEL_88:

        goto LABEL_89;
      }
LABEL_34:
      v108 = v277;
      if (objc_msgSend(v6, "displayTypeHint") != 10)
      {
        objc_msgSend(v277, "symbolStyle");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "setTextOffset:", 0.0, v103 - v105 + v107);

        v297 = v74;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v297, 1);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "setSecondarySymbolStyles:", v159);

      }
      goto LABEL_88;
    }
    v6 = v156;
    v12 = v155;
LABEL_76:

    if (v154 == 4)
      goto LABEL_77;
    goto LABEL_80;
  }
  v108 = v277;
  if (objc_msgSend(v6, "displayTypeHint") == 10)
  {
    if (objc_msgSend(v6, "state") == 4)
      objc_msgSend(v277, "setRenderSecondarySymbolsSeparately:", 1);
    objc_msgSend(v276, "secondaryDisplayStrings");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "count");

    if (objc_msgSend(v6, "state") != 16 && v110)
    {
      v111 = v110;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = 0u;
      v290 = 0u;
      v291 = 0u;
      v292 = 0u;
      objc_msgSend(v276, "secondaryDisplayStrings");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v289, v296, 16);
      if (v114)
      {
        v115 = v114;
        v116 = *(_QWORD *)v290;
        while (1)
        {
          if (*(_QWORD *)v290 != v116)
            objc_enumerationMutation(v113);
          objc_msgSend(v277, "symbolStyle");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void *)objc_msgSend(v117, "copy");
          objc_msgSend(v112, "addObject:", v118);

          if (!--v115)
          {
            v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v289, v296, 16);
            if (!v115)
              break;
          }
        }
      }

      v108 = v277;
      objc_msgSend(v277, "setSecondarySymbolStyles:", v112);

      v110 = v111;
    }
    if (objc_msgSend(v6, "state") <= 2)
    {
      v119 = objc_msgSend(v6, "displayType");
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v120, "lightKeyboard"))
        v121 = 0.25;
      else
        v121 = 0.3;

      v122 = dbl_186680200[v119 == 7];
      if (v119 == 7)
        v123 = 1.0;
      else
        v123 = 0.65;
      v124 = dbl_186680210[v119 == 7];
      objc_msgSend(v108, "symbolStyle");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "textOffset");
      v127 = v126;
      v129 = v128;

      objc_msgSend(v108, "geometry");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "displayFrame");
      v132 = v122 * v131;

      v133 = objc_msgSend(v6, "BOOLForProperty:", CFSTR("slide-down"));
      v134 = v132 + v132;
      if (!v133)
        v134 = v132;
      v135 = v129 + v134;
      objc_msgSend(v108, "symbolStyle");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "setTextOffset:", v127, v135);

      if (v110 == 2)
      {
        objc_msgSend(v108, "geometry");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "displayFrame");
        v167 = v124 * v166;

        objc_msgSend(v108, "secondarySymbolStyles");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "firstObject");
        v169 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v169, "setTextOpacity:", v121);
        objc_msgSend(v169, "fontSize");
        objc_msgSend(v169, "setFontSize:", v123 * v170);
        objc_msgSend(v169, "textOffset");
        v172 = v171;
        v174 = v173 - v167;
        objc_msgSend(v108, "geometry");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "displayFrame");
        v177 = v172 - v176 * 0.24;

        objc_msgSend(v169, "setTextOffset:", v177, v174);
        objc_msgSend(v108, "secondarySymbolStyles");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "lastObject");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v74, "setTextOpacity:", v121);
        objc_msgSend(v74, "fontSize");
        objc_msgSend(v74, "setFontSize:", v123 * v179);
        objc_msgSend(v74, "textOffset");
        v181 = v180;
        v183 = v182 - v167;
        objc_msgSend(v108, "geometry");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "displayFrame");
        v186 = v181 + v185 * 0.24;

        v187 = v74;
        v188 = v186;
        v189 = v183;
LABEL_87:
        objc_msgSend(v187, "setTextOffset:", v188, v189);
        goto LABEL_88;
      }
      if (v110 == 1)
      {
        objc_msgSend(v108, "secondarySymbolStyles");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "firstObject");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "displayType") != 7)
          objc_msgSend(v74, "setTextOpacity:", v121);
        objc_msgSend(v74, "setImageScale:", v123);
        objc_msgSend(v74, "textOffset");
        v139 = v138;
        v141 = v140;
        objc_msgSend(v108, "geometry");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "displayFrame");
        v144 = v143;

        objc_msgSend(v74, "fontSize");
        v146 = v145;
        objc_msgSend(v74, "setFontSize:", v123 * v145);
        objc_msgSend(v6, "secondaryDisplayStrings");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "firstObject");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend(v148, "isEqualToString:", CFSTR("٬"));

        if (v149)
        {
          objc_msgSend(v74, "setFontSize:", v146 * 1.1);
          objc_msgSend(v108, "geometry");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "displayFrame");
          v152 = v151 * 0.27;

        }
        else
        {
          v152 = v124 * v144;
          objc_msgSend(v6, "secondaryDisplayStrings");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "firstObject");
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = objc_msgSend(v191, "rangeOfCharacterFromSet:", v192);

          if (v193 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v74, "fontSize");
            objc_msgSend(v74, "setFontSize:", v194 * 0.9);
          }
          v108 = v277;
        }
        v189 = v141 - v152;
        v187 = v74;
        v188 = v139;
        goto LABEL_87;
      }
    }
  }
LABEL_89:
  if (objc_msgSend(v6, "displayType") == 23
    || objc_msgSend(v6, "displayType") == 51
    || objc_msgSend(v276, "displayPathType"))
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = UIKBColorBlack;
    if ((objc_msgSend(v195, "lightKeyboard") & 1) == 0 && objc_msgSend(v6, "state") <= 2)
      v196 = UIKBColorWhite;
    v197 = *v196;
    objc_msgSend(v108, "symbolStyle");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "setTextColor:", v197);

  }
  if (objc_msgSend(v6, "displayType") == 3)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v199, "lightKeyboard"))
      v200 = CFSTR("UIKBColorBlack");
    else
      v200 = CFSTR("UIKBColorWhite");
    objc_msgSend(v108, "symbolStyle");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "setTextColor:", v200);

  }
  if (-[UIKBRenderFactory drawsOneHandedAffordance](self, "drawsOneHandedAffordance")
    && objc_msgSend(v6, "displayType") == 25)
  {
    v202 = objc_alloc_init(UIKBDivotedEffect);
    objc_msgSend(v108, "addRenderEffect:", v202);
    objc_msgSend(v108, "setRenderFlagsForAboveEffects:", objc_msgSend(v108, "renderFlagsForAboveEffects") | 1);

  }
  if (!rect_12)
  {
    if (-[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v6)
      && objc_msgSend(v6, "state") == 2)
    {
      -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorKeyBlueKeyBackground"));
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setBackgroundGradient:", v203);

      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha50"), 4, -1.0, 1.0);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "addRenderEffect:", v204);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = objc_msgSend(v205, "lightKeyboard");

      if (!v206)
        goto LABEL_136;
      objc_msgSend(v108, "symbolStyle");
      v207 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString setTextColor:](v207, "setTextColor:", CFSTR("UIKBColorWhite"));
      goto LABEL_135;
    }
    -[UIKBRenderFactory defaultKeyShadowColorName](self, "defaultKeyShadowColorName");
    v207 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v208 = objc_msgSend(v6, "displayType");
    if (v208 == 47)
    {
      -[UIKBRenderFactoryiPhone _customizeTraits:forPredictionCellKey:](self, "_customizeTraits:forPredictionCellKey:", v108, v6);
    }
    else
    {
      if (v208 == 48)
      {
        objc_msgSend(v6, "name");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        v210 = objc_msgSend(v209, "isEqualToString:", CFSTR("DividerLine"));

        if (!v210)
        {
          objc_msgSend(v6, "name");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = objc_msgSend(v217, "isEqualToString:", CFSTR("SelectionBackground"));

          if (v218)
          {
            -[UIKBRenderFactory renderConfig](self, "renderConfig");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            v220 = objc_msgSend(v219, "lightKeyboard");
            v221 = UIKBPredictionCandidateEnabledBackground;
            if (!v220)
              v221 = UIKBColorKeyGrayKeyLightBackground;
            +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", *v221);
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setBackgroundGradient:", v222);

          }
          goto LABEL_135;
        }
        +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBPredictionCandidateEnabledBackground"));
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "setBackgroundGradient:", v211);
      }
      else
      {
        -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "setBackgroundGradient:", v213);

        if ((objc_msgSend(v6, "state") & 4) != 0
          && objc_msgSend(v6, "displayType") != 23
          && !-[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v6))
        {
          if (-[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v6))
          {
            objc_msgSend(v108, "setControlOpacities:", 1);
            -[UIKBRenderFactory controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v214);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setBackgroundGradient:", v215);

            -[UIKBRenderFactory controlKeyShadowColorName](self, "controlKeyShadowColorName");
            v216 = v207;
            v207 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[UIKBRenderFactory renderConfig](self, "renderConfig");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            v224 = objc_msgSend(v223, "animatedBackground");

            if (v224)
            {
              objc_msgSend(v108, "setBlurBlending:", 1);
              -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
              v216 = (__CFString *)objc_claimAutoreleasedReturnValue();
              +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha10"));
              v225 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setLayeredForegroundGradient:", v225);

              objc_msgSend(v108, "setBlendForm:", 9);
            }
            else
            {
              -[UIKBRenderFactory renderConfig](self, "renderConfig");
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              v227 = objc_msgSend(v226, "lightKeyboard");

              if (v227)
              {
                v228 = UIKBColorLightGrayPressState;
              }
              else
              {
                objc_msgSend(v108, "setBlurBlending:", 1);
                if (objc_msgSend((id)objc_opt_class(), "_graphicsQuality") == 100)
                {
                  objc_msgSend(v108, "setBlendForm:", 6);
                  v228 = UIKBColorKeyGrayKeyActiveDarkBackground;
                }
                else
                {
                  v228 = UIKBColorKeyGrayKeyDarkBackground;
                }
              }
              v216 = *v228;
            }
            +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v216);
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setBackgroundGradient:", v229);

          }
        }
        +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v207, 4, -1.0, 1.0);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "addRenderEffect:", v211);
      }

    }
LABEL_135:

  }
LABEL_136:
  objc_msgSend(v276, "displayString");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = -[UIKBRenderFactory glyphSelectorForDisplayString:](self, "glyphSelectorForDisplayString:", v230);

  if (v231)
  {
    objc_msgSend(v108, "symbolStyle");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "setSelector:", v231);

  }
  objc_msgSend(v276, "secondaryDisplayStrings");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v286[0] = MEMORY[0x1E0C809B0];
  v286[1] = 3221225472;
  v286[2] = __52__UIKBRenderFactoryiPhone__traitsForKey_onKeyplane___block_invoke;
  v286[3] = &unk_1E16BD3E8;
  v234 = v108;
  v287 = v234;
  v288 = self;
  objc_msgSend(v233, "enumerateObjectsUsingBlock:", v286);

  v284 = 0u;
  v285 = 0u;
  v282 = 0u;
  v283 = 0u;
  objc_msgSend(v276, "variantDisplayContents");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v282, v295, 16);
  if (v236)
  {
    v237 = v236;
    v238 = *(_QWORD *)v283;
    do
    {
      for (i = 0; i != v237; ++i)
      {
        if (*(_QWORD *)v283 != v238)
          objc_enumerationMutation(v235);
        objc_msgSend(*(id *)(*((_QWORD *)&v282 + 1) + 8 * i), "displayString");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        v241 = -[UIKBRenderFactory glyphSelectorForDisplayString:](self, "glyphSelectorForDisplayString:", v240);

        if (v241)
        {
          objc_msgSend(v234, "variantTraits");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "symbolStyle");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "setSelector:", v241);

          objc_msgSend(v234, "highlightedVariantTraits");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "symbolStyle");
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "setSelector:", v241);

        }
      }
      v237 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v282, v295, 16);
    }
    while (v237);
  }

  v7 = rect_24;
  if (objc_msgSend(v6, "displayType") == 27 && objc_msgSend(v6, "variantType") == 4)
  {
    objc_msgSend(rect_24, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = objc_msgSend(v246, "displayRowHint");

    if (objc_msgSend(v6, "displayRowHint") == v247)
      -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = objc_msgSend(v248, "lightKeyboard");

  v8 = v277;
  v31 = rect_16;
  if (v249)
  {
    v280 = 0u;
    v281 = 0u;
    v278 = 0u;
    v279 = 0u;
    objc_msgSend(rect_24, "subtrees");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v278, v294, 16);
    if (!v251)
    {
      v258 = 0;
      goto LABEL_171;
    }
    v252 = v251;
    v275 = v6;
    v253 = *(_QWORD *)v279;
LABEL_154:
    v254 = 0;
    while (1)
    {
      if (*(_QWORD *)v279 != v253)
        objc_enumerationMutation(v250);
      v255 = *(void **)(*((_QWORD *)&v278 + 1) + 8 * v254);
      objc_msgSend(v255, "name");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = objc_msgSend(v256, "_containsSubstring:", CFSTR("Assist"));

      if ((v257 & 1) != 0)
        break;
      if (v252 == ++v254)
      {
        v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v278, v294, 16);
        if (v252)
          goto LABEL_154;
        v258 = 0;
        v7 = rect_24;
        v6 = v275;
        v8 = v277;
        v31 = rect_16;
        goto LABEL_171;
      }
    }
    v258 = v255;

    if (v258)
    {
      objc_msgSend(v258, "keys");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v275;
      v260 = objc_msgSend(v259, "containsObject:", v275);

      v7 = rect_24;
      v8 = v277;
      if (v260)
      {
        if ((objc_msgSend(v275, "state") & 3) != 0)
        {
          -[UIKBRenderFactoryiPhone shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
          v261 = objc_claimAutoreleasedReturnValue();
LABEL_170:
          v250 = (void *)v261;
          v31 = rect_16;
          objc_msgSend(v234, "overlayWithTraits:", v261);
LABEL_171:

LABEL_172:
          goto LABEL_173;
        }
        if ((objc_msgSend(v275, "state") & 4) != 0)
        {
          -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
          v261 = objc_claimAutoreleasedReturnValue();
          goto LABEL_170;
        }
      }
    }
    else
    {
      v7 = rect_24;
      v6 = v275;
      v8 = v277;
    }
    v31 = rect_16;
    goto LABEL_172;
  }
LABEL_173:
  if (((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0
     || objc_msgSend(v6, "supportsSupplementalDisplayString"))
    && objc_msgSend(v6, "displayType") == 7)
  {
    if (rect_12)
    {
      v262 = 1;
    }
    else if (-[UIKBRenderFactoryiPhone isCustomizedKeyStyle](self, "isCustomizedKeyStyle"))
    {
      v262 = 2;
    }
    else
    {
      v262 = 0;
    }
    -[UIKBRenderFactoryiPhone multiscriptKeyTraitsForKey:style:](self, "multiscriptKeyTraitsForKey:style:", v6, v262);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "overlayWithTraits:", v263);

  }
  if (objc_msgSend(v6, "displayType") == 7)
  {
    objc_msgSend(v6, "displayString");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v264, "isEqualToString:", CFSTR("ㄢ")) & 1) != 0)
    {
      objc_msgSend(v6, "secondaryDisplayStrings");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "firstObject");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      v267 = objc_msgSend(v266, "isEqualToString:", CFSTR("ㄦ"));

      v31 = rect_16;
      if (v267)
        -[UIKBRenderFactoryiPhone _customizeTraits:forZhuyinGridDualStringKey:](self, "_customizeTraits:forZhuyinGridDualStringKey:", v234, v6);
    }
    else
    {

    }
  }
  v268 = v234;

LABEL_188:
  return v8;
}

- (BOOL)_popupStyleForKey:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;

  v4 = a3;
  if (-[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v4))
    v5 = 20;
  else
    v5 = 16;
  if ((objc_msgSend(v4, "interactionType") == 1 || objc_msgSend(v4, "interactionType") == 2)
    && (objc_msgSend(v4, "state") & v5) != 0)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("Assist")) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_popupMenuStyleForKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "state") == 16
    && (objc_msgSend(v3, "displayType") == 13
     || objc_msgSend(v3, "displayType") == 4
     || objc_msgSend(v3, "displayTypeHint") == 12
     || objc_msgSend(v3, "displayType") == 5);

  return v4;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v27 = a3;
  v8 = a4;
  v9 = a5;
  -[UIKBRenderFactory scale](self, "scale");
  v11 = v10;
  v12 = 5.0;
  if (v11 <= 2.0)
  {
    objc_msgSend(v8, "paddedFrame", 5.0);
    v12 = 4.0;
    if (v13 > 42.0)
      v12 = 5.0;
  }
  objc_msgSend(v27, "setRoundRectRadius:", v12);
  if (objc_msgSend(v8, "displayTypeHint") == 12)
    objc_msgSend(v27, "setRoundRectRadius:", 8.0);
  objc_msgSend(v27, "paddedFrame");
  objc_msgSend(v27, "setSymbolFrame:", v14 + 2.0, v16 + 1.0, v15 + -4.0, v17 + -3.0);
  objc_msgSend(v27, "symbolFrame");
  objc_msgSend(v27, "setPaddedFrame:", v18 + 0.0, v19 + 0.0);
  if (objc_msgSend(v8, "displayType") == 23 || objc_msgSend(v8, "displayType") == 3)
  {
    objc_msgSend(v9, "displayString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "paddedFrame");
    if (v20)
    {
      objc_msgSend(v27, "setSymbolFrame:", round(v21 + (v23 + -20.0) * 0.5), round(v22 + (v24 + -20.0) * 0.5), 20.0, 20.0);
      objc_msgSend(v27, "symbolFrame");
      v25 = -5.0;
      v26 = -5.0;
    }
    else
    {
      v25 = 3.0;
      v26 = 3.0;
    }
    v28 = CGRectInset(*(CGRect *)&v21, v25, v26);
    objc_msgSend(v27, "setSymbolFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  }
  if (!objc_msgSend(v8, "displayType")
    || objc_msgSend(v8, "displayType") == 7
    || objc_msgSend(v8, "displayType") == 8)
  {
    objc_msgSend(v27, "symbolFrame");
    v30 = CGRectInset(v29, -2.0, 0.0);
    objc_msgSend(v27, "setSymbolFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  }

}

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 1;
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  double v54;
  id v55;

  v55 = a3;
  v8 = a4;
  v9 = a5;
  -[UIKBRenderFactoryiPhone symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
  v11 = v10;
  v12 = *(double *)off_1E167DC70;
  if (objc_msgSend(v8, "displayType") == 13)
  {
    -[UIKBRenderFactoryiPhone internationalKeyOffset](self, "internationalKeyOffset");
LABEL_7:
    objc_msgSend(v55, "setTextOffset:");
LABEL_8:
    objc_msgSend(v55, "setUsesSymbolImage:", 1);
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "displayType") == 9)
  {
    -[UIKBRenderFactoryiPhone realEmojiKeyOffset](self, "realEmojiKeyOffset");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "displayType") == 4)
  {
    -[UIKBRenderFactoryiPhone dictationKeyOffset](self, "dictationKeyOffset");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "displayType") == 3)
  {
    -[UIKBRenderFactoryiPhone deleteKeyFontSize](self, "deleteKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone deleteKeyOffset](self, "deleteKeyOffset");
LABEL_14:
    objc_msgSend(v55, "setTextOffset:");
    goto LABEL_15;
  }
  if (objc_msgSend(v8, "displayType") == 23)
  {
    -[UIKBRenderFactoryiPhone shiftKeyFontSize](self, "shiftKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone shiftKeyOffset](self, "shiftKeyOffset");
    objc_msgSend(v55, "setTextOffset:");
    v14 = objc_msgSend(v8, "displayTypeHint");
    if (v14)
    {
      if (v14 == 2)
      {
        -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setFontName:", v15);

LABEL_27:
        -[UIKBRenderFactoryiPhone stringKeyOffset](self, "stringKeyOffset");
        goto LABEL_14;
      }
      if ((v14 & 0xFFFFFFFE) == 2)
        goto LABEL_27;
    }
    else
    {
      -[UIKBRenderFactoryiPhone hintNoneKeyFontSize](self, "hintNoneKeyFontSize");
      objc_msgSend(v55, "setFontSize:");
    }
LABEL_15:
    objc_msgSend(v55, "setUsesSymbolImage:", 1);
    if (-[UIKBRenderFactoryiPhone needsSmallerFontSizeForKey:](self, "needsSmallerFontSizeForKey:", v8))
    {
      -[UIKBRenderFactoryiPhone smallSymbolImageFontSize](self, "smallSymbolImageFontSize");
      v11 = v13;
      v12 = *(double *)off_1E167DC68;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "displayType") == 51 || objc_msgSend(v8, "interactionType") == 38)
    goto LABEL_15;
  objc_msgSend(v8, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasSuffix:", CFSTR("Chinese-Facemark"));

  if (v17)
  {
    -[UIKBRenderFactoryiPhone stringKeyFontSize](self, "stringKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone stringKeyOffset](self, "stringKeyOffset");
LABEL_44:
    v36 = v55;
LABEL_50:
    objc_msgSend(v36, "setTextOffset:", v18, v19);
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "displayType") == 18)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v20);

    -[UIKBRenderFactoryiPhone moreKeyFontSize](self, "moreKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone more123KeyOffset](self, "more123KeyOffset");
    v22 = v21;
    v24 = v23;
    if (objc_msgSend(v8, "displayTypeHint") == 1)
    {
      if (objc_msgSend(v8, "BOOLForProperty:", CFSTR("More-Key-Merged")))
      {
        -[UIKBRenderFactoryiPhone moreABCKeyWideCellFontSize](self, "moreABCKeyWideCellFontSize");
        objc_msgSend(v55, "setFontSize:");
        -[UIKBRenderFactoryiPhone moreABCKeyWideCellOffset](self, "moreABCKeyWideCellOffset");
      }
      else
      {
        -[UIKBRenderFactoryiPhone moreABCKeyFontSize](self, "moreABCKeyFontSize");
        objc_msgSend(v55, "setFontSize:");
        -[UIKBRenderFactoryiPhone moreABCKeyOffset](self, "moreABCKeyOffset");
      }
      v22 = v25;
      v24 = v26;
    }
    objc_msgSend(v8, "displayString");
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v37 == CFSTR(""))
      objc_msgSend(v55, "setUsesSymbolImage:", 1);
    v36 = v55;
    v18 = v22;
    v19 = v24;
    goto LABEL_50;
  }
  if (objc_msgSend(v8, "displayType") == 21
    || objc_msgSend(v8, "displayType") == 25
    || objc_msgSend(v8, "displayType") == 27)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v27);

    -[UIKBRenderFactoryiPhone returnKeyFontSize](self, "returnKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone returnKeyOffset](self, "returnKeyOffset");
    objc_msgSend(v55, "setTextOffset:");
    objc_msgSend(v55, "setKerning:", 0.0);
    if (objc_msgSend(v8, "variantType") == 4)
    {
      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setFontName:", v28);

      -[UIKBRenderFactoryiPhone returnKeyFontSize](self, "returnKeyFontSize");
      objc_msgSend(v55, "setFontSize:");
      v29 = -0.5;
      v30 = -0.25;
    }
    else
    {
      objc_msgSend(v9, "displayString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "_isIdeographicGlyphs");

      if (!v32)
      {
LABEL_40:
        objc_msgSend(v9, "displayStringImage");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "containsString:", CFSTR("grinning")))
        {

        }
        else
        {
          objc_msgSend(v9, "displayStringImage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "containsString:", CFSTR("return"));

          if (!v35)
            goto LABEL_9;
        }
        objc_msgSend(v55, "setUsesSymbolImage:", 1);
        -[UIKBRenderFactoryiPhone symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
        objc_msgSend(v55, "setFontSizeForSymbolImage:");
        objc_msgSend(v55, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
        -[UIKBRenderFactoryiPhone symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
        goto LABEL_44;
      }
      -[UIKBRenderFactoryiPhone stringKeyOffset](self, "stringKeyOffset");
    }
    objc_msgSend(v55, "setTextOffset:", v30, v29);
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "displayType") == 42)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v38);

    -[UIKBRenderFactoryiPhone assistKeyFontSize](self, "assistKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone cutKeyOffset](self, "cutKeyOffset");
LABEL_61:
    objc_msgSend(v55, "setTextOffset:");
    objc_msgSend(v55, "setKerning:", 0.0);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "displayType") == 43)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v39);

    -[UIKBRenderFactoryiPhone assistKeyFontSize](self, "assistKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone copyKeyOffset](self, "copyKeyOffset");
    goto LABEL_61;
  }
  if (objc_msgSend(v8, "displayType") == 44)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v40);

    -[UIKBRenderFactoryiPhone assistKeyFontSize](self, "assistKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone pasteKeyOffset](self, "pasteKeyOffset");
    goto LABEL_61;
  }
  if (objc_msgSend(v8, "displayType") == 39)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v41);

    -[UIKBRenderFactoryiPhone assistKeyFontSize](self, "assistKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone boldKeyOffset](self, "boldKeyOffset");
    goto LABEL_61;
  }
  if (objc_msgSend(v8, "interactionType") == 17)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFontName:", v42);

    -[UIKBRenderFactoryiPhone assistKeyFontSize](self, "assistKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone undoKeyOffset](self, "undoKeyOffset");
    goto LABEL_61;
  }
  if (objc_msgSend(v8, "displayType") == 45)
  {
    -[UIKBRenderFactoryiPhone leftArrowKeyOffset](self, "leftArrowKeyOffset");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "displayType") == 46)
  {
    -[UIKBRenderFactoryiPhone rightArrowKeyOffset](self, "rightArrowKeyOffset");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "displayType") == 5)
  {
    -[UIKBRenderFactoryiPhone dismissKeyOffset](self, "dismissKeyOffset");
    goto LABEL_7;
  }
  objc_msgSend(v8, "name");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("Zhuyin-Letter-FIRST_TONE"));

  if (v44)
  {
    -[UIKBRenderFactoryiPhone zhuyinFirstToneKeyFontSize](self, "zhuyinFirstToneKeyFontSize");
    objc_msgSend(v55, "setFontSize:");
    -[UIKBRenderFactoryiPhone zhuyinFirstToneKeyOffset](self, "zhuyinFirstToneKeyOffset");
    goto LABEL_44;
  }
  objc_msgSend(v8, "representedString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("‌"));

  if (v46)
  {
    -[UIKBRenderFactoryiPhone ZWNJKeyOffset](self, "ZWNJKeyOffset");
    goto LABEL_44;
  }
  -[UIKBRenderFactoryiPhone stringKeyFontSize](self, "stringKeyFontSize");
  objc_msgSend(v55, "setFontSize:");
  -[UIKBRenderFactoryiPhone stringKeyOffset](self, "stringKeyOffset");
  objc_msgSend(v55, "setTextOffset:");
  if (objc_msgSend(v8, "dynamicLayout"))
  {
    objc_msgSend(v8, "frame");
    if (v47 < 35.0)
    {
      objc_msgSend(v55, "fontSize");
      objc_msgSend(v55, "setFontSize:", round(v48 * 0.8));
    }
  }
  if (qword_1ECD7ECB0 != -1)
    dispatch_once(&qword_1ECD7ECB0, &__block_literal_global_521);
  objc_msgSend(v8, "displayString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rangeOfCharacterFromSet:", qword_1ECD7ECA8);
  v51 = v50;

  objc_msgSend(v8, "displayString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "length");

  if (v51 == v53)
  {
    objc_msgSend(v55, "textOffset");
    objc_msgSend(v55, "setTextOffset:");
    objc_msgSend(v55, "fontSize");
    objc_msgSend(v55, "setFontSize:", v54 + 2.0);
  }
LABEL_9:
  if (objc_msgSend(v55, "usesSymbolImage"))
  {
    objc_msgSend(v55, "setFontSizeForSymbolImage:", v11);
    objc_msgSend(v55, "setFontWeightForSymbolImage:", v12);
  }

}

- (double)returnKeyFontSize
{
  return 16.0;
}

- (BOOL)needsSmallerFontSizeForKey:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  if ((objc_msgSend(v4, "displayType") == 3
     || objc_msgSend(v4, "displayType") == 23
     || objc_msgSend(v4, "displayType") == 51
     || objc_msgSend(v4, "interactionType") == 38)
    && (-[UIKBRenderFactoryiPhone skinnyKeyThreshold](self, "skinnyKeyThreshold"), v5 > 0.0))
  {
    objc_msgSend(v4, "paddedFrame");
    v7 = v6;
    -[UIKBRenderFactoryiPhone skinnyKeyThreshold](self, "skinnyKeyThreshold");
    v9 = v7 < v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)skinnyKeyThreshold
{
  return 36.0;
}

- (CGPoint)shiftKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)shiftKeyFontSize
{
  return 18.0;
}

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)hintNoneKeyFontSize
{
  return 15.0;
}

- (double)deleteKeyFontSize
{
  return 15.0;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setupLayoutSegments
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  id v19;

  -[UIKBRenderFactoryiPhone _row4ControlSegmentWidthLeft](self, "_row4ControlSegmentWidthLeft");
  v4 = v3;
  -[UIKBRenderFactoryiPhone _row4ControlSegmentWidthRight](self, "_row4ControlSegmentWidthRight");
  v6 = 1.0 - v5;
  -[UIKBRenderFactoryiPhone _row4ControlSegmentWidthRight](self, "_row4ControlSegmentWidthRight");
  v8 = v7;
  -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyStates:", 3);
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Delete-Key"));
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v9);
  -[UIKBRenderFactoryiPhone shiftDeleteGlyphTraits](self, "shiftDeleteGlyphTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setKeyStates:", 3);
  objc_msgSend(v11, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  objc_msgSend(v11, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Delete-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v11);
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyStates:", 4);
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 1.0, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v12);
  -[UIKBRenderFactoryiPhone shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setKeyStates:", 100);
  objc_msgSend(v14, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v14);
  -[UIKBRenderFactoryiPhone shiftLockControlKeyTraits](self, "shiftLockControlKeyTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setKeyStates:", 8);
  objc_msgSend(v16, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v16);
  -[UIKBRenderFactoryiPhone activeControlKeyTraits](self, "activeControlKeyTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyStates:", 4);
  objc_msgSend(v18, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Delete-Key"));
  objc_msgSend(v18, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v18, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v18);

}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.29;
}

- (id)shiftLockControlKeyTraits
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if (v4)
  {
    -[UIKBRenderFactoryiPhone shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setControlOpacities:", 1);
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha80"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundGradient:", v6);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "animatedBackground");

    if ((_DWORD)v6)
    {
      objc_msgSend(v5, "setBlurBlending:", 1);
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha75"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLayeredForegroundGradient:", v8);

    }
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha45"), 4, -1.0, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addRenderEffect:", v9);

  }
  return v5;
}

- (id)shiftedControlKeyTraits
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  __CFString **v12;
  __CFString *v13;
  void *v14;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if ((v4 & 1) != 0)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "lightKeyboard") & 1) != 0)
      -[UIKBRenderFactoryiPhone activeControlKeyTraits](self, "activeControlKeyTraits");
    else
      -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "animatedBackground");

    if (v8)
    {
      objc_msgSend(v6, "setBlurBlending:", 1);
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha25"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayeredForegroundGradient:", v9);

    }
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "lightKeyboard");
    v12 = UIKBColorBlack;
    if (!v11)
      v12 = UIKBColorWhite_Alpha20;
    v13 = *v12;

    +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSymbolStyle:", v14);
  }
  else
  {
    -[UIKBRenderFactoryiPhone shiftLockControlKeyTraits](self, "shiftLockControlKeyTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)shiftDeleteGlyphTraits
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");

  if (v5)
  {
    +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorBlack_Alpha10"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextOffset:", 2.0, 0.0);
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSecondarySymbolStyles:", v7);

  }
  return v3;
}

- (id)controlKeyTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setControlOpacities:", 1);
  -[UIKBRenderFactory controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundGradient:", v5);

  -[UIKBRenderFactory controlKeyForegroundColorName](self, "controlKeyForegroundColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLayeredForegroundGradient:", v7);

  }
  else
  {
    objc_msgSend(v3, "setLayeredForegroundGradient:", 0);
  }
  -[UIKBRenderFactory controlKeyShadowColorName](self, "controlKeyShadowColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v8, 4, -1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRenderEffect:", v9);

  return v3;
}

- (id)activeControlKeyTraits
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setControlOpacities:", 0);
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "lightKeyboard") & 1) != 0)
  {
    -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("UIKBColorKeyGrayKeyLightBackground");
  }
  v6 = v5;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundGradient:", v7);

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorClear"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayeredForegroundGradient:", v8);

  -[UIKBRenderFactory controlKeyShadowColorName](self, "controlKeyShadowColorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v9, 4, -1.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRenderEffect:", v10);

  return v3;
}

- (int64_t)assetIdiom
{
  return 0;
}

- (double)stringKeyFontSize
{
  return 22.0;
}

- (double)assistKeyFontSize
{
  return 12.0;
}

- (double)moreABCKeyFontSize
{
  return 13.0;
}

- (double)moreABCKeyWideCellFontSize
{
  return 16.0;
}

- (double)zhuyinFirstToneKeyFontSize
{
  return 16.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 19.0;
}

- (double)smallSymbolImageFontSize
{
  return 14.0;
}

- (CGPoint)stringKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)returnKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftArrowKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)cutKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)copyKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)pasteKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)boldKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)zhuyinFirstToneKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -1.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)realEmojiKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.5;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyWideCellOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)secondaryShiftKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.5;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)ZWNJKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  return CFSTR("kana_multitap_complete_arrow.png");
}

- (id)muttitapReverseKeyImageName
{
  return CFSTR("kana_multitap_reverse_arrow.png");
}

- (BOOL)iPadFudgeLayout
{
  return 0;
}

- (BOOL)iPadSansHomeButtonLayout
{
  return 0;
}

- (UIEdgeInsets)dynamicInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 12.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  return 0.125;
}

- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v8;
  double v9;
  UIEdgeInsets result;

  if (a3 > 4)
  {
    v8 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
    v4 = 0.0;
    if (v8)
      v6 = 1.0;
    else
      v6 = 0.0;
    if (v8)
      v9 = 2.0;
    else
      v9 = 1.0;
    v3 = 0.0;
    if (a3 == 5)
    {
      v5 = v9;
    }
    else
    {
      v3 = 0.0;
      v5 = v6;
    }
    if (a3 == 5)
      v6 = v9;
  }
  else
  {
    -[UIKBRenderFactoryiPhone dynamicInsets](self, "dynamicInsets");
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

void __65__UIKBRenderFactoryiPhone__customizeSymbolStyle_forKey_contents___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7ECA8;
  qword_1ECD7ECA8 = v0;

}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 18.0;
  v3 = 6.0;
  v4 = 28.0;
  v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantDisplayFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -2.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)variantWideShadowWeight
{
  return 40.0;
}

- (CGPoint)variantSymbolTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 2.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)variantAnnotationTextFontSize
{
  return 10.0;
}

- (CGPoint)popupSymbolTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -2.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  return 40.0;
}

- (BOOL)isTallPopup
{
  return 0;
}

- (double)dualStringBottomAdditionalOffsetForDisplayContents:(id)a3
{
  void *v3;
  double v4;

  objc_msgSend(a3, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("।")))
    v4 = 1.5;
  else
    v4 = -0.5;

  return v4;
}

- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  char v48;
  uint64_t v49;
  const __CFString *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *v98;
  void *v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "lightKeyboard") & 1) != 0)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBlurBlending:", objc_msgSend(v12, "animatedBackground"));

  }
  else
  {
    objc_msgSend(v8, "setBlurBlending:", 1);
  }

  -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
  if (-[UIKBRenderFactory lightweightFactory](self, "lightweightFactory"))
    goto LABEL_47;
  -[UIKBRenderFactory thinKeycapsFontName](self, "thinKeycapsFontName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symbolStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFontName:", v13);

  -[UIKBRenderFactoryiPhone popupFontSize](self, "popupFontSize");
  v16 = v15;
  objc_msgSend(v8, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFontSize:", v16);

  -[UIKBRenderFactoryiPhone popupSymbolTextOffset](self, "popupSymbolTextOffset");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v8, "symbolStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextOffset:", v19, v21);

  if (objc_msgSend(v9, "displayType") == 27)
  {
    -[UIKBRenderFactory thinTextFontName](self, "thinTextFontName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFontName:", v23);

    objc_msgSend(v8, "symbolStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFontSize:", 22.0);

  }
  if (!objc_msgSend(v9, "displayType"))
  {
    objc_msgSend(v9, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("Burmese-Letter-"));

    if (v27)
    {
      objc_msgSend(v8, "symbolStyle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fontSize");
      v30 = round(v29 * 0.85);
      objc_msgSend(v8, "symbolStyle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFontSize:", v30);

    }
  }
  if (objc_msgSend(v9, "dynamicLayout"))
  {
    objc_msgSend(v9, "frame");
    if (v32 < 35.0)
    {
      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fontSize");
      v35 = 0.7;
LABEL_15:
      v37 = round(v34 * v35);
      objc_msgSend(v8, "symbolStyle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFontSize:", v37);

      goto LABEL_16;
    }
    objc_msgSend(v9, "frame");
    if (v36 < 45.0)
    {
      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fontSize");
      v35 = 0.8;
      goto LABEL_15;
    }
  }
LABEL_16:
  if (-[UIKBRenderFactoryiPhone _popupMenuStyleForKey:](self, "_popupMenuStyleForKey:", v9))
    -[UIKBRenderFactoryiPhone wideShadowPopupMenuInsets](self, "wideShadowPopupMenuInsets");
  else
    -[UIKBRenderFactoryiPhone wideShadowPaddleInsets](self, "wideShadowPaddleInsets");
  v43 = v39;
  v44 = v40;
  v45 = v41;
  v46 = v42;
  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isFloating");

  if ((v48 & 1) == 0)
  {
    v49 = objc_msgSend(v9, "popupDirection");
    v50 = CFSTR("UIKBColorBlack_Alpha35");
    if (v49 == 3)
    {
      v51 = *MEMORY[0x1E0C9D820];
      v52 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v53 = 32.0;
      v54 = 1.0;
      v55 = 1.0;
      v56 = 1.0;
      v57 = 1.0;
    }
    else
    {
      +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.5, 1.0, 0.0, 1.0, 0.0, 3.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRenderEffect:", v58);

      -[UIKBRenderFactoryiPhone variantWideShadowWeight](self, "variantWideShadowWeight");
      v53 = v59;
      v51 = *MEMORY[0x1E0C9D820];
      v52 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v50 = CFSTR("UIKBColorBlack_Alpha55");
      v54 = v43;
      v55 = v44;
      v56 = v45;
      v57 = v46;
    }
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", v50, v51, v52, v54, v55, v56, v57, v53);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRenderEffect:", v60);

  }
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundGradient:", v62);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = objc_msgSend(v63, "lightKeyboard");

  if ((_DWORD)v61)
  {
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRenderEffect:", v64);

  }
  if ((objc_msgSend(v9, "state") & 0x10) != 0)
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isFloating");

    if (v66)
    {
      objc_msgSend(v8, "geometry");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setLayoutMargins:", 0.0, 800.0, 0.0, 0.0);

    }
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v68, 22.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactoryiPhone variantSymbolTextOffset](self, "variantSymbolTextOffset");
    objc_msgSend(v69, "setTextOffset:");
    if (objc_msgSend(v9, "displayType") == 27)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setFontName:", v70);

      objc_msgSend(v69, "setFontSize:", 16.0);
    }
    objc_msgSend(v8, "symbolStyle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "textColor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTextColor:", v72);

    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v69);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVariantTraits:", v73);

    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorKeyBlueKeyBackground"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setLayeredForegroundGradient:", v75);

    +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorWhite"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setSymbolStyle:", v76);

    objc_msgSend(v8, "setHighlightedVariantTraits:", v74);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v9, "subtrees");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    if (v78)
    {
      v79 = v78;
      v92 = v69;
      v93 = v10;
      v80 = *(_QWORD *)v95;
      while (2)
      {
        for (i = 0; i != v79; ++i)
        {
          if (*(_QWORD *)v95 != v80)
            objc_enumerationMutation(v77);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "secondaryDisplayStrings");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "count");

          if (v83)
          {

            v69 = v92;
            v77 = (void *)objc_msgSend(v92, "copy");
            -[UIKBRenderFactoryiPhone variantAnnotationTextFontSize](self, "variantAnnotationTextFontSize");
            objc_msgSend(v77, "setFontSize:");
            -[UIKBRenderFactory renderConfig](self, "renderConfig");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v84, "lightKeyboard"))
              v85 = CFSTR("UIKBColorBlack_Alpha40");
            else
              v85 = CFSTR("UIKBColorWhite");
            objc_msgSend(v77, "setTextColor:", v85);

            objc_msgSend(v77, "setAnchorCorner:", 2);
            -[UIKBRenderFactoryiPhone variantAnnotationTextOffset](self, "variantAnnotationTextOffset");
            objc_msgSend(v77, "setTextOffset:");
            v99 = v77;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "variantTraits");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setSecondarySymbolStyles:", v86);

            +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorWhite"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v88;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setSecondarySymbolStyles:", v89);

            v10 = v93;
            goto LABEL_44;
          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
        if (v79)
          continue;
        break;
      }
      v69 = v92;
      v10 = v93;
    }
LABEL_44:

  }
  if ((objc_msgSend(v9, "renderKeyInKeyplane:", v10) & 1) == 0)
  {
    -[UIKBRenderFactory defaultKeyShadowColorName](self, "defaultKeyShadowColorName");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v90, 4, -1.0, 1.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRenderEffect:", v91);

  }
LABEL_47:

}

- (void)_customizeTraits:(id)a3 forPredictionCellKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  __CFString **v10;
  __CFString **v11;
  __CFString *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lightKeyboard");

  v9 = objc_msgSend(v6, "state");
  if (v8)
  {
    if (v9 == 2)
    {
      v10 = UIKBPredictionCandidateActiveBackground;
    }
    else
    {
      if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 100)
      {
        v12 = CFSTR("UIKBColorGray_Percent65");
        -[UIKBRenderFactory controlKeyForegroundColorName](self, "controlKeyForegroundColorName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = objc_msgSend(v6, "state") == 4;
        goto LABEL_15;
      }
      v10 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    }
    v12 = *v10;
    v13 = 0;
    goto LABEL_12;
  }
  if (v9 == 2)
  {
    v11 = UIKBPredictionCandidateActiveBackground;
  }
  else if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 100)
  {
    objc_msgSend(v17, "setBlendForm:", 6);
    v11 = UIKBColorKeyGrayKeyActiveDarkBackground;
  }
  else
  {
    v11 = UIKBColorKeyGrayKeyDarkBackground;
  }
  v12 = *v11;
  v14 = 0;
  v13 = 0;
LABEL_15:
  objc_msgSend(v17, "setControlOpacities:", v14);
  if (!v12)
  {
    objc_msgSend(v17, "setBackgroundGradient:", 0);
    if (v13)
      goto LABEL_17;
LABEL_19:
    objc_msgSend(v17, "setLayeredForegroundGradient:", 0);
    goto LABEL_20;
  }
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundGradient:", v15);

  if (!v13)
    goto LABEL_19;
LABEL_17:
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLayeredForegroundGradient:", v16);

LABEL_20:
}

- (void)_customizeTraits:(id)a3 forZhuyinGridDualStringKey:(id)a4
{
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void **v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __CFString **v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  objc_msgSend(v5, "symbolStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setFontSize:", 16.0);

    objc_msgSend(v5, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlignment:", 0);

    objc_msgSend(v5, "symbolStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnchorCorner:", 4);

    objc_msgSend(v5, "symbolStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextOffset:", -12.0, 8.0);

    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v12, 14.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "lightKeyboard"))
      v15 = CFSTR("UIKBColorBlack");
    else
      v15 = CFSTR("UIKBColorWhite");
    objc_msgSend(v13, "setTextColor:", v15);

    objc_msgSend(v13, "setAlignment:", 2);
    objc_msgSend(v13, "setAnchorCorner:", 2);
    objc_msgSend(v13, "setTextOffset:", 5.0, 5.0);
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v16, 18.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "lightKeyboard"))
      v19 = CFSTR("UIKBColorBlack_Alpha25");
    else
      v19 = CFSTR("UIKBColorWhite");
    objc_msgSend(v17, "setTextColor:", v19);

    objc_msgSend(v17, "setAlignment:", 1);
    v28[0] = v13;
    v20 = (void **)v28;
  }
  else
  {
    objc_msgSend(v7, "setTextOffset:", -12.0, 0.0);

    objc_msgSend(v5, "secondarySymbolStyles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setTextOffset:", 12.0, 0.0);
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v22, 14.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "lightKeyboard");
    v25 = UIKBColorBlack_Alpha25;
    if (!v24)
      v25 = UIKBColorWhite;
    objc_msgSend(v17, "setTextColor:", *v25);

    objc_msgSend(v17, "setAlignment:", 1);
    v27 = v13;
    v20 = &v27;
  }
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondarySymbolStyles:", v26);

}

- (int64_t)rowLimitForKey:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  void *v8;
  double v9;
  double v10;
  void *v11;

  v8 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v8, "paddedFrame");
  objc_msgSend(v8, "setPaddedFrame:", v9 + 0.0, v10 + 0.0);
  objc_msgSend(v8, "iPhoneVariantGeometries:annotationIndex:", a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_configureTraitsForPopupStyle:(id)a3 withKey:(id)a4 onKeyplane:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double *v30;
  int v31;
  int v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _BOOL8 v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int64_t v74;
  void *v75;
  __CFString *v76;
  __CFString *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  char v88;
  uint64_t i;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  uint64_t v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double width;
  double y;
  double height;
  CGFloat v113;
  double MaxX;
  double v115;
  double v116;
  void *v117;
  double x;
  int v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  id v166;
  _QWORD v167[5];
  uint64_t v168;
  uint64_t *v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD v172[3];
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;

  v172[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v166 = a5;
  v10 = -[UIKBRenderFactory contentViewClassForPopupKey:](self, "contentViewClassForPopupKey:", v9);
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v9, "state") == 16)
    {
      -[UIKBRenderFactoryiPhone _customizePopupTraits:forKey:onKeyplane:](self, "_customizePopupTraits:forKey:onKeyplane:", v8, v9, v166);
      -[objc_class preferredContentViewSizeForKey:withTraits:](v11, "preferredContentViewSizeForKey:withTraits:", v9, v8);
      v13 = v12;
      v15 = v14;
      objc_msgSend(v8, "geometry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "detachedVariants");

      objc_msgSend(v9, "paddedFrame");
      v20 = round(v19 + (v18 - v13) * 0.5);
      objc_msgSend(v9, "paddedFrame");
      v22 = v21;
      if (objc_msgSend(v9, "popupDirection") == 2)
      {
        objc_msgSend(v9, "paddedFrame");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v8, "geometry");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24 + v26;
        objc_msgSend(v27, "setPopupDirection:", 2);
      }
      else
      {
        if (v17)
          v81 = 2.0;
        else
          v81 = 0.0;
        if (objc_msgSend(v9, "popupDirection") != 3)
        {
          v28 = v22 - v15 - v81;
          goto LABEL_39;
        }
        objc_msgSend(v166, "frame");
        v83 = v82;
        objc_msgSend(v166, "frame");
        v85 = v84;
        objc_msgSend(v8, "geometry");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setPopupDirection:", 3);

        objc_msgSend(v8, "geometry");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = round((v83 - v13) * 0.5 + 0.0);
        v28 = round((v85 - v15) * 0.5 + 0.0);
        objc_msgSend(v27, "setRoundRectRadius:", 15.0);
      }

LABEL_39:
      v95 = UIKBPopupBiasForKey(v166, v9);
      if (v95 <= 0)
        v96 = 2;
      else
        v96 = v95;
      objc_msgSend(v8, "geometry");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setPopupBias:", v96);

      -[UIKBRenderFactoryiPhone wideShadowPaddleInsets](self, "wideShadowPaddleInsets");
      v99 = v98;
      v101 = v100;
      v103 = v102;
      v105 = v104;
      if (objc_msgSend(v9, "popupDirection") == 3)
      {
        objc_msgSend(v8, "geometry");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setPaddedFrame:", v20, v28, v13, v15);

        v99 = 12.0;
        v101 = 12.0;
        v103 = 12.0;
        v105 = 12.0;
      }
      v162 = v101;
      v165 = v13;
      v107 = -v103;
      v108 = v20 - v101;
      v109 = -v101;
      width = v165 - (-v101 - v105);
      y = v28 - v99;
      height = v15 - (v107 - v99);
      if (v108 >= 0.0)
      {
        v173.origin.x = v108;
        v173.origin.y = y;
        v173.size.width = width;
        v173.size.height = height;
        v113 = y;
        MaxX = CGRectGetMaxX(v173);
        objc_msgSend(v166, "frame");
        if (MaxX <= CGRectGetWidth(v174))
        {
          v109 = v108;
        }
        else
        {
          objc_msgSend(v166, "frame");
          v115 = CGRectGetMaxX(v175);
          v176.origin.x = v108;
          v176.origin.y = v113;
          v176.size.width = width;
          v176.size.height = height;
          v109 = v115 - CGRectGetWidth(v176) - v162;
        }
        y = v113;
      }
      objc_msgSend(v8, "geometry");
      v116 = v165;
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      x = v109;
      v119 = objc_msgSend(v117, "detachedVariants");

      if (v119)
      {
        objc_msgSend(v8, "geometry");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v99;
        objc_msgSend(v120, "roundRectRadius");
        v122 = (width - v165) * 0.5 + v109 + v121;
        v123 = v165 - v121 - v121;
        v124 = y + (height - v15) * 0.5 + v121;
        v157 = height;
        v125 = v15;
        v126 = v15 - v121 - v121;

        v127 = v122;
        v128 = v124;
        v129 = v123;
        v130 = v126;
        v131 = v122;
        v116 = v165;
        v132 = v124;
        v99 = v160;
        v133 = v123;
        x = v109;
        v134 = v126;
        v15 = v125;
        height = v157;
        +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v127, v128, v129, v130, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v172[0] = v135;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 1);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setVariantGeometries:", v136);

      }
      if (objc_msgSend(v9, "popupDirection") != 3)
      {
        objc_msgSend(v9, "paddedFrame");
        v179.origin.x = x;
        v179.origin.y = y;
        v179.size.width = width;
        v179.size.height = height;
        v178 = CGRectUnion(v177, v179);
        x = v178.origin.x;
        y = v178.origin.y;
        width = v178.size.width;
        height = v178.size.height;
      }
      objc_msgSend(v8, "geometry");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "setDisplayFrame:", x, y, width, height);

      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v116, v15, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v116, v15);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "popupDirection") == 2)
      {
        objc_msgSend(v9, "paddedFrame");
        v140 = v139;
        v141 = 5.0;
      }
      else
      {
        v140 = 0.0;
        v141 = -5.0;
      }
      if (objc_msgSend(v9, "popupDirection") == 3)
      {
        v142 = v162;
      }
      else
      {
        v142 = v162 + 3.0;
        v143 = v15 - v99;
        v99 = v99 + v141 + v140;
        v116 = v116 - v162 + -3.0;
        v15 = v143 - v141;
      }
      objc_msgSend(v138, "setSymbolFrame:", v142, v99, v116, v15);
      +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v138);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVariantTraits:", v144);

      goto LABEL_60;
    }
  }
  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory") || !objc_msgSend(v9, "dynamicLayout"))
  {
    v30 = (double *)UIKBRectsCreate(v166, v9, objc_msgSend(v9, "state"));
    v31 = UIKBPopupBiasForKey(v166, v9);
    v32 = v31;
    v33 = v30[12];
    v34 = v30[13];
    v156 = v30[14];
    v158 = v30[15];
    if (v31 == 21)
    {
      v35 = -10.5;
    }
    else
    {
      if (v31 != 29)
        goto LABEL_15;
      v35 = 10.5;
    }
    v36 = objc_msgSend(v9, "state");
    v37 = -0.0;
    if (v36 == 4)
      v37 = v35;
    v33 = v33 + v37;
LABEL_15:
    v154 = v33;
    v38 = v30[8];
    v155 = v34;
    v161 = v30[10];
    v163 = v30[11];
    v159 = v30[9];
    if ((objc_msgSend(v9, "state") & 0x10) != 0)
    {
      -[UIKBRenderFactoryiPhone variantDisplayFrameInsets](self, "variantDisplayFrameInsets");
      v40 = v39;
      v42 = v41;
      v153 = v43;
      v151 = v44;
      -[UIKBRenderFactoryiPhone variantSymbolFrameInsets](self, "variantSymbolFrameInsets");
      v46 = v45;
      v48 = v47;
      v152 = v49;
      v150 = v50;
      objc_msgSend(v8, "geometry");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "paddedFrame");
      v146 = v53;
      v147 = v52;
      v148 = v54;
      v149 = v55;
      -[UIKBRenderFactoryiPhone variantPaddedFrameInsets](self, "variantPaddedFrameInsets");
      v57 = v56;
      v59 = v58;
      v145 = v60;
      v62 = v61;
      objc_msgSend(v8, "geometry");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v38 + v42;
      v159 = v159 + v40;
      v161 = v161 - (v42 + v151);
      v163 = v163 - (v40 + v153);
      v154 = v154 + v48;
      v155 = v155 + v46;
      v156 = v156 - (v48 + v150);
      v158 = v158 - (v46 + v152);
      objc_msgSend(v63, "setPaddedFrame:", v147 + v59, v146 + v57, v148 - (v59 + v62), v149 - (v57 + v145));

    }
    objc_msgSend(v8, "geometry");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setDisplayFrame:", v38, v159, v161, v163);

    objc_msgSend(v8, "geometry");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setSymbolFrame:", v154, v155, v156, v158);

    free(v30);
    if (v32 <= 0)
      v66 = 2;
    else
      v66 = v32;
    objc_msgSend(v8, "geometry");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setPopupBias:", v66);

    v68 = -[UIKBRenderFactoryiPhone isTallPopup](self, "isTallPopup");
    objc_msgSend(v8, "geometry");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTallPopup:", v68);

    -[UIKBRenderFactory displayContentsForKey:](self, "displayContentsForKey:", v9);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "variantDisplayContents");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "count");

    if (!v71)
      goto LABEL_37;
    v168 = 0;
    v169 = &v168;
    v170 = 0x2020000000;
    v171 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v164, "variantDisplayContents");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v167[0] = MEMORY[0x1E0C809B0];
    v167[1] = 3221225472;
    v167[2] = __76__UIKBRenderFactoryiPhone__configureTraitsForPopupStyle_withKey_onKeyplane___block_invoke;
    v167[3] = &unk_1E16D3BB0;
    v167[4] = &v168;
    objc_msgSend(v72, "enumerateObjectsUsingBlock:", v167);

    objc_msgSend(v8, "geometry");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[UIKBRenderFactoryiPhone rowLimitForKey:](self, "rowLimitForKey:", v9);
    -[UIKBRenderFactoryiPhone variantGeometriesForGeometry:variantCount:rowLimit:annotationIndex:](self, "variantGeometriesForGeometry:variantCount:rowLimit:annotationIndex:", v73, v71, v74, v169[3]);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVariantGeometries:", v75);

    objc_msgSend(v9, "variantPopupBias");
    v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    LODWORD(v75) = v76 == CFSTR("fixed-right");

    if ((_DWORD)v75)
    {
      objc_msgSend(v8, "variantGeometries");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderGeometry sortedGeometries:leftToRight:](UIKBRenderGeometry, "sortedGeometries:leftToRight:", v79, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVariantGeometries:", v80);
    }
    else
    {
      objc_msgSend(v9, "variantPopupBias");
      v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v78 = v77 == CFSTR("fixed-left");

      if (!v78)
      {
LABEL_32:
        objc_msgSend(v166, "name");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "containsString:", CFSTR("Emoji"));

        if ((v88 & 1) != 0)
          -[UIKBRenderFactory modifyTraitsForDividerVariant:withKey:](self, "modifyTraitsForDividerVariant:withKey:", v8, v9);
        for (i = 0; i != v71; ++i)
        {
          objc_msgSend(v9, "subtrees");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "objectAtIndex:", i);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "variantGeometries");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectAtIndex:", i);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "similarShape");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setShape:", v94);

        }
        _Block_object_dispose(&v168, 8);
LABEL_37:
        -[UIKBRenderFactoryiPhone _customizePopupTraits:forKey:onKeyplane:](self, "_customizePopupTraits:forKey:onKeyplane:", v8, v9, v166);

LABEL_60:
        v29 = v166;
        goto LABEL_61;
      }
      objc_msgSend(v8, "variantGeometries");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderGeometry sortedGeometries:leftToRight:](UIKBRenderGeometry, "sortedGeometries:leftToRight:", v79, 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVariantGeometries:", v80);
    }

    goto LABEL_32;
  }
  v29 = v166;
  -[UIKBRenderFactoryiPhone _customizePopupTraits:forKey:onKeyplane:](self, "_customizePopupTraits:forKey:onKeyplane:", v8, v9, v166);
LABEL_61:

}

void __76__UIKBRenderFactoryiPhone__configureTraitsForPopupStyle_withKey_onKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "secondaryDisplayStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)_shouldConfigureSecondarySymbolStyleForSpaceKey:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") == 25)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("LanguageIndicator")) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

void __52__UIKBRenderFactoryiPhone__traitsForKey_onKeyplane___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "secondarySymbolStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "glyphSelectorForDisplayString:", v11);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "secondarySymbolStyles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setSelector:", v8);
    }
  }

}

- (BOOL)isCustomizedKeyStyle
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "containsString:", CFSTR("Thai")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Korean-With-QWERTY"));

  return v5;
}

+ (id)_textOffsetHints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (qword_1ECD7ECB8 != -1)
    dispatch_once(&qword_1ECD7ECB8, &__block_literal_global_548);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECD7ECC0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((objc_msgSend(v4, "containsString:", CFSTR("Thai")) & 1) != 0)
    {
      v6 = CFSTR("TUI-Thai-TextOffsets.plist");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Korean-With-QWERTY")))
    {
      v6 = CFSTR("TUI-Korean-With-QWERTY-TextOffsets.plist");
    }
    else
    {
      v6 = 0;
    }
    TextInputUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((_DWORD)v8)
    {
      v11 = (void *)qword_1ECD7ECC0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v4);

    }
  }
  objc_msgSend((id)qword_1ECD7ECC0, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __43__UIKBRenderFactoryiPhone__textOffsetHints__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD7ECC0;
  qword_1ECD7ECC0 = (uint64_t)v0;

}

- (CGPoint)customizedOffsetForString:(id)a3 isPrimary:(BOOL)a4 isLandscape:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  __CFString *v9;
  BOOL v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  void *v33;
  float v34;
  double v35;
  double v36;
  double v37;
  CGPoint result;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_textOffsetHints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = CFSTR("primaryX");
    v10 = !v5;
    if (v5)
      v9 = CFSTR("primaryLandscapeX");
    v11 = CFSTR("primaryY");
    v12 = CFSTR("primaryLandscapeY");
  }
  else
  {
    v9 = CFSTR("secondaryX");
    v10 = !v5;
    if (v5)
      v9 = CFSTR("secondaryLandscapeX");
    v11 = CFSTR("secondaryY");
    v12 = CFSTR("secondaryLandscapeY");
  }
  if (v10)
    v13 = (__CFString *)v11;
  else
    v13 = (__CFString *)v12;
  v14 = v9;
  v15 = v13;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Configuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;

  if (v5)
    v24 = CFSTR("landscapeDeltaX");
  else
    v24 = CFSTR("deltaX");
  v25 = CFSTR("deltaY");
  if (v5)
    v25 = CFSTR("landscapeDeltaY");
  v26 = v25;
  v27 = v24;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "floatValue");
  v31 = v30;

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "objectForKeyedSubscript:", v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "floatValue");
  v35 = v34;

  v36 = v19 + v31;
  v37 = v23 + v35;
  result.y = v37;
  result.x = v36;
  return result;
}

- (id)multiscriptKeyTraitsForKey:(id)a3 style:(int64_t)a4
{
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  float v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  float v37;
  UIKBTextStyle *v38;
  UIKBTextStyle *v39;
  void *v40;
  void *v41;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    v16 = a3;
    objc_msgSend((id)objc_opt_class(), "_textOffsetHints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("primaryFontSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v4 = v20;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("secondaryFontSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;

    objc_msgSend(v16, "displayString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "secondaryDisplayStrings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0.0;
    if (v25)
    {
      -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:](self, "customizedOffsetForString:isPrimary:isLandscape:", v25, 1, 0);
      v14 = v28;
      v13 = v29;
      objc_msgSend(v17, "objectForKeyedSubscript:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("deltaFontSize"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v4 = v4 + v32;

    }
    else
    {
      v13 = 0.0;
      v14 = 0.0;
    }
    v10 = v24;
    if (v27)
    {
      -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:](self, "customizedOffsetForString:isPrimary:isLandscape:", v27, 0, 0);
      v12 = v33;
      v11 = v34;
      objc_msgSend(v17, "objectForKeyedSubscript:", v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("deltaFontSize"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v10 = v10 + v37;

    }
    else
    {
      v12 = 0.0;
    }

  }
  else
  {
    v4 = 0.0;
    v5 = -5.0;
    v6 = 8.0;
    v7 = 8.5;
    v8 = -10.0;
    v9 = 15.0;
    if (a4)
    {
      v9 = 0.0;
      v8 = 0.0;
      v7 = 0.0;
      v6 = 0.0;
      v5 = 0.0;
    }
    if (a4 == 1)
      v10 = 25.0;
    else
      v10 = v9;
    if (a4 == 1)
      v11 = -19.0;
    else
      v11 = v8;
    if (a4 == 1)
      v12 = 13.0;
    else
      v12 = v7;
    if (a4 == 1)
      v13 = 4.0;
    else
      v13 = v6;
    if (a4 == 1)
      v14 = -8.0;
    else
      v14 = v5;
  }
  v38 = objc_alloc_init(UIKBTextStyle);
  -[UIKBTextStyle setTextOffset:](v38, "setTextOffset:", v14, v13);
  -[UIKBTextStyle setTextOpacity:](v38, "setTextOpacity:", 1.0);
  -[UIKBTextStyle setFontSize:](v38, "setFontSize:", v4);
  v39 = objc_alloc_init(UIKBTextStyle);
  -[UIKBTextStyle setTextOffset:](v39, "setTextOffset:", v12, v11);
  -[UIKBTextStyle setTextOpacity:](v39, "setTextOpacity:", 0.4);
  -[UIKBTextStyle setFontSize:](v39, "setFontSize:", v10);
  +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setSymbolStyle:", v38);
  v43[0] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setSecondarySymbolStyles:", v41);

  return v40;
}

@end
