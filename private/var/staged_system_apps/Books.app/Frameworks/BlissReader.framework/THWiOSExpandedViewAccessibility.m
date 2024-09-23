@implementation THWiOSExpandedViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWiOSExpandedView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
