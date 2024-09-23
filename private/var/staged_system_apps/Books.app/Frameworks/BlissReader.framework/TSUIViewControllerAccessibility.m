@implementation TSUIViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUIViewControllerAccessibility;
  -[TSUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[TSUIViewControllerAccessibility tsaxLoadAccessibilityInformation](self, "tsaxLoadAccessibilityInformation");
}

@end
