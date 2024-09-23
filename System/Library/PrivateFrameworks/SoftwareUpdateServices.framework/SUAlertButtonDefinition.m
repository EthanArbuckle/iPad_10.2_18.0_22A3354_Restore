@implementation SUAlertButtonDefinition

- (SUAlertButtonDefinition)initWithLabel:(id)a3 presentationStyle:(unint64_t)a4 isPreferredButton:(BOOL)a5 handler:(id)a6
{
  id v11;
  id v12;
  SUAlertButtonDefinition *v13;
  SUAlertButtonDefinition *v14;
  uint64_t v15;
  id handler;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SUAlertButtonDefinition;
  v13 = -[SUAlertButtonDefinition init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_label, a3);
    v14->_presentationStyle = a4;
    v14->_isPreferredButton = a5;
    v15 = MEMORY[0x212BF6094](v12);
    handler = v14->_handler;
    v14->_handler = (id)v15;

  }
  return v14;
}

- (NSString)label
{
  return self->_label;
}

- (id)handler
{
  return self->_handler;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
