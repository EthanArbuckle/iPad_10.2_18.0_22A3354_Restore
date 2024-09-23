@implementation TSCHChartRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCHChartRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSString)tsaxChartTypeFullDescription
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = -[TSCHChartDrawableInfoAccessibility tsaxChartTypeFullDescription](-[TSCHChartRepAccessibility tsaxChartDrawableInfo](self, "tsaxChartDrawableInfo"), "tsaxChartTypeFullDescription");
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (TSCHChartDrawableInfoAccessibility)tsaxChartDrawableInfo
{
  void *v3;
  TSCHChartDrawableInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSCHChartDrawableInfoAccessibility);
  result = (TSCHChartDrawableInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chartInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("chart"));
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("chart.hint.ios"));
}

@end
