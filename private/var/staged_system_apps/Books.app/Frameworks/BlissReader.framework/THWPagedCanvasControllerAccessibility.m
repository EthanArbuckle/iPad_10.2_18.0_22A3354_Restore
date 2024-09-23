@implementation THWPagedCanvasControllerAccessibility

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPagedCanvasControllerAccessibility;
  -[THWPagedCanvasControllerAccessibility interactiveCanvasControllerDidStopScrolling:](&v5, "interactiveCanvasControllerDidStopScrolling:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_267C50;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 1.0);
}

- (void)thaxInitializeAccessibility
{
  if (objc_msgSend(-[THWPagedCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"), "conformsToProtocol:", &OBJC_PROTOCOL___THUIScrollViewAccessibilityDelegate))objc_msgSend(-[THWPagedCanvasControllerAccessibility _thaxScrollView](self, "_thaxScrollView"), "thaxSetScrollingDelegate:", -[THWPagedCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"));
}

- (void)thaxTeardownAccessibility
{
  objc_msgSend(-[THWPagedCanvasControllerAccessibility _thaxScrollView](self, "_thaxScrollView"), "thaxSetScrollingDelegate:", 0);
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

- (id)_thaxScrollView
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THUIScrollViewAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWPagedCanvasControllerAccessibility thaxScrollView](self, "thaxScrollView"), 1, &v5);
  if (v5)
    abort();
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPagedCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxScrollView
{
  return -[THWPagedCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrollView"));
}

- (id)thaxDelegate
{
  return -[THWPagedCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

- (THTSDCanvasViewAccessibility)thaxCanvasView
{
  return -[THTSDInteractiveCanvasControllerAccessibility thaxCanvasView](-[THWPagedCanvasControllerAccessibility thaxInteractiveCanvasController](self, "thaxInteractiveCanvasController"), "thaxCanvasView");
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController
{
  void *v3;
  THTSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility);
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWPagedCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPagedCanvasControllerAccessibility;
  v5 = -[THWPagedCanvasControllerAccessibility createViewIfNeededWithFrame:viewScale:](&v7, "createViewIfNeededWithFrame:viewScale:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  if (-[THWPagedCanvasControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxInitializeAccessibility", &OBJC_PROTOCOL___THWPagedCanvasControllerAccessibilityExtras))-[THWPagedCanvasControllerAccessibility thaxInitializeAccessibility](self, "thaxInitializeAccessibility");
  return v5;
}

- (void)teardownView
{
  objc_super v3;

  if (-[THWPagedCanvasControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxTeardownAccessibility", &OBJC_PROTOCOL___THWPagedCanvasControllerAccessibilityExtras))-[THWPagedCanvasControllerAccessibility thaxTeardownAccessibility](self, "thaxTeardownAccessibility");
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControllerAccessibility;
  -[THWPagedCanvasControllerAccessibility teardownView](&v3, "teardownView");
}

@end
