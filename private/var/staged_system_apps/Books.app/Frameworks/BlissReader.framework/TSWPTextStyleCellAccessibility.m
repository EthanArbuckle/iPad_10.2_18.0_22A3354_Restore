@implementation TSWPTextStyleCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPTextStyleCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return objc_msgSend(-[TSWPTextStyleCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("textStyle")), "tsaxValueForKey:", CFSTR("name"));
}

@end
