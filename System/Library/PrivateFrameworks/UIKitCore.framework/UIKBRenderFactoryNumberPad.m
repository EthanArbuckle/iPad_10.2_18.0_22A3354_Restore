@implementation UIKBRenderFactoryNumberPad

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 1;
}

- (id)controlKeyBackgroundColorName
{
  return CFSTR("UIKBColorClear");
}

- (id)controlKeyForegroundColorName
{
  return 0;
}

- (id)controlKeyDividerColorName
{
  return CFSTR("UIKBColor10KeyLightControlKeySeparator");
}

- (double)numberFontSize
{
  return 25.0;
}

- (double)letterFontSize
{
  return 10.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 1.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationGlyphOffset
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

- (CGPoint)leftColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 2.0;
  v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 2.0;
  v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)loneZeroOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)specialSymbolOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 3.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  id v40;

  v40 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "interactionType") == 4)
  {
    objc_msgSend(v40, "setFontSize:", 15.0);
    -[UIKBRenderFactoryNumberPad deleteGlyphOffset](self, "deleteGlyphOffset");
    objc_msgSend(v40, "setTextOffset:");
    objc_msgSend(v40, "setUsesSymbolImage:", 1);
  }
  if (objc_msgSend(v11, "interactionType") == 5)
  {
    objc_msgSend(v40, "setFontSize:", 15.0);
    -[UIKBRenderFactoryNumberPad dictationGlyphOffset](self, "dictationGlyphOffset");
    goto LABEL_5;
  }
  if (objc_msgSend(v11, "interactionType") == 11
    || objc_msgSend(v11, "interactionType") == 9)
  {
    objc_msgSend(v40, "setFontSize:", 22.0);
    objc_msgSend(v40, "setTextOffset:", 0.0, 2.0);
    v14 = objc_msgSend(v11, "interactionType") == 9;
    v13 = v40;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "interactionType") == 14)
  {
    objc_msgSend(v12, "displayString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("+*#"));

    if (v23)
    {
      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFontName:", v24);

      if (_AXSEnhanceTextLegibilityEnabled())
        objc_msgSend(v40, "setFontName:", CFSTR("PhonepadTwo"));
      objc_msgSend(v40, "setKerning:", 3.0);
      objc_msgSend(v40, "setTextOffset:", 0.0, 3.0);
      objc_msgSend(v40, "setSelector:", 1);
      goto LABEL_6;
    }
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFontName:", v31);

    objc_msgSend(v40, "setFontSize:", 20.0);
LABEL_5:
    objc_msgSend(v40, "setTextOffset:");
LABEL_6:
    v13 = v40;
    v14 = 1;
LABEL_10:
    objc_msgSend(v13, "setUsesSymbolImage:", v14);
    goto LABEL_11;
  }
  objc_msgSend(v11, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "hasSuffix:", CFSTR("Pause")))
  {

  }
  else
  {
    objc_msgSend(v11, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "hasSuffix:", CFSTR("Wait"));

    if (!v38)
      goto LABEL_11;
  }
  objc_msgSend(v40, "setFontSize:", 16.0);
  -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFontName:", v39);

  objc_msgSend(v40, "setTextOffset:", 0.0, 1.0);
