@implementation UIKeyboardButton

- (UIKeyboardButton)initWithKeyboardButtonStyle:(int64_t)a3
{
  UIKeyboardButton *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardButton;
  result = -[UIView init](&v5, sel_init);
  if (result)
    result->_keyboardButtonStyle = a3;
  return result;
}

- (int64_t)keyboardButtonStyle
{
  return self->_keyboardButtonStyle;
}

@end
