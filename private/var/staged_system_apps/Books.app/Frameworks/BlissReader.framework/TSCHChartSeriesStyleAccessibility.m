@implementation TSCHChartSeriesStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartSeriesStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSSStyleAccessibility, a2);
}

- (id)tsax2DColumnFillProperty
{
  return -[TSSStyleAccessibility tsaxObjectForProperty:](self, "tsaxObjectForProperty:", 1387);
}

@end
