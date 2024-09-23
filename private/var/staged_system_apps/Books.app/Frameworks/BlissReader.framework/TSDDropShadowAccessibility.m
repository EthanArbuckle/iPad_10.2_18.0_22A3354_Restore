@implementation TSDDropShadowAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDDropShadow");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDShadowAccessibility, a2);
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("drop.shadow"));
}

@end
