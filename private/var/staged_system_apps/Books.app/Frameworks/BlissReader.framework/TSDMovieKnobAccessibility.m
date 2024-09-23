@implementation TSDMovieKnobAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMovieKnob");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDKnobAccessibility, a2);
}

- (TSDMovieRepAccessibility)tsaxParentRepForKnob
{
  void *v3;
  TSDRepAccessibility *v4;
  TSDMovieRepAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(TSDMovieRepAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieKnobAccessibility;
  v4 = -[TSDKnobAccessibility tsaxParentRepForKnob](&v6, "tsaxParentRepForKnob");
  result = (TSDMovieRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (id)tsaxLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("play.movie"));
}

@end
