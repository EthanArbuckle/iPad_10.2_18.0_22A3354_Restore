@implementation CRLUIPageControlAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIPageControl");
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
  v5 = (void *)objc_opt_class(CRLUIPageControlAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_accessibilityCurrentPageDidChange
{
  objc_super v3;

  if (-[CRLUIPageControlAccessibility crlaxPageChangeCausesLayoutChange](self, "crlaxPageChangeCausesLayoutChange"))
  {
    CRLAccessibilityPostLayoutChangedNotification(0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLUIPageControlAccessibility;
    -[CRLUIPageControlAccessibility _accessibilityCurrentPageDidChange](&v3, "_accessibilityCurrentPageDidChange");
  }
}

@end
