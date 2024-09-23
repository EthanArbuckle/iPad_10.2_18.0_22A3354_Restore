@implementation _SBFloatingDockPlatterMetrics

- (_SBFloatingDockPlatterMetrics)initWithBounds:(CGRect)a3 continuousCornerRadius:(double)a4 shadowRadius:(double)a5 shadowYOffset:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _SBFloatingDockPlatterMetrics *result;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)_SBFloatingDockPlatterMetrics;
  result = -[_SBFloatingDockPlatterMetrics init](&v14, sel_init);
  if (result)
  {
    result->_bounds.origin.y = y;
    result->_bounds.size.width = width;
    result->_bounds.size.height = height;
    result->_continuousCornerRadius = a4;
    result->_shadowRadius = a5;
    result->_shadowYOffset = a6;
    result->_bounds.origin.x = x;
  }
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowYOffset
{
  return self->_shadowYOffset;
}

@end
