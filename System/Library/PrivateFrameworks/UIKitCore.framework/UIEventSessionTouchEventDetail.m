@implementation UIEventSessionTouchEventDetail

- (UIEventSessionTouchEventDetail)init
{
  UIEventSessionTouchEventDetail *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEventSessionTouchEventDetail;
  result = -[UIEventSessionTouchEventDetail init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_windowSection = 0u;
    *(_OWORD *)&result->_upDownState = 0u;
  }
  return result;
}

- (int64_t)upDownState
{
  return self->_upDownState;
}

- (void)setUpDownState:(int64_t)a3
{
  self->_upDownState = a3;
}

- (int64_t)tapDragState
{
  return self->_tapDragState;
}

- (void)setTapDragState:(int64_t)a3
{
  self->_tapDragState = a3;
}

- (int64_t)windowSection
{
  return self->_windowSection;
}

- (void)setWindowSection:(int64_t)a3
{
  self->_windowSection = a3;
}

- (double)dragDistanceSquared
{
  return self->_dragDistanceSquared;
}

- (void)setDragDistanceSquared:(double)a3
{
  self->_dragDistanceSquared = a3;
}

- (CGPoint)lastLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastLocation.x;
  y = self->_lastLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->_lastLocation = a3;
}

@end
