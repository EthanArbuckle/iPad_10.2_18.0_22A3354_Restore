@implementation _UIEditMenuPresentationLayout

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("UIEditMenuPresentationLayout:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_containerBounds);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\t containerBounds: %@,\n"), v4);

  NSStringFromCGPoint(self->_anchorPoint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\t anchorPoint: %@,\n"), v5);

  NSStringFromCGPoint(self->_menuPosition);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\t menuPosition: %@,\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("\t arrowDirection: %ld,\n"), self->_arrowDirection);
  NSStringFromCGRect(self->_menuSourceRect);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\t menuSourceRect: %@,\n"), v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)menuPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_menuPosition.x;
  y = self->_menuPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMenuPosition:(CGPoint)a3
{
  self->_menuPosition = a3;
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(int64_t)a3
{
  self->_arrowDirection = a3;
}

- (CGRect)menuSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_menuSourceRect.origin.x;
  y = self->_menuSourceRect.origin.y;
  width = self->_menuSourceRect.size.width;
  height = self->_menuSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMenuSourceRect:(CGRect)a3
{
  self->_menuSourceRect = a3;
}

@end
