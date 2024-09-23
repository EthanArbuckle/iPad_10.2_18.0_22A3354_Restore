@implementation BFFStyle

+ (id)sharedStyle
{
  if (sharedStyle_onceToken != -1)
    dispatch_once(&sharedStyle_onceToken, &__block_literal_global_0);
  return (id)sharedStyle__instance;
}

void __23__BFFStyle_sharedStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedStyle__instance;
  sharedStyle__instance = v0;

}

- (id)headerTitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BEBD5E8];
  _BFFHeaderTextStyle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEBD5E0];
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)_effectiveSizeForIconSize:(CGSize)a3 inView:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = v6;
  v8 = *MEMORY[0x24BDBF148];
  v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (width != *MEMORY[0x24BDBF148] || height != v9)
  {
    objc_msgSend(v6, "bounds");
    if (width >= v11)
      v8 = v11;
    else
      v8 = width;
    objc_msgSend(v7, "bounds");
    if (width >= v12)
    {
      objc_msgSend(v7, "bounds");
      v9 = height * (v13 / width);
    }
    else
    {
      v9 = height;
    }
  }

  v14 = v8;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)headerYOffsetForIconSize:(CGSize)a3 inView:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[BFFStyle _effectiveSizeForIconSize:inView:](self, "_effectiveSizeForIconSize:inView:", v7, width, height);
  v10 = v9;
  if (v9 >= 100.001)
  {
    if (v8 < v9)
      v8 = v9;
    v12 = 0.0;
    if (v8 < 160.001)
    {
      objc_msgSend(v7, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = -(_BFFIconTitleBaselineOffset(v7) - v14 * 0.34) - v10;

      v12 = fmax(v15, 0.0);
    }
  }
  else
  {
    v11 = _BFFCGFloatByDeviceHeight(v7, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
    v12 = fmax(v11 - _CGFloatByIdiom(v7, 0.0, 24.0, 0.0) - v10, 0.0);
  }

  return v12;
}

- (double)headerTitleBaselineOffsetForView:(id)a3 iconSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;

  height = a4.height;
  width = a4.width;
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v9 = a3;
  v10 = v9;
  if (width == v7 && height == v8)
  {
    v18 = _BFFCGFloatByDeviceHeight(v9, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);

    return v18;
  }
  else
  {
    -[BFFStyle _effectiveSizeForIconSize:inView:](self, "_effectiveSizeForIconSize:inView:", v9, width, height);
    v13 = v12;
    -[BFFStyle headerYOffsetForIconSize:inView:](self, "headerYOffsetForIconSize:inView:", v10, width, height);
    v15 = v14 + v13;
    v16 = _BFFIconTitleBaselineOffset(v10);

    return v15 + v16;
  }
}

- (double)headerYOffsetForIcon:(id)a3 inView:(id)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a4;
  objc_msgSend(a3, "size");
  -[BFFStyle headerYOffsetForIconSize:inView:](self, "headerYOffsetForIconSize:inView:", v6);
  v8 = v7;

  return v8;
}

- (double)headerIconBaselineOffsetForView:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = _BFFCGFloatByDeviceHeight(v3, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
  v5 = _CGFloatByIdiom(v3, 0.0, 24.0, 0.0);

  return v4 - v5;
}

- (double)headerIconBaselineOffset
{
  double result;

  -[BFFStyle headerIconBaselineOffsetForView:](self, "headerIconBaselineOffsetForView:", 0);
  return result;
}

- (double)headerTitleBaselineOffsetForView:(id)a3 hasIcon:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;

  v4 = a4;
  v6 = a3;
  -[BFFStyle headerIconBaselineOffsetForView:](self, "headerIconBaselineOffsetForView:", v6);
  v8 = v7;
  if (v4)
  {
    v9 = _BFFIconTitleBaselineOffset(v6);

    return v8 + v9;
  }
  else
  {

  }
  return v8;
}

- (double)headerTitleBaselineOffsetHasIcon:(BOOL)a3
{
  double result;

  -[BFFStyle headerTitleBaselineOffsetForView:hasIcon:](self, "headerTitleBaselineOffsetForView:hasIcon:", 0, a3);
  return result;
}

- (double)headerSubheaderBaselineSpacingForView:(id)a3
{
  return _CGFloatByIdiom(a3, 32.0, 44.0, 44.0);
}

- (double)screenHeaderHeightForView:(id)a3
{
  return _BFFCGFloatByDeviceHeight(a3, 0.0, 0.0, 0.0, 240.5, 240.5, 371.5, 371.5, 0.0);
}

- (double)screenHeaderFooterSideInsetForView:(id)a3
{
  return _BFFCGFloatByDeviceHeight(a3, 0.0, 0.0, 0.0, 100.0, 100.0, 228.0, 399.0, 0.0);
}

- (double)baselineInsetForHeaderTitle
{
  return _BFFCGFloatByDeviceHeight(0, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
}

- (UIEdgeInsets)edgeInsetsForHeaderView:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
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
  UIEdgeInsets result;

  v4 = a3;
  v5 = objc_msgSend(v4, "_shouldReverseLayoutDirection");
  v6 = _CGFloatByIdiom(v4, 15.0, 15.0, 15.0);
  v7 = _CGFloatByIdiom(v4, 15.0, 0.0, 0.0);
  if (v5)
    v8 = v6;
  else
    v8 = v7;
  if (v5)
    v6 = v7;
  -[BFFStyle baselineInsetForHeaderTitle](self, "baselineInsetForHeaderTitle");
  v10 = v9;
  -[BFFStyle headerTitleFont](self, "headerTitleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");
  v13 = v10 + v12;

  v14 = _BFFCGFloatByDeviceHeight(v4, 27.5, 35.5, 39.3333333, 52.5, 52.5, 32.0, 32.0, 32.0);
  v15 = v13;
  v16 = v6;
  v17 = v14;
  v18 = v8;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)tableCellFont
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ja"));

  v6 = (double *)MEMORY[0x24BEBE260];
  if (v5)
    v6 = (double *)MEMORY[0x24BEBE270];
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 17.0, *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)singleLineCellHeightForTable:(id)a3
{
  return 60.0;
}

