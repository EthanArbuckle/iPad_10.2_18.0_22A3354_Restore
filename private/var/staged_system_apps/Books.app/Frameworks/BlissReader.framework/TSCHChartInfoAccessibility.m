@implementation TSCHChartInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxChartTypeFullDescription
{
  return (NSString *)objc_msgSend(-[TSCHChartInfoAccessibility _tsaxChartType](self, "_tsaxChartType"), "tsaxFullDescription");
}

- (id)_tsaxChartType
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSCHChartTypeAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSCHChartInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chartType")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
