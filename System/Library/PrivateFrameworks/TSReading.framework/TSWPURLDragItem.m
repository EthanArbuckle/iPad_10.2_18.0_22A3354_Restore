@implementation TSWPURLDragItem

- (TSWPURLDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4 canvasDragPoint:(CGPoint)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  CGFloat y;
  CGFloat x;
  TSWPURLDragItem *result;
  objc_super v11;

  length = a6.length;
  location = a6.location;
  y = a5.y;
  x = a5.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPURLDragItem;
  result = -[TSWPDragItem initWithDragPreview:canvasRect:](&v11, sel_initWithDragPreview_canvasRect_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
  {
    result->_canvasDragPoint.x = x;
    result->_canvasDragPoint.y = y;
    result->_range.location = location;
    result->_range.length = length;
  }
  return result;
}

- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6
{
  id result;
  id v9;
  uint64_t v10;
  uint64_t v11;
  TSWPSelection *v12;

  objc_opt_class();
  -[TSWPURLDragItem canvasDragPoint](self, "canvasDragPoint");
  objc_msgSend(a4, "hitRep:");
  result = (id)TSUDynamicCast();
  if (result)
  {
    v9 = result;
    v10 = -[TSWPURLDragItem range](self, "range");
    v12 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v10, v11);
    return +[TSWPEditingController _targetedDragPreviewForSelection:interactiveCanvasController:reps:applyScale:imageFrameUnion:](TSWPEditingController, "_targetedDragPreviewForSelection:interactiveCanvasController:reps:applyScale:imageFrameUnion:", v12, a4, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9), 1, 0);
  }
  return result;
}

- (CGPoint)canvasDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_canvasDragPoint.x;
  y = self->_canvasDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
