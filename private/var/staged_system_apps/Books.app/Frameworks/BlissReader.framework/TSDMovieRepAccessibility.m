@implementation TSDMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMovieRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (void)tsaxPlayMovie
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_230E38;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)tsaxTogglePlayback
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_230E98;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (NSString)tsaxMovieLabel
{
  NSString *v3;
  id v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = objc_msgSend(-[TSDMovieRepAccessibility _tsaxMovieInfo](self, "_tsaxMovieInfo"), "tsaxMovieLabel");
  if (objc_msgSend(v4, "length"))
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("movie.with.name %@")), v4);
  else
    v5 = TSAccessibilityLocalizedString((uint64_t)CFSTR("movie"));
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (BOOL)tsaxIsPlayable
{
  return -[TSDMovieRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPlayable"));
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("movie"));
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

- (id)_tsaxMovieInfo
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDMovieInfoAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("movieInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("movie.double.tap.to.play.iOS"));
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDMovieRepAccessibility;
  if (-[TSDRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction"))
    return 1;
  else
    return -[TSDMovieRepAccessibility tsaxIsPlayable](self, "tsaxIsPlayable");
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if (-[TSDRepAccessibility tsaxIsSelected](-[TSDRepAccessibility tsaxRepForSelecting](self, "tsaxRepForSelecting"), "tsaxIsSelected")&& -[TSDMovieRepAccessibility tsaxIsPlayable](self, "tsaxIsPlayable"))
  {
    -[TSDMovieRepAccessibility tsaxTogglePlayback](self, "tsaxTogglePlayback");
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDMovieRepAccessibility;
    return -[TSDRepAccessibility accessibilityActivate](&v4, "accessibilityActivate");
  }
}

@end
