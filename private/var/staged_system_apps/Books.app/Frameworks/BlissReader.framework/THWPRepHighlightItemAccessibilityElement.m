@implementation THWPRepHighlightItemAccessibilityElement

- (id)highlight
{
  TSDCanvasViewAccessibility *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = -[TSDRepAccessibility tsaxCanvasView](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "tsaxCanvasView");
  -[THWPRepHighlightItemAccessibilityElement accessibilityActivationPoint](self, "accessibilityActivationPoint");
  -[TSDCanvasViewAccessibility convertPoint:fromView:](v3, "convertPoint:fromView:", 0);
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "tsaxInteractiveCanvasController"), "tsaxConvertBoundsToUnscaledPoint:", v4, v5);
  return -[THWPHighlightControllerAccessibility thaxHighlightAtCanvasPoint:](-[THWPRepAccessibility thaxHighlightController](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "thaxHighlightController"), "thaxHighlightAtCanvasPoint:", v6, v7);
}

- (BOOL)accessibilityActivate
{
  id v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = -[THWPRepHighlightItemAccessibilityElement highlight](self, "highlight");
  if (v3)
  {
    -[THWPHighlightControllerAccessibility thaxShowEditorForHighlight:](-[THWPRepAccessibility thaxHighlightController](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "thaxHighlightController"), "thaxShowEditorForHighlight:", v3);
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Could not perform AX activate on highlight item, falling back to tap"), v5, v6, v7, v8, v9, v11))abort();
  }
  return v3 != 0;
}

@end
