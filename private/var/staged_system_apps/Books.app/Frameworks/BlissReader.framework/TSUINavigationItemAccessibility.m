@implementation TSUINavigationItemAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UINavigationItem");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUINavigationItemAccessibility;
  -[TSUINavigationItemAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[TSUINavigationItemAccessibility tsaxLoadAccessibilityInformation](self, "tsaxLoadAccessibilityInformation");
}

@end
