@implementation UIKBRenderFactoryiPadSplit

- (CGPoint)internationalKeyOffset
{
  double v2;
  BOOL v3;
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v3 = v2 == 2.0;
  v4 = 0.0;
  if (v3)
    v4 = -0.5;
  v5 = v4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  BOOL v3;
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v3 = v2 == 2.0;
  v4 = 0.0;
  if (v3)
    v4 = -0.5;
  v5 = v4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = -1.5;
  if (v3 != 2.0)
    v2 = -1.0;
  v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = -2.5;
  if (v3 != 2.0)
    v2 = -2.0;
  v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
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

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)variantAnnotationTextFontSize
{
  return 8.0;
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
  v4 = 6.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  return 0.9;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  return 0;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIKBRenderFactoryiPadSplit;
  v3 = a3;
  -[UIKBRenderFactory backgroundTraitsForKeyplane:](&v20, sel_backgroundTraitsForKeyplane_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-left"), v20.receiver, v20.super_class);
  objc_msgSend(v5, "valueWithCGRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSplitLeftRect:", v6);

  v8 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-right"));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "valueWithCGRect:", v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSplitRightRect:", v17);

  return v4;
}

- (double)defaultPathWeight
{
  return 1.0;
}

- (double)symbolFrameInset
{
  return 6.0;
}

- (double)keyInsetBottom
{
  double result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadSplit;
  -[UIKBRenderFactoryiPad keyInsetBottom](&v4, sel_keyInsetBottom);
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  return result;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIKBRenderFactoryiPadSplit;
  -[UIKBRenderFactoryiPad _customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:](&v17, sel__customizeTraits_forPopupForKey_withRenderingContext_keycapsFontName_, v10, v11, a5, a6);
  if (objc_msgSend(v11, "displayType") == 13)
  {
    -[UIKBRenderFactoryiPadSplit internationalKeyOffset](self, "internationalKeyOffset");
LABEL_10:
    v14 = v12;
    v15 = v13;
    objc_msgSend(v10, "symbolStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextOffset:", v14, v15);

    goto LABEL_11;
  }
  if (objc_msgSend(v11, "displayType") == 5)
  {
    -[UIKBRenderFactoryiPadSplit dismissKeyOffset](self, "dismissKeyOffset");
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "displayType") == 3)
  {
    -[UIKBRenderFactoryiPadSplit deleteKeyOffset](self, "deleteKeyOffset");
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "displayType") == 23 || objc_msgSend(v11, "interactionType") == 14)
  {
    -[UIKBRenderFactoryiPadSplit shiftKeyOffset](self, "shiftKeyOffset");
    goto LABEL_10;
  }
LABEL_11:

}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.25;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKBRenderFactoryiPadSplit;
  v9 = a4;
  -[UIKBRenderFactoryiPad _customizeGeometry:forKey:contents:](&v20, sel__customizeGeometry_forKey_contents_, v8, v9, a5);
  LODWORD(a5) = objc_msgSend(v9, "displayType", v20.receiver, v20.super_class);

  if ((_DWORD)a5 == 2)
  {
    objc_msgSend(v8, "symbolFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIKBRenderFactoryiPadSplit symbolFrameInset](self, "symbolFrameInset");
    v19 = v18;
    v21.origin.x = v11;
    v21.origin.y = v13;
    v21.size.width = v15;
    v21.size.height = v17;
    v22 = CGRectInset(v21, v19, 0.0);
    objc_msgSend(v8, "setSymbolFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  }

}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  void *v9;
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
  void *v39;
  double v41;
  double v42;
  double v43;
  double v44;

  v9 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v9, "paddedInsets");
  v43 = v10;
  v44 = v11;
  v41 = v12;
  v42 = v13;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 50.0);
  v15 = v14;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 54.0);
  v17 = v16;
  objc_msgSend(v9, "frame");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v9, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UIKBRenderFactory scale](self, "scale");
  UIRectCenteredXInRectScale(v19, v21, v15, v17, v23, v25, v27, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v9, "setPaddedFrame:", v41 + v32, v43 + v34, v36 - (v41 + v42), v38 - (v43 + v44));
  objc_msgSend(v9, "paddedFrame");
  objc_msgSend(v9, "setSymbolFrame:");
  objc_msgSend(v9, "iPadVariantGeometries:rowLimit:", a4, a5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  double v10;
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactoryiPadSplit;
  -[UIKBRenderFactoryiPad _customizeSymbolStyle:forKey:contents:](&v11, sel__customizeSymbolStyle_forKey_contents_, v8, v9, a5);
  objc_msgSend(v8, "setFontSize:", 18.0);
  if (objc_msgSend(v9, "displayType") == 23)
  {
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
LABEL_3:
    v10 = 16.0;
LABEL_6:
    objc_msgSend(v8, "setFontSize:", v10);
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "displayType") == 3)
  {
    v10 = 15.0;
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "displayType") == 13)
  {
    -[UIKBRenderFactoryiPadSplit internationalKeyOffset](self, "internationalKeyOffset");
LABEL_13:
    objc_msgSend(v8, "setTextOffset:");
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "displayType") == 4)
  {
    -[UIKBRenderFactoryiPad dictationKeyOffset](self, "dictationKeyOffset");
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "displayType") == 5)
  {
    -[UIKBRenderFactoryiPadSplit dismissKeyOffset](self, "dismissKeyOffset");
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "displayType") == 21 || objc_msgSend(v9, "displayType") == 18)
    goto LABEL_3;
LABEL_14:

}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKBRenderFactoryiPadSplit;
  -[UIKBRenderFactoryiPad _traitsForKey:onKeyplane:](&v19, sel__traitsForKey_onKeyplane_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(",!"));

  if (v9)
  {
    objc_msgSend(v7, "symbolStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textOffset");
    v12 = v11;
    v14 = v13;

    objc_msgSend(v7, "symbolStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextOffset:", v12 + 1.0, v14);

  }
  -[UIKBRenderFactory scaleTraits:](self, "scaleTraits:", v7);
  if (-[UIKBRenderFactoryiPhone _shouldConfigureSecondarySymbolStyleForSpaceKey:](self, "_shouldConfigureSecondarySymbolStyleForSpaceKey:", v6))
  {
    objc_msgSend(v7, "secondarySymbolStyles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setFontSize:", 11.0);
    objc_msgSend(v17, "setTextOffset:", 8.0, 8.0);

  }
  return v7;
}

@end