- (double)nonTableHorizontalMargin
{
  double result;

  _BFFTableInset(0);
  return result;
}

- (double)horizontalMarginForView:(id)a3
{
  double result;

  _BFFTableInset(a3);
  return result;
}

- (UIEdgeInsets)horizontalInsetsForContainingInView:(id)a3 width:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
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
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinX;
  CGFloat MaxX;
  double v32;
  double v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  UIEdgeInsets result;

  v5 = a3;
  v6 = *MEMORY[0x24BEBE158];
  v7 = *(double *)(MEMORY[0x24BEBE158] + 16);
  if (_useCompactMetrics(v5))
  {
    _BFFTableInset(v5);
    v9 = v8;
    v10 = v8;
  }
  else
  {
    objc_msgSend(v5, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v5, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v5, "window");
    else
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;

    objc_msgSend(v5, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v21, v12, v14, a4, v16);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    MinX = CGRectGetMinX(v39);
    v40.origin.x = v23;
    v40.origin.y = v25;
    v40.size.width = v27;
    v40.size.height = v29;
    MaxX = CGRectGetMaxX(v40);
    v32 = (v20 + -536.0) * 0.5;
    v33 = v32 - (v20 - MaxX);
    v34 = v32 - MinX < 0.0;
    if (v33 < 0.0)
      v34 = 1;
    if (v34)
      v9 = 24.0;
    else
      v9 = v33;
    if (v34)
      v10 = 24.0;
    else
      v10 = v32 - MinX;
  }

  v35 = v6;
  v36 = v10;
  v37 = v7;
  v38 = v9;
  result.right = v38;
  result.bottom = v37;
  result.left = v36;
  result.top = v35;
  return result;
}

- (UIEdgeInsets)edgeInsetsForTable:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v3 = a3;
  _BFFTableInset(v3);
  v5 = v4;
  objc_msgSend(v3, "contentInset");
  v7 = v6;
  objc_msgSend(v3, "separatorInset");
  v9 = v5 - v8;
  v10 = _BFFHeightByDeviceSize(v3);

  if (v10 == 7)
    v11 = 212.0;
  else
    v11 = 0.0;
  v12 = v7;
  v13 = v9;
  v14 = v5;
  result.right = v14;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
}

- (void)applyThemeToNavigationController:(id)a3 allowUnderlap:(BOOL)a4
{
  id v4;

  objc_msgSend(a3, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHidesShadow:", 1);

}

- (void)applyAutomaticScrollToEdgeBehaviorOnNavigationItem:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "_isManualScrollEdgeAppearanceEnabled") & 1) == 0)
  {
    objc_msgSend(v3, "_setAutoScrollEdgeTransitionDistance:", 16.0);
    objc_msgSend(v3, "_setManualScrollEdgeAppearanceEnabled:", 1);
  }

}

- (void)applyThemeToNavigationController:(id)a3
{
  -[BFFStyle applyThemeToNavigationController:allowUnderlap:](self, "applyThemeToNavigationController:allowUnderlap:", a3, 0);
}

- (id)continueButtonWithTitle:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a4;
  v6 = a3;
  +[BFFContinueButton buttonWithType:](BFFContinueButton, "buttonWithType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE200]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "scaledValueForValue:", 50.0);
  if (v13 <= 100.0)
    v14 = v13;
  else
    v14 = 100.0;
  objc_msgSend(v7, "setFrame:", v10, v12, 288.0, v14);
  objc_msgSend(v5, "addSubview:", v7);

  return v7;
}

- (CGSize)sizeForContinueButtonInAncestor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[BFFStyle horizontalInsetsForContainingInView:width:](self, "horizontalInsetsForContainingInView:width:", v4, v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledValueForValue:", 50.0);
  if (v11 <= 100.0)
    v12 = v11;
  else
    v12 = 100.0;
  objc_msgSend(v4, "bounds");
  v14 = v13;

  if (v14 - v7 - v9 <= 327.0)
    v15 = v14 - v7 - v9;
  else
    v15 = 327.0;

  v16 = v15;
  v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

- (double)tallRowHeight
{
  return 60.0;
}

- (void)applyThemeToLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "_labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

}

- (void)applyThemeToTextView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

}

- (void)applyThemeToRemoteUIWebViewController:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BFFStyle backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)applyThemeToAllTableViews
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD9F0], "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.300000012);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorBottomShadowColor:", v4);

  v5 = (void *)MEMORY[0x24BEBD708];
  v18[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearanceWhenContainedInInstancesOfClasses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = (void *)MEMORY[0x24BEBD708];
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appearanceWhenContainedInInstancesOfClasses:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

  objc_msgSend(MEMORY[0x24BEBD9F0], "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  objc_msgSend(MEMORY[0x24BEBD9F8], "appearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFStyle backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

}

- (void)applyThemeToTitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BEBD4B8];
  v9 = a3;
  objc_msgSend(v4, "_labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v5);

  -[BFFStyle backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v6);

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerTitleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setNumberOfLines:", 0);

}

- (void)applyThemeToTableCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "textLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableCellFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v5);

  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v8, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v8, "setMinimumScaleFactor:", 12.0 / v7);

  objc_msgSend(v3, "setAccessoryType:", 1);
}

- (void)applyThemeToSectionHeaderLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "_secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

}

@end
