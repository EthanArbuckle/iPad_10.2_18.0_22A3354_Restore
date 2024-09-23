@implementation THDocumentRootAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THDocumentRoot");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THDocumentNavigationModelAccessibility)thaxNavigationModel
{
  void *v3;
  THDocumentNavigationModelAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THDocumentNavigationModelAccessibility);
  result = (THDocumentNavigationModelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentRootAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("navigationModel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxContext
{
  return -[THDocumentRootAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("context"));
}

- (THModelNodeAccessibility)thaxRootNode
{
  void *v3;
  THModelNodeAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THModelNodeAccessibility);
  result = (THModelNodeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentRootAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rootNode")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIsEPUB
{
  return -[THDocumentRootAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isEPUB"));
}

- (THTOCModelAccessibility)thaxTOCModel
{
  void *v3;
  THTOCModelAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTOCModelAccessibility);
  result = (THTOCModelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentRootAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tocModel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
