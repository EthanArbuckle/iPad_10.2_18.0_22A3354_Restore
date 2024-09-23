@implementation TSDContactShadowAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDContactShadow");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDShadowAccessibility, a2);
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("contact.shadow"));
}

@end
