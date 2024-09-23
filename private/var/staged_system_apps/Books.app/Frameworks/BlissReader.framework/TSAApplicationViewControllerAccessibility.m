@implementation TSAApplicationViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAApplicationViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)setupToolbarForViewController:(id)a3 duration:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSAApplicationViewControllerAccessibility;
  -[TSAApplicationViewControllerAccessibility setupToolbarForViewController:duration:](&v5, "setupToolbarForViewController:duration:", a3);
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(&stru_43C0C0, a4);
}

@end
