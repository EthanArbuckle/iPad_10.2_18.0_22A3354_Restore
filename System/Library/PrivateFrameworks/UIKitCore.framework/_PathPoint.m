@implementation _PathPoint

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  CGPoint v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_PathPoint point](self, "point");
  NSStringFromCGPoint(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_PathPoint: 0x%p: %@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isSentinelPoint
{
  return self->_sentinelPoint;
}

- (void)setSentinelPoint:(BOOL)a3
{
  self->_sentinelPoint = a3;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)relativeTime
{
  return self->_relativeTime;
}

- (void)setRelativeTime:(double)a3
{
  self->_relativeTime = a3;
}

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (void)setAbsoluteTime:(double)a3
{
  self->_absoluteTime = a3;
}

- (double)decay
{
  return self->_decay;
}

- (void)setDecay:(double)a3
{
  self->_decay = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end
