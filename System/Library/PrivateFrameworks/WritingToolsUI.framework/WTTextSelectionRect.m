@implementation WTTextSelectionRect

+ (id)rectWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  WTTextSelectionRect *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(WTTextSelectionRect);
  v7->_rect.origin.x = x;
  v7->_rect.origin.y = y;
  v7->_rect.size.width = width;
  v7->_rect.size.height = height;
  return v7;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromCGRect(self->_rect);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p>: %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
