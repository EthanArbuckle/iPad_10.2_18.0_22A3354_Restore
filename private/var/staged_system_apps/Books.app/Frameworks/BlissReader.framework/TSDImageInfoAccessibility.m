@implementation TSDImageInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDImageInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)tsaxDescription
{
  NSString *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = -[TSDDrawableInfoAccessibility tsaxUserProvidedDescription](self, "tsaxUserProvidedDescription");
  if (!-[NSString length](v3, "length"))
    v3 = -[TSDImageInfoAccessibility _tsaxFriendlyFilename](self, "_tsaxFriendlyFilename");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!-[NSString length](v3, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No usable image description was generated."), v5, v6, v7, v8, v9, v11))abort();
    }
  }
  return v3;
}

- (id)_tsaxFriendlyFilename
{
  return objc_msgSend(-[TSDImageInfoAccessibility _tsaxImageData](self, "_tsaxImageData"), "tsaxFriendlyFilename");
}

- (id)_tsaxImageData
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSPDataAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDImageInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("imageData")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
