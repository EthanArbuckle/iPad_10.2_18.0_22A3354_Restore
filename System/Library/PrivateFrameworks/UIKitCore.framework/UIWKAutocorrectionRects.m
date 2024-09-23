@implementation UIWKAutocorrectionRects

- (CGRect)firstRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_firstRect.origin.x;
  y = self->_firstRect.origin.y;
  width = self->_firstRect.size.width;
  height = self->_firstRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFirstRect:(CGRect)a3
{
  self->_firstRect = a3;
}

- (CGRect)lastRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastRect.origin.x;
  y = self->_lastRect.origin.y;
  width = self->_lastRect.size.width;
  height = self->_lastRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastRect:(CGRect)a3
{
  self->_lastRect = a3;
}

@end
