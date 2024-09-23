@implementation THWMovieLayout

- (void)dealloc
{
  objc_super v3;

  -[THWMovieLayout setMediaListener:](self, "setMediaListener:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWMovieLayout;
  -[THWMovieLayout dealloc](&v3, "dealloc");
}

- (BOOL)usesTransportController
{
  return 1;
}

- (void)wasRemovedFromLayoutController:(id)a3
{
  -[THWAVMediaListener mediaWillBeRemoved](-[THWMovieLayout mediaListener](self, "mediaListener", a3), "mediaWillBeRemoved");
}

- (BOOL)isIntroMedia
{
  unsigned int v3;

  v3 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self);
  return self->_delegate && v3 == 2;
}

- (double)aspectRatio
{
  double v2;
  double v3;

  objc_msgSend(-[THWMovieLayout geometry](self, "geometry"), "size");
  return v2 / v3;
}

- (BOOL)isExpanded
{
  unsigned int v3;
  BOOL v4;

  v3 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self) - 1;
  if (self->_delegate)
    v4 = v3 >= 2;
  else
    v4 = 1;
  return !v4;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWMovieLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWMovieLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  objc_super v10;

  if (-[THWMovieLayout isExpanded](self, "isExpanded") || -[THWMovieLayout isIntroMedia](self, "isIntroMedia"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWMovieLayout delegate](self, "delegate"), "widgetLayoutBounds");
    v7 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THWMovieLayout;
    v7 = -[THWMovieLayout layoutGeometryFromProvider](&v10, "layoutGeometryFromProvider");
  }
  v8 = v7;
  if (-[THWMovieLayout usesTransportController](self, "usesTransportController")
    && !-[THWMovieLayout mediaListener](self, "mediaListener"))
  {
    +[THWAVTransportController createTransportControllerForLayouts:](THWAVTransportController, "createTransportControllerForLayouts:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self));
  }
  return v8;
}

- (BOOL)p_isAutoplayAllowed
{
  if ((objc_opt_respondsToSelector(self->_delegate, "widgetLayoutIsCompact:") & 1) != 0
    && -[THWWidgetLayoutDelegate widgetLayoutIsCompact:](-[THWMovieLayout delegate](self, "delegate"), "widgetLayoutIsCompact:", self))
  {
    return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](self->_delegate, "widgetLayoutIsReflowablePresentation:", self);
  }
  else
  {
    return 1;
  }
}

- (void)updateChildrenFromInfo
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  THWButtonControlLayout *v7;

  v3 = objc_opt_class(THWMovieInfo);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWMovieLayout info](self, "info")).n128_u64[0];
  v6 = v5;
  if (-[THWMovieLayout usesTransportControllerControls](self, "usesTransportControllerControls", v4))
  {
    if (!-[THWMovieLayout isExpanded](self, "isExpanded") && !-[THWMovieLayout isIntroMedia](self, "isIntroMedia"))
    {
      -[THWMovieLayout setChildren:](self, "setChildren:", +[THWAVTransportController transportControllerLayoutsForLayouts:](THWAVTransportController, "transportControllerLayoutsForLayouts:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self)));
      -[THWMovieLayout invalidate](self, "invalidate");
    }
  }
  else if (!v6
         || !objc_msgSend(v6, "autoplayConfig")
         || !objc_msgSend(objc_msgSend(v6, "autoplayConfig"), "enabled")
         || !-[THWMovieLayout p_isAutoplayAllowed](self, "p_isAutoplayAllowed"))
  {
    v7 = -[THWControlLayout initWithTag:]([THWButtonControlLayout alloc], "initWithTag:", 1000);
    -[THWButtonControlLayout invalidateFrame](v7, "invalidateFrame");
    -[THWMovieLayout setChildren:](self, "setChildren:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v7));

  }
}

- (id)layoutForPlayButton
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = TSDRectWithSize(objc_msgSend(-[THWMovieLayout geometry](self, "geometry"), "size"));
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v2 + (v3 + -86.0) * 0.5, v5 + (v4 + -86.0) * 0.5, 86.0, 86.0);
}

- (id)layoutGeometryForLayout:(id)a3
{
  id result;

  result = (id)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (result)
  {
    if (-[THWMovieLayout usesTransportControllerControls](self, "usesTransportControllerControls"))
      return -[THWAVMediaListener layoutGeometryForLayout:](-[THWMovieLayout mediaListener](self, "mediaListener"), "layoutGeometryForLayout:");
    else
      return -[THWMovieLayout layoutForPlayButton](self, "layoutForPlayButton");
  }
  return result;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (THWAVMediaListener)mediaListener
{
  return self->_mediaListener;
}

- (void)setMediaListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (BOOL)usesTransportControllerControls
{
  return self->_usesTransportControllerControls;
}

@end
