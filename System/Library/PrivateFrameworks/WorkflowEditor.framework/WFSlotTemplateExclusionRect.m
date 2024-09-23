@implementation WFSlotTemplateExclusionRect

- (WFSlotTemplateExclusionRect)initWithRect:(CGRect)a3 fromEdge:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  WFSlotTemplateExclusionRect *v9;
  WFSlotTemplateExclusionRect *v10;
  WFSlotTemplateExclusionRect *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateExclusionRect;
  v9 = -[WFSlotTemplateExclusionRect init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_rect.origin.x = x;
    v9->_rect.origin.y = y;
    v9->_rect.size.width = width;
    v9->_rect.size.height = height;
    v9->_edge = a4;
    v11 = v9;
  }

  return v10;
}

- (CGRect)resolvedRectWithViewBounds:(CGRect)a3 inRTL:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  CGFloat y;
  double v7;
  CGFloat height;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v4 = a4;
  width = a3.size.width;
  y = self->_rect.origin.y;
  v7 = self->_rect.size.width;
  height = self->_rect.size.height;
  v9 = -[WFSlotTemplateExclusionRect edge](self, "edge", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = width - v7;
  if (v9)
    v11 = 0.0;
  else
    v11 = width - v7;
  if (!v9)
    v10 = 0.0;
  if (v4)
    v10 = v11;
  v12 = y;
  v13 = v7;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end
