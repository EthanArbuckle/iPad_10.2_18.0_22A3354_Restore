@implementation _UITextSelectionCaretRect

+ (id)selectionRectWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)objc_alloc_init((Class)objc_opt_class());
  v7[3] = x;
  v7[4] = y;
  v7[5] = width;
  v7[6] = height;
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

- (int64_t)writingDirection
{
  return -1;
}

- (BOOL)containsStart
{
  return 1;
}

- (BOOL)containsEnd
{
  return 1;
}

- (BOOL)isVertical
{
  return 0;
}

@end
