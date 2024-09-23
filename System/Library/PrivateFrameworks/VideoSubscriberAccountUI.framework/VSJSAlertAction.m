@implementation VSJSAlertAction

- (VSJSAlertAction)init
{
  void *v3;
  VSJSAlertAction *v4;
  NSString *title;
  NSString *style;
  JSValue *callback;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)VSJSAlertAction;
  v4 = -[IKJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v3);

  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)CFSTR("OK");

    style = v4->_style;
    v4->_style = (NSString *)CFSTR("default");

    callback = v4->_callback;
    v4->_callback = 0;

  }
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (JSValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_storeStrong((id *)&self->_callback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