LABEL_11:
  objc_msgSend(v12, "displayString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("."));

  if (v16)
  {
    v17 = 0.0;
    v18 = -1.0;
LABEL_13:
    objc_msgSend(v40, "setTextOffset:", v17, v18);
    goto LABEL_20;
  }
  objc_msgSend(v12, "displayString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("#")) & 1) != 0)
    goto LABEL_17;
  objc_msgSend(v12, "displayString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("*")))
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v12, "displayString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("+"));

  if ((v26 & 1) != 0)
  {
LABEL_18:
    objc_msgSend(v40, "setFontSize:", 42.0);
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFontName:", v21);

    -[UIKBRenderFactoryNumberPad specialSymbolOffset](self, "specialSymbolOffset");
    objc_msgSend(v40, "setTextOffset:");
    objc_msgSend(v40, "setSelector:", 1);
    if (_AXSEnhanceTextLegibilityEnabled())
      objc_msgSend(v40, "setFontName:", CFSTR("PhonepadTwo"));
    goto LABEL_20;
  }
  objc_msgSend(v11, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "hasPrefix:", CFSTR("NumberPad-")) & 1) != 0)
  {
    objc_msgSend(v11, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasSuffix:", CFSTR("-0-Plus"));

    if (v29)
    {
      objc_msgSend(v40, "setTextOffset:", 0.0, 3.0);
      objc_msgSend(v10, "setTextOffset:", 18.0, 1.0);
      objc_msgSend(v10, "setFontSize:", 22.0);
      goto LABEL_20;
    }
  }
  else
  {

  }
  objc_msgSend(v11, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "hasPrefix:", CFSTR("NumberPad-")) & 1) != 0)
  {
    objc_msgSend(v12, "secondaryDisplayStrings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (!v34)
    {
      objc_msgSend(v11, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "hasSuffix:", CFSTR("-0"));

      if (v36)
      {
        -[UIKBRenderFactoryNumberPad loneZeroOffset](self, "loneZeroOffset");
      }
      else
      {
        v17 = 0.0;
        v18 = 0.0;
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
LABEL_20:
  if (objc_msgSend(v40, "usesSymbolImage"))
  {
    -[UIKBRenderFactoryNumberPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    objc_msgSend(v40, "setFontSizeForSymbolImage:");
    objc_msgSend(v40, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
  }

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
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  __CFString **v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  int v56;
  __CFString **v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)UIKBRenderFactoryNumberPad;
  v7 = a4;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](&v63, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm", v63.receiver, v63.super_class));
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v9, "lightKeyboard") ^ 1);

  objc_msgSend(v8, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRoundRectRadius:", 5.0);
  objc_msgSend(v10, "setRoundRectCorners:", -1);
  objc_msgSend(v7, "frame");
  objc_msgSend(v10, "adjustForConsistentGapsWithSize:inFrame:", 6.0, 6.0, v11, v12, v13, v14);
  -[UIKBRenderFactory displayContentsForKey:](self, "displayContentsForKey:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactoryNumberPad numberFontSize](self, "numberFontSize");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbolStyle:", v17);

  objc_msgSend(v8, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMinFontSize:", 9.0);

  -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactoryNumberPad letterFontSize](self, "letterFontSize");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setFontWeight:", *(double *)off_1E167DC50);
  objc_msgSend(v20, "setKerning:", 2.0);
  v64[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondarySymbolStyles:", v21);

  objc_msgSend(v7, "frame");
  v23 = v22;

  objc_msgSend(v6, "frame");
  v26 = v23 * 0.5;
  if (v24 + v25 >= v26)
  {
    objc_msgSend(v6, "frame");
    if (v32 <= v26)
    {
      -[UIKBRenderFactoryNumberPad centerColumnNumberOffset](self, "centerColumnNumberOffset");
      v39 = v38;
      v41 = v40;
      objc_msgSend(v8, "symbolStyle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTextOffset:", v39, v41);

      -[UIKBRenderFactoryNumberPad centerColumnLetterOffset](self, "centerColumnLetterOffset");
    }
    else
    {
      -[UIKBRenderFactoryNumberPad rightColumnNumberOffset](self, "rightColumnNumberOffset");
      v34 = v33;
      v36 = v35;
      objc_msgSend(v8, "symbolStyle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setTextOffset:", v34, v36);

      -[UIKBRenderFactoryNumberPad rightColumnLetterOffset](self, "rightColumnLetterOffset");
    }
  }
  else
  {
    -[UIKBRenderFactoryNumberPad leftColumnNumberOffset](self, "leftColumnNumberOffset");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v8, "symbolStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextOffset:", v28, v30);

    -[UIKBRenderFactoryNumberPad leftColumnLetterOffset](self, "leftColumnLetterOffset");
  }
  objc_msgSend(v20, "setTextOffset:");
  objc_msgSend(v8, "symbolStyle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactoryNumberPad _customizeSymbolStyle:secondaryStyle:forKey:contents:](self, "_customizeSymbolStyle:secondaryStyle:forKey:contents:", v43, v20, v6, v15);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "whiteText");
  v46 = UIKBColorWhite;
  if (!v45)
    v46 = UIKBColorBlack;
  v47 = *v46;
  objc_msgSend(v8, "symbolStyle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTextColor:", v47);

  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v8, "symbolStyle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTextOpacity:", 0.35);

  }
  objc_msgSend(v8, "symbolStyle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "textColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v51);

  objc_msgSend(v8, "symbolStyle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "textOpacity");
  objc_msgSend(v20, "setTextOpacity:");

  v53 = objc_msgSend(v6, "state");
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v53 & 4) != 0)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "lightKeyboard");
    v57 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    if (!v56)
      v57 = UIKBColorKeyGrayKeyDarkBackground;
    v58 = *v57;

    v54 = v58;
  }
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v54);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundGradient:", v59);

  objc_msgSend(v8, "setControlOpacities:", (v53 >> 2) & 1);
  -[UIKBRenderFactory defaultKeyShadowColorName](self, "defaultKeyShadowColorName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v60, 4, -1.0, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addRenderEffect:", v61);

  return v8;
}

- (void)setupLayoutSegments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setControlOpacities:", 1);
  -[UIKBRenderFactoryNumberPad controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundGradient:", v4);

  +[UIKBNullEffect nullEffect](UIKBNullEffect, "nullEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addRenderEffect:", v5);

  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyStates:", 2);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.33, 0.25);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v6);
  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlOpacities:", 0);
  -[UIKBRenderFactoryNumberPad controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundGradient:", v9);

  +[UIKBNullEffect nullEffect](UIKBNullEffect, "nullEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRenderEffect:", v10);

  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyStates:", 4);
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.33, 0.25);
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v11);

}

@end
