@implementation BKAssetPresentingViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKAssetPresentingViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKAssetPresentingViewControllerAccessibility;
  -[BKAssetPresentingViewControllerAccessibility viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingViewControllerAccessibility bkaxView](self, "bkaxView"));
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAssetPresentingViewControllerAccessibility;
  -[BKAssetPresentingViewControllerAccessibility viewDidAppear:](&v3, "viewDidAppear:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (id)bkaxView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = objc_opt_class(UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("view")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

@end
