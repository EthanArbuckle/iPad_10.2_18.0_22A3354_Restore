@implementation _UIUserDefaultsActivityNavigationController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_UIUserDefaultsActivityNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[_UIUserDefaultsActivityNavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredContentSize:", width, height);

}

- (BOOL)_shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  -[_UIUserDefaultsActivityNavigationController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5)
  {
    if (objc_msgSend(v5, "_providesCustomBasePresentationInsets"))
    {
      -[_UIUserDefaultsActivityNavigationController _contentOverlayInsets](self, "_contentOverlayInsets");
      if (v6 > 0.0)
        v7 = 1;
    }
  }

  return v7;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  double result;
  objc_super v4;

  if (-[_UIUserDefaultsActivityNavigationController _shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight](self, "_shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight"))
  {
    -[_UIUserDefaultsActivityNavigationController _contentOverlayInsets](self, "_contentOverlayInsets");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIUserDefaultsActivityNavigationController;
    -[_UIUserDefaultsActivityNavigationController _statusBarHeightAdjustmentForCurrentOrientation](&v4, sel__statusBarHeightAdjustmentForCurrentOrientation);
  }
  return result;
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  objc_super v4;

  if (-[_UIUserDefaultsActivityNavigationController _shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight](self, "_shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIUserDefaultsActivityNavigationController;
  return -[_UIUserDefaultsActivityNavigationController _viewControllerUnderlapsStatusBar](&v4, sel__viewControllerUnderlapsStatusBar);
}

@end
