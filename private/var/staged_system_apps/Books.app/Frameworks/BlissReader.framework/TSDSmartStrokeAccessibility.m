@implementation TSDSmartStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDSmartStroke");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDStrokeAccessibility, a2);
}

- (id)tsaxStrokePatternDescription
{
  return TSAccessibilityLocalizedString((uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stroke.%@"), -[TSDSmartStrokeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("strokeName"))));
}

@end
