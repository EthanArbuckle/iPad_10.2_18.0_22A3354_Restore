@implementation SSChromeHelper

+ (void)configureNavigationBarAppearance:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDF6600];
  v3 = (void *)MEMORY[0x24BDF6950];
  v4 = a3;
  objc_msgSend(v3, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleTextAttributes:", v6);

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "setShadowImage:", v8);

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1102);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffects:", v10);

  objc_msgSend(v4, "setAlpha:", 1.0);
  objc_msgSend(v4, "setBarTintColor:", 0);
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setTranslucent:", 1);
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v7, 0);

}

+ (id)createFixedSpaceBarButtonItemWithWidth:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v4, "setWidth:", a3);
  return v4;
}

+ (double)defaultBarButtonSpacing
{
  return 20.0;
}

+ (double)defaultBarButtonWidth
{
  return 44.0;
}

+ (id)barSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
}

+ (id)separatorView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v2, "_setOverrideUserInterfaceStyle:", 2);
  +[SSChromeHelper barSeparatorColor](SSChromeHelper, "barSeparatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

+ (double)barSeparatorSize
{
  return 1.0;
}

+ (double)cropsCornerWidth
{
  return 4.0;
}

+ (double)cropsCornerLength
{
  return 20.0;
}

+ (double)cropsHandleOutset
{
  return 0.0;
}

+ (CGRect)availableRectForFullscreenContent:(CGRect)result layoutBounds:(CGRect)a4 bleedToBottom:(BOOL)a5 topBarHeight:(double)a6 bottomBarHeight:(double)a7 userInterfaceIdiom:(int64_t)a8 multipleScreenshots:(BOOL)a9
{
  double width;
  _BOOL4 v10;
  double height;
  double v13;
  double y;
  double x;
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

  width = result.size.width;
  if (!a5)
  {
    v10 = a9;
    height = a4.size.height;
    v13 = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v26 = *(double *)(MEMORY[0x24BDF7718] + 24);
    v25 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v16 = *MEMORY[0x24BDF7718] + a6;
    v17 = *(double *)(MEMORY[0x24BDF7718] + 16) + a7;
    +[SSChromeHelper screenshotTopBottomMargin:](SSChromeHelper, "screenshotTopBottomMargin:", a8);
    v19 = v18;
    if (!a8 && v10)
    {
      objc_msgSend((id)objc_opt_class(), "countIndicatorOffset");
      v19 = v19 + v20 * 2.0;
    }
    v21 = v16 + v19;
    if (a8 == 1)
      v22 = width * 0.115;
    else
      v22 = v26;
    if (a8 == 1)
      v23 = width * 0.115;
    else
      v23 = v25;
    result.origin.x = x + v23;
    result.origin.y = y + v21;
    width = v13 - (v23 + v22);
    result.size.height = height - (v21 + v17 + v19);
  }
  v24 = width;
  result.size.width = v24;
  return result;
}

+ (double)countIndicatorOffset
{
  return 8.0;
}

+ (double)screenshotTopBottomMargin:(int64_t)a3
{
  double result;

  if (a3 == 1)
    +[SSChromeHelper screenshotTopBottomMarginPad](SSChromeHelper, "screenshotTopBottomMarginPad");
  else
    +[SSChromeHelper screenshotTopBottomMarginPhone](SSChromeHelper, "screenshotTopBottomMarginPhone");
  return result;
}

+ (double)screenshotTopBottomMarginPad
{
  return 20.0;
}

+ (double)screenshotTopBottomMarginPhone
{
  return 30.0;
}

+ (double)widthForContentSwitcher:(id)a3 forView:(id)a4
{
  objc_msgSend(a3, "sizeToFit");
  return 114.0;
}

+ (double)widthForOpacityControlInView:(id)a3 withContentSwitcher:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
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

  v6 = a4;
  v7 = a3;
  +[SSChromeHelper barButtonItemsLeftOfOpacitySlider](SSChromeHelper, "barButtonItemsLeftOfOpacitySlider");
  v9 = v8;
  +[SSChromeHelper defaultBarButtonWidth](SSChromeHelper, "defaultBarButtonWidth");
  v11 = v10;
  +[SSChromeHelper widthForContentSwitcher:forView:](SSChromeHelper, "widthForContentSwitcher:forView:", v6, v7);
  v13 = v12;

  +[SSChromeHelper contentSwitcherPadding](SSChromeHelper, "contentSwitcherPadding");
  v15 = v13 + v11 * v9 + v14;
  objc_msgSend(a1, "defaultBarButtonSpacing");
  v17 = v15 + v16 * 2.0;
  +[SSVellumOpacityControl preferredWidth](SSVellumOpacityControl, "preferredWidth");
  v19 = v18;
  objc_msgSend(v7, "bounds");
  v21 = v20;

  return fmin(v19, v21 * 0.5 - v17);
}

+ (double)barButtonItemsLeftOfOpacitySlider
{
  return 2.0;
}

+ (double)contentSwitcherPadding
{
  return 16.0;
}

+ (int)statusBarVisibilityForTraitCollection:(id)a3 isPortrait:(BOOL)a4
{
  int v4;

  if (a4)
    v4 = 2;
  else
    v4 = 1;
  if (objc_msgSend(a3, "userInterfaceIdiom"))
    return 2;
  else
    return v4;
}

+ (int64_t)statusBarStyle
{
  return 1;
}

+ (int64_t)backgroundBlurEffectStyle
{
  return 2;
}

@end
