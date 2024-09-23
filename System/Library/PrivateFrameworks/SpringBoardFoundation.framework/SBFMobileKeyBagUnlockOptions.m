@implementation SBFMobileKeyBagUnlockOptions

- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3
{
  return -[SBFMobileKeyBagUnlockOptions initWithPasscode:skipSEKeepUserDataOperation:](self, "initWithPasscode:skipSEKeepUserDataOperation:", a3, 0);
}

- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4
{
  id v7;
  SBFMobileKeyBagUnlockOptions *v8;
  SBFMobileKeyBagUnlockOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFMobileKeyBagUnlockOptions;
  v8 = -[SBFMobileKeyBagUnlockOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_passcode, a3);
    v9->_skipSEKeepUserDataOperation = a4;
  }

  return v9;
}

- (NSData)passcode
{
  return self->_passcode;
}

- (BOOL)skipSEKeepUserDataOperation
{
  return self->_skipSEKeepUserDataOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
