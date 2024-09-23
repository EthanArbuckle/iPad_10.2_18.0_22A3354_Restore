@implementation BKUITransitionViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)accessibilityViewIsModal
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKUITransitionViewAccessibility;
  v3 = -[BKUITransitionViewAccessibility accessibilityViewIsModal](&v8, "accessibilityViewIsModal");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUITransitionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController bkaxPresentedAssetTransitionViewIdentifier](BKAssetPresentingViewController, "bkaxPresentedAssetTransitionViewIdentifier"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6 | v3;
}

@end
