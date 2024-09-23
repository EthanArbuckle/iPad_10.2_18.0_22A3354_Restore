@implementation _UITextClippingDebugInfo

- (_UITextClippingDebugInfo)initWithClippingView:(id)a3 visibleBounds:(CGRect)a4 ignoresResult:(BOOL)a5 edgesClipped:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_storeWeak((id *)&self->_clippingView, a3);
  self->_visibleBounds.origin.x = x;
  self->_visibleBounds.origin.y = y;
  self->_visibleBounds.size.width = width;
  self->_visibleBounds.size.height = height;
  self->_ignoresResult = a5;
  self->_edgesClipped = a6;
  return self;
}

- (BOOL)hasClippedEdges
{
  return self->_edgesClipped != 0;
}

- (BOOL)leftEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 1) & 1;
}

- (BOOL)rightEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 3) & 1;
}

- (BOOL)bottomEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 2) & 1;
}

- (BOOL)topEdgeClipped
{
  return self->_edgesClipped & 1;
}

- (UIView)clippingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clippingView);
}

- (void)setClippingView:(id)a3
{
  objc_storeWeak((id *)&self->_clippingView, a3);
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->_visibleBounds = a3;
}

- (BOOL)ignoresResult
{
  return self->_ignoresResult;
}

- (void)setIgnoresResult:(BOOL)a3
{
  self->_ignoresResult = a3;
}

- (unint64_t)edgesClipped
{
  return self->_edgesClipped;
}

- (void)setEdgesClipped:(unint64_t)a3
{
  self->_edgesClipped = a3;
}

- (void)setLeftEdgeClipped:(BOOL)a3
{
  self->_leftEdgeClipped = a3;
}

- (void)setRightEdgeClipped:(BOOL)a3
{
  self->_rightEdgeClipped = a3;
}

- (void)setBottomEdgeClipped:(BOOL)a3
{
  self->_bottomEdgeClipped = a3;
}

- (void)setTopEdgeClipped:(BOOL)a3
{
  self->_topEdgeClipped = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clippingView);
}

@end
