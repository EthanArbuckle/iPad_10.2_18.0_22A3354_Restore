@implementation TSTTableStylePresetAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableStylePreset");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxPresetDescription
{
  unint64_t v2;
  uint64_t v3;
  NSString *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[TSTTableStylePresetAccessibility _tsaxPresetIndex](self, "_tsaxPresetIndex");
  v3 = v2;
  if (v2 > 5)
    v4 = 0;
  else
    v4 = TSAccessibilityLocalizedString((uint64_t)off_43BE80[v2]);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!v4)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Preset label not provided for index: %lu"), v6, v7, v8, v9, v10, v3))abort();
    }
  }
  return v4;
}

- (unint64_t)_tsaxPresetIndex
{
  return (unint64_t)-[TSTTableStylePresetAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("index"));
}

@end
