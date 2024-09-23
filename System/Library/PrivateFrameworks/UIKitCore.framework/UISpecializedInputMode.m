@implementation UISpecializedInputMode

- (void)clearViewControllerClass
{
  Class viewControllerClass;

  viewControllerClass = self->_viewControllerClass;
  self->_viewControllerClass = 0;

}

- (void)dealloc
{
  Class viewControllerClass;
  objc_super v4;

  viewControllerClass = self->_viewControllerClass;
  self->_viewControllerClass = 0;

  v4.receiver = self;
  v4.super_class = (Class)UISpecializedInputMode;
  -[UIKeyboardInputMode dealloc](&v4, sel_dealloc);
}

- (BOOL)includeBarHeight
{
  return 1;
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  return 1;
}

- (id)hardwareLayout
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("autofillsignup"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UISpecializedInputMode;
  -[UIKeyboardInputMode hardwareLayout](&v6, sel_hardwareLayout);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSpecializedInputMode
{
  return 1;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (void)setViewControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_viewControllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClass, 0);
}

@end
