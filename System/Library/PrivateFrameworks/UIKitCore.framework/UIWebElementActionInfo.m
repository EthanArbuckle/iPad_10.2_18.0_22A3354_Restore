@implementation UIWebElementActionInfo

- (void)_setInteractionLocation:(CGPoint)a3
{
  self->_interactionLocation = a3;
}

- (CGPoint)interactionLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_interactionLocation.x;
  y = self->_interactionLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
