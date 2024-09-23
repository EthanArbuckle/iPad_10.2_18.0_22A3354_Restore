@implementation TSDCanvasHostedAccessibilityElement

- (TSDCanvasAccessibility)parentCanvas
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v3, v4, v5, v6, v7, vars0))abort();
  }
  return 0;
}

- (CGRect)frameInUnscaledCanvas
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double x;
  double y;
  double width;
  double height;
  uint64_t vars0;
  CGRect result;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v3, v4, v5, v6, v7, vars0))abort();
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)frame
{
  TSDCanvasAccessibility *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[TSDCanvasHostedAccessibilityElement parentCanvas](self, "parentCanvas");
  -[TSDCanvasHostedAccessibilityElement frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  -[TSDCanvasAccessibility tsaxScreenFrameFromUnscaledCanvas:](v3, "tsaxScreenFrameFromUnscaledCanvas:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end
