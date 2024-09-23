@implementation TSDBezierPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDBezierPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  TSDBezierPathAccessibility *v3;

  v3 = -[TSDBezierPathSourceAccessibility _tsaxPath](self, "_tsaxPath");
  -[TSDPathSourceAccessibility tsaxNaturalSize](self, "tsaxNaturalSize");
  return -[TSDBezierPathAccessibility tsaxInferredLabelForSize:](v3, "tsaxInferredLabelForSize:");
}

- (TSDBezierPathAccessibility)_tsaxPath
{
  void *v3;
  TSDBezierPathAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDBezierPathAccessibility);
  result = (TSDBezierPathAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDBezierPathSourceAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mPath")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
