@implementation TSTTableColumnOrRowAccessibilityElement

- (TSTTableRepAccessibility)tableRep
{
  void *v3;
  TSTTableRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTTableRepAccessibility);
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)self->_tableRep, 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)parentCanvas
{
  return -[TSDRepAccessibility tsaxCanvas](-[TSTTableColumnOrRowAccessibilityElement tableRep](self, "tableRep"), "tsaxCanvas");
}

- (CGRect)frameInCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSTTableColumnOrRowAccessibilityElement _frameInCanvasWithTableRep:](self, "_frameInCanvasWithTableRep:", -[TSTTableColumnOrRowAccessibilityElement tableRep](self, "tableRep"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)direction
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

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double x;
  double y;
  double width;
  double height;
  uint64_t vars0;
  CGRect result;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v4, v5, v6, v7, v8, vars0))abort();
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

- (void)setTableRep:(id)a3
{
  self->_tableRep = (TSTTableRepAccessibility *)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (void)_setCellID:(id)a3
{
  self->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

@end
