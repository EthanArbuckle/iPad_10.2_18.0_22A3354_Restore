@implementation TSUIPageControlAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_accessibilityCurrentPageDidChange
{
  objc_super v3;

  if (-[TSUIPageControlAccessibility tsaxPageChangeCausesLayoutChange](self, "tsaxPageChangeCausesLayoutChange"))
  {
    TSAccessibilityPostLayoutChangedNotification(0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TSUIPageControlAccessibility;
    -[TSUIPageControlAccessibility _accessibilityCurrentPageDidChange](&v3, "_accessibilityCurrentPageDidChange");
  }
}

@end
