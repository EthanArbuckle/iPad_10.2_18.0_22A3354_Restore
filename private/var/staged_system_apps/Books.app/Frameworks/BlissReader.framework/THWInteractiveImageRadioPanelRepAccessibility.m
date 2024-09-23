@implementation THWInteractiveImageRadioPanelRepAccessibility

- (id)thaxLabelForButtonControlRep:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;

  if (-[THWInteractiveImageRadioPanelRepAccessibility _thaxNextButtonRep](self, "_thaxNextButtonRep") == a3)
  {
    v12 = CFSTR("interactive.image.navigation.next");
    return THAccessibilityLocalizedString((uint64_t)v12);
  }
  if (-[THWInteractiveImageRadioPanelRepAccessibility _thaxPreviousButtonRep](self, "_thaxPreviousButtonRep") == a3)
  {
    v12 = CFSTR("interactive.image.navigation.previous");
    return THAccessibilityLocalizedString((uint64_t)v12);
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("A label for this button control rep was not provided: %@"), v6, v7, v8, v9, v10, (uint64_t)a3))abort();
  }
  return 0;
}

- (id)thaxHintForButtonControlRep:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;

  if (-[THWInteractiveImageRadioPanelRepAccessibility _thaxNextButtonRep](self, "_thaxNextButtonRep") == a3)
  {
    v12 = CFSTR("interactive.image.navigation.next.hint.ios");
    return THAccessibilityLocalizedString((uint64_t)v12);
  }
  if (-[THWInteractiveImageRadioPanelRepAccessibility _thaxPreviousButtonRep](self, "_thaxPreviousButtonRep") == a3)
  {
    v12 = CFSTR("interactive.image.navigation.previous.hint.ios");
    return THAccessibilityLocalizedString((uint64_t)v12);
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("A hint for this button control rep was not provided: %@"), v6, v7, v8, v9, v10, (uint64_t)a3))abort();
  }
  return 0;
}

- (id)_thaxNextButtonRep
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWButtonControlRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_nextButtonRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxPreviousButtonRep
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWButtonControlRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_previousButtonRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWInteractiveImageRadioPanelRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THWControlContainerRepAccessibility, a2);
}

@end
