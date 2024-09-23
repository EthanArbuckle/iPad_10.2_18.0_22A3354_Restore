@implementation _TVRCTouchInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TVRCTouchPhaseDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; virtualPhase = %@"), v4);

  if (self->_pendingCancellation)
    objc_msgSend(v3, "appendString:", CFSTR("; pending cancellation"));
  NSStringFromCGPoint(self->_initialLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; initialLocation = %@"), v5);

  NSStringFromCGPoint(self->_initialProportionalLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; initialProportionalLocation = %@"), v6);

  if (self->_isLikelyLongListScrollingEdgeGesture)
    objc_msgSend(v3, "appendString:", CFSTR("; isLikelyLongListScrollingEdgeGesture = YES"));
  if (self->_virtualPhase)
  {
    v10 = CGRectIntegral(self->_boundingBox);
    NSStringFromCGRect(v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; boundingBox = %@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (int64_t)virtualPhase
{
  return self->_virtualPhase;
}

- (void)setVirtualPhase:(int64_t)a3
{
  self->_virtualPhase = a3;
}

- (BOOL)pendingCancellation
{
  return self->_pendingCancellation;
}

- (void)setPendingCancellation:(BOOL)a3
{
  self->_pendingCancellation = a3;
}

- (CGPoint)initialLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (CGPoint)initialProportionalLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialProportionalLocation.x;
  y = self->_initialProportionalLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialProportionalLocation:(CGPoint)a3
{
  self->_initialProportionalLocation = a3;
}

- (BOOL)isLikelyLongListScrollingEdgeGesture
{
  return self->_isLikelyLongListScrollingEdgeGesture;
}

- (void)setIsLikelyLongListScrollingEdgeGesture:(BOOL)a3
{
  self->_isLikelyLongListScrollingEdgeGesture = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

@end
