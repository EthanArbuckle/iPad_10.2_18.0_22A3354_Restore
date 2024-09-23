@implementation TSCHChartTypeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartType");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxShortDescription
{
  return (NSString *)-[TSCHChartTypeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("userInterfaceName"));
}

- (NSString)tsaxFullDescription
{
  NSString *v2;
  NSString *v3;

  v2 = -[TSCHChartTypeAccessibility tsaxShortDescription](self, "tsaxShortDescription");
  v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("chart"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("chart.canvas.name %@ %@")), v2, v3);
}

@end
