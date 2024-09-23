@implementation THWViewportLayout

- (THWViewportLayout)initWithInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWViewportLayout;
  return -[THWViewportLayout initWithInfo:](&v4, "initWithInfo:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[THWViewportLayout setScrollableCanvasControlLayout:](self, "setScrollableCanvasControlLayout:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWViewportLayout;
  -[THWViewportLayout dealloc](&v3, "dealloc");
}

- (void)p_invalidateExternal
{
  -[THWViewportLayout invalidateFrame](self, "invalidateFrame");
  -[THWViewportLayout invalidateChildren](self, "invalidateChildren");
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWViewportLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWViewportLayout;
  -[THWViewportLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWViewportLayout p_invalidateExternal](self, "p_invalidateExternal");
}

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
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWViewportLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWViewportLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWViewportLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWViewportLayout delegate](self, "delegate"), "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWViewportLayout;
    return -[THWViewportLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (void)updateChildrenFromInfo
{
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWViewportLayout;
  -[THWViewportLayout updateChildrenFromInfo](&v6, "updateChildrenFromInfo");
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (!-[THWViewportLayout scrollableCanvasControlLayout](self, "scrollableCanvasControlLayout"))
    -[THWViewportLayout setScrollableCanvasControlLayout:](self, "setScrollableCanvasControlLayout:", objc_alloc_init(THWScrollableCanvasControlLayout));
  objc_msgSend(v3, "addObject:", -[THWViewportLayout scrollableCanvasControlLayout](self, "scrollableCanvasControlLayout"));
  if (!-[THWViewportLayout isExpanded](self, "isExpanded"))
  {
    v4 = objc_msgSend(-[THWViewportLayout info](self, "info"), "backgroundShape");
    v5 = objc_msgSend(-[THWViewportLayout layoutController](self, "layoutController"), "layoutForInfo:", v4);
    if (v5
      || (v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(objc_msgSend(-[THWViewportLayout info](self, "info"), "backgroundShape"), "layoutClass")), "initWithInfo:", v4)) != 0)
    {
      objc_msgSend(v3, "addObject:", v5);
    }
  }
  -[THWViewportLayout setChildren:](self, "setChildren:", v3);
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = TSDRectWithSize(objc_msgSend(-[THWViewportLayout geometry](self, "geometry"), "frame"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[THWViewportLayout scrollableCanvasControlLayout](self, "scrollableCanvasControlLayout") == a3
    || objc_msgSend(-[THWViewportLayout layoutController](self, "layoutController"), "layoutForInfo:", objc_msgSend(-[THWViewportLayout info](self, "info"), "backgroundShape")) == a3)
  {
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v5, v7, v9, v11);
  }
  else
  {
    return 0;
  }
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWScrollableCanvasControlLayout)scrollableCanvasControlLayout
{
  return self->_scrollableCanvasControlLayout;
}

- (void)setScrollableCanvasControlLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

@end
