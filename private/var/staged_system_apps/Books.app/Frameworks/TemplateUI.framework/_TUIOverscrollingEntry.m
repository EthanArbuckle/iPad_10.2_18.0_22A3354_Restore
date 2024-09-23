@implementation _TUIOverscrollingEntry

- (TUIOverscrollingLiveTransform)overscrollingLiveTransform
{
  return self->_overscrollingLiveTransform;
}

- (void)setOverscrollingLiveTransform:(id)a3
{
  objc_storeStrong((id *)&self->_overscrollingLiveTransform, a3);
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (CGPoint)defaultOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_defaultOrigin.x;
  y = self->_defaultOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDefaultOrigin:(CGPoint)a3
{
  self->_defaultOrigin = a3;
}

- (CGSize)defaultSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultSize.width;
  height = self->_defaultSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultSize:(CGSize)a3
{
  self->_defaultSize = a3;
}

- (double)defaultScale
{
  return self->_defaultScale;
}

- (void)setDefaultScale:(double)a3
{
  self->_defaultScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overscrollingLiveTransform, 0);
}

@end
