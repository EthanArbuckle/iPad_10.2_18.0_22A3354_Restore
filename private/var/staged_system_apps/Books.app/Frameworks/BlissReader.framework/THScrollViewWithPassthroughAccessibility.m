@implementation THScrollViewWithPassthroughAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THScrollViewWithPassthrough");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end
