@implementation CRLCanvasHostedAccessibilityElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CRLCanvasAccessibility)parentCanvas
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v3, v4, v5, v6, v7, vars0))abort();
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

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v3, v4, v5, v6, v7, vars0))abort();
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
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHostedAccessibilityElement parentCanvas](self, "parentCanvas"));
  -[CRLCanvasHostedAccessibilityElement frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  objc_msgSend(v3, "crlaxScreenFrameFromUnscaledCanvas:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
