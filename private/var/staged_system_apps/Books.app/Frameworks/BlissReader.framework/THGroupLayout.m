@implementation THGroupLayout

- (BOOL)isExpanded
{
  THWWidgetLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    LOBYTE(delegate) = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1;
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THGroupLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THGroupLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)layoutGeometryForLayout:(id)a3
{
  return 0;
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v4 = a3;
  if (-[THGroupLayout isCompactFlowPresentation](self, "isCompactFlowPresentation", a3, a4))
  {
    v6 = objc_opt_class(THFlowBodyLayout);
    *(_QWORD *)&v8 = TSUDynamicCast(v6, -[THGroupLayout parent](self, "parent")).n128_u64[0];
    if (v7)
    {
      objc_msgSend(v7, "maximumFrameSizeForChild:", self, v8);
      v10 = v9;
      objc_msgSend(-[THGroupLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo"), "frame");
      memset(&v17, 0, sizeof(v17));
      CGAffineTransformMakeScale(&v17, v10 / v11, v10 / v11);
      if (v4)
        objc_msgSend(v4, "transform");
      else
        memset(&t1, 0, sizeof(t1));
      v14 = v17;
      CGAffineTransformConcat(&v16, &t1, &v14);
      v17 = v16;
      v12 = objc_alloc((Class)TSDLayoutGeometry);
      objc_msgSend(v4, "size");
      v16 = v17;
      return objc_msgSend(v12, "initWithSize:transform:", &v16);
    }
  }
  return v4;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  return -[THGroupLayout adjustLayoutGeometry:forLayout:](self, "adjustLayoutGeometry:forLayout:", a3, a5);
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

@end
