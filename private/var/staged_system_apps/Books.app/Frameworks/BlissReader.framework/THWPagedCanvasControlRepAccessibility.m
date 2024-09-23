@implementation THWPagedCanvasControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPagedCanvasControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (THWPagedCanvasControllerAccessibility)thaxPagedCanvasController
{
  void *v3;
  THWPagedCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPagedCanvasControllerAccessibility);
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pagedCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
