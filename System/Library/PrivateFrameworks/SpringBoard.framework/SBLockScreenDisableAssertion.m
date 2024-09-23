@implementation SBLockScreenDisableAssertion

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0DAC298], "setLockScreenDisableAssertionClass:", objc_opt_class());
}

- (SBLockScreenDisableAssertion)initWithIdentifier:(id)a3
{
  id v4;
  SBLockScreenDisableAssertion *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  SBFAuthenticationAssertion *disableLockAssertion;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBLockScreenDisableAssertion;
  v5 = -[SBLockScreenDisableAssertion init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend((id)SBApp, "authenticationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createKeybagUnlockAssertionWithReason:", v5->_identifier);
    v9 = objc_claimAutoreleasedReturnValue();
    disableLockAssertion = v5->_disableLockAssertion;
    v5->_disableLockAssertion = (SBFAuthenticationAssertion *)v9;

    -[SBFAuthenticationAssertion activate](v5->_disableLockAssertion, "activate");
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addLockScreenDisableAssertion:", v5);

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: reason %@>"), v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLockScreenDisableAssertion:", self);

  -[SBFAuthenticationAssertion invalidate](self->_disableLockAssertion, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenDisableAssertion;
  -[SBLockScreenDisableAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLockScreenDisableAssertion:", self);

  -[SBFAuthenticationAssertion invalidate](self->_disableLockAssertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLockAssertion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
