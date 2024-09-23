@implementation _UIAlertControllerTextField

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerTextField;
  -[UITextField setSecureTextEntry:](&v5, sel_setSecureTextEntry_);
  if (v3)
    -[_UIAlertControllerTextField setShortcutConversionType:](self, "setShortcutConversionType:", 1);
}

- (_UIAlertControllerTextFieldView)textFieldView
{
  return self->_textFieldView;
}

- (void)setTextFieldView:(id)a3
{
  self->_textFieldView = (_UIAlertControllerTextFieldView *)a3;
}

@end
