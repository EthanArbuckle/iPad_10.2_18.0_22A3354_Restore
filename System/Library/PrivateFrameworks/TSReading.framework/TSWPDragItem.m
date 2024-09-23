@implementation TSWPDragItem

- (TSWPDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSWPDragItem *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPDragItem;
  v9 = -[TSWPDragItem init](&v11, sel_init);
  if (v9)
  {
    v9->_targetedDragPreview = (UITargetedDragPreview *)a3;
    v9->_canvasRect.origin.x = x;
    v9->_canvasRect.origin.y = y;
    v9->_canvasRect.size.width = width;
    v9->_canvasRect.size.height = height;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPDragItem;
  -[TSWPDragItem dealloc](&v3, sel_dealloc);
}

- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  CGAffineTransform v21;
  CGAffineTransform v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  memset(&v22, 0, sizeof(v22));
  objc_msgSend(a4, "viewScale");
  v14 = v13;
  objc_msgSend(a4, "viewScale");
  CGAffineTransformMakeScale(&v22, v14, v15);
  v16 = objc_alloc(MEMORY[0x24BDF6A00]);
  v17 = TSDCenterOfRect(x, y, width, height);
  v21 = v22;
  v18 = (void *)objc_msgSend(v16, "initWithContainer:center:transform:", a5, &v21, v17);
  v19 = (void *)objc_msgSend(a3, "retargetedPreviewWithTarget:", v18);

  return v19;
}

- (UITargetedDragPreview)targetedDragPreview
{
  return self->_targetedDragPreview;
}

- (CGRect)canvasRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_canvasRect.origin.x;
  y = self->_canvasRect.origin.y;
  width = self->_canvasRect.size.width;
  height = self->_canvasRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
