@implementation THPageLayerAndSubviewNoHitViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THPageLayerAndSubviewNoHitView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)_accessibilitySubviews
{
  return 0;
}

@end
