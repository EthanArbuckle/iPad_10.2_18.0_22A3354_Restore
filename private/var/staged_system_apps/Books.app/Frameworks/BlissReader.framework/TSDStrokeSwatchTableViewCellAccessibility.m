@implementation TSDStrokeSwatchTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDStrokeSwatchTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return objc_msgSend(-[TSDStrokeSwatchTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("stroke")), "accessibilityLabel");
}

@end
