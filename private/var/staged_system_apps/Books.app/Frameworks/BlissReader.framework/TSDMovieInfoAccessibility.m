@implementation TSDMovieInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMovieInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)tsaxMovieLabel
{
  return -[TSPDataAccessibility tsaxLabel](-[TSDMovieInfoAccessibility _tsaxMovieData](self, "_tsaxMovieData"), "tsaxLabel");
}

- (id)tsaxTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("movie"));
}

- (TSPDataAccessibility)_tsaxMovieData
{
  void *v3;
  TSPDataAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSPDataAccessibility);
  result = (TSPDataAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDMovieInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMovieData")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
