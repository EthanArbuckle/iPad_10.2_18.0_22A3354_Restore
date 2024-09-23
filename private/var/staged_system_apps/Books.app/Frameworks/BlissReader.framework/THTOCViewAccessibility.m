@implementation THTOCViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THTOCView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityElementsHidden
{
  return objc_msgSend(-[THTOCViewAccessibility _thaxBookViewController](self, "_thaxBookViewController"), "thaxIsTOCVisible") ^ 1;
}

- (id)_thaxBookViewController
{
  id v2;
  void *v3;
  id result;
  char v5;

  v2 = -[THTOCViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_accessibilityViewController"));
  v5 = 0;
  v3 = (void *)objc_opt_class(THBookViewControllerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("delegate")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
