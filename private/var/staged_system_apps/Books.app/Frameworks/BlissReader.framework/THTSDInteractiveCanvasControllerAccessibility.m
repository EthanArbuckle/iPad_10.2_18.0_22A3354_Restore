@implementation THTSDInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDInteractiveCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDInteractiveCanvasControllerAccessibility, a2);
}

- (THTSDCanvasViewAccessibility)thaxCanvasView
{
  void *v3;
  THTSDCanvasViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDCanvasViewAccessibility);
  result = (THTSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THTSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)_thaxShouldSwapHitRepsForDuplicatesInGroupWidgets
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A3C);
}

- (void)_thaxSetShouldSwapHitRepsForDuplicatesInGroupWidgets:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A3C, a3);
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  void *v3;

  v3 = (void *)objc_opt_class(THDocumentViewControllerAccessibility);
  return (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THTSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate")), 0, 0);
}

- (BOOL)thaxIsMostOuterICC
{
  return -[THTSDInteractiveCanvasControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController") != 0;
}

- (id)tsaxActionMenuItemsForRep:(id)a3
{
  return 0;
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBounds:(id)a3
{
  id v4;

  v4 = -[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](self, "tsaxDelegate", a3);
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate)&& (objc_opt_respondsToSelector(v4, "thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:") & 1) != 0)
  {
    return objc_msgSend(v4, "thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:", self);
  }
  else
  {
    return 0;
  }
}

- (BOOL)thaxShouldFilterOutNonVisibleReps
{
  id v3;

  v3 = -[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](self, "tsaxDelegate");
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate)&& (objc_opt_respondsToSelector(v3, "thaxShouldFilterOutNonVisibleRepsForICC:") & 1) != 0)
  {
    return objc_msgSend(v3, "thaxShouldFilterOutNonVisibleRepsForICC:", self);
  }
  else
  {
    return 0;
  }
}

- (BOOL)thaxShouldIgnoreCanvas
{
  id v3;

  v3 = -[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](self, "tsaxDelegate");
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate)&& (objc_opt_respondsToSelector(v3, "thaxShouldIgnoreCanvasForICC:") & 1) != 0)
  {
    return objc_msgSend(v3, "thaxShouldIgnoreCanvasForICC:", self);
  }
  else
  {
    return 0;
  }
}

@end
