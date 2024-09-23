@implementation RPHIDTouchEvent

- (int)finger
{
  return self->_finger;
}

- (void)setFinger:(int)a3
{
  self->_finger = a3;
}

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

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_phase = a3;
}

- (double)timestampSeconds
{
  return self->_timestampSeconds;
}

- (void)setTimestampSeconds:(double)a3
{
  self->_timestampSeconds = a3;
}

@end
