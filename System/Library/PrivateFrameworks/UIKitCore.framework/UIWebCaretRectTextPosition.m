@implementation UIWebCaretRectTextPosition

+ (id)textPositionWithCaretRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCaretRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIWebCaretRectTextPosition)initWithCaretRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIWebCaretRectTextPosition *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UIWebCaretRectTextPosition;
  result = -[UIWebCaretRectTextPosition init](&v8, sel_init);
  if (result)
  {
    result->_caretRect.origin.x = x;
    result->_caretRect.origin.y = y;
    result->_caretRect.size.width = width;
    result->_caretRect.size.height = height;
  }
  return result;
}

- (CGRect)caretRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_caretRect.origin.x;
  y = self->_caretRect.origin.y;
  width = self->_caretRect.size.width;
  height = self->_caretRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
