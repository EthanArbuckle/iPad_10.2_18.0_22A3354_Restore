@implementation TSDDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDDrawableInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxUserProvidedDescription
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDDrawableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityDescription")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxComment
{
  return -[TSDDrawableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("comment"));
}

- (NSString)tsaxTypeDescription
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("object"));
}

- (TSDInfoGeometryAccessibility)tsaxGeometry
{
  void *v3;
  TSDInfoGeometryAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInfoGeometryAccessibility);
  result = (TSDInfoGeometryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDDrawableInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("geometry")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
