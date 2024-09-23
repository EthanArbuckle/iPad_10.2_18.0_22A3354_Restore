@implementation TSDFillAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDFill");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (int)tsaxFillType
{
  return -[TSDFillAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("fillType"));
}

- (TSUColorAccessibility)tsaxReferenceColor
{
  void *v3;
  TSUColorAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDFillAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("referenceColor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

+ (id)tsaxDescriptionForFill:(id)a3
{
  void *v4;
  Class v5;
  char v7;

  if (!a3 || +[NSNull null](NSNull, "null") == a3)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("fill.none"));
  if ((objc_opt_isKindOfClass(a3, +[TSAccessibilitySafeCategory tsaxTargetClass](TSDFillAccessibility, "tsaxTargetClass")) & 1) == 0)return 0;
  v7 = 0;
  v4 = (void *)objc_opt_class(TSDFillAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)a3, 1, &v7);
  if (v7)
    abort();
  return -[objc_class tsaxStyleInfoDescription](v5, "tsaxStyleInfoDescription");
}

- (NSString)tsaxStyleInfoDescription
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v4 = objc_opt_class(self);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("-[TSDFillAccessibility tsaxStyleInfoDescription] is abstract. Please implement tsaxStyleInfoDescription in %@."), v5, v6, v7, v8, v9, v4))abort();
  }
  return 0;
}

@end
