@implementation TSDShapeInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)tsaxShapeStyleName
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSSStyleAccessibility tsaxName](-[TSDShapeInfoAccessibility _tsaxShapeStyle](self, "_tsaxShapeStyle"), "tsaxName"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDPathSourceAccessibility)tsaxPathSource
{
  void *v3;
  TSDPathSourceAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDPathSourceAccessibility);
  result = (TSDPathSourceAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDShapeInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pathSource")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)tsaxShapeTypeDescription
{
  return -[TSDPathSourceAccessibility tsaxLabel](-[TSDShapeInfoAccessibility tsaxPathSource](self, "tsaxPathSource"), "tsaxLabel");
}

- (TSDShapeStyleAccessibility)_tsaxShapeStyle
{
  void *v3;
  TSDShapeStyleAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDShapeStyleAccessibility);
  result = (TSDShapeStyleAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDShapeInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shapeStyle")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
