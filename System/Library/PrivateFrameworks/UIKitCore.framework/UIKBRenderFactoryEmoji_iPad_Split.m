@implementation UIKBRenderFactoryEmoji_iPad_Split

- (int64_t)assetIdiom
{
  return 1;
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return objc_msgSend(a3, "displayType") == 37;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (CGPoint)emojiPopupTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.5;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (double)emojiInternationalKeySize
{
  return 15.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.5;
  v3 = 5.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  __CFString **v15;
  __CFString *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString **v24;
  __CFString *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;

  v100 = a3;
  v10 = a4;
  v11 = a5;
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", a6, 22.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setSymbolStyle:", v12);

  objc_msgSend(v11, "renderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "lightKeyboard");
  v15 = UIKBColorBlack;
  if (!v14)
    v15 = UIKBColorWhite;
  v16 = *v15;
  objc_msgSend(v100, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v19 = v18;
  if (objc_msgSend(v10, "displayType") == 13)
  {
    -[UIKBRenderFactoryEmoji_iPad_Split lightKeycapsFontName](self, "lightKeycapsFontName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryEmoji_iPad_Split emojiInternationalKeySize](self, "emojiInternationalKeySize");
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setSymbolStyle:", v21);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "whiteText");
    v24 = UIKBColorWhite_Alpha85;
    if (!v23)
      v24 = UIKBEmojiLightControlSymbolColor;
    v25 = *v24;
    objc_msgSend(v100, "symbolStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v25);

    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
    v28 = v27;
    -[UIKBRenderFactory scale](self, "scale");
    if (v29 == 2.0)
      v30 = 0.5;
    else
      v30 = 0.0;
    objc_msgSend(v100, "geometry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "paddedFrame");
    v36 = 5.0 - v19;
    v37 = -5.0;
    if (v28 > 1.0)
      v37 = -6.0;
    v38 = v32 - v19;
    v39 = v34 - (v30 - v19);
    v40 = v36 + v33;
    v41 = v35 - (v36 + v37);
    objc_msgSend(v100, "geometry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setPaddedFrame:", v38, v40, v39, v41);

    objc_msgSend(v100, "geometry");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "paddedFrame");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    objc_msgSend(v100, "geometry");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setDisplayFrame:", v45, v47, v49, v51);

    -[UIKBRenderFactory scale](self, "scale");
    if (v53 == 2.0)
      v54 = -0.5;
    else
      v54 = -1.0;
    if (v53 == 2.0)
      v55 = 5.5;
    else
      v55 = 6.0;
    objc_msgSend(v100, "symbolStyle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTextOffset:", v54, v55);
    v57 = 1;
  }
  else
  {
    if (objc_msgSend(v10, "displayType") != 5)
    {
      v57 = 0;
      goto LABEL_25;
    }
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
    if (v58 <= 1.0)
      v59 = -5.0;
    else
      v59 = -6.0;
    objc_msgSend(v100, "geometry");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "paddedFrame");
    v62 = v61;
    v64 = v63 + 0.0;
    v66 = v65 + 0.0;
    v68 = v67 - v59;
    objc_msgSend(v100, "geometry");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setPaddedFrame:", v64, v66, v62, v68);

    objc_msgSend(v100, "geometry");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "paddedFrame");
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    objc_msgSend(v100, "geometry");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setDisplayFrame:", v72, v74, v76, v78);

    objc_msgSend(v100, "symbolStyle");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryEmoji_iPad_Split symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v82 = v81;
    objc_msgSend(v100, "symbolStyle");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setFontSizeForSymbolImage:", v82);

    v84 = *(double *)off_1E167DC60;
    objc_msgSend(v100, "symbolStyle");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setFontWeightForSymbolImage:", v84);

    objc_msgSend(v100, "symbolStyle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTextOffset:", 0.0, 5.0);
    v57 = 3;
  }

LABEL_25:
  -[UIKBRenderFactory_Emoji defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setBackgroundGradient:", v87);

  objc_msgSend(v100, "geometry");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "paddedFrame");
  v90 = v19 + v89;
  v92 = v91 - (v19 + 0.0);
  v94 = v19 + v93;
  v96 = v95 - (v19 + 0.0);
  objc_msgSend(v100, "geometry");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setPaddedFrame:", v90, v94, v92, v96);

  -[UIKBRenderFactory_Emoji _emojiBorderColor](self, "_emojiBorderColor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v98, v57, -v19, v19);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "addRenderEffect:", v99);

  -[UIKBRenderFactory modifyTraitsForDetachedInputSwitcher:withKey:](self, "modifyTraitsForDetachedInputSwitcher:withKey:", v100, v10);
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIKBRenderFactoryEmoji_iPad_Split;
  v3 = a3;
  -[UIKBRenderFactory_Emoji backgroundTraitsForKeyplane:](&v21, sel_backgroundTraitsForKeyplane_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometry", v21.receiver, v21.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoundRectCorners:", -1);

  v6 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-left"));
  objc_msgSend(v6, "valueWithCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSplitLeftRect:", v7);

  v9 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-right"));
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "valueWithCGRect:", v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSplitRightRect:", v18);

  return v4;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
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
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  double v100;
  void *v101;
  id v102;
  void *v104;
  int v105;
  uint64_t v106;
  _BOOL4 v107;
  void *v108;
  unint64_t v109;
  void *v110;
  int v111;
  __CFString **v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  __CFString **v139;
  __CFString *v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  int IsStickerPickerService;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t i;
  void *v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  void *v215;
  double v216;
  double v217;
  void *v218;
  double v219;
  double v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  double v225;
  double v226;
  double v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  void *v248;
  void *v249;
  void *v250;
  int v251;
  void *v252;
  void *v253;
  int v254;
  double v255;
  double v256;
  double v257;
  double v258;
  void *v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  void *v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  void *v277;
  void *v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  objc_super v283;
  _BYTE v284[128];
  uint64_t v285;

  v285 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v283.receiver = self;
  v283.super_class = (Class)UIKBRenderFactoryEmoji_iPad_Split;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](&v283, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "state") & 0x10) != 0
    && (objc_msgSend(v6, "displayType") == 13 || objc_msgSend(v6, "displayType") == 5))
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryEmoji_iPad_Split lightKeycapsFontName](self, "lightKeycapsFontName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryEmoji_iPad_Split _customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:](self, "_customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:", v8, v6, v9, v10);

LABEL_25:
    goto LABEL_26;
  }
  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v12 = v11;
  objc_msgSend(v8, "geometry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v8, "geometry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDisplayFrame:", v15, v17, v19, v21);

  objc_msgSend(v8, "geometry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v8, "geometry");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPaddedFrame:", v25, v27, v29, v31);

  -[UIKBRenderFactoryEmoji_iPad_Split symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
  v34 = v33;
  if (objc_msgSend(v6, "displayType") == 37 || objc_msgSend(v6, "displayType") == 36)
  {
    if (objc_msgSend(v6, "displayType") == 37)
    {
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
      v36 = v35;
      objc_msgSend(v8, "geometry");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "paddedFrame");
      v42 = 8.0;
      if (v36 > 1.0)
        v42 = 9.0;
      v43 = -5.0;
      if (v36 > 1.0)
        v43 = -6.0;
      v44 = 10.0;
      if (v36 > 1.0)
        v44 = 12.0;
      v45 = v40 + v42;
      v46 = v39 + v43;
      v47 = v41 + v44;
      v48 = v38 + -3.0;
      objc_msgSend(v8, "geometry");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPaddedFrame:", v48, v46, v45, v47);

      objc_msgSend(v8, "geometry");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "paddedFrame");
      v52 = v51;
      v54 = v53 + -1.0;
      v56 = v55 + 1.0;
      v58 = v57 + 0.0;
      objc_msgSend(v8, "geometry");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setDisplayFrame:", v54, v58, v56, v52);

      -[UIKBRenderFactory_Emoji _emojiBorderColor](self, "_emojiBorderColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v60, 2, v12 + -1.0, v12);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRenderEffect:", v61);
    }
    else
    {
      if (objc_msgSend(v6, "displayType") != 36)
      {
LABEL_22:
        objc_msgSend(v8, "geometry");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "paddedFrame");
        v87 = v86;
        v89 = v88;
        v91 = v90;
        v93 = v92;
        objc_msgSend(v8, "geometry");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setFrame:", v87, v89, v91, v93);

        v95 = objc_msgSend(v6, "clipCorners");
        objc_msgSend(v8, "geometry");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setRoundRectCorners:", v95);

        objc_msgSend(v8, "geometry");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setRoundRectRadius:", 10.0);
        goto LABEL_23;
      }
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
      v63 = v62;
      objc_msgSend(v8, "geometry");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "paddedFrame");
      v69 = -5.0;
      if (v63 > 1.0)
        v69 = -6.0;
      v70 = 8.0;
      v71 = 10.0;
      if (v63 > 1.0)
      {
        v70 = 10.0;
        v71 = 12.0;
      }
      v72 = v65 + v69;
      v73 = v67 + v70;
      v74 = v66 + v69;
      v75 = v68 + v71;
      objc_msgSend(v8, "geometry");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setPaddedFrame:", v72, v74, v73, v75);

      objc_msgSend(v8, "geometry");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "paddedFrame");
      v78 = v77;
      v80 = v79;
      v82 = v81;
      v84 = v83;
      objc_msgSend(v8, "geometry");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setDisplayFrame:", v78, v80, v82, v84);
    }

    goto LABEL_22;
  }
  objc_msgSend(v6, "name");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("EmojiPopupKey"));

  if (v105)
  {
    v106 = objc_msgSend(v7, "visualStyling");
    v107 = -[UIKBRenderFactory lightweightFactory](self, "lightweightFactory");
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v106 & 0xFFFFFFFFFF00FFFFLL;
    if (v107)
      +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", v109, v108);
    else
      +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", v109, v108);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory scale](self, "scale");
    objc_msgSend(v97, "setScale:");
    objc_msgSend(v97, "traitsForKey:onKeyplane:", v6, v7);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v167, "geometry");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "frame");
    v170 = v169 + 0.0;
    v172 = v171 + -1.0;
    v174 = v173 + 0.0;
    v176 = v175 + -2.0;
    objc_msgSend(v167, "geometry");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "setPaddedFrame:", v170, v174, v172, v176);

    objc_msgSend(v167, "geometry");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "frame");
    v180 = v179 + -2.0;
    v182 = v181 + 4.0;
    v184 = v183 + -2.0;
    v186 = v185 + 4.0;
    objc_msgSend(v167, "geometry");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setSymbolFrame:", v180, v184, v182, v186);

    IsStickerPickerService = _UIApplicationIsStickerPickerService();
    v189 = 32.0;
    if (IsStickerPickerService)
      v189 = 38.0;
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", CFSTR("AppleColorEmoji"), v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "setTextColor:", CFSTR("UIKBColorBlack"));
    -[UIKBRenderFactoryEmoji_iPad_Split emojiPopupTextOffset](self, "emojiPopupTextOffset");
    objc_msgSend(v190, "setTextOffset:");
    objc_msgSend(v167, "setSymbolStyle:", v190);
    -[UIKBRenderFactory_Emoji controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setLayeredBackgroundGradient:", v192);

    objc_msgSend(v167, "removeAllRenderEffects");
    objc_msgSend(v167, "variantTraits");
    v193 = (void *)objc_claimAutoreleasedReturnValue();

    if (v193)
    {
      v194 = (void *)objc_msgSend(v190, "copy");
      objc_msgSend(v194, "setTextOffset:", 0.5, 2.0);
      objc_msgSend(v167, "variantTraits");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v278 = v194;
      objc_msgSend(v195, "setSymbolStyle:", v194);

      -[UIKBRenderFactory scale](self, "scale");
      v197 = 1.0 / v196;
      objc_msgSend(v167, "variantTraits");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "symbolStyle");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "setPathWeight:", v197);

      -[UIKBRenderFactory_Emoji _emojiSkinToneDividerColor](self, "_emojiSkinToneDividerColor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "variantTraits");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "symbolStyle");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "setTextColor:", v200);

      v281 = 0u;
      v282 = 0u;
      v279 = 0u;
      v280 = 0u;
      objc_msgSend(v167, "variantGeometries");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v279, v284, 16);
      if (v204)
      {
        v205 = v204;
        v206 = *(_QWORD *)v280;
        do
        {
          for (i = 0; i != v205; ++i)
          {
            if (*(_QWORD *)v280 != v206)
              objc_enumerationMutation(v203);
            v208 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i);
            objc_msgSend(v208, "symbolFrame");
            objc_msgSend(v208, "setSymbolFrame:", v209 + 0.0, v210 + 0.0);
            objc_msgSend(v208, "paddedFrame");
            objc_msgSend(v208, "setPaddedFrame:", v211 + 2.0, v213 + 2.0, v212 + -4.0, v214 + -4.0);
          }
          v205 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v279, v284, 16);
        }
        while (v205);
      }

    }
    v8 = v167;
    goto LABEL_23;
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "whiteText");
  v112 = UIKBColorWhite;
  if (!v111)
    v112 = UIKBColorBlack;
  +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", *v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbolStyle:", v113);

  objc_msgSend(v8, "symbolStyle");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setUsesSymbolImage:", 1);

  if ((objc_msgSend(v6, "state") & 0x10) == 0 && objc_msgSend(v6, "displayType") == 13)
  {
    objc_msgSend(v8, "geometry");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "paddedFrame");
    v117 = v116 + 0.0;
    v119 = v118 - (1.0 - v12);
    v121 = v120 + 5.0;
    v123 = v122 + -5.0;
    objc_msgSend(v8, "geometry");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setPaddedFrame:", v117, v121, v119, v123);

    objc_msgSend(v8, "geometry");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "paddedFrame");
    v127 = v126;
    v129 = v128 + 0.0;
    v131 = v130 - v12;
    v133 = v132 - (0.0 - v12);
    objc_msgSend(v8, "geometry");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setDisplayFrame:", v129, v131, v127, v133);

    -[UIKBRenderFactoryEmoji_iPad_Split lightKeycapsFontName](self, "lightKeycapsFontName");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryEmoji_iPad_Split emojiInternationalKeySize](self, "emojiInternationalKeySize");
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolStyle:", v136);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v137, "whiteText");
    v139 = UIKBColorWhite_Alpha85;
    if (!v138)
      v139 = UIKBEmojiLightControlSymbolColor;
    v140 = *v139;
    objc_msgSend(v8, "symbolStyle");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setTextColor:", v140);

    -[UIKBRenderFactoryEmoji_iPad_Split emojiInternationalKeyOffset](self, "emojiInternationalKeyOffset");
    v143 = v142;
    v145 = v144;
    objc_msgSend(v8, "symbolStyle");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setTextOffset:", v143, v145);
    v147 = 1;
    goto LABEL_75;
  }
  if (objc_msgSend(v6, "displayType") == 3)
  {
    -[UIKBRenderFactoryEmoji_iPad_Split lightKeycapsFontName](self, "lightKeycapsFontName");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setFontName:", v148);

    objc_msgSend(v8, "symbolStyle");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setFontSize:", 14.0);

    objc_msgSend(v8, "symbolStyle");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "textOffset");
    v153 = v152;
    objc_msgSend(v8, "symbolStyle");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "textOffset");
    v156 = v155 - (2.0 - v12);
    objc_msgSend(v8, "symbolStyle");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setTextOffset:", v153, v156);

    objc_msgSend(v8, "geometry");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "paddedFrame");
    v159 = v158;
    v161 = v12 + v160;
    v163 = v162 - (v12 + 0.0);
    v165 = v164 + 0.0;
    objc_msgSend(v8, "geometry");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setPaddedFrame:", v161, v165, v163, v159);

    v147 = 2;
    goto LABEL_75;
  }
  if ((objc_msgSend(v6, "state") & 0x10) == 0 && objc_msgSend(v6, "displayType") == 5
    || objc_msgSend(v6, "displayType") == 25
    || objc_msgSend(v6, "displayType") == 21)
  {
    if ((objc_msgSend(v6, "state") & 0x10) != 0 || objc_msgSend(v6, "displayType") != 5)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "setFontName:", v222);

      objc_msgSend(v8, "symbolStyle");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "setFontSize:", 14.0);

      if (objc_msgSend(v6, "displayType") == 21)
      {
        -[UIKBRenderFactory scale](self, "scale");
        if (v225 == 2.0)
          v226 = 0.5;
        else
          v226 = *MEMORY[0x1E0C9D538];
        if (v225 == 2.0)
          v227 = 0.0;
        else
          v227 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v8, "symbolStyle");
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v228, "setTextOffset:", v226, v227);

      }
      if (objc_msgSend(v6, "displayType") != 21)
        goto LABEL_74;
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
      if (v229 <= 1.0)
        goto LABEL_74;
      -[UIKBRenderFactory stretchFactor](self, "stretchFactor");
      if (v230 == 1.0)
        v231 = 1.0;
      else
        v231 = -v12;
      objc_msgSend(v8, "geometry");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "paddedFrame");
      v233 = v232;
      v235 = v234 + 0.0;
      v237 = v231 + v236;
      v239 = v238 - (v231 + 0.0);
      objc_msgSend(v8, "geometry");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setPaddedFrame:", v235, v237, v233, v239);
    }
    else
    {
      objc_msgSend(v8, "symbolStyle");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "textOffset");
      v217 = v216;
      objc_msgSend(v8, "symbolStyle");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "textOffset");
      v220 = v219 + 5.0;
      objc_msgSend(v8, "symbolStyle");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "setTextOffset:", v217, v220);

    }
