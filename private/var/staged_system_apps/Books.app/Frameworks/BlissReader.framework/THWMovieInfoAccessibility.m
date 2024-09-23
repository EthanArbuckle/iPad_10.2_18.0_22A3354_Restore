@implementation THWMovieInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWMovieInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDMovieInfoAccessibility, a2);
}

- (NSString)thaxMediaLabel
{
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  char v7;

  v3 = -[TSDDrawableInfoAccessibility tsaxUserProvidedDescription](self, "tsaxUserProvidedDescription");
  if (!-[NSString length](v3, "length"))
  {
    v7 = 0;
    v4 = (objc_class *)objc_opt_class(NSString);
    v5 = (NSString *)__TSAccessibilityCastAsClass(v4, (uint64_t)-[THWMovieInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mediaDisplayName")), 1, &v7);
    if (v7)
      abort();
    return v5;
  }
  return v3;
}

@end
