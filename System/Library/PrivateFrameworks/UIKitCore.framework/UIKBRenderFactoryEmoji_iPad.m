@implementation UIKBRenderFactoryEmoji_iPad

- (int64_t)assetIdiom
{
  return 1;
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
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 24.0;
}

- (double)emojiInternationalKeySize
{
  return 18.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -1.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return objc_msgSend(a3, "displayType") == 37;
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
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v10 = a4;
  v11 = a5;
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", a6, 22.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSymbolStyle:", v12);

  objc_msgSend(v11, "renderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "lightKeyboard");
  v15 = UIKBColorBlack;
  if (!v14)
    v15 = UIKBColorWhite;
  v16 = *v15;
  objc_msgSend(v24, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  if (objc_msgSend(v10, "interactionType") == 9)
  {
    objc_msgSend(v24, "symbolStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextOffset:", -1.0, 0.0);

    -[UIKBRenderFactoryEmoji_iPad emojiInternationalKeySize](self, "emojiInternationalKeySize");
    v20 = v19;
    objc_msgSend(v24, "symbolStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFontSize:", v20);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v10, "displayType") == 5)
  {
    objc_msgSend(v24, "symbolStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextOffset:", 0.0, 2.0);
    goto LABEL_7;
  }
LABEL_8:
  -[UIKBRenderFactory_Emoji defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundGradient:", v23);

  -[UIKBRenderFactory modifyTraitsForDetachedInputSwitcher:withKey:](self, "modifyTraitsForDetachedInputSwitcher:withKey:", v24, v10);
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  __CFString **v76;
  char v77;
  __CFString *v78;
  void *v79;
  void *v81;
  int v82;
  uint64_t v83;
  _BOOL4 v84;
  void *v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t i;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  objc_super v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v120.receiver = self;
  v120.super_class = (Class)UIKBRenderFactoryEmoji_iPad;
  -[UIKBRenderFactoryEmoji_iPhone _traitsForKey:onKeyplane:](&v120, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "state") & 0x10) == 0 && objc_msgSend(v6, "displayType") == 5)
  {
    objc_msgSend(v8, "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "geometry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPaddedFrame:", v11, v13, v15, v17);

    objc_msgSend(v8, "geometry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "paddedFrame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v8, "geometry");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    -[UIKBRenderFactoryEmoji_iPad lightKeycapsFontName](self, "lightKeycapsFontName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v29, 40.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolStyle:", v30);

    objc_msgSend(v8, "symbolStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryEmoji_iPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v33 = v32;
    objc_msgSend(v8, "symbolStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFontSizeForSymbolImage:", v33);

    v35 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFontWeightForSymbolImage:", v35);

    objc_msgSend(v8, "symbolStyle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFontWeight:", v35);

    objc_msgSend(v8, "symbolStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textOffset");
    v40 = v39;
    objc_msgSend(v8, "symbolStyle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "textOffset");
    v43 = v42 + 2.0;
    objc_msgSend(v8, "symbolStyle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTextOffset:", v40, v43);

LABEL_8:
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "whiteText");

    if (v75)
    {
      v76 = UIKBColorWhite;
    }
    else
    {
      v77 = objc_msgSend(v6, "state");
      v76 = UIKBEmojiLightControlSymbolActiveColor;
      if ((v77 & 4) == 0)
        v76 = UIKBEmojiLightControlSymbolColor;
    }
    v78 = *v76;
    objc_msgSend(v8, "symbolStyle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTextColor:", v78);
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "displayType") == 5)
  {
    objc_msgSend(v8, "symbolStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryEmoji_iPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v47 = v46;
    objc_msgSend(v8, "symbolStyle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFontSizeForSymbolImage:", v47);

    v49 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFontWeightForSymbolImage:", v49);

    objc_msgSend(v8, "symbolStyle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFontWeight:", v49);
LABEL_13:
    v79 = v8;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "displayType") == 25)
  {
    objc_msgSend(v8, "geometry");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "paddedFrame");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    objc_msgSend(v8, "geometry");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);

    objc_msgSend(v8, "geometry");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "displayFrame");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    objc_msgSend(v8, "geometry");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setSymbolFrame:", v64, v66, v68, v70);

    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v72, 18.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolStyle:", v73);

    goto LABEL_8;
  }
  objc_msgSend(v6, "name");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "isEqualToString:", CFSTR("EmojiPopupKey"));

  if (!v82)
    goto LABEL_15;
  v83 = objc_msgSend(v7, "visualStyling");
  v84 = -[UIKBRenderFactory lightweightFactory](self, "lightweightFactory");
  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v83 & 0xFFFFFFFFFF00FFFFLL;
  if (v84)
    +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", v86, v85);
  else
    +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", v86, v85);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBRenderFactory scale](self, "scale");
  objc_msgSend(v51, "setScale:");
  -[UIKBRenderFactory stretchFactor](self, "stretchFactor");
  objc_msgSend(v51, "setStretchFactor:");
  objc_msgSend(v51, "setAllowsPaddles:", -[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v6));
  objc_msgSend(v51, "traitsForKey:onKeyplane:", v6, v7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", CFSTR("AppleColorEmoji"), 48.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTextColor:", CFSTR("UIKBColorBlack"));
  -[UIKBRenderFactoryEmoji_iPad emojiPopupTextOffset](self, "emojiPopupTextOffset");
  objc_msgSend(v87, "setTextOffset:");
  objc_msgSend(v79, "setSymbolStyle:", v87);
  -[UIKBRenderFactory_Emoji controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setLayeredBackgroundGradient:", v89);

  objc_msgSend(v79, "removeAllRenderEffects");
  objc_msgSend(v79, "variantTraits");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    v91 = (void *)objc_msgSend(v87, "copy");
    objc_msgSend(v91, "setTextOffset:", 0.0, 2.0);
    objc_msgSend(v79, "variantTraits");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v91;
    objc_msgSend(v92, "setSymbolStyle:", v91);

    -[UIKBRenderFactory scale](self, "scale");
    v94 = 1.0 / v93;
    objc_msgSend(v79, "variantTraits");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "symbolStyle");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setPathWeight:", v94);

    -[UIKBRenderFactory_Emoji _emojiSkinToneDividerColor](self, "_emojiSkinToneDividerColor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "variantTraits");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "symbolStyle");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setTextColor:", v97);

    -[UIKBRenderFactory_Emoji controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setLayeredBackgroundGradient:", v101);

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    objc_msgSend(v79, "variantGeometries");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v121, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v104; ++i)
        {
          if (*(_QWORD *)v117 != v105)
            objc_enumerationMutation(v102);
          v107 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend(v107, "symbolFrame");
          objc_msgSend(v107, "setSymbolFrame:", v108 + 0.0, v109 + 0.0);
          objc_msgSend(v107, "paddedFrame");
          objc_msgSend(v107, "setPaddedFrame:", v110 + 1.0, v112 + 1.0, v111 + -2.0, v113 + -3.0);
        }
        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v121, 16);
      }
      while (v104);
    }

  }
  +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.0, 18.0, 6.0, 28.0, 6.0, 4.5);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addRenderEffect:", v114);

LABEL_14:
  v8 = v79;
LABEL_15:

  return v8;
}

@end
