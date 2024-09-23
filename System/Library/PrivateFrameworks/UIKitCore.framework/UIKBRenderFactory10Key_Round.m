@implementation UIKBRenderFactory10Key_Round

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.0;
  v3 = 3.0;
  v4 = 3.0;
  v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
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

- (BOOL)useRoundCorner
{
  return 1;
}

- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4
{
  return 15;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  return -1;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v30 = a4;
  v9 = a6;
  v10 = a3;
  -[UIKBRenderFactory scale](self, "scale");
  v12 = v11;
  v13 = 5.0;
  if (v12 <= 2.0)
  {
    objc_msgSend(v30, "paddedFrame", 5.0);
    v13 = 4.0;
    if (v14 > 42.0)
      v13 = 5.0;
  }
  objc_msgSend(v10, "setRoundRectRadius:", v13);
  -[UIKBRenderFactory10Key_Round symbolFrameInsets](self, "symbolFrameInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = -[UIKBRenderFactory10Key_Round edgesWithInsetsForKey:onKeyplane:](self, "edgesWithInsetsForKey:onKeyplane:", v30, v9);

  if ((v23 & 1) == 0)
    v16 = 0.0;
  if ((v23 & 2) == 0)
    v18 = 0.0;
  if ((v23 & 4) == 0)
    v20 = 0.0;
  if ((v23 & 8) == 0)
    v22 = 0.0;
  objc_msgSend(v10, "paddedFrame");
  objc_msgSend(v10, "setSymbolFrame:", v18 + v24, v16 + v26, v25 - (v22 + v18), v27 - (v16 + v20));
  objc_msgSend(v10, "symbolFrame");
  objc_msgSend(v10, "setPaddedFrame:", v28 + 0.0, v29 + 0.0);

}

- (id)defaultKeyShadowColorName
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack_Alpha35;
  if (!v3)
    v4 = UIKBColorBlack_Alpha40;
  v5 = *v4;

  return v5;
}

- (id)controlKeyBackgroundColorName
{
  void *v3;
  objc_super v5;

  if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
  {
    -[UIKBRenderFactory _controlKeyBackgroundColorName](self, "_controlKeyBackgroundColorName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactory10Key_Round;
    -[UIKBRenderFactory10Key controlKeyBackgroundColorName](&v5, sel_controlKeyBackgroundColorName);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  objc_super v4;

  if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactory10Key_Round;
  return -[UIKBRenderFactory10Key lightHighQualityEnabledBlendForm](&v4, sel_lightHighQualityEnabledBlendForm);
}

- (id)controlKeyTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  objc_super v11;

  if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
  {
    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setControlOpacities:", 1);
    -[UIKBRenderFactory10Key_Round controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundGradient:", v5);

    -[UIKBRenderFactory10Key controlKeyForegroundColorName](self, "controlKeyForegroundColorName");
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
    -[UIKBRenderFactory10Key_Round controlKeyShadowColorName](self, "controlKeyShadowColorName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v9, 4, -1.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addRenderEffect:", v10);

    return v3;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIKBRenderFactory10Key_Round;
    -[UIKBRenderFactory10Key controlKeyTraits](&v11, sel_controlKeyTraits);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)activeControlKeyTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
  {
    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setControlOpacities:", 0);
    -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundGradient:", v5);

    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorClear"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLayeredForegroundGradient:", v6);

    return v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKBRenderFactory10Key_Round;
    -[UIKBRenderFactory10Key activeControlKeyTraits](&v8, sel_activeControlKeyTraits);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)shiftedControlKeyTraits
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  objc_super v12;

  if (!-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBRenderFactory10Key_Round;
    -[UIKBRenderFactory10Key shiftedControlKeyTraits](&v12, sel_shiftedControlKeyTraits);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    return v7;
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if ((v4 & 1) == 0)
  {
    -[UIKBRenderFactory10Key_Round shiftLockControlKeyTraits](self, "shiftLockControlKeyTraits");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "lightKeyboard") & 1) != 0)
    -[UIKBRenderFactory10Key_Round activeControlKeyTraits](self, "activeControlKeyTraits");
  else
    -[UIKBRenderFactory10Key_Round controlKeyTraits](self, "controlKeyTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightKeyboard");

  if (v10)
  {
    +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorBlack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymbolStyle:", v11);

  }
  return v7;
}

