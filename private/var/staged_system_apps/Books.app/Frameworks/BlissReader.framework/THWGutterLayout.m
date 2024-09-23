@implementation THWGutterLayout

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGutterLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (id)layoutGeometryFromProvider
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWGutterLayout;
  v3 = -[THWGutterLayout layoutGeometryFromProvider](&v9, "layoutGeometryFromProvider");
  if (-[THWGutterLayout isCompactFlowPresentation](self, "isCompactFlowPresentation"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWGutterLayout delegate](self, "delegate"), "widgetLayoutBounds");
    v5 = v4;
    if (v4 <= 414.0)
      v6 = v4 + -40.0;
    else
      v6 = 374.0;
    objc_msgSend(-[THWGutterLayout info](self, "info"), "stageFrame");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", (v5 - v6) * 0.5, 0.0, v6, fmax(v7 + 20.0, 120.0));
  }
  return v3;
}

- (id)childInfosForLayout
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWGutterLayout;
  v3 = -[THWGutterLayout childInfosForLayout](&v5, "childInfosForLayout");
  if (-[THWGutterLayout isCompactFlowPresentation](self, "isCompactFlowPresentation")
    && objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape")
    && objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape"), "containedStorage"))
  {
    v3 = objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v3, "removeObjectIdenticalTo:", objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape"));
    objc_msgSend(v3, "addObject:", objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape"), "containedStorage"));
  }
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (CGRect)p_leftThirdBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THWGutterLayout geometry](self, "geometry"), "frame");
  v4 = v3 / 3.0;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v2;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)p_rightTwoThirdBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THWGutterLayout geometry](self, "geometry"), "frame");
  v4 = v3 / 3.0;
  v5 = (v3 + v3) / 3.0;
  v6 = 0.0;
  result.size.height = v2;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (double)p_scaleToFitStage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "backgroundShape"), "geometry"), "size");
  v4 = v3;
  v6 = v5;
  -[THWGutterLayout p_leftThirdBounds](self, "p_leftThirdBounds");
  return THScaleNeededToFitSizeInSize(v4, v6, v7, v8);
}

- (id)layoutGeometryForLayout:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  if (!-[THWGutterLayout isCompactFlowPresentation](self, "isCompactFlowPresentation"))
    return 0;
  v6 = objc_opt_class(TSDDrawableLayout, v5);
  TSUDynamicCast(v6, a3);
  v8 = v7;
  v10 = objc_opt_class(TSWPLayout, v9);
  *(_QWORD *)&v11 = TSUDynamicCast(v10, a3).n128_u64[0];
  v13 = v12;
  v14 = objc_msgSend(v8, "info", v11);
  if (v14 != objc_msgSend(-[THWGutterLayout info](self, "info"), "stageInfo")
    || (v16 = objc_opt_class(THImageLayout, v15), (objc_opt_isKindOfClass(a3, v16) & 1) != 0))
  {
    v17 = objc_msgSend(v8, "info");
    if (v17 == objc_msgSend(-[THWGutterLayout info](self, "info"), "backgroundShape"))
    {
      objc_msgSend(objc_msgSend(objc_msgSend(v8, "info"), "geometry"), "size");
      -[THWGutterLayout p_leftThirdBounds](self, "p_leftThirdBounds");
      v31.origin.x = TSDFitOrFillSizeInRect(0);
      return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    }
    if (v13)
    {
      objc_msgSend(v13, "invalidateTextLayout");
      -[THWGutterLayout p_rightTwoThirdBounds](self, "p_rightTwoThirdBounds");
      v31 = CGRectInset(v30, 10.0, 10.0);
      return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    }
    return 0;
  }
  v19 = objc_alloc((Class)TSDLayoutGeometry);
  objc_msgSend(-[THWGutterLayout info](self, "info"), "stageFrame");
  v20 = objc_msgSend(v19, "initWithFrame:");
  -[THWGutterLayout p_leftThirdBounds](self, "p_leftThirdBounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[THWGutterLayout p_scaleToFitStage](self, "p_scaleToFitStage");
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", v20, v22, v24, v26, v28, v29);
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  return a3;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  id v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if (!-[THWGutterLayout isCompactFlowPresentation](self, "isCompactFlowPresentation", a3, a4))
    return a3;
  v9 = objc_opt_class(TSDDrawableLayout, v8);
  *(_QWORD *)&v10 = TSUDynamicCast(v9, a5).n128_u64[0];
  v12 = objc_msgSend(v11, "info", v10);
  if (v12 != objc_msgSend(-[THWGutterLayout info](self, "info"), "stageInfo"))
    return a3;
  -[THWGutterLayout p_leftThirdBounds](self, "p_leftThirdBounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[THWGutterLayout p_scaleToFitStage](self, "p_scaleToFitStage");
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", a3, v15, v17, v19, v21, v22);
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
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWGutterLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWGutterLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (void)p_invalidateExternal
{
  -[THWGutterLayout invalidateFrame](self, "invalidateFrame");
  -[THWGutterLayout invalidateChildren](self, "invalidateChildren");
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWGutterLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWGutterLayout;
  -[THWGutterLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWGutterLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:](TSDLayout, "descendentWrappablesOfLayout:", self);
}

- (int)wrapContainerMode
{
  return 0;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 0;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 1;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)compactStorage
{
  return self->_compactStorage;
}

- (void)setCompactStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

@end
