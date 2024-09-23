@implementation SURollbackOptions

- (SURollbackOptions)init
{
  SURollbackOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SURollbackOptions;
  result = -[SUOptionsBase init](&v3, sel_init);
  if (result)
  {
    result->_cancelActiveUpdate = 1;
    result->_promptForConsent = 1;
    result->_promptForPasscode = 1;
  }
  return result;
}

- (void)setCancelActiveUpdate:(BOOL)a3
{
  self->_cancelActiveUpdate = a3;
}

- (BOOL)cancelActiveUpdate
{
  return self->_cancelActiveUpdate;
}

- (void)setPromptForConsent:(BOOL)a3
{
  if (self->_promptForConsent != a3)
    self->_promptForConsent = a3;
}

- (BOOL)promptForConsent
{
  return self->_promptForConsent;
}

- (void)setPromptForPasscode:(BOOL)a3
{
  if (self->_promptForPasscode != a3)
    self->_promptForPasscode = a3;
}

- (BOOL)promptForPasscode
{
  return self->_promptForPasscode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackOptions)initWithCoder:(id)a3
{
  id v4;
  SURollbackOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SURollbackOptions;
  v5 = -[SUOptionsBase init](&v7, sel_init);
  if (v5)
  {
    -[SURollbackOptions setCancelActiveUpdate:](v5, "setCancelActiveUpdate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelActiveUpdate")));
    -[SURollbackOptions setPromptForConsent:](v5, "setPromptForConsent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("promptForConsent")));
    -[SURollbackOptions setPromptForPasscode:](v5, "setPromptForPasscode:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("promptForPasscode")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions cancelActiveUpdate](self, "cancelActiveUpdate"), CFSTR("cancelActiveUpdate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions promptForConsent](self, "promptForConsent"), CFSTR("promptForConsent"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions promptForPasscode](self, "promptForPasscode"), CFSTR("promptForPasscode"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCancelActiveUpdate:", -[SURollbackOptions cancelActiveUpdate](self, "cancelActiveUpdate"));
  objc_msgSend(v4, "setPromptForConsent:", -[SURollbackOptions promptForConsent](self, "promptForConsent"));
  objc_msgSend(v4, "setPromptForPasscode:", -[SURollbackOptions promptForPasscode](self, "promptForPasscode"));
  return v4;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SURollbackOptions cancelActiveUpdate](self, "cancelActiveUpdate"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SURollbackOptions promptForConsent](self, "promptForConsent"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SURollbackOptions promptForPasscode](self, "promptForPasscode"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("        RollbackOptions:\n            CancelCurrentUpdate:%@\n                promptForConsent:%@\n                promptForPasscode:%@"), v4, v5, v6);
}

@end
