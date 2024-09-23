@implementation _UIFluidSliderInteractionUpdate

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (CGRect)trackBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trackBounds.origin.x;
  y = self->_trackBounds.origin.y;
  width = self->_trackBounds.size.width;
  height = self->_trackBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTrackBounds:(CGRect)a3
{
  self->_trackBounds = a3;
}

- (CGAffineTransform)trackTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setTrackTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackTransform.tx = v4;
  *(_OWORD *)&self->_trackTransform.a = v3;
}

- (CGRect)barFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_barFrame.origin.x;
  y = self->_barFrame.origin.y;
  width = self->_barFrame.size.width;
  height = self->_barFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBarFrame:(CGRect)a3
{
  self->_barFrame = a3;
}

- (int64_t)interactionState
{
  return self->_interactionState;
}

- (void)setInteractionState:(int64_t)a3
{
  self->_interactionState = a3;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isAtTarget
{
  return self->_atTarget;
}

- (void)setAtTarget:(BOOL)a3
{
  self->_atTarget = a3;
}

- (double)_unclampedValue
{
  return self->__unclampedValue;
}

- (void)set_unclampedValue:(double)a3
{
  self->__unclampedValue = a3;
}

@end
