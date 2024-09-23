@implementation THWSceneControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWSceneController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THWSceneViewAccessibility)thaxSceneView
{
  void *v3;
  THWSceneViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWSceneViewAccessibility);
  result = (THWSceneViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWSceneControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("sceneView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
