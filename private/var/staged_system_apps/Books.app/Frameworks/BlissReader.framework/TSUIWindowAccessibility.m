@implementation TSUIWindowAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (UIResponder)tsaxFirstResponder
{
  objc_class *v3;
  UIResponder *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIResponder);
  result = (UIResponder *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSUIWindowAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("firstResponder")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUIWindowAccessibility;
  -[TSUIWindowAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[TSUIWindowAccessibility tsaxLoadAccessibilityInformation](self, "tsaxLoadAccessibilityInformation");
}

@end
