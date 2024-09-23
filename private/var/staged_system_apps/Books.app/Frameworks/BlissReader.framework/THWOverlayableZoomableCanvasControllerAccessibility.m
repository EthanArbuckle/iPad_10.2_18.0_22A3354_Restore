@implementation THWOverlayableZoomableCanvasControllerAccessibility

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  _BOOL4 IsNull;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29[10];
  uint64_t v30;
  double *v31;
  uint64_t v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  CGRect v37;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)THWOverlayableZoomableCanvasControllerAccessibility;
  -[THWOverlayableZoomableCanvasControllerAccessibility interactiveCanvasController:expandBoundsForHitTesting:](&v36, "interactiveCanvasController:expandBoundsForHitTesting:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (UIAccessibilityIsVoiceOverRunning()
    && -[THWOverlayableZoomableCanvasControllerAccessibility thaxScrollContainerICC](self, "thaxScrollContainerICC") == a3)
  {
    v37.origin.x = v11;
    v37.origin.y = v13;
    v37.size.width = v15;
    v37.size.height = v17;
    IsNull = CGRectIsNull(v37);
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (!IsNull)
      {
        ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("This class no longer sets the bounds to CGRectNull if the ICC is the scroll container ICC. We probably need to update this logic."), v20, v21, v22, v23, v24, v29[0]))abort();
      }
    }
    if (IsNull)
    {
      v30 = 0;
      v31 = (double *)&v30;
      v32 = 0x4010000000;
      v33 = "";
      v34 = 0u;
      v35 = 0u;
      v29[0] = (uint64_t)_NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = (uint64_t)sub_257654;
      v29[3] = (uint64_t)&unk_43B958;
      v29[4] = (uint64_t)self;
      v29[5] = (uint64_t)&v30;
      *(CGFloat *)&v29[6] = x;
      *(CGFloat *)&v29[7] = y;
      *(CGFloat *)&v29[8] = width;
      *(CGFloat *)&v29[9] = height;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v29))
        abort();
      v11 = v31[4];
      v13 = v31[5];
      v15 = v31[6];
      v17 = v31[7];
      _Block_object_dispose(&v30, 8);
    }
  }
  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3
{
  if (objc_msgSend(-[THWOverlayableZoomableCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"), "conformsToProtocol:", &OBJC_PROTOCOL___THWOverlayableZoomableCanvasControllerAccessibilityDelegate)&& (objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxShouldIgnoreCanvasForICC:") & 1) != 0)
  {
    return objc_msgSend(-[THWOverlayableZoomableCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxShouldIgnoreCanvasForICC:", a3);
  }
  else
  {
    return 0;
  }
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWOverlayableZoomableCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView
{
  return -[THTSDInteractiveCanvasControllerAccessibility thaxCanvasView](-[THWOverlayableZoomableCanvasControllerAccessibility thaxScrollContainerICC](self, "thaxScrollContainerICC"), "thaxCanvasView");
}

- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView
{
  return -[THTSDInteractiveCanvasControllerAccessibility thaxCanvasView](-[THWOverlayableZoomableCanvasControllerAccessibility thaxScrollContentICC](self, "thaxScrollContentICC"), "thaxCanvasView");
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContainerICC
{
  void *v3;
  THTSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility);
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWOverlayableZoomableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrollContainerICC")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContentICC
{
  void *v3;
  THTSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility);
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWOverlayableZoomableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrollContentICC")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxDelegate
{
  return -[THWOverlayableZoomableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

@end
