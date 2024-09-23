@implementation VSCredentialEntryField

- (VSCredentialEntryField)init
{
  VSCredentialEntryField *v2;
  VSCredentialEntryField *v3;
  NSString *text;
  NSString *title;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSCredentialEntryField;
  v2 = -[VSCredentialEntryField init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_24FE1B848;

    title = v3->_title;
    v3->_title = (NSString *)&stru_24FE1B848;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v7;

  }
  return v3;
}

- (NSString)recentsTitle
{
  __CFString *v2;

  v2 = self->_recentsTitle;
  if (!v2)
    v2 = &stru_24FE1B848;
  return (NSString *)v2;
}

- (NSString)recentsMessage
{
  __CFString *v2;

  v2 = self->_recentsMessage;
  if (!v2)
    v2 = &stru_24FE1B848;
  return (NSString *)v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void)setRecentsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setRecentsMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_recentsMessage, 0);
  objc_storeStrong((id *)&self->_recentsTitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
