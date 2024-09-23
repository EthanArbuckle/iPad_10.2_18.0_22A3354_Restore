@implementation THiOSCanvasViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THiOSCanvasViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDiOSCanvasViewControllerAccessibility, a2);
}

- (id)tsaxEditMenuItems
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THiOSCanvasViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("extraMenuItems")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
