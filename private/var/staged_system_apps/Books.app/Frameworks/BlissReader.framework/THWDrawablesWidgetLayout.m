@implementation THWDrawablesWidgetLayout

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
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWDrawablesWidgetLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWDrawablesWidgetLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = TSDScaleSizeWithinSize(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable"), "geometry"), "size"));
  v4 = TSDRoundedSize(v3) + 0.0;
  v6 = v5 + 0.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  double v4;

  -[THWDrawablesWidgetLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (unsigned)widgetStack:(id)a3 maxLinesForWPLayout:(id)a4 withDefault:(unsigned int)a5
{
  uint64_t v7;
  double v8;
  id v9;

  v7 = objc_opt_class(THWMovieInfo);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "stageDrawable")).n128_u64[0];
  if (objc_msgSend(v9, "isAudioOnly", v8))
    return 3;
  else
    return a5;
}

- (id)actualStageDrawable
{
  if (-[THWDrawablesWidgetLayout isExpanded](self, "isExpanded")
    && objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "expandedStageDrawable"))
  {
    return objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "expandedStageDrawable");
  }
  else
  {
    return objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "stageDrawable");
  }
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWDrawablesWidgetLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWDrawablesWidgetLayout delegate](self, "delegate"), "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWDrawablesWidgetLayout;
    return -[THWDrawablesWidgetLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (id)childrenForLayout
{
  id v3;
  NSArray *v4;
  id v6;

  v3 = -[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable");
  if (v3)
  {
    v6 = v3;
    v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1);
  }
  else
  {
    v4 = (NSArray *)&__NSArray0__struct;
  }
  if (!-[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self)
    && objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "adornmentInfo"))
  {
    return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v4);
  }
  return v4;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWDrawablesWidgetLayout;
  v3 = objc_msgSend(-[THWDrawablesWidgetLayout dependentLayouts](&v5, "dependentLayouts"), "mutableCopy");
  if (!v3)
    v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[THWDrawablesWidgetLayout children](self, "children"));
  return v3;
}

- (CGRect)stageFrame
{
  CGRect *p_stageFrame;
  double x;
  double y;
  double width;
  double height;
  CGRect v8;
  CGRect result;

  p_stageFrame = &self->_stageFrame;
  v8.origin.x = CGRectZero.origin.x;
  v8.origin.y = CGRectZero.origin.y;
  v8.size.width = CGRectZero.size.width;
  v8.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v8, self->_stageFrame))
  {
    objc_msgSend(-[THWDrawablesWidgetLayout p_layoutGeometryForStageDrawable](self, "p_layoutGeometryForStageDrawable"), "frame");
    p_stageFrame->origin.x = x;
    p_stageFrame->origin.y = y;
    p_stageFrame->size.width = width;
    p_stageFrame->size.height = height;
  }
  else
  {
    x = p_stageFrame->origin.x;
    y = p_stageFrame->origin.y;
    width = p_stageFrame->size.width;
    height = p_stageFrame->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)p_layoutGeometryForStageDrawable
{
  id v3;
  id result;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[THWDrawablesWidgetLayout children](self, "children", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = objc_msgSend(v8, "info");
        if (v9 == -[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable"))
          return objc_msgSend(objc_msgSend(v8, "geometry"), "copy");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5
{
  CGFloat v6;
  CGFloat v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  float v17;
  float v18;

  v6 = a4.width + -128.0;
  v7 = a4.height + -128.0;
  v8 = +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", -[THWDrawablesWidgetLayout p_layoutGeometryForStageDrawable](self, "p_layoutGeometryForStageDrawable"), 0.0, 0.0, a3.width + -128.0, a3.height + -128.0);
  v9 = +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", -[THWDrawablesWidgetLayout p_layoutGeometryForStageDrawable](self, "p_layoutGeometryForStageDrawable"), 0.0, 0.0, v6, v7);
  objc_msgSend(v8, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "frame");
  result = 1.0;
  if (v11 > 0.0 && v13 > 0.0)
  {
    v17 = v14 / v11;
    v18 = v15 / v13;
    return fminf(v17, v18);
  }
  return result;
}

- (void)p_invalidateExternal
{
  -[THWDrawablesWidgetLayout invalidateFrame](self, "invalidateFrame");
  -[THWDrawablesWidgetLayout invalidateChildren](self, "invalidateChildren");
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWDrawablesWidgetLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWDrawablesWidgetLayout;
  -[THWDrawablesWidgetLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWDrawablesWidgetLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = objc_msgSend(a3, "info");
  if (v4 != -[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable")
    || -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self) != 3)
  {
    return 0;
  }
  objc_msgSend(-[THWDrawablesWidgetLayout geometry](self, "geometry"), "size");
  v5 = TSDRectWithSize(-[THWDrawablesWidgetLayout p_idealForMaxSize:](self, "p_idealForMaxSize:"));
  TSDRectWithSize(objc_msgSend(-[THWDrawablesWidgetLayout geometry](self, "geometry"), "size"));
  v6 = TSDCenterRectOverRect(v5);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v6, v7, v8, v9);
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  id v7;
  CGRect v9;
  CGRect v10;

  if (!-[THWDrawablesWidgetLayout isExpanded](self, "isExpanded"))
    return a3;
  v7 = objc_msgSend(a4, "info");
  if (v7 != -[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable"))
    return a3;
  -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWDrawablesWidgetLayout delegate](self, "delegate"), "widgetLayoutBounds");
  v10 = CGRectInset(v9, 64.0, 64.0);
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", a3, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  id v9;
  double x;
  double y;
  double width;
  double height;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  if (!-[THWDrawablesWidgetLayout isExpanded](self, "isExpanded"))
    return a3;
  v9 = objc_msgSend(a5, "info");
  if (v9 != -[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable"))
    return a3;
  -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWDrawablesWidgetLayout delegate](self, "delegate"), "widgetLayoutBounds");
  v19 = CGRectInset(v18, 64.0, 64.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  objc_msgSend(a4, "frame");
  v17 = THScaleNeededToFitSizeInSize(v15, v16, width, height);
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", a3, x, y, width, height, v17);
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:](TSDLayout, "descendentWrappablesOfLayout:", self);
}

- (int)wrapContainerMode
{
  return objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "containerWrap");
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setStageFrame:(CGRect)a3
{
  self->_stageFrame = a3;
}

@end
