@implementation THWInteractiveImageWidgetRepAccessibility

- (BOOL)isAccessibilityElement
{
  return -[THWInteractiveImageWidgetRepAccessibility _thaxWidgetInteractionDisabledOnPage](self, "_thaxWidgetInteractionDisabledOnPage");
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.interactive"));
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.interactive.hint.ios"));
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  THTSDCanvasViewAccessibility *v5;
  THTSDCanvasViewAccessibility *v6;
  objc_super v7;

  v5 = -[THWInteractiveImageWidgetRepAccessibility thaxScrollContentCanvasView](self, "thaxScrollContentCanvasView");
  if (v5)
  {
    v6 = v5;
    -[THTSDCanvasViewAccessibility setAccessibilityElementsHidden:](v5, "setAccessibilityElementsHidden:", 1);
    -[THTSDCanvasViewAccessibility setIsAccessibilityElement:](v6, "setIsAccessibilityElement:", 0);
    -[THTSDCanvasViewAccessibility setAccessibilityTraits:](v6, "setAccessibilityTraits:", UIAccessibilityTraitNone);
  }
  v7.receiver = self;
  v7.super_class = (Class)THWInteractiveImageWidgetRepAccessibility;
  -[TSDRepAccessibility tsaxLoadChildrenIntoCollection:](&v7, "tsaxLoadChildrenIntoCollection:", a3);
}

- (BOOL)thaxShouldHideChildReps
{
  return -[THWInteractiveImageWidgetRepAccessibility _thaxWidgetInteractionDisabledOnPage](self, "_thaxWidgetInteractionDisabledOnPage");
}

- (void)overlayableZoomableCanvasController:(id)a3 didEndZoomingAtScale:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageWidgetRepAccessibility;
  -[THWInteractiveImageWidgetRepAccessibility overlayableZoomableCanvasController:didEndZoomingAtScale:](&v5, "overlayableZoomableCanvasController:didEndZoomingAtScale:", a3, a4);
  -[THTSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](-[THWInteractiveImageWidgetRepAccessibility thaxScrollContainerCanvasView](self, "thaxScrollContainerCanvasView"), "tsaxInvalidateChildrenEventually");
}

- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3
{
  return -[THWInteractiveImageWidgetRepAccessibility _thaxWidgetInteractionDisabledOnPage](self, "_thaxWidgetInteractionDisabledOnPage", a3);
}

- (BOOL)_thaxWidgetInteractionDisabledOnPage
{
  return -[THWInteractiveImageWidgetRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("p_widgetInteractionDisabledOnPage"));
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWInteractiveImageWidgetRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDContainerRepAccessibility, a2);
}

- (void)thaxSelectCallout:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2668D4;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (NSArray)thaxCalloutReps
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("calloutReps")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView
{
  return -[THWOverlayableZoomableCanvasControllerAccessibility thaxScrollContainerCanvasView](-[THWInteractiveImageWidgetRepAccessibility _thaxStageCanvasController](self, "_thaxStageCanvasController"), "thaxScrollContainerCanvasView");
}

- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView
{
  return -[THWOverlayableZoomableCanvasControllerAccessibility thaxScrollContentCanvasView](-[THWInteractiveImageWidgetRepAccessibility _thaxStageCanvasController](self, "_thaxStageCanvasController"), "thaxScrollContentCanvasView");
}

- (id)thaxCalloutInfoForDisplay
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("calloutInfoForDisplay"));
}

- (THWOverlayableZoomableCanvasControllerAccessibility)_thaxStageCanvasController
{
  void *v3;
  THWOverlayableZoomableCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWOverlayableZoomableCanvasControllerAccessibility);
  result = (THWOverlayableZoomableCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("stageCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
