@implementation VSTwoFactorEntryTextField

- (VSTwoFactorEntryTextField)init
{
  VSTwoFactorEntryTextField *v2;
  VSTwoFactorEntryTextField *v3;
  NSString *text;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryTextField;
  v2 = -[VSTwoFactorEntryTextField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_autoShowKeyboard = 1;
    text = v2->_text;
    v2->_expectedLength = 0;
    v2->_text = (NSString *)&stru_24FE1B848;

  }
  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (BOOL)autoShowKeyboard
{
  return self->_autoShowKeyboard;
}

- (void)setAutoShowKeyboard:(BOOL)a3
{
  self->_autoShowKeyboard = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
