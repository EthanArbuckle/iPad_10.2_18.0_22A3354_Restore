@implementation TSDBrushStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDBrushStroke");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("stroke.chalkTexture.png"));
}

@end
