@implementation UIZoomTransitionInteractionContext

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (CGVector)velocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_velocity.dx;
  dy = self->_velocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setVelocity:(CGVector)a3
{
  self->_velocity = a3;
}

- (BOOL)willBegin
{
  return self->_willBegin;
}

- (void)setWillBegin:(BOOL)a3
{
  self->_willBegin = a3;
}

@end
