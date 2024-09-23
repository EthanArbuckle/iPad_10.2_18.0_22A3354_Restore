@implementation THLabelWithWordHighlightsAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THLabelWithWordHighlights");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return -[THLabelWithWordHighlightsAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mText"));
}

@end
