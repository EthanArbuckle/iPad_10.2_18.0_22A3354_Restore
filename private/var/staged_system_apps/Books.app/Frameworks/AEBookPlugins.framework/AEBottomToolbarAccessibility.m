@implementation AEBottomToolbarAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEBottomToolbar");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end
