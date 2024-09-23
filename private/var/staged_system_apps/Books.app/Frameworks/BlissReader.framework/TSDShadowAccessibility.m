@implementation TSDShadowAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShadow");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxIsShadowEnabled
{
  return -[TSDShadowAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mEnabled"));
}

- (NSString)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("shadow"));
}

- (NSString)tsaxShadowAngleDescription
{
  double v2;

  -[TSDShadowAccessibility _tsaxShadowAngle](self, "_tsaxShadowAngle");
  if (v2 <= 0.0)
    return 0;
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("angle.with.units %f")), *(_QWORD *)&v2);
}

- (NSString)tsaxShadowColorDescription
{
  return (NSString *)objc_msgSend(-[TSDShadowAccessibility _tsaxShadowColor](self, "_tsaxShadowColor"), "tsaxStyleInfoDescription");
}

- (double)_tsaxShadowAngle
{
  double result;

  -[TSDShadowAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("mAngle"));
  return result;
}

- (id)_tsaxShadowColor
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDShadowAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("TSUColor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
