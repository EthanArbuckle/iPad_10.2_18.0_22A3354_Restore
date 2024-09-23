@implementation TSKSegmentedControlAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKSegmentedControl");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (unint64_t)tsaxSegmentCount
{
  return (unint64_t)objc_msgSend(-[TSKSegmentedControlAccessibility _tsaxSegments](self, "_tsaxSegments"), "count");
}

- (void)tsaxSetSegmentDescriptions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_class *v8;
  uint64_t v9;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v4 = -[TSKSegmentedControlAccessibility _tsaxSegments](self, "_tsaxSegments");
  v5 = objc_msgSend(a3, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    if (v5)
    {
      v6 = 0;
      while (1)
      {
        v7 = objc_msgSend(v4, "objectAtIndex:", v6);
        v16 = 0;
        v8 = (objc_class *)objc_opt_class(NSString);
        v9 = __TSAccessibilityCastAsClass(v8, (uint64_t)objc_msgSend(a3, "objectAtIndex:", v6), 1, &v16);
        if (v16)
          break;
        objc_msgSend(v7, "setAccessibilityLabel:", v9);
        if (v5 == (id)++v6)
          return;
      }
LABEL_10:
      abort();
    }
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Number of segments have changed from %lu to %lu"), v11, v12, v13, v14, v15, (uint64_t)v5))goto LABEL_10;
  }
}

- (id)_tsaxSegments
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSKSegmentedControlAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mButtonSegments")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
