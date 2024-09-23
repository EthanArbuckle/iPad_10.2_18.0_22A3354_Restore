@implementation SBSetupPIPMorphingSwitcherEventResponse

- (int64_t)type
{
  return 25;
}

- (CGRect)appLayoutBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_appLayoutBoundingBox.origin.x;
  y = self->_appLayoutBoundingBox.origin.y;
  width = self->_appLayoutBoundingBox.size.width;
  height = self->_appLayoutBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAppLayoutBoundingBox:(CGRect)a3
{
  self->_appLayoutBoundingBox = a3;
}

@end
