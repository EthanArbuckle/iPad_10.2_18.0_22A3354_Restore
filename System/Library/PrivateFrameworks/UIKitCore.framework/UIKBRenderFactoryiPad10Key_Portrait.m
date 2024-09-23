@implementation UIKBRenderFactoryiPad10Key_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (CGPoint)globeKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
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
  v4 = 22.0;
  v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)abcKeyTextOffset
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

- (double)numberPadKeyPrimarySymbolSize
{
  return 18.5;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -7.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = 9.5;
  if (v3 != 2.0)
    v2 = 10.0;
  v4 = 1.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (id)multitapCompleteKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_complete_arrow.png");
  else
    v3 = CFSTR("kana_multitap_complete_arrow-163r.png");
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_reverse_arrow.png");
  else
    v3 = CFSTR("kana_multitap_reverse_arrow-163r.png");
  return v3;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (double)controlColumnWidthFactor
{
  return 0.081;
}

- (void)setupLayoutSegments
{
  -[UIKBRenderFactoryiPad10Key_Portrait controlColumnWidthFactor](self, "controlColumnWidthFactor");
  -[UIKBRenderFactory10Key setupColumnLayoutSegmentsWithControlWidth:](self, "setupColumnLayoutSegmentsWithControlWidth:");
}

- (UIEdgeInsets)topEdgeAdjustmentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v3 = v2;
  v4 = -v2;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v3;
  result.left = v5;
  result.top = v4;
  return result;
}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  objc_super v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v48.receiver = self;
  v48.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  v11 = -[UIKBRenderFactory10Key edgesAdjustedForTranslucentGapsForGeometry:key:onKeyplane:](&v48, sel_edgesAdjustedForTranslucentGapsForGeometry_key_onKeyplane_, v8, v9, v10);
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v12 > 1.0)
  {
    objc_msgSend(v9, "frame");
    v14 = v13;
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
    if (v14 <= v15)
    {
      objc_msgSend(v9, "frame");
      v16 = 1.0 - v18;
      if (objc_msgSend(v10, "isSplit"))
      {
        -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
        v16 = v16 + v19;
      }
      if (objc_msgSend(v10, "isSplit"))
      {
        -[UIKBRenderFactory stretchFactor](self, "stretchFactor");
        if (v20 != 1.0)
          -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
      }
    }
    else
    {
      v16 = -1.0;
      if (objc_msgSend(v10, "isSplit"))
      {
        -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
        v16 = -v17;
      }
    }
    objc_msgSend(v8, "paddedFrame");
    objc_msgSend(v8, "setPaddedFrame:", v21 + 0.0, v16 + v22);
    objc_msgSend(v8, "displayFrame");
    objc_msgSend(v8, "setDisplayFrame:", v23 + 0.0, v16 + v24);
  }
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v25 > 1.0)
  {
    objc_msgSend(v9, "frame");
    v27 = v26;
    objc_msgSend(v10, "frameForKeylayoutName:", CFSTR("split-right"));
    if (v27 == v28)
    {
      objc_msgSend(v8, "paddedFrame");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
      objc_msgSend(v8, "setPaddedFrame:", v37 + v30, v32 + 0.0, v34 - (v37 + 0.0), v36);
      objc_msgSend(v8, "displayFrame");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
      objc_msgSend(v8, "setDisplayFrame:", v46 + v39, v41 + 0.0, v43 - (v46 + 0.0), v45);
    }
  }

  return (unint64_t)v11;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  -[UIKBRenderFactory backgroundTraitsForKeyplane:](&v13, sel_backgroundTraitsForKeyplane_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "visualStyling") & 0x80) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "frameForKeylayoutName:", CFSTR("split-left"));
    objc_msgSend(v6, "valueWithCGRect:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSplitLeftRect:", v7);

    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "frameForKeylayoutName:", CFSTR("split-right"));
    objc_msgSend(v9, "valueWithCGRect:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geometry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSplitRightRect:", v10);

  }
  return v5;
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
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v30, "removeAllRenderEffects");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v11, 22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setSymbolStyle:", v13);
  objc_msgSend(v12, "renderConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "lightKeyboard");
  v16 = UIKBColorBlack;
  if (!v15)
    v16 = UIKBColorWhite;
  v17 = *v16;
  objc_msgSend(v30, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  if (objc_msgSend(v10, "displayType") == 13)
  {
    objc_msgSend(v30, "symbolStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextOffset:", 0.0, -1.0);

    objc_msgSend(v30, "symbolStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v22 = v21;
    objc_msgSend(v30, "symbolStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFontSizeForSymbolImage:", v22);

  }
  if (objc_msgSend(v10, "displayType") == 4 || objc_msgSend(v10, "displayType") == 5)
  {
    objc_msgSend(v30, "symbolStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v26 = v25;
    objc_msgSend(v30, "symbolStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFontSizeForSymbolImage:", v26);

  }
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundGradient:", v29);

  -[UIKBRenderFactory10Key modifyTraitsForDetachedInputSwitcher:withKey:](self, "modifyTraitsForDetachedInputSwitcher:withKey:", v30, v10);
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
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
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  -[UIKBRenderFactory10Key _traitsForKey:onKeyplane:](&v36, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displayType") == 35)
  {
    -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
    v10 = v9;
    objc_msgSend(v8, "geometry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "symbolFrame");
    v13 = v12;
    v14 = -2.0 - v10;
    v15 = v10 + -2.0;
    v17 = v10 + -2.0 + v16;
    v19 = v18 - (v14 + v15);
    v21 = v20 + 0.0;
    objc_msgSend(v8, "geometry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSymbolFrame:", v17, v21, v19, v13);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "displayType") == 1)
  {
    objc_msgSend(v8, "geometry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    objc_msgSend(v11, "setFrame:", v23 + 0.0, v24 + 0.0, v25 + -0.5);
    objc_msgSend(v11, "paddedFrame");
    objc_msgSend(v11, "setPaddedFrame:", v26 + 0.0, v27 + 0.0, v28 + -0.5);
    objc_msgSend(v11, "displayFrame");
    objc_msgSend(v11, "setDisplayFrame:", v29 + 0.0, v30 + 0.0, v31 + -0.5);
    goto LABEL_5;
  }
  if ((objc_msgSend(v7, "visualStyling") & 0x80) != 0 && objc_msgSend(v6, "state") == 20)
  {
    objc_msgSend(v8, "variantTraits");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "symbolStyle");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34, "setFontSize:", 27.0);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = objc_msgSend(v35, "lightKeyboard");

    if ((v34 & 1) == 0)
    {
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorClear"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundGradient:", v11);
      goto LABEL_5;
    }
  }
LABEL_6:
  -[UIKBRenderFactory scaleTraits:](self, "scaleTraits:", v8);

  return v8;
}

@end
