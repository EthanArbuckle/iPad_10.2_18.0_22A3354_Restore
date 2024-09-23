@implementation THWInteractiveImageRadioPanelLayout

- (void)dealloc
{
  objc_super v3;

  self->_pageControl = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (id)additionalLayouts
{
  id v3;
  THWPageControlLayout *pageControl;
  THWButtonControlLayout *v5;
  THWButtonControlLayout *v6;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[THWInteractiveImageRadioPanelLayout setTotalCallouts:](self, "setTotalCallouts:", objc_msgSend(-[THWInteractiveImageWidgetLayout info](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "info"), "calloutCount"));
  pageControl = self->_pageControl;
  if (!pageControl)
  {
    self->_pageControl = -[THWControlLayout initWithTag:]([THWPageControlLayout alloc], "initWithTag:", 2);
    -[THWPageControlLayout setCurrentPage:](self->_pageControl, "setCurrentPage:", -[THWInteractiveImageWidgetLayout selectedCalloutIndex](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "selectedCalloutIndex"));
    -[THWPageControlLayout setNumberOfPages:](self->_pageControl, "setNumberOfPages:", -[THWInteractiveImageRadioPanelLayout totalCallouts](self, "totalCallouts"));
    pageControl = self->_pageControl;
  }
  objc_msgSend(v3, "addObject:", pageControl);
  v5 = objc_alloc_init(THWButtonControlLayout);
  -[THWControlLayout setTag:](v5, "setTag:", 0);
  objc_msgSend(v3, "addObject:", v5);
  -[THWButtonControlLayout invalidateFrame](v5, "invalidateFrame");

  v6 = objc_alloc_init(THWButtonControlLayout);
  -[THWControlLayout setTag:](v6, "setTag:", 1);
  objc_msgSend(v3, "addObject:", v6);
  -[THWButtonControlLayout invalidateFrame](v6, "invalidateFrame");

  return v3;
}

- (id)primaryColor
{
  if (-[THWInteractiveImageWidgetLayout isExpanded](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "isExpanded"))
  {
    return +[TSUColor whiteColor](TSUColor, "whiteColor");
  }
  else
  {
    return -[THWInteractiveImageWidgetLayout primaryColor](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "primaryColor");
  }
}

- (double)p_desiredWidth
{
  unint64_t v2;
  unint64_t v3;

  v2 = -[THWInteractiveImageRadioPanelLayout totalCallouts](self, "totalCallouts");
  v3 = v2 - 1;
  if (!v2)
    v3 = 0;
  return (double)v3 * 4.0 + (double)v2 * 31.0;
}

- (BOOL)p_shouldUseTextLabelWithFrameWidth:(double)a3
{
  double v5;
  double v6;
  unint64_t v7;

  -[THWInteractiveImageRadioPanelLayout maxCalloutFrameWidth](self, "maxCalloutFrameWidth");
  v6 = v5;
  v7 = -[THWInteractiveImageRadioPanelLayout totalCallouts](self, "totalCallouts");
  return v6 <= a3 || v7 > 0xA;
}

- (id)computeLayoutGeometry
{
  id v3;
  double v4;
  double v5;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  double v18;
  double v19;
  CGRect *p_pageControlFrame;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGSize v27;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  v3 = -[THWInteractiveImageRadioPanelLayout computeLayoutGeometry](&v28, "computeLayoutGeometry");
  objc_msgSend(v3, "frame");
  v5 = v4;
  __asm { FMOV            V0.2D, #31.0 }
  self->_navigationArrowSize = _Q0;
  v27 = _Q0;
  self->_controlButtonSize = _Q0;
  -[THWInteractiveImageRadioPanelLayout setMaxCalloutFrameWidth:](self, "setMaxCalloutFrameWidth:", v4 + -142.0);
  -[THWInteractiveImageRadioPanelLayout p_desiredWidth](self, "p_desiredWidth");
  v12 = v11;
  -[THWInteractiveImageRadioPanelLayout maxCalloutFrameWidth](self, "maxCalloutFrameWidth");
  if (v12 <= v13)
    v14 = 4.0;
  else
    v14 = 1.0;
  v15 = (double)-[THWInteractiveImageRadioPanelLayout totalCallouts](self, "totalCallouts");
  v16 = v14 * (double)(-[THWInteractiveImageRadioPanelLayout totalCallouts](self, "totalCallouts") - 1) + v15 * 31.0;
  v17 = -[THWInteractiveImageRadioPanelLayout p_shouldUseTextLabelWithFrameWidth:](self, "p_shouldUseTextLabelWithFrameWidth:", v16);
  if (v17)
  {
    -[THWInteractiveImageRadioPanelLayout maxCalloutFrameWidth](self, "maxCalloutFrameWidth");
    v16 = v18;
  }
  objc_msgSend(v3, "frame");
  p_pageControlFrame = &self->_pageControlFrame;
  self->_pageControlFrame.origin.x = (v5 - v16) * 0.5;
  self->_pageControlFrame.origin.y = (v19 + -31.0) * 0.5;
  self->_pageControlFrame.size.width = v16;
  self->_pageControlFrame.size.height = 31.0;
  -[THWPageControlLayout setSpacing:](self->_pageControl, "setSpacing:", v14);
  -[THWPageControlLayout setForceTextOnly:](self->_pageControl, "setForceTextOnly:", v17);
  objc_msgSend(v3, "frame");
  v22 = v21;
  v23 = 0.0;
  if (-[THWInteractiveImageWidgetLayout isExpanded](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "isExpanded"))
  {
    v23 = p_pageControlFrame->origin.x + -31.0 + -14.0;
  }
  if (-[THWInteractiveImageWidgetLayout isExpanded](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "isExpanded"))
  {
    v29.origin.x = p_pageControlFrame->origin.x;
    v29.origin.y = self->_pageControlFrame.origin.y;
    v29.size.width = self->_pageControlFrame.size.width;
    v29.size.height = self->_pageControlFrame.size.height;
    v24 = CGRectGetMaxX(v29) + 14.0;
  }
  else
  {
    v24 = v5 + -31.0;
  }
  v25 = (v22 + -31.0) * 0.5;
  self->_prevButtonFrame.origin.x = v23;
  self->_prevButtonFrame.origin.y = v25;
  self->_prevButtonFrame.size = v27;
  self->_nextButtonFrame.origin.x = v24;
  self->_nextButtonFrame.origin.y = v25;
  self->_nextButtonFrame.size = v27;
  return v3;
}

- (id)dependentLayouts
{
  NSMutableArray *v3;
  objc_super v5;

  v3 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[THWInteractiveImageRadioPanelLayout children](self, "children"));
  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", -[THWInteractiveImageRadioPanelLayout dependentLayouts](&v5, "dependentLayouts"));
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  void *v4;
  unint64_t v5;
  int *v6;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (!v4)
    return 0;
  v5 = (unint64_t)objc_msgSend(v4, "tag");
  if (v5 > 2)
    return 0;
  v6 = off_42A408[v5];
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", *(double *)&self->super.TSDContainerLayout_opaque[*v6], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 8], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 16], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 24]);
}

- (unint64_t)tag
{
  return self->tag;
}

- (void)setTag:(unint64_t)a3
{
  self->tag = a3;
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

- (THWPageControlLayout)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (THWInteractiveImageWidgetLayout)widgetLayout
{
  return self->_widgetLayout;
}

- (void)setWidgetLayout:(id)a3
{
  self->_widgetLayout = (THWInteractiveImageWidgetLayout *)a3;
}

- (unint64_t)totalCallouts
{
  return self->_totalCallouts;
}

- (void)setTotalCallouts:(unint64_t)a3
{
  self->_totalCallouts = a3;
}

- (CGSize)navigationArrowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_navigationArrowSize.width;
  height = self->_navigationArrowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNavigationArrowSize:(CGSize)a3
{
  self->_navigationArrowSize = a3;
}

- (CGSize)controlButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_controlButtonSize.width;
  height = self->_controlButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)nextButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_nextButtonFrame.origin.x;
  y = self->_nextButtonFrame.origin.y;
  width = self->_nextButtonFrame.size.width;
  height = self->_nextButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNextButtonFrame:(CGRect)a3
{
  self->_nextButtonFrame = a3;
}

- (CGRect)prevButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_prevButtonFrame.origin.x;
  y = self->_prevButtonFrame.origin.y;
  width = self->_prevButtonFrame.size.width;
  height = self->_prevButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrevButtonFrame:(CGRect)a3
{
  self->_prevButtonFrame = a3;
}

- (CGRect)pageControlFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pageControlFrame.origin.x;
  y = self->_pageControlFrame.origin.y;
  width = self->_pageControlFrame.size.width;
  height = self->_pageControlFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPageControlFrame:(CGRect)a3
{
  self->_pageControlFrame = a3;
}

- (double)maxCalloutFrameWidth
{
  return self->_maxCalloutFrameWidth;
}

- (void)setMaxCalloutFrameWidth:(double)a3
{
  self->_maxCalloutFrameWidth = a3;
}

@end
