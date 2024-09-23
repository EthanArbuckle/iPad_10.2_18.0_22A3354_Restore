@implementation THWScrollableCanvasControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWScrollableCanvasControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (THWScrollableCanvasControllerAccessibility)thaxScrollableCanvasController
{
  void *v3;
  THWScrollableCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWScrollableCanvasControllerAccessibility);
  result = (THWScrollableCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrollableCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
