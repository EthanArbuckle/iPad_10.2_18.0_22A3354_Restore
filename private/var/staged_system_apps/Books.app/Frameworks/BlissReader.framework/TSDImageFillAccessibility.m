@implementation TSDImageFillAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDImageFill");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxFillTechniqueDescription
{
  unsigned int v2;

  v2 = -[TSDImageFillAccessibility tsaxFillTechnique](self, "tsaxFillTechnique");
  if (v2 > 4)
    return 0;
  else
    return TSAccessibilityLocalizedString((uint64_t)off_43C0E0[v2]);
}

- (int)tsaxFillTechnique
{
  return -[TSDImageFillAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("technique"));
}

- (TSPDataAccessibility)tsaxImageData
{
  void *v3;
  TSPDataAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSPDataAccessibility);
  result = (TSPDataAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDImageFillAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("imageData")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSUColorAccessibility)tsaxTintColor
{
  void *v3;
  TSUColorAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSUColorAccessibility);
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDImageFillAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tintColor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("image.fill"));
}

@end
