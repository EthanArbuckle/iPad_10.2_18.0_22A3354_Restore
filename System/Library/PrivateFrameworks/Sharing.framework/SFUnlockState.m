@implementation SFUnlockState

- (SFUnlockState)initWithUnlockEnabled:(id)a3 remotePasscodeEnabled:(id)a4
{
  id v6;
  id v7;
  SFUnlockState *v8;
  uint64_t v9;
  NSNumber *unlockEnabled;
  uint64_t v11;
  NSNumber *remotePasscodeEnabled;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFUnlockState;
  v8 = -[SFUnlockState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    unlockEnabled = v8->_unlockEnabled;
    v8->_unlockEnabled = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    remotePasscodeEnabled = v8->_remotePasscodeEnabled;
    v8->_remotePasscodeEnabled = (NSNumber *)v11;

  }
  return v8;
}

- (SFUnlockState)initWithCoder:(id)a3
{
  id v4;
  SFUnlockState *v5;
  void *v6;
  uint64_t v7;
  NSNumber *unlockEnabled;
  void *v9;
  uint64_t v10;
  NSNumber *remotePasscodeEnabled;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUnlockState;
  v5 = -[SFUnlockState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnlockEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    unlockEnabled = v5->_unlockEnabled;
    v5->_unlockEnabled = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemotePasscodeEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    remotePasscodeEnabled = v5->_remotePasscodeEnabled;
    v5->_remotePasscodeEnabled = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *unlockEnabled;
  id v5;

  unlockEnabled = self->_unlockEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", unlockEnabled, CFSTR("UnlockEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remotePasscodeEnabled, CFSTR("RemotePasscodeEnabled"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)unlockEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)remotePasscodeEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePasscodeEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
}

@end
