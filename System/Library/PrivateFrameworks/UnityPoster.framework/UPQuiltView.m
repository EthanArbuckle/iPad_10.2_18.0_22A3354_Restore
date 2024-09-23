@implementation UPQuiltView

- (UPQuiltViewDelegate)quiltViewDelegate
{
  return (UPQuiltViewDelegate *)objc_loadWeakRetained((id *)&self->_quiltViewDelegate);
}

- (void)setQuiltViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quiltViewDelegate, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CALayer)quiltImageLayer
{
  return self->_quiltImageLayer;
}

- (void)setQuiltImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_quiltImageLayer, a3);
}

- (CGRect)timeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeRect.origin.x;
  y = self->_timeRect.origin.y;
  width = self->_timeRect.size.width;
  height = self->_timeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTimeRect:(CGRect)a3
{
  self->_timeRect = a3;
}

- (CGRect)landscapeWidgetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_landscapeWidgetRect.origin.x;
  y = self->_landscapeWidgetRect.origin.y;
  width = self->_landscapeWidgetRect.size.width;
  height = self->_landscapeWidgetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLandscapeWidgetRect:(CGRect)a3
{
  self->_landscapeWidgetRect = a3;
}

- (CGRect)originalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalFrame.origin.x;
  y = self->_originalFrame.origin.y;
  width = self->_originalFrame.size.width;
  height = self->_originalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quiltImageLayer, 0);
  objc_destroyWeak((id *)&self->_quiltViewDelegate);
}

@end
