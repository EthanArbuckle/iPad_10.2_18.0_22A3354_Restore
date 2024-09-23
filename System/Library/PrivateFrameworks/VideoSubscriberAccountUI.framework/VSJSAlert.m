@implementation VSJSAlert

- (VSJSAlert)init
{
  void *v3;
  VSJSAlert *v4;
  NSString *title;
  NSString *message;
  NSArray *actions;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)VSJSAlert;
  v4 = -[IKJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v3);

  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)CFSTR("Error");

    message = v4->_message;
    v4->_message = (NSString *)&stru_24FE1B848;

    actions = v4->_actions;
    v4->_actions = 0;

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

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
