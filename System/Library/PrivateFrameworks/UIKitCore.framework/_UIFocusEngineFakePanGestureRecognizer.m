@implementation _UIFocusEngineFakePanGestureRecognizer

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)digitizerLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_digitizerLocation.x;
  y = self->_digitizerLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDigitizerLocation:(CGPoint)a3
{
  self->_digitizerLocation = a3;
}

- (CGPoint)velocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocity = a3;
}

@end
