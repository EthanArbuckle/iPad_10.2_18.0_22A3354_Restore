@implementation THWWebLayout

- (THWWebLayout)initWithInfo:(id)a3
{
  THWWebLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWWebLayout;
  v3 = -[THWWebLayout initWithInfo:](&v5, "initWithInfo:", a3);
  if (v3)
    v3->_playButtonLayout = objc_alloc_init(THWButtonControlLayout);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWWebLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (CGRect)stageFrame
{
  unsigned int v3;
  double v4;
  uint64_t v5;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self);
  if (v3 - 1 < 2)
  {
    x = TSDRectWithSize(objc_msgSend(-[THWWebLayout geometry](self, "geometry"), "size"));
  }
  else if (v3)
  {
    if (v3 == 3)
    {
      objc_msgSend(-[THWWebLayout geometry](self, "geometry"), "size");
      v4 = TSDRectWithSize(-[THWWebLayout p_idealForMaxSize:](self, "p_idealForMaxSize:"));
      TSDRectWithSize(v5);
      x = TSDCenterRectOverRect(v4);
    }
    else
    {
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
    }
  }
  else
  {
    objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "stageGeometry"), "boundsBeforeRotation");
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)stageFrameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THWWebLayout stageFrame](self, "stageFrame");
  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)webFrame
{
  double v3;
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
  CGRect result;

  -[THWWebLayout stageFrame](self, "stageFrame");
  v4 = v3;
  v6 = v5;
  v9 = TSDCenterOfRect(v7, v8, v3, v5);
  -[THWWebLayout webSizeInStageSize:](self, "webSizeInStageSize:", v4, v6);
  v10 = TSDRectWithCenterAndSize(v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)webFrameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THWWebLayout webFrame](self, "webFrame");
  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)webSizeInStageSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(-[THWWebLayout info](self, "info"), "idealWebSize");
  v7 = TSDShrinkSizeToFitInSize(v5, v6, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)idealWebFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[THWWebLayout stageFrame](self, "stageFrame");
  v7 = TSDCenterOfRect(v3, v4, v5, v6);
  objc_msgSend(-[THWWebLayout info](self, "info"), "idealWebSize");
  v8 = TSDRectWithCenterAndSize(v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)idealWebFrameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THWWebLayout idealWebFrame](self, "idealWebFrame");
  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)hidePlayButton
{

  self->_playButtonLayout = 0;
  -[THWWebLayout invalidateChildren](self, "invalidateChildren");
}

- (id)layoutGeometryFromProvider
{
  THWWidgetLayoutDelegate *delegate;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  delegate = self->_delegate;
  if (delegate && -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1)
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v4, v5, v6, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWWebLayout;
    return -[THWWebLayout layoutGeometryFromProvider](&v9, "layoutGeometryFromProvider");
  }
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWWebLayout;
  v3 = objc_msgSend(-[THWWebLayout dependentLayouts](&v5, "dependentLayouts"), "mutableCopy");
  if (!v3)
    v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (self->_playButtonLayout)
    objc_msgSend(v3, "addObject:");
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
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
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWWebLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWWebLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)childrenForLayout
{
  id v3;

  v3 = objc_msgSend(-[THWWebLayout info](self, "info"), "childInfos");
  if (!-[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self)
    && objc_msgSend(-[THWWebLayout info](self, "info"), "adornmentInfo"))
  {
    v3 = objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v3);
  }
  if (!v3)
    v3 = &__NSArray0__struct;
  if (-[THWWebLayout isExpanded](self, "isExpanded")
    || !self->_playButtonLayout
    || (objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "autoplayConfig"), "enabled") & 1) != 0)
  {
    return v3;
  }
  else
  {
    return objc_msgSend(v3, "arrayByAddingObject:", self->_playButtonLayout);
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_playButtonLayout != a3)
    return 0;
  -[THWWebLayout stageFrame](self, "stageFrame");
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v4, v5, v6, v7);
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = TSDScaleSizeWithinSize(objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "stageGeometry"), "boundsBeforeRotation"));
  v4 = TSDRoundedSize(v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  double v4;

  -[THWWebLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (void)setPlayButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

@end
