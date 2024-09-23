@implementation TSDDoubleSegmentedControlTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDDoubleSegmentedControlTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)tsaxLeftSegmentedControl
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKSegmentedControlAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDDoubleSegmentedControlTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("leftSegmentedControl")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxRightSegmentedControl
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKSegmentedControlAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDDoubleSegmentedControlTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rightSegmentedControl")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
