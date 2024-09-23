@implementation TSDAngleGradientAccessibility

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("gradient.fill"));
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDAngleGradient");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDGradientAccessibility, a2);
}

@end
