@implementation TSTTableColumnOrRowIndexAccessibilityElement

- (BOOL)tsaxSelect
{
  -[TSTTableRepAccessibility tsaxSelectColumnOrRowForCellID:inDirection:](-[TSTTableColumnOrRowIndexAccessibilityElement tableRep](self, "tableRep"), "tsaxSelectColumnOrRowForCellID:inDirection:", -[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID"), -[TSTTableColumnOrRowIndexAccessibilityElement direction](self, "direction"));
  return 1;
}

- (id)accessibilityLabel
{
  return -[TSTTableRepAccessibility tsaxColumnOrRowNameForCellID:inDirection:withComponents:](-[TSTTableColumnOrRowIndexAccessibilityElement tableRep](self, "tableRep"), "tsaxColumnOrRowNameForCellID:inDirection:withComponents:", -[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID"), -[TSTTableColumnOrRowIndexAccessibilityElement direction](self, "direction"), 1);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableColumnOrRowIndexAccessibilityElement;
  v3 = -[TSTTableColumnOrRowIndexAccessibilityElement accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[TSTTableRepAccessibility tsaxColumnOrRowIsSelectedAtCellID:inDirection:](-[TSTTableColumnOrRowIndexAccessibilityElement tableRep](self, "tableRep"), "tsaxColumnOrRowIsSelectedAtCellID:inDirection:", -[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID"), -[TSTTableColumnOrRowIndexAccessibilityElement direction](self, "direction"));
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

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
  return -[TSDRepAccessibility tsaxCanvas](-[TSTTableColumnOrRowIndexAccessibilityElement tableRep](self, "tableRep"), "tsaxCanvas");
}

- (CGRect)frameInCanvas
{
  TSTTableRepAccessibility *v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v3 = -[TSTTableColumnOrRowIndexAccessibilityElement tableRep](self, "tableRep");
  v4 = -[TSDCanvasAccessibility tsaxCanvasHostingLayer](-[TSDRepAccessibility tsaxCanvas](v3, "tsaxCanvas"), "tsaxCanvasHostingLayer");
  -[TSTTableRepAccessibility tsaxDeviceBoundsForCellRange:](v3, "tsaxDeviceBoundsForCellRange:", -[TSTTableRepAccessibility tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:inDirection:](v3, "tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:inDirection:", -[TSTTableColumnOrRowIndexAccessibilityElement cellID](self, "cellID"), -[TSTTableColumnOrRowIndexAccessibilityElement direction](self, "direction")) | 0x1000100000000);
  -[TSTTableColumnOrRowIndexAccessibilityElement _frameInCanvasWithTableRep:canvasHostingLayer:firstGoodCellFrame:](self, "_frameInCanvasWithTableRep:canvasHostingLayer:firstGoodCellFrame:", v3, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
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

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double x;
  double y;
  double width;
  double height;
  uint64_t vars0;
  CGRect result;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Abstract method"), v6, v7, v8, v9, v10, vars0))abort();
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
