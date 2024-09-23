@implementation _UITouchForceObservationMessageReader

- (double)touchForce
{
  return self->_touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->_touchForce = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGPoint)centroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (BOOL)shouldFilterDueToSystemGestures
{
  return self->_shouldFilterDueToSystemGestures;
}

- (void)setShouldFilterDueToSystemGestures:(BOOL)a3
{
  self->_shouldFilterDueToSystemGestures = a3;
}

@end
