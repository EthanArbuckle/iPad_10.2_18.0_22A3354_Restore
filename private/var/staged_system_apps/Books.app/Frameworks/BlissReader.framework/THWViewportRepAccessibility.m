@implementation THWViewportRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return -[THWViewportRepAccessibility thaxEmbeddedScrollView](self, "thaxEmbeddedScrollView") != 0;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v5;
  void *v6;

  v5 = -[THWViewportRepAccessibility thaxEmbeddedScrollView](self, "thaxEmbeddedScrollView");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "addObject:", v5);
    objc_msgSend(v6, "setAccessibilityContainer:", self);
  }
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWViewportRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (id)thaxEmbeddedScrollView
{
  return -[THWScrollableCanvasControllerAccessibility thaxScrollView](-[THWViewportRepAccessibility _thaxScrollableCanvasController](self, "_thaxScrollableCanvasController"), "thaxScrollView");
}

- (THWScrollableCanvasControllerAccessibility)_thaxScrollableCanvasController
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
