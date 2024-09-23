@implementation TSDAudioRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDAudioRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSString)tsaxLabel
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = -[TSDMovieInfoAccessibility tsaxMovieLabel](-[TSDAudioRepAccessibility _tsaxMovieInfo](self, "_tsaxMovieInfo"), "tsaxMovieLabel");
  if (-[NSString length](v4, "length"))
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("audio.with.name %@")), v4);
  else
    v5 = TSAccessibilityLocalizedString((uint64_t)CFSTR("audio"));
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("audio"));
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (TSKAVPlayerControllerAccessibility)tsaxPlayerController
{
  void *v3;
  TSKAVPlayerControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKAVPlayerControllerAccessibility);
  result = (TSKAVPlayerControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("playerController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDMovieInfoAccessibility)_tsaxMovieInfo
{
  void *v3;
  TSDMovieInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDMovieInfoAccessibility);
  result = (TSDMovieInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("movieInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
