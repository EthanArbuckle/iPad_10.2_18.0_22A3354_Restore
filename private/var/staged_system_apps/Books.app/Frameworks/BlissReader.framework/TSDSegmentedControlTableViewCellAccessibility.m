@implementation TSDSegmentedControlTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDSegmentedControlTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSKSegmentedControlAccessibility)tsaxSegmentedControl
{
  void *v3;
  TSKSegmentedControlAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKSegmentedControlAccessibility);
  result = (TSKSegmentedControlAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDSegmentedControlTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("segmentedControl")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
