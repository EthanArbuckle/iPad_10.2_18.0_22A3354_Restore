@implementation TSWPTextMagnifierRendererAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPTextMagnifierRenderer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_accessibilitySubviews
{
  return 0;
}

@end
