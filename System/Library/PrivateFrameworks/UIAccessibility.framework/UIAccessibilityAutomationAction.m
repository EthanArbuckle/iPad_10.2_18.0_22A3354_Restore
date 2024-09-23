@implementation UIAccessibilityAutomationAction

- (UIAccessibilityAutomationAction)initWithIdentifier:(id)a3 selector:(SEL)a4
{
  id v6;
  UIAccessibilityAutomationAction *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityAutomationAction;
  v7 = -[UIAccessibilityAutomationAction init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_selector = a4;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