LABEL_74:
    objc_msgSend(v8, "geometry");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "paddedFrame");
    v241 = v12 + v240;
    v243 = v242 - (v12 + 0.0);
    v245 = v12 + v244;
    v247 = v246 - (v12 + 0.0);
    objc_msgSend(v8, "geometry");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v248, "setPaddedFrame:", v241, v245, v243, v247);

    v147 = 3;
    goto LABEL_75;
  }
  objc_msgSend(v6, "displayString");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v146, "length"))
  {
    v254 = objc_msgSend(v6, "interactionType");

    if (v254)
    {
      v147 = 0;
      goto LABEL_76;
    }
    -[UIKBRenderFactory scale](self, "scale");
    if (v255 == 2.0)
      v256 = -4.5;
    else
      v256 = -4.0;
    -[UIKBRenderFactory scale](self, "scale");
    if (v257 == 2.0)
      v258 = 0.5;
    else
      v258 = 0.0;
    objc_msgSend(v8, "geometry");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "paddedFrame");
    v261 = v260 + 0.0;
    v263 = v262 - v258;
    v265 = v264 + 0.0;
    v267 = v266 - v256;
    objc_msgSend(v8, "geometry");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "setPaddedFrame:", v261, v265, v263, v267);

    objc_msgSend(v8, "geometry");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "paddedFrame");
    v270 = v269;
    v272 = v271;
    v274 = v273;
    v276 = v275;
    objc_msgSend(v8, "geometry");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v277, "setDisplayFrame:", v270, v272, v274, v276);

  }
  v147 = 0;
LABEL_75:

LABEL_76:
  if ((objc_msgSend(v6, "state") & 4) != 0)
    -[UIKBRenderFactory_Emoji _emojiDefaultControlKeyActiveBackgroundColorGradient](self, "_emojiDefaultControlKeyActiveBackgroundColorGradient");
  else
    -[UIKBRenderFactory_Emoji _emojiDefaultControlKeyBackgroundColorGradient](self, "_emojiDefaultControlKeyBackgroundColorGradient");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundGradient:", v249);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = objc_msgSend(v250, "whiteText");

  if (v251)
  {
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha5"));
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayeredBackgroundGradient:", v252);

  }
  -[UIKBRenderFactory_Emoji _emojiBorderColor](self, "_emojiBorderColor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v97, v147, -v12, v12);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addRenderEffect:", v253);

LABEL_23:
  objc_msgSend(v8, "symbolStyle");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "usesSymbolImage");

  if (v99)
  {
    v100 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setFontSizeForSymbolImage:", v34);

    objc_msgSend(v8, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFontWeightForSymbolImage:", v100);
    goto LABEL_25;
  }
LABEL_26:
  v102 = v8;

  return v102;
}

@end
