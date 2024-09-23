@implementation SBFMobileKeyBagState

- (int64_t)lockState
{
  const __CFString *v2;
  void *v3;
  unint64_t v4;

  if (self->_extended)
    v2 = CFSTR("kSBFKeyBagInfoExtendedLockState");
  else
    v2 = CFSTR("kSBFKeyBagInfoLockState");
  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 <= 7)
    return qword_18AC15EE0[v4];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

- (BOOL)isEffectivelyLocked
{
  unint64_t v2;

  v2 = -[SBFMobileKeyBagState lockState](self, "lockState");
  return (v2 < 7) & (0x46u >> v2);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFMobileKeyBagState lockState](self, "lockState");
  if (v4 > 7)
    v5 = 0;
  else
    v5 = off_1E200F598[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("lockState"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState isEffectivelyLocked](self, "isEffectivelyLocked"), CFSTR("isEffectivelyLocked"));
  return v3;
}

- (BOOL)shouldWipe
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoShouldWipe"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)recoveryRequired
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 5) & 1;

  return v3;
}

- (BOOL)recoveryPossible
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "longLongValue") & 0x40) == 0;

  return v3;
}

- (BOOL)permanentlyBlocked
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoPermanentlyBlocked"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)failedAttemptCount
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoFailedAttempts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (int64_t)escrowCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoRecoveryCountdown"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBFMobileKeyBagState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFMobileKeyBagState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  -[SBFMobileKeyBagState succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState permanentlyBlocked](self, "permanentlyBlocked"), CFSTR("permanentlyBlocked"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState shouldWipe](self, "shouldWipe"), CFSTR("shouldWipe"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState recoveryRequired](self, "recoveryRequired"), CFSTR("recoveryRequired"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState recoveryPossible](self, "recoveryPossible"), CFSTR("recoveryPossible"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SBFMobileKeyBagState backOffTime](self, "backOffTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("backOffTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBFMobileKeyBagState failedAttemptCount](self, "failedAttemptCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("failedAttemptCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SBFMobileKeyBagState escrowCount](self, "escrowCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "appendObject:withName:", v14, CFSTR("escrowCount"));

  return v4;
}

- (double)backOffTime
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoBackOff"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (SBFMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4
{
  id v6;
  SBFMobileKeyBagState *v7;
  uint64_t v8;
  NSDictionary *state;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFMobileKeyBagState;
  v7 = -[SBFMobileKeyBagState init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    state = v7->_state;
    v7->_state = (NSDictionary *)v8;

    v7->_extended = a4;
  }

  return v7;
}

- (SBFMobileKeyBagState)init
{
  return -[SBFMobileKeyBagState initWithKeyBagInfo:extended:](self, "initWithKeyBagInfo:extended:", MEMORY[0x1E0C9AA70], 0);
}

- (BOOL)recoveryEnabled
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 9) & 1;

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBFMutableMobileKeyBagState initWithKeyBagInfo:extended:]([SBFMutableMobileKeyBagState alloc], "initWithKeyBagInfo:extended:", self->_state, self->_extended);
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_state, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSDictionary isEqual:](self->_state, "isEqual:", v4[1])
    && self->_extended == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (id)publicDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFMobileKeyBagState lockState](self, "lockState");
  if (v4 > 7)
    v5 = 0;
  else
    v5 = off_1E200F598[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("lockState"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState isEffectivelyLocked](self, "isEffectivelyLocked"), CFSTR("isEffectivelyLocked"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState permanentlyBlocked](self, "permanentlyBlocked"), CFSTR("permanentlyBlocked"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState recoveryRequired](self, "recoveryRequired"), CFSTR("recoveryRequired"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState recoveryPossible](self, "recoveryPossible"), CFSTR("recoveryPossible"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState shouldWipe](self, "shouldWipe"), CFSTR("shouldWipe"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFMobileKeyBagState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
