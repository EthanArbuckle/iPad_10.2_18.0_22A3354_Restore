@implementation UITextDragFinishState

- (BOOL)dragTearoffOccured
{
  return self->_dragTearoffOccured;
}

- (void)setDragTearoffOccured:(BOOL)a3
{
  self->_dragTearoffOccured = a3;
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

@end
