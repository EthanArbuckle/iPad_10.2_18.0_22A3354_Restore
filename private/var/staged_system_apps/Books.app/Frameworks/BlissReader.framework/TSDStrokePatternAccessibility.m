@implementation TSDStrokePatternAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDStrokePattern");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxIsSeparatorStroke
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5438A8);
}

- (void)tsaxSetSeparatorStroke:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5438A8, a3);
}

- (BOOL)tsaxIsDefaultStroke
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5438A9);
}

- (void)tsaxSetDefaultStroke:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5438A9, a3);
}

- (NSString)tsaxDescription
{
  NSString *v3;
  const __CFString *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = (NSString *)objc_msgSend(&off_469B80, "count");
  if (-[TSDStrokePatternAccessibility tsaxIsDefaultStroke](self, "tsaxIsDefaultStroke"))
  {
    v4 = CFSTR("stroke.default");
LABEL_3:
    v3 = TSAccessibilityLocalizedString((uint64_t)v4);
    goto LABEL_4;
  }
  if (-[TSDStrokePatternAccessibility tsaxIsSeparatorStroke](self, "tsaxIsSeparatorStroke"))
  {
    TSAccessibilityShouldPerformValidationChecks();
    return (NSString *)&stru_43D7D8;
  }
  if (v3)
  {
    v12 = 0;
    while (!-[TSDStrokePatternAccessibility isEqual:](self, "isEqual:", objc_msgSend((id)objc_opt_class(self), "tsaxValueForKey:", objc_msgSend(&off_469B80, "objectAtIndexedSubscript:", v12))))
    {
      if (v3 == (NSString *)++v12)
      {
        v3 = 0;
        goto LABEL_4;
      }
    }
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stroke.%@"), objc_msgSend(&off_469B80, "objectAtIndexedSubscript:", v12));
    goto LABEL_3;
  }
LABEL_4:
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No name for stroke was found: %@"), v6, v7, v8, v9, v10, (uint64_t)self))abort();
    return 0;
  }
  return v3;
}

- (int)_tsaxStrokePattern
{
  return -[TSDStrokePatternAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("patternType"));
}

+ (id)tsaxSolidPatternDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("stroke.solidPattern"));
}

@end
