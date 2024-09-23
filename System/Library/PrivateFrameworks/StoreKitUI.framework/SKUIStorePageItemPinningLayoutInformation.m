@implementation SKUIStorePageItemPinningLayoutInformation

- (CGRect)availablePinningFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_availablePinningFrame.origin.x;
  y = self->_availablePinningFrame.origin.y;
  width = self->_availablePinningFrame.size.width;
  height = self->_availablePinningFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvailablePinningFrame:(CGRect)a3
{
  self->_availablePinningFrame = a3;
}

- (CGRect)layoutAttributesFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layoutAttributesFrame.origin.x;
  y = self->_layoutAttributesFrame.origin.y;
  width = self->_layoutAttributesFrame.size.width;
  height = self->_layoutAttributesFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayoutAttributesFrame:(CGRect)a3
{
  self->_layoutAttributesFrame = a3;
}

- (double)afterPinningLocationYAdditions
{
  return self->_afterPinningLocationYAdditions;
}

- (void)setAfterPinningLocationYAdditions:(double)a3
{
  self->_afterPinningLocationYAdditions = a3;
}

- (double)beforePinningLocationYAdditions
{
  return self->_beforePinningLocationYAdditions;
}

- (void)setBeforePinningLocationYAdditions:(double)a3
{
  self->_beforePinningLocationYAdditions = a3;
}

@end
