@implementation TSDStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDStroke");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSDStrokePatternAccessibility)tsaxStrokePattern
{
  void *v3;
  TSDStrokePatternAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDStrokePatternAccessibility);
  result = (TSDStrokePatternAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDStrokeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pattern")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxStrokeIsEmpty
{
  return -[TSDStrokeAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isNullStroke"));
}

- (NSString)tsaxStrokePatternDescription
{
  if (-[TSDStrokeAccessibility tsaxStrokeIsEmpty](self, "tsaxStrokeIsEmpty"))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("stroke.emptyPattern"));
  else
    return -[TSDStrokePatternAccessibility tsaxDescription](-[TSDStrokeAccessibility tsaxStrokePattern](self, "tsaxStrokePattern"), "tsaxDescription");
}

- (NSString)tsaxStrokeWidthDescription
{
  double v2;
  const __CFString *v3;

  -[TSDStrokeAccessibility _tsaxStrokeWidth](self, "_tsaxStrokeWidth");
  if (v2 <= 1.0)
    v3 = CFSTR("stroke.width.singular %f");
  else
    v3 = CFSTR("stroke.width.plural %f");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v3), *(_QWORD *)&v2);
}

- (NSString)tsaxStrokeColorDescription
{
  return (NSString *)objc_msgSend(-[TSDStrokeAccessibility _tsaxStrokeColor](self, "_tsaxStrokeColor"), "tsaxStyleInfoDescription");
}

- (id)_tsaxStrokeColor
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDStrokeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("color")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (double)_tsaxStrokeWidth
{
  double result;

  -[TSDStrokeAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("width"));
  return result;
}

- (id)accessibilityLabel
{
  id result;

  result = -[TSDStrokeAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityUserDefinedLabel"));
  if (!result)
    return -[TSDStrokeAccessibility tsaxStrokePatternDescription](self, "tsaxStrokePatternDescription");
  return result;
}

@end
