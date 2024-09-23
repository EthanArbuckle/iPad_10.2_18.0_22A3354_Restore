@implementation VSBindableTextField

- (id)text
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField text](&v3, sel_text);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setText:](&v3, sel_setText_, a3);
}

- (id)placeholder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField placeholder](&v3, sel_placeholder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPlaceholder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setPlaceholder:](&v3, sel_setPlaceholder_, a3);
}

- (int64_t)autocapitalizationType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  return -[VSBindableTextField autocapitalizationType](&v3, sel_autocapitalizationType);
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setAutocapitalizationType:](&v3, sel_setAutocapitalizationType_, a3);
}

- (int64_t)autocorrectionType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  return -[VSBindableTextField autocorrectionType](&v3, sel_autocorrectionType);
}

- (void)setAutocorrectionType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setAutocorrectionType:](&v3, sel_setAutocorrectionType_, a3);
}

- (BOOL)isSecureTextEntry
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  return -[VSBindableTextField isSecureTextEntry](&v3, sel_isSecureTextEntry);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setSecureTextEntry:](&v3, sel_setSecureTextEntry_, a3);
}

- (int64_t)keyboardType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  return -[VSBindableTextField keyboardType](&v3, sel_keyboardType);
}

- (void)setKeyboardType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setKeyboardType:](&v3, sel_setKeyboardType_, a3);
}

- (int64_t)returnKeyType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  return -[VSBindableTextField returnKeyType](&v3, sel_returnKeyType);
}

- (void)setReturnKeyType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSBindableTextField;
  -[VSBindableTextField setReturnKeyType:](&v3, sel_setReturnKeyType_, a3);
}

@end
