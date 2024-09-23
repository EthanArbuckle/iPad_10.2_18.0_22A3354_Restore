@implementation CRLNavigationControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLNavigationController");
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
  objc_opt_class(CRLNavigationControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLNavigationControllerAccessibility;
  -[CRLNavigationControllerAccessibility didShowViewController:animated:](&v4, "didShowViewController:animated:", a3, a4);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end
