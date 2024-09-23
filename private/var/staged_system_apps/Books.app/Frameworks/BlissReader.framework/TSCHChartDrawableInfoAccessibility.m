@implementation TSCHChartDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartDrawableInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)tsaxChartTypeFullDescription
{
  return (NSString *)objc_msgSend(-[TSCHChartDrawableInfoAccessibility _tsaxChartInfo](self, "_tsaxChartInfo"), "tsaxChartTypeFullDescription");
}

- (id)_tsaxChartInfo
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSCHChartInfoAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSCHChartDrawableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chart")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
