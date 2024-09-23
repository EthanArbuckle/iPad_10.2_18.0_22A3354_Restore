@implementation THWIOSMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWIOSMovieRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (id)childRepsForHitTesting
{
  objc_super v4;

  if (!objc_msgSend((id)objc_opt_class(self), "thaxRepShouldAllowHitTestingOfChildren:", self))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THWIOSMovieRepAccessibility;
  return -[THWIOSMovieRepAccessibility childRepsForHitTesting](&v4, "childRepsForHitTesting");
}

- (BOOL)isAccessibilityElement
{
  return !-[THWIOSMovieRepAccessibility _thaxIsPlaying](self, "_thaxIsPlaying");
}

- (id)accessibilityLabel
{
  NSString *v2;

  v2 = -[THWMovieInfoAccessibility thaxMediaLabel](-[THWIOSMovieRepAccessibility _thaxMovieInfo](self, "_thaxMovieInfo"), "thaxMediaLabel");
  if (-[NSString length](v2, "length"))
    return v2;
  else
    return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.movie.short.roledescription"));
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.stopped.hint.ios"));
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton;
}

- (BOOL)thaxShouldHideChildReps
{
  return !-[THWIOSMovieRepAccessibility _thaxIsPlaying](self, "_thaxIsPlaying");
}

- (BOOL)thaxIsRepPressable
{
  return !-[THWIOSMovieRepAccessibility _thaxIsPlaying](self, "_thaxIsPlaying");
}

- (BOOL)thaxPressRep
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[5];

  if (TSAccessibilityShouldPerformValidationChecks()
    && -[THWIOSMovieRepAccessibility _thaxIsPlaying](self, "_thaxIsPlaying")
    && (ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("The user should not be able to press on this rep while playing."), v4, v5, v6, v7, v8, v10))|| (v11[0] = _NSConcreteStackBlock, v11[1] = 3221225472, v11[2] = sub_26A9A4, v11[3] = &unk_426DD0, v11[4] = self, __TSAccessibilityPerformSafeBlock((uint64_t)v11)))
  {
    abort();
  }
  TSAccessibilityPostLayoutChangedNotification(0);
  return 1;
}

- (THWMovieInfoAccessibility)_thaxMovieInfo
{
  void *v3;
  THWMovieInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWMovieInfoAccessibility);
  result = (THWMovieInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("movieInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)_thaxIsPlaying
{
  return -[THWIOSMovieRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPlaying"));
}

@end
