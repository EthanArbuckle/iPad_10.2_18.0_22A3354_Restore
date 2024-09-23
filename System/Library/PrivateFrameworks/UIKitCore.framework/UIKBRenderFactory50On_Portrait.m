@implementation UIKBRenderFactory50On_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)keyplaneSwitchKeyFontSize
{
  return 17.0;
}

- (double)returnKeyFontSize
{
  return 18.0;
}

- (double)spaceKeyFontSize
{
  return 17.0;
}

- (double)deleteKeyFontSize
{
  return 16.0;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (BOOL)shouldShowTopRowEdge
{
  return 1;
}

- (BOOL)shouldShowBottomRowEdge
{
  return 1;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 4.0;
  v4 = 4.0;
  v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4
{
  return objc_msgSend(a3, "groupNeighbor") ^ 0xF;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  char v4;
  unint64_t v5;

  v4 = ~-[UIKBRenderFactory50On_Portrait edgesWithInsetsForKey:onKeyplane:](self, "edgesWithInsetsForKey:onKeyplane:", a3, a4);
  v5 = (v4 & 3) == 0;
  if ((v4 & 9) == 0)
    v5 |= 2uLL;
  if ((v4 & 6) == 0)
    v5 |= 4uLL;
  if ((v4 & 0xC) != 0)
    return v5;
  else
    return v5 | 8;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  __CFString **v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v25, "removeAllRenderEffects");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v11, 22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setSymbolStyle:", v13);
  objc_msgSend(v12, "renderConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "lightKeyboard");
  v16 = UIKBColorBlack;
  if (!v15)
    v16 = UIKBColorWhite;
  v17 = *v16;
  objc_msgSend(v25, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundGradient:", v20);

  if (objc_msgSend(v10, "displayType") == 13
    || objc_msgSend(v10, "displayType") == 4
    || objc_msgSend(v10, "displayType") == 5)
  {
    objc_msgSend(v25, "symbolStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v23 = v22;
    objc_msgSend(v25, "symbolStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFontSizeForSymbolImage:", v23);

  }
  -[UIKBRenderFactory10Key modifyTraitsForDetachedInputSwitcher:withKey:](self, "modifyTraitsForDetachedInputSwitcher:withKey:", v25, v10);

}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  double v37;
  double v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  double v43;
  double v44;
  objc_super v45;

  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UIKBRenderFactory50On_Portrait;
  -[UIKBRenderFactory10Key_Round _traitsForKey:onKeyplane:](&v45, sel__traitsForKey_onKeyplane_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state") <= 3)
  {
    objc_msgSend(v7, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "geometry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDisplayFrame:", v10, v12, v14, v16);

  }
  v18 = objc_msgSend(v6, "displayType");
  objc_msgSend(v6, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Facemark"));

  if (v20)
  {
    -[UIKBRenderFactory50On_Portrait lightKeycapsFontName](self, "lightKeycapsFontName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "symbolStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFontName:", v21);

    objc_msgSend(v7, "symbolStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 20.0;
LABEL_24:
    objc_msgSend(v23, "setFontSize:", v25);
    goto LABEL_25;
  }
  objc_msgSend(v6, "displayString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length") == 1)
  {
    objc_msgSend(v6, "displayString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(CFSTR("年月日時分"), "rangeOfString:", v27);

    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "symbolStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFontName:", CFSTR("HiraKakuProN-W3"));
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {

  }
  if (v18 <= 13)
  {
    if ((v18 - 10) >= 2)
    {
      if (v18 != 2)
      {
        if (v18 == 3)
        {
          -[UIKBRenderFactory50On_Portrait deleteKeyFontSize](self, "deleteKeyFontSize");
LABEL_23:
          v35 = v29;
          objc_msgSend(v7, "symbolStyle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = v35;
          goto LABEL_24;
        }
        goto LABEL_31;
      }
      -[UIKBRenderFactory50On_Portrait keyplaneSwitchKeyFontSize](self, "keyplaneSwitchKeyFontSize");
      v38 = v37;
      objc_msgSend(v7, "symbolStyle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFontSize:", v38);
      goto LABEL_30;
    }
    goto LABEL_19;
  }
  if (v18 > 22)
  {
    if (v18 != 23)
    {
      if (v18 == 25)
      {
        -[UIKBRenderFactory50On_Portrait spaceKeyFontSize](self, "spaceKeyFontSize");
        goto LABEL_23;
      }
      goto LABEL_31;
    }
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "lightKeyboard");

    if (!v41)
    {
LABEL_33:
      objc_msgSend(v7, "symbolStyle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v44 = v43;
      objc_msgSend(v7, "symbolStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFontSizeForSymbolImage:", v44);
      goto LABEL_25;
    }
    +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorBlack"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymbolStyle:", v39);
LABEL_30:

    goto LABEL_33;
  }
  if (v18 == 14)
  {
LABEL_19:
    -[UIKBRenderFactory50On_Portrait keyplaneSwitchKeyFontSize](self, "keyplaneSwitchKeyFontSize");
    goto LABEL_23;
  }
  if (v18 == 21)
  {
    -[UIKBRenderFactory50On_Portrait returnKeyFontSize](self, "returnKeyFontSize");
    v31 = v30;
    objc_msgSend(v7, "symbolStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFontSize:", v31);

    objc_msgSend(v7, "symbolStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "usesSymbolImage");

    if (v34)
    {
      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      goto LABEL_23;
    }
    goto LABEL_26;
  }
LABEL_31:
  if (objc_msgSend(v6, "interactionType") == 12
    || objc_msgSend(v6, "interactionType") == 17)
  {
    goto LABEL_33;
  }
LABEL_26:

  return v7;
}

- (double)controlColumnWidthFactor
{
  return 0.1;
}

- (void)setupLayoutSegments
{
  -[UIKBRenderFactory50On_Portrait controlColumnWidthFactor](self, "controlColumnWidthFactor");
  -[UIKBRenderFactory10Key setupColumnLayoutSegmentsWithControlWidth:](self, "setupColumnLayoutSegmentsWithControlWidth:");
}

@end
