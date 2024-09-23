@implementation THWPopUpContentProviderAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPopUpContentProvider");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (UIView)thaxPopoverContentView
{
  objc_class *v3;
  UIView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWPopUpContentProviderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("popoverContentView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
