@implementation THUIBarButtonItemAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIBarButtonItem");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (UIView)thaxView
{
  objc_class *v3;
  UIView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THUIBarButtonItemAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
