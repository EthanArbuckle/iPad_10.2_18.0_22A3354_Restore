@implementation THWAdornmentPanelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAdornmentPanel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxView
{
  return -[THWAdornmentPanelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view"));
}

- (TSDCanvasViewAccessibility)thaxCanvasView
{
  void *v3;
  TSDCanvasViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDCanvasViewAccessibility);
  result = (TSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[THWAdornmentPanelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("autosizedCanvasController")), "tsaxValueForKey:", CFSTR("canvasView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
