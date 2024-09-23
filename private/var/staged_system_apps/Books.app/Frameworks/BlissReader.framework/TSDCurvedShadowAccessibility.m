@implementation TSDCurvedShadowAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCurvedShadow");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDShadowAccessibility, a2);
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("curved.shadow"));
}

@end
