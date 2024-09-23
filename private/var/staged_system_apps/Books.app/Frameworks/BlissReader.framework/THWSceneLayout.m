@implementation THWSceneLayout

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWSceneLayout invalidateFrame](self, "invalidateFrame");
}

- (BOOL)isExpanded
{
  unsigned int v3;

  v3 = -[THWWidgetLayoutDelegate widgetLayoutMode:](-[THWSceneLayout delegate](self, "delegate"), "widgetLayoutMode:", self);
  return -[THWSceneLayout delegate](self, "delegate") && v3 == 1;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWSceneLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWSceneLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (void)updateChildrenFromInfo
{
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWSceneLayout;
  -[THWSceneLayout updateChildrenFromInfo](&v6, "updateChildrenFromInfo");
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (!-[THWSceneLayout isExpanded](self, "isExpanded"))
  {
    v4 = objc_msgSend(-[THWSceneLayout info](self, "info"), "placeholderImage");
    v5 = objc_msgSend(-[THWSceneLayout layoutController](self, "layoutController"), "layoutForInfo:", v4);
    if (v5
      || (v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4)) != 0)
    {
      objc_msgSend(v3, "addObject:", v5);
    }
  }
  -[THWSceneLayout setChildren:](self, "setChildren:", v3);
  objc_msgSend(-[THWSceneLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWSceneLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWSceneLayout delegate](self, "delegate"), "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWSceneLayout;
    return -[THWSceneLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
