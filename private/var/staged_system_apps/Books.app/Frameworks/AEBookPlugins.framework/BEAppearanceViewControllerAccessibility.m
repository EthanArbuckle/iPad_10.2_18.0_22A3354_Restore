@implementation BEAppearanceViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BEAppearanceViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BEAppearanceViewControllerAccessibility;
  -[BEAppearanceViewControllerAccessibility viewDidLoad](&v12, "viewDidLoad");
  v3 = AEAXLocString(CFSTR("brightness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewControllerAccessibility _imaxBrightnessSlider](self, "_imaxBrightnessSlider"));
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  v6 = AEAXLocString(CFSTR("decrease.font.size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewControllerAccessibility _imaxSizeSmallerButton](self, "_imaxSizeSmallerButton"));
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

  v9 = AEAXLocString(CFSTR("increase.font.size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewControllerAccessibility _imaxSizeLargerButton](self, "_imaxSizeLargerButton"));
  objc_msgSend(v11, "setAccessibilityLabel:", v10);

}

- (id)brightnessSlider
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BEAppearanceViewControllerAccessibility;
  v2 = -[BEAppearanceViewControllerAccessibility brightnessSlider](&v7, "brightnessSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("brightness.slider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (UISlider)_imaxBrightnessSlider
{
  return (UISlider *)-[BEAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("brightnessSlider"));
}

- (UIButton)_imaxSizeSmallerButton
{
  return (UIButton *)-[BEAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("sizeSmallerButton"));
}

- (UIButton)_imaxSizeLargerButton
{
  return (UIButton *)-[BEAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("sizeLargerButton"));
}

@end
