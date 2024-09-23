@implementation THiOSIntroMediaViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THiOSIntroMediaView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THiOSIntroMediaViewAccessibilityDelegate)thaxDelegate
{
  return (THiOSIntroMediaViewAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_543A23);
}

- (void)thaxSetDelegate:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A23, a3);
}

- (BOOL)accessibilityPerformEscape
{
  THiOSIntroMediaViewAccessibilityDelegate *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = -[THiOSIntroMediaViewAccessibility thaxDelegate](self, "thaxDelegate");
  if (v3)
  {
    -[THiOSIntroMediaViewAccessibilityDelegate thaxIntroMediaViewDidPerformEscapeGesture](-[THiOSIntroMediaViewAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIntroMediaViewDidPerformEscapeGesture");
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No delegate set for the intro media view controller. User won't be able to escape properly."), v5, v6, v7, v8, v9, v11))abort();
  }
  return v3 != 0;
}

@end
