@implementation TSDGradientStopAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDGradientStop");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxColorDescription
{
  return -[TSUColorAccessibility tsaxStyleInfoDescription](-[TSDGradientStopAccessibility tsaxColor](self, "tsaxColor"), "tsaxStyleInfoDescription");
}

- (TSUColorAccessibility)tsaxColor
{
  void *v3;
  TSUColorAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDGradientStopAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("color")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
