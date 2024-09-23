@implementation TSAFirstLaunchViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAFirstLaunchViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_primaryButtonTapped
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSAFirstLaunchViewControllerAccessibility;
  -[TSAFirstLaunchViewControllerAccessibility _primaryButtonTapped](&v2, "_primaryButtonTapped");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_secondaryButtonTapped
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSAFirstLaunchViewControllerAccessibility;
  -[TSAFirstLaunchViewControllerAccessibility _secondaryButtonTapped](&v2, "_secondaryButtonTapped");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end
