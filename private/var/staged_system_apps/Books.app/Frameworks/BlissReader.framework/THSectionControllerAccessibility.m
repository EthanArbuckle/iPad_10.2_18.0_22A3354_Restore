@implementation THSectionControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THSectionController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THPresentationTypeAccessibility)thaxPresentationType
{
  void *v3;
  THPresentationTypeAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THPresentationTypeAccessibility);
  result = (THPresentationTypeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THSectionControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("presentationType")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
