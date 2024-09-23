@implementation _UITextHighlightSelectionRect

+ (id)selectionRectWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UITextHighlightSelectionRect *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(_UITextHighlightSelectionRect);
  v7->_rect.origin.x = x;
  v7->_rect.origin.y = y;
  v7->_rect.size.width = width;
  v7->_rect.size.height = height;
  return v7;
}

+ (id)startingSelectionRectWithRect:(CGRect)a3
{
  id result;

  result = +[_UITextHighlightSelectionRect selectionRectWithRect:](_UITextHighlightSelectionRect, "selectionRectWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *((_BYTE *)result + 24) = 1;
  return result;
}

+ (id)endingSelectionRectWithRect:(CGRect)a3
{
  id result;

  result = +[_UITextHighlightSelectionRect selectionRectWithRect:](_UITextHighlightSelectionRect, "selectionRectWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *((_BYTE *)result + 25) = 1;
  return result;
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

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
}

@end
