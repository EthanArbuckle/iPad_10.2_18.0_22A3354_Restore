@implementation THGlossaryTermTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryTermTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return objc_msgSend(-[THGlossaryTermTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mLabelWithHighlights")), "accessibilityLabel");
}

@end
