@implementation _UIContentViewEditingTextField

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  BOOL v5;
  objc_super v7;

  v5 = -[UIView isFirstResponder](self, "isFirstResponder");
  if (a3 == 3 && v5)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIContentViewEditingTextField;
  return -[UITextField _shouldForwardMovementToFocusEngine:](&v7, sel__shouldForwardMovementToFocusEngine_, a3);
}

@end
