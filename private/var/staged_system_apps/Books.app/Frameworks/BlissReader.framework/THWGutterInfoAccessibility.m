@implementation THWGutterInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWGutterInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxAuthorProvidedDescription
{
  void *v3;
  NSString *result;

  v3 = (void *)objc_opt_class(TSDDrawableInfoAccessibility);
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWGutterInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedDrawableToPresent")), 0, 0);
  if (result)
    return (NSString *)-[NSString tsaxUserProvidedDescription](result, "tsaxUserProvidedDescription");
  return result;
}

- (TSWPShapeInfoAccessibility)thaxTitleShape
{
  void *v3;
  TSWPShapeInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPShapeInfoAccessibility);
  result = (TSWPShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWGutterInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("titleShape")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
