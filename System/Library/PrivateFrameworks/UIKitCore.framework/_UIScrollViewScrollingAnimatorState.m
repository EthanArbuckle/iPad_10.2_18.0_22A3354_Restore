@implementation _UIScrollViewScrollingAnimatorState

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGPoint)maximumVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_maximumVelocity.x;
  y = self->_maximumVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMaximumVelocity:(CGPoint)a3
{
  self->_maximumVelocity = a3;
}

- (CGPoint)force
{
  double x;
  double y;
  CGPoint result;

  x = self->_force.x;
  y = self->_force.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setForce:(CGPoint)a3
{
  self->_force = a3;
}

- (unint64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(unint64_t)a3
{
  self->_granularity = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

@end
