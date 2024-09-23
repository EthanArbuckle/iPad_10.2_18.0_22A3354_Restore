@implementation THUIAccessibilityElement

+ (id)tsaxTargetClassName
{
  return CFSTR("UIAccessibilityElement");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
