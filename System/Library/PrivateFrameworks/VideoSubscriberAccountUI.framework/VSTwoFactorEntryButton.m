@implementation VSTwoFactorEntryButton

- (VSTwoFactorEntryButton)init
{
  VSTwoFactorEntryButton *v2;
  VSTwoFactorEntryButton *v3;
  NSString *text;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryButton;
  v2 = -[VSTwoFactorEntryButton init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_24FE1B848;

    objc_storeStrong((id *)&v3->_type, CFSTR("default"));
  }
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
