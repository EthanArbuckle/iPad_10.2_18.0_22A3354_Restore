@implementation THChapterBrowserInteractiveCanvasController

- (CGRect)visibleBoundsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THChapterBrowserInteractiveCanvasController canvasView](self, "canvasView"), "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)supportsReadingHighlights
{
  return 0;
}

- (BOOL)supportsWritingHighlights
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  uint64_t v4;
  id v5;
  BOOL result;

  v4 = objc_opt_class(UITapGestureRecognizer);
  result = 0;
  if ((objc_opt_isKindOfClass(a3, v4) & 1) != 0)
  {
    v5 = (id)TSWPImmediateSingleTap;
    if (v5 == objc_msgSend(a3, "gestureKind"))
      return 1;
  }
  return result;
}

@end
