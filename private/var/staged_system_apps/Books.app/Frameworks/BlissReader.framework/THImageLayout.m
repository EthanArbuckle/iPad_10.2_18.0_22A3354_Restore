@implementation THImageLayout

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THImageLayout invalidateFrame](self, "invalidateFrame");
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
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THImageLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THImageLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (BOOL)isIntroMedia
{
  unsigned int v3;

  v3 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self);
  return self->_delegate && v3 == 2;
}

- (BOOL)isInRoot
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_opt_class(TSDRootLayout, a2);
  TSUDynamicCast(v3, -[THImageLayout parent](self, "parent"));
  return v4 != 0;
}

- (double)p_insetAmount
{
  unsigned __int8 v3;
  double result;
  unsigned __int8 v5;
  unsigned int v6;

  v3 = -[THImageLayout isIntroMedia](self, "isIntroMedia");
  result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(-[THImageLayout layoutController](self, "layoutController", 0.0), "isCompactHeight");
    result = 10.0;
    if ((v5 & 1) == 0)
    {
      v6 = objc_msgSend(-[THImageLayout layoutController](self, "layoutController", 10.0), "isCompactWidth");
      result = 32.0;
      if (v6)
        return 10.0;
    }
  }
  return result;
}

- (id)p_expandedLayoutGeometryForFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THImageLayout p_insetAmount](self, "p_insetAmount");
  v9 = v8;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v13 = CGRectInset(v12, v9, v9);
  v11.receiver = self;
  v11.super_class = (Class)THImageLayout;
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", -[THImageLayout layoutGeometryFromProvider](&v11, "layoutGeometryFromProvider"), v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (id)layoutGeometryFromProvider
{
  objc_super v4;

  if (-[THImageLayout isExpanded](self, "isExpanded") && -[THImageLayout isInRoot](self, "isInRoot"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THImageLayout delegate](self, "delegate"), "widgetLayoutBounds");
    return -[THImageLayout p_expandedLayoutGeometryForFrame:](self, "p_expandedLayoutGeometryForFrame:");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THImageLayout;
    return -[THImageLayout layoutGeometryFromProvider](&v4, "layoutGeometryFromProvider");
  }
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
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

  height = a4.height;
  width = a4.width;
  v8 = -[THImageLayout p_expandedLayoutGeometryForFrame:](self, "p_expandedLayoutGeometryForFrame:", 0.0, 0.0, a3.width, a3.height, a5);
  v9 = -[THImageLayout p_expandedLayoutGeometryForFrame:](self, "p_expandedLayoutGeometryForFrame:", 0.0, 0.0, width, height);
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

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
