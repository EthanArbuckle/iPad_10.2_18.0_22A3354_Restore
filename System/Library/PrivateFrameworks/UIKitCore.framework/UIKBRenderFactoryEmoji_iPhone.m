@implementation UIKBRenderFactoryEmoji_iPhone

- (int64_t)assetIdiom
{
  return 0;
}

- (CGPoint)emojiPopupTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -4.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)emojiInternationalKeySize
{
  return 14.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 2.5;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (double)emojiCategoryControlIconSize
{
  return 28.0;
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") == 37 || objc_msgSend(v3, "displayType") == 55)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", CFSTR("EmojiPopupKey"));

  }
  return v4;
}

- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v12, "displayType") == 37
    || objc_msgSend(v12, "displayType") == 55
    || objc_msgSend(v12, "displayType") == 36)
  {
    v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKBRenderFactoryEmoji_iPhone;
    -[UIKBRenderFactory traitsHashStringForKey:withGeometry:withSymbolStyle:controlOpacities:blurBlending:](&v17, sel_traitsHashStringForKey_withGeometry_withSymbolStyle_controlOpacities_blurBlending_, v12, v13, v14, v8, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  char v37;
  __CFString **v38;
  __CFString **v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  char v49;
  __CFString **v50;
  __CFString **v51;
  __CFString *v52;
  void *v53;
  void *v54;
  int v55;
  __CFString **v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  id v61;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  __CFString **v67;
  __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  unint64_t v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  __CFString **v97;
  __CFString *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  double x;
  double y;
  double width;
  double height;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  _BOOL4 v124;
  void *v125;
  unint64_t v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  void *v132;
  int IsStickerPickerService;
  double v134;
  void *v135;
  int64_t v136;
  double v137;
  int64_t v138;
  int64_t v139;
  int64_t v140;
  int64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i;
  void *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  void *v168;
  id v169;
  id v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  objc_super v175;
  _BYTE v176[128];
  uint64_t v177;
  CGRect v178;
  CGRect v179;

  v177 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v175.receiver = self;
  v175.super_class = (Class)UIKBRenderFactoryEmoji_iPhone;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](&v175, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "state") & 0x10) != 0
    && (objc_msgSend(v6, "displayType") == 13 || objc_msgSend(v6, "displayType") == 5))
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory _customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:](self, "_customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:", v8, v6, v9, v10);
LABEL_5:

    goto LABEL_24;
  }
  objc_msgSend(v8, "geometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "paddedFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "geometry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDisplayFrame:", v13, v15, v17, v19);

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v22 = v21;
  if (objc_msgSend(v6, "displayType") == 13)
  {
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryEmoji_iPhone emojiInternationalKeySize](self, "emojiInternationalKeySize");
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolStyle:", v24);

    objc_msgSend(v8, "symbolStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryEmoji_iPhone symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v27 = v26;
    objc_msgSend(v8, "symbolStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFontSizeForSymbolImage:", v27);

    v29 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFontWeight:", v29);

    -[UIKBRenderFactoryEmoji_iPhone emojiInternationalKeyOffset](self, "emojiInternationalKeyOffset");
    v32 = v31;
    v34 = v33;
    objc_msgSend(v8, "symbolStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextOffset:", v32, v34);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = objc_msgSend(v36, "whiteText");

    v37 = objc_msgSend(v6, "state");
    if ((_DWORD)v35)
    {
      v38 = UIKBColorWhite;
      v39 = UIKBColorWhite_Alpha85;
    }
    else
    {
      v38 = UIKBEmojiLightControlSymbolActiveColor;
      v39 = UIKBColorBlack_Alpha90;
    }
    if ((v37 & 4) == 0)
      v38 = v39;
    v52 = *v38;
    objc_msgSend(v8, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v52);
  }
  else if (objc_msgSend(v6, "displayType") == 3)
  {
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v40, 15.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolStyle:", v41);

    objc_msgSend(v8, "symbolStyle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryEmoji_iPhone symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v44 = v43;
    objc_msgSend(v8, "symbolStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFontSizeForSymbolImage:", v44);

    v46 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFontWeight:", v46);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = objc_msgSend(v48, "whiteText");

    v49 = objc_msgSend(v6, "state");
    if ((_DWORD)v40)
    {
      v50 = UIKBColorWhite;
      v51 = UIKBColorWhite_Alpha85;
    }
    else
    {
      v50 = UIKBEmojiLightControlSymbolActiveColor;
      v51 = UIKBColorBlack_Alpha90;
    }
    if ((v49 & 4) == 0)
      v50 = v51;
    v58 = *v50;
    objc_msgSend(v8, "symbolStyle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTextColor:", v58);

    -[UIKBRenderFactory_Emoji _emojiBorderColor](self, "_emojiBorderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v9, 3, -v22, v22);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRenderEffect:", v60);

  }
  else
  {
    if (objc_msgSend(v6, "displayType") == 25)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v53, 13.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSymbolStyle:", v54);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v9, "whiteText");
      v56 = UIKBColorWhite;
      if (!v55)
        v56 = UIKBColorBlack;
      v57 = *v56;
      objc_msgSend(v8, "symbolStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v57);
      goto LABEL_5;
    }
    if (objc_msgSend(v6, "displayType") == 37)
    {
      v169 = v7;
      objc_msgSend(v8, "geometry");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setPopupBias:", 2);

      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderFactoryEmoji_iPhone emojiCategoryControlIconSize](self, "emojiCategoryControlIconSize");
      +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSymbolStyle:", v65);

      v66 = -[UIKBRenderFactory increasedContrastEnabled](self, "increasedContrastEnabled");
      v67 = UIKBColorBlack_Alpha65;
      if (!v66)
        v67 = UIKBColorBlack_Alpha50;
      v68 = *v67;
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "lightKeyboard"))
        v70 = v68;
      else
        v70 = CFSTR("UIKBColorWhite_Alpha25");
      objc_msgSend(v8, "symbolStyle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setTextColor:", v70);

      +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "count");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "geometry");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "paddedFrame");
      v77 = v76;

      if (v73)
      {
        v78 = 0;
        v79 = v77 / (double)v73;
        do
        {
          objc_msgSend(v8, "geometry");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "paddedFrame");
          v82 = v79 * (double)v78 + v81;
          objc_msgSend(v8, "geometry");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "paddedFrame");
          v85 = v84;
          objc_msgSend(v8, "geometry");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "paddedFrame");
          v88 = v87;

          +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v82, v85, v79, v88, v82, v85, v79, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setDisplayFrame:", v82, v85, v79, v88);
          objc_msgSend(v89, "displayFrame");
          objc_msgSend(v89, "setSymbolFrame:");
          objc_msgSend(v74, "addObject:", v89);

          ++v78;
        }
        while (v73 != v78);
      }
      v90 = v74;
      if (+[UIKeyboardEmojiCategory isRTLMode](UIKeyboardEmojiCategory, "isRTLMode"))
      {
        +[UIKBRenderGeometry sortedGeometries:leftToRight:](UIKBRenderGeometry, "sortedGeometries:leftToRight:", v74, 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setVariantGeometries:", v91);

      }
      else
      {
        objc_msgSend(v8, "setVariantGeometries:", v74);
      }
      v9 = v68;
      +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v102, "copy");
      objc_msgSend(v101, "setSymbolStyle:", v103);

      v168 = v101;
      objc_msgSend(v8, "setVariantTraits:", v101);
      +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)objc_msgSend(v105, "copy");
      objc_msgSend(v104, "setSymbolStyle:", v106);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v107, "lightKeyboard"))
        v108 = v68;
      else
        v108 = CFSTR("UIKBColorWhite_Alpha25");
      objc_msgSend(v104, "symbolStyle");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setTextColor:", v108);

      objc_msgSend(v8, "setHighlightedVariantTraits:", v104);
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v110, "lightKeyboard"))
        v111 = 0;
      else
        v111 = 5;
      objc_msgSend(v8, "setBlendForm:", v111);

      if (_UIApplicationIsFirstPartyStickers())
      {
        -[UIKBRenderFactory_Emoji _emojiBorderColor](self, "_emojiBorderColor");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v112, 1, v22, v22);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRenderEffect:", v113);

        objc_msgSend(v8, "geometry");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "paddedFrame");
        v179 = CGRectInset(v178, -15.0, 0.0);
        x = v179.origin.x;
        y = v179.origin.y;
        width = v179.size.width;
        height = v179.size.height;

        objc_msgSend(v8, "geometry");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setPaddedFrame:", x, y, width, height);

        objc_msgSend(v8, "geometry");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "setDisplayFrame:", x, y, width, height);

      }
      v7 = v169;
    }
    else if (objc_msgSend(v6, "displayType") == 55)
    {
      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v92, 21.0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSymbolStyle:", v93);

      objc_msgSend(v8, "symbolStyle");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "lightKeyboard");
      v97 = UIKBColorBlack_Alpha95;
      if (!v96)
        v97 = UIKBColorWhite_Alpha87;
      v98 = *v97;
      objc_msgSend(v8, "symbolStyle");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setTextColor:", v98);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "lightKeyboard"))
        v100 = 0;
      else
        v100 = 5;
      objc_msgSend(v8, "setBlendForm:", v100);
    }
    else
    {
      objc_msgSend(v6, "name");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v121, "isEqualToString:", CFSTR("EmojiPopupKey"));

      if (v122)
      {
        v123 = objc_msgSend(v7, "visualStyling");
        v124 = -[UIKBRenderFactory lightweightFactory](self, "lightweightFactory");
        -[UIKBRenderFactory renderingContext](self, "renderingContext");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v123 & 0xFFFFFFFFFF00FFFFLL;
        if (v124)
          +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", v126, v125);
        else
          +[UIKBRenderFactory factoryForVisualStyle:renderingContext:skipLayoutSegments:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:skipLayoutSegments:", v126, v125, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBRenderFactory scale](self, "scale");
        objc_msgSend(v9, "setScale:");
        -[UIKBRenderFactory stretchFactor](self, "stretchFactor");
        objc_msgSend(v9, "setStretchFactor:");
        objc_msgSend(v9, "setAllowsPaddles:", -[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v6));
        objc_msgSend(v9, "traitsForKey:onKeyplane:", v6, v7);
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        IsStickerPickerService = _UIApplicationIsStickerPickerService();
        v134 = 32.0;
        if (IsStickerPickerService)
          v134 = 38.0;
        +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", CFSTR("AppleColorEmoji"), v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "setIgnoreTextMarginOnKey:", 1);
        objc_msgSend(v135, "setTextColor:", CFSTR("UIKBColorBlack"));
        objc_msgSend(v132, "setSymbolStyle:", v135);
        if (objc_msgSend(v9, "allowsPaddles"))
        {
          -[UIKBRenderFactoryEmoji_iPhone emojiPopupTextOffset](self, "emojiPopupTextOffset");
          objc_msgSend(v135, "setTextOffset:");
          objc_msgSend(v132, "setControlOpacities:", 0);
        }
        else
        {
          v136 = -[UIKBRenderFactoryEmoji_iPhone assetIdiom](self, "assetIdiom");
          v137 = 0.0;
          if (v136 != 1)
          {
            v138 = -[UIKBRenderFactoryEmoji_iPhone assetIdiom](self, "assetIdiom", 0.0, 0.0);
            v137 = 0.0;
            if (v138 != 24)
            {
              v139 = -[UIKBRenderFactoryEmoji_iPhone assetIdiom](self, "assetIdiom", 0.0, 0.0);
              v137 = 0.0;
              if (v139 != 25)
              {
                v140 = -[UIKBRenderFactoryEmoji_iPhone assetIdiom](self, "assetIdiom", 0.0, 0.0);
                v137 = 0.0;
                if (v140 != 26)
                {
                  v141 = -[UIKBRenderFactoryEmoji_iPhone assetIdiom](self, "assetIdiom", 0.0, 0.0);
                  v137 = 1.0;
                  if (v141 == 23)
                    v137 = 0.0;
                }
              }
            }
          }
          objc_msgSend(v135, "setTextOffset:", 0.0, v137);
          -[UIKBRenderFactory_Emoji controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "setLayeredBackgroundGradient:", v143);

          objc_msgSend(v132, "removeAllRenderEffects");
        }
        objc_msgSend(v132, "variantTraits");
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        if (v144)
        {
          v170 = v7;
          v145 = (void *)objc_msgSend(v135, "copy");
          objc_msgSend(v145, "setTextOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          objc_msgSend(v132, "variantTraits");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "setSymbolStyle:", v145);

          -[UIKBRenderFactory scale](self, "scale");
          v148 = 1.0 / v147;
          objc_msgSend(v132, "variantTraits");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "symbolStyle");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "setPathWeight:", v148);

          -[UIKBRenderFactory_Emoji _emojiSkinToneDividerColor](self, "_emojiSkinToneDividerColor");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "variantTraits");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "symbolStyle");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "setTextColor:", v151);

          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          objc_msgSend(v132, "variantGeometries");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
          if (v155)
          {
            v156 = v155;
            v157 = *(_QWORD *)v172;
            do
            {
              for (i = 0; i != v156; ++i)
              {
                if (*(_QWORD *)v172 != v157)
                  objc_enumerationMutation(v154);
                v159 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
                objc_msgSend(v159, "symbolFrame");
                objc_msgSend(v159, "setSymbolFrame:", v160 + -2.0, v162 + -2.0, v161 + 4.0, v163 + 2.0);
                objc_msgSend(v159, "paddedFrame");
                objc_msgSend(v159, "setPaddedFrame:", v164 + 0.0, v165 + -2.0);
                objc_msgSend(v159, "displayFrame");
                objc_msgSend(v159, "setDisplayFrame:", v166 + 0.0, v167 + -2.0);
              }
              v156 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
            }
            while (v156);
          }

          v7 = v170;
        }

        v8 = v132;
      }
      else
      {
        objc_msgSend(v8, "symbolStyle");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "setUsesSymbolImage:", 1);

        -[UIKBRenderFactoryEmoji_iPhone symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
        v129 = v128;
        objc_msgSend(v8, "symbolStyle");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "setFontSizeForSymbolImage:", v129);

        v131 = *(double *)off_1E167DC60;
        objc_msgSend(v8, "symbolStyle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFontWeight:", v131);
      }
    }
  }
LABEL_24:

  v61 = v8;
  return v61;
}

@end