- (id)shiftLockControlKeyTraits
{
  void *v3;
  int v4;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if (v4)
    -[UIKBRenderFactory10Key_Round shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
  else
    +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldUseRoundCornerForKey:(id)a3
{
  return objc_msgSend(a3, "state") != 16;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  __CFString **v24;
  __CFString *v25;
  void *v26;
  char v27;
  __CFString *v28;
  void *v29;
  char v30;
  unint64_t v31;
  double MinX;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  objc_super v47;
  CGRect v48;
  CGRect v49;

  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)UIKBRenderFactory10Key_Round;
  -[UIKBRenderFactory10Key _traitsForKey:onKeyplane:](&v47, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
    goto LABEL_56;
  v9 = objc_msgSend(v6, "displayType");
  if (v9 == 12)
    goto LABEL_56;
  v10 = v9;
  if ((objc_msgSend(v6, "state") & 0x10) != 0 && v10 <= 0xD && ((1 << v10) & 0x2030) != 0)
  {
    -[UIKBRenderFactory10Key_Round shouldUseRoundCornerForKey:](self, "shouldUseRoundCornerForKey:", v6);
    v11 = 1;
  }
  else
  {
    if (!-[UIKBRenderFactory10Key_Round shouldUseRoundCornerForKey:](self, "shouldUseRoundCornerForKey:", v6))
      goto LABEL_54;
    v11 = 0;
  }
  objc_msgSend(v8, "setControlOpacities:", 0);
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  v12 = -[UIKBRenderFactory10Key_Round roundCornersForKey:onKeyplane:](self, "roundCornersForKey:onKeyplane:", v6, v7);
  objc_msgSend(v8, "geometry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRoundRectCorners:", v12);

  -[UIKBRenderFactory10Key displayContentsForKey:](self, "displayContentsForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory10Key_Round _customizeGeometry:forKey:contents:onKeyplane:](self, "_customizeGeometry:forKey:contents:onKeyplane:", v15, v6, v14, v7);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v8, "removeAllRenderEffects");
    -[UIKBRenderFactory10Key_Round defaultKeyShadowColorName](self, "defaultKeyShadowColorName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "state") & 0x6C) == 0)
    {
      if (-[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v6))
      {
LABEL_38:
        v30 = -[UIKBRenderFactory10Key_Round edgesWithInsetsForKey:onKeyplane:](self, "edgesWithInsetsForKey:onKeyplane:", v6, v7);
        v31 = ~v30 & 6;
        objc_msgSend(v6, "paddedFrame");
        MinX = CGRectGetMinX(v48);
        objc_msgSend(v6, "frame");
        v33 = MinX - CGRectGetMinX(v49);
        if ((~v30 & 6) != 0)
        {
          -[UIKBRenderFactory10Key controlKeyDividerColorName](self, "controlKeyDividerColorName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
          v36 = -v35;
          if ((~v30 & 2) != 0)
            v37 = v36;
          else
            v37 = 0.0;
          if (v31 >= 4)
            v38 = v36;
          else
            v38 = 0.0;
          v39 = v16;
          if (v33 > 0.0)
          {
            v37 = v37 - v33;
            +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v34, 2, -v33, v33);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addRenderEffect:", v40);

          }
          -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
          +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v34, v31, 0.0, v37, v38, 0.0, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addRenderEffect:", v42);

          v16 = v39;
        }
        if ((v30 & 4) != 0)
        {
          v43 = 0.0;
          if ((v30 & 2) == 0)
          {
            -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
            v43 = -v33 - v44;
          }
          +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v16, 4, 0.0, v43, -1.0, 0.0, 1.0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addRenderEffect:", v45);

        }
        goto LABEL_53;
      }
      -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_37:
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundGradient:", v29);

      goto LABEL_38;
    }
    v17 = objc_msgSend(v6, "displayType") == 14 || objc_msgSend(v6, "displayType") == 11;
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "animatedBackground");

    if (v20)
    {
      -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha10"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLayeredForegroundGradient:", v21);
LABEL_25:

      goto LABEL_37;
    }
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "lightKeyboard");

    if (v23)
    {
      if (!v17)
      {
        if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 10)
          v24 = UIKBColorLightGrayPressState;
        else
          v24 = UIKBColorLightGrayPressState10Key;
LABEL_35:
        v25 = *v24;
        goto LABEL_36;
      }
    }
    else
    {
      if (!v17)
      {
        if (objc_msgSend(v6, "state") == 20)
        {
          v18 = CFSTR("UIKBColorClear");

          v16 = v18;
          goto LABEL_37;
        }
        if (objc_msgSend((id)objc_opt_class(), "_graphicsQuality") == 100)
        {
          -[UIKBRenderFactory renderingContext](self, "renderingContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isFloating");

          if ((v27 & 1) == 0)
            objc_msgSend(v8, "setBlendForm:", 6);
          v18 = CFSTR("UIKBColorKeyGrayKeyActiveDarkBackground");
          v28 = CFSTR("UIKBColorClear");

          v16 = v28;
          goto LABEL_37;
        }
        v24 = UIKBColorKeyGrayKeyDarkBackground;
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "displayType") != 11)
      {
        -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v18 = v25;
        goto LABEL_37;
      }
    }
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activatedKeyplaneSwitchControlKeyBackgroundName");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_53:

