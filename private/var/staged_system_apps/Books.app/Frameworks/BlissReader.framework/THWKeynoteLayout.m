@implementation THWKeynoteLayout

- (THWKeynoteLayout)initWithInfo:(id)a3
{
  THWKeynoteLayout *v3;
  THWKeynoteLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWKeynoteLayout;
  v3 = -[THWKeynoteLayout initWithInfo:](&v6, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](v3, "info"), "showInfo"), "sourceURL"))
    {
      v4->_playButtonLayout = objc_alloc_init(THWButtonControlLayout);
      if (objc_msgSend(-[THWKeynoteLayout info](v4, "info"), "showTransportControls"))
        v4->_transportControlLayout = objc_alloc_init(THWTransportControlLayout);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (BOOL)p_autoplayEnabled
{
  return objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](self, "info"), "autoplayConfig"), "enabled");
}

- (BOOL)isCompact
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;

  v3 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWKeynoteLayout layoutController](self, "layoutController"), "canvas"), "canvasController")).n128_u64[0];
  if (v4)
  {
    v6 = v4;
    if ((objc_msgSend(v4, "isCompactWidth", v5) & 1) != 0)
      LOBYTE(v4) = 1;
    else
      LOBYTE(v4) = objc_msgSend(v6, "isCompactHeight");
  }
  return (char)v4;
}

- (BOOL)p_shouldShowPlayButton
{
  _BOOL4 playButtonHidden;
  BOOL v4;
  BOOL v5;

  playButtonHidden = self->_playButtonHidden;
  v4 = !self->_playButtonHidden;
  if (-[THWKeynoteLayout p_autoplayEnabled](self, "p_autoplayEnabled"))
  {
    v5 = -[THWKeynoteLayout isCompact](self, "isCompact");
    return !playButtonHidden && v5;
  }
  return v4;
}

- (THWKeynoteShowLayout)showLayout
{
  THWKeynoteShowLayout *result;

  result = (THWKeynoteShowLayout *)objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo");
  if (result)
    return (THWKeynoteShowLayout *)objc_msgSend(-[THWKeynoteLayout layoutController](self, "layoutController"), "layoutForInfo:", objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"));
  return result;
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (THWTransportControlLayout)transportControlLayout
{
  return self->_transportControlLayout;
}

- (void)hidePlayButton
{
  self->_playButtonHidden = 1;
  -[THWKeynoteLayout invalidateChildren](self, "invalidateChildren");
}

- (void)showPlayButton
{
  self->_playButtonHidden = 0;
  -[THWKeynoteLayout invalidateChildren](self, "invalidateChildren");
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWKeynoteLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWKeynoteLayout;
    return -[THWKeynoteLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (id)dependentLayouts
{
  id v3;
  THWKeynoteShowLayout *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[THWKeynoteLayout showLayout](self, "showLayout");
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  if (-[THWKeynoteLayout p_shouldShowPlayButton](self, "p_shouldShowPlayButton") && self->_playButtonLayout)
    objc_msgSend(v3, "addObject:");
  if (self->_transportControlLayout)
    objc_msgSend(v3, "addObject:");
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)childInfosForLayout
{
  NSArray *v3;
  NSArray *v4;

  if (objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"))
    v3 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"));
  else
    v3 = +[NSArray array](NSArray, "array");
  v4 = v3;
  if (-[THWKeynoteLayout p_isExpanded](self, "p_isExpanded")
    || !objc_msgSend(-[THWKeynoteLayout info](self, "info"), "adornmentInfo"))
  {
    return v4;
  }
  else
  {
    return objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v4);
  }
}

- (id)additionalLayouts
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (!-[THWKeynoteLayout p_isExpanded](self, "p_isExpanded"))
  {
    if (-[THWKeynoteLayout p_shouldShowPlayButton](self, "p_shouldShowPlayButton") && self->_playButtonLayout)
      objc_msgSend(v3, "addObject:");
    if (self->_transportControlLayout)
      objc_msgSend(v3, "addObject:");
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWKeynoteLayout invalidateFrame](self, "invalidateFrame");
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWKeynoteLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWKeynoteLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  if (!objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"))
    return 0;
  v5 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithInfoGeometry:", objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"), "geometry"));
  if (-[THWKeynoteLayout p_isExpanded](self, "p_isExpanded"))
  {
    -[THWKeynoteShowLayout showSize](-[THWKeynoteLayout showLayout](self, "showLayout"), "showSize");
    TSDScaleSizeWithinSize(objc_msgSend(-[THWKeynoteLayout geometry](self, "geometry"), "frame"));
    objc_msgSend(-[THWKeynoteLayout geometry](self, "geometry"), "frame");
    v10 = TSDCenterOfRect(v6, v7, v8, v9);
    v11 = TSDRectWithCenterAndSize(v10);
    v5 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v11, v12, v13, v14);
  }
  if (-[THWKeynoteLayout showLayout](self, "showLayout") == a3 || self->_playButtonLayout == a3)
    return v5;
  if (self->_transportControlLayout != a3)
    return 0;
  objc_msgSend(v5, "frame");
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v16.origin.x, CGRectGetMaxY(v16), v16.size.width, 30.0);
}

- (BOOL)p_isExpanded
{
  THWWidgetLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    LOBYTE(delegate) = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1;
  return (char)delegate;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setPlayButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void)setTransportControlLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (BOOL)playButtonHidden
{
  return self->_playButtonHidden;
}

- (void)setPlayButtonHidden:(BOOL)a3
{
  self->_playButtonHidden = a3;
}

@end
