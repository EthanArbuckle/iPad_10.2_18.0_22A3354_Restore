@implementation TSKPopoverBasedViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKPopoverBasedViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSKPopoverControllerAccessibility)tsaxPopoverController
{
  void *v3;
  TSKPopoverControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKPopoverControllerAccessibility);
  result = (TSKPopoverControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSKPopoverBasedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mPopoverController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKPopoverBasedViewControllerAccessibility;
  v4 = -[TSKPopoverBasedViewControllerAccessibility p_newCloseImageBarButtonWithTarget:action:](&v6, "p_newCloseImageBarButtonWithTarget:action:", a3, a4);
  objc_msgSend(v4, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("done.button")));
  return v4;
}

@end