LABEL_54:
  if (objc_msgSend(v6, "displayType") == 1)
    objc_msgSend(v8, "setBackgroundGradient:", 0);
LABEL_56:

  return v8;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  __CFString **v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __objc2_class **v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double Height;
  double v53;
  double Width;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double x;
  double y;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  CGFloat rect;
  double rect_8;
  double rect_16;
  id rect_24;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  rect_24 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(a5, "renderConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "lightKeyboard");

  v14 = UIKBColorGray_Percent37;
  if (v13)
    v14 = UIKBColorWhite;
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", *v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(rect_24, "setBackgroundGradient:", v15);

  objc_msgSend(rect_24, "removeAllRenderEffects");
  +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.5, 1.0, 0.0, 1.0, 0.0, 3.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(rect_24, "addRenderEffect:", v16);

  -[UIKBRenderFactory10Key_Round wideShadowPaddleInsets](self, "wideShadowPaddleInsets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isFloating");

  if ((v26 & 1) == 0)
  {
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha55"), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v18, v20, v22 + 6.0, v24, 40.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rect_24, "addRenderEffect:", v27);

  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "lightKeyboard");

  if (v29)
  {
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rect_24, "addRenderEffect:", v30);

  }
  if (objc_msgSend(v10, "displayType") == 13 || objc_msgSend(v10, "displayType") == 4)
    v31 = off_1E167A978;
  else
    v31 = off_1E167AF28;
  -[__objc2_class sharedInstance](*v31, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_layout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "bounds");
  objc_msgSend(v34, "convertRect:toView:", 0);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(v34, "window");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  v45 = v44;
  rect = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  v89.origin.x = v36;
  v89.origin.y = v38;
  v89.size.width = v40;
  v89.size.height = v42;
  rect_16 = CGRectGetMinY(v89);
  v90.origin.x = v36;
  v90.origin.y = v38;
  v90.size.width = v40;
  v90.size.height = v42;
  rect_8 = CGRectGetMinX(v90);
  v91.origin.x = v45;
  v91.origin.y = v47;
  v91.size.width = v49;
  v91.size.height = v51;
  Height = CGRectGetHeight(v91);
  v92.origin.x = v36;
  v92.origin.y = v38;
  v92.size.width = v40;
  v92.size.height = v42;
  v53 = Height - CGRectGetMaxY(v92);
  v93.origin.x = rect;
  v93.origin.y = v47;
  v93.size.width = v49;
  v93.size.height = v51;
  Width = CGRectGetWidth(v93);
  v94.origin.x = v36;
  v94.origin.y = v38;
  v94.size.width = v40;
  v94.size.height = v42;
  v55 = Width - CGRectGetMaxX(v94);
  objc_msgSend(rect_24, "geometry");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setLayoutMargins:", rect_16, rect_8, v53, v55);

  objc_msgSend(v32, "popupRect");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  objc_msgSend(v10, "paddedFrame");
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  objc_msgSend(v34, "convertRect:fromView:", v32, v58, v60, v62, v64);
  v98.origin.x = v73;
  v98.origin.y = v74;
  v98.size.width = v75;
  v98.size.height = v76;
  v95.origin.x = v66;
  v95.origin.y = v68;
  v95.size.width = v70;
  v95.size.height = v72;
  v96 = CGRectUnion(v95, v98);
  v97 = CGRectInset(v96, -12.0, -2.0);
  x = v97.origin.x;
  y = v97.origin.y;
  v79 = v97.size.width;
  v80 = v97.size.height;
  objc_msgSend(rect_24, "geometry");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setDisplayFrame:", x, y, v79, v80);

  objc_msgSend(rect_24, "setBlurBlending:", 1);
  objc_msgSend(rect_24, "geometry");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setPopupBias:", 40);

  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v11, 22.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(rect_24, "setSymbolStyle:", v83);
  objc_msgSend(rect_24, "symbolStyle");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setTextColor:", CFSTR("UIKBColorClear"));

  if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 10)
    objc_msgSend(rect_24, "removeAllRenderEffects");

}

@end
