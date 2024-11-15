@implementation PKUITextField

- (PKUITextField)init
{
  PKUITextField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKUITextField;
  result = -[PKUITextField init](&v3, sel_init);
  if (result)
    result->_allowsTextFromCamera = 1;
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  objc_super *v7;
  unsigned __int8 v8;
  PKUITextField *v10;
  objc_super v11;

  v6 = a4;
  if (sel_captureTextFromCamera_ == a3)
  {
    if (!self->_allowsTextFromCamera)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v11.receiver = self;
    v7 = &v11;
  }
  else
  {
    v10 = self;
    v7 = (objc_super *)&v10;
  }
  v7->super_class = (Class)PKUITextField;
  v8 = -[objc_super canPerformAction:withSender:](v7, sel_canPerformAction_withSender_, a3, v6, v10);
LABEL_6:

  return v8;
}

- (BOOL)allowsTextFromCamera
{
  return self->_allowsTextFromCamera;
}

- (void)setAllowsTextFromCamera:(BOOL)a3
{
  self->_allowsTextFromCamera = a3;
}

@end
