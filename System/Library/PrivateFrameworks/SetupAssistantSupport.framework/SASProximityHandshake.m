@implementation SASProximityHandshake

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[SASProximityHandshake platformType](self, "platformType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("platformType"));

  objc_msgSend(v5, "encodeBool:forKey:", -[SASProximityHandshake hasPasscodeSet](self, "hasPasscodeSet"), CFSTR("hasPasscodeSet"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SASProximityHandshake simplePasscodeType](self, "simplePasscodeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("simplePasscodeType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SASProximityHandshake unlockType](self, "unlockType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("unlockType"));

}

- (SASProximityHandshake)initWithCoder:(id)a3
{
  id v4;
  SASProximityHandshake *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SASProximityHandshake;
  v5 = -[SASProximityHandshake init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityHandshake setPlatformType:](v5, "setPlatformType:", objc_msgSend(v6, "integerValue"));

    -[SASProximityHandshake setHasPasscodeSet:](v5, "setHasPasscodeSet:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPasscodeSet")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simplePasscodeType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityHandshake setSimplePasscodeType:](v5, "setSimplePasscodeType:", objc_msgSend(v7, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unlockType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityHandshake setUnlockType:](v5, "setUnlockType:", objc_msgSend(v8, "integerValue"));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)loadInformation
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[SASProximityHandshake setPlatformType:](self, "setPlatformType:", 1);
  v5 = 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityHandshake setUnlockType:](self, "setUnlockType:", objc_msgSend(v3, "unlockScreenTypeWithOutSimplePasscodeType:", &v5));

  -[SASProximityHandshake setSimplePasscodeType:](self, "setSimplePasscodeType:", v5);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityHandshake setHasPasscodeSet:](self, "setHasPasscodeSet:", objc_msgSend(v4, "isPasscodeSet"));

}

- (int64_t)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(int64_t)a3
{
  self->_platformType = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (int)simplePasscodeType
{
  return self->_simplePasscodeType;
}

- (void)setSimplePasscodeType:(int)a3
{
  self->_simplePasscodeType = a3;
}

- (int)unlockType
{
  return self->_unlockType;
}

- (void)setUnlockType:(int)a3
{
  self->_unlockType = a3;
}

@end
