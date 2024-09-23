@implementation CRLUIWindowAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLUIWindowAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (UIResponder)crlaxFirstResponder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIWindowAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstResponder"));

  return (UIResponder *)v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLUIWindowAccessibility;
  -[CRLUIWindowAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[CRLUIWindowAccessibility crlaxLoadAccessibilityInformation](self, "crlaxLoadAccessibilityInformation");
}

@end
