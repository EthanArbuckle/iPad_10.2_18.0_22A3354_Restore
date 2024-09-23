@implementation SBFMutableMobileKeyBagState

- (SBFMutableMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4
{
  SBFMutableMobileKeyBagState *v5;
  SBFMutableMobileKeyBagState *v6;
  uint64_t v7;
  NSDictionary *state;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFMutableMobileKeyBagState;
  v5 = -[SBFMobileKeyBagState initWithKeyBagInfo:extended:](&v10, sel_initWithKeyBagInfo_extended_, a3);
  v6 = v5;
  if (v5)
  {
    v7 = -[NSDictionary mutableCopy](v5->super._state, "mutableCopy");
    state = v6->super._state;
    v6->super._state = (NSDictionary *)v7;

    v6->super._extended = a4;
  }
  return v6;
}

- (SBFMutableMobileKeyBagState)init
{
  return -[SBFMutableMobileKeyBagState initWithKeyBagInfo:extended:](self, "initWithKeyBagInfo:extended:", MEMORY[0x1E0C9AA70], 0);
}

- (id)_mutableState
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFMobileKeyBagState.m"), 265, CFSTR("Unexpected non-mutable _state"));

  }
  return self->super._state;
}

- (void)setLockState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if ((unint64_t)(a3 - 1) > 6)
    v4 = 0;
  else
    v4 = qword_18AC15F20[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kSBFKeyBagInfoLockState"));

}

- (void)setBackOffTime:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSBFKeyBagInfoBackOff"));

}

- (void)setFailedAttemptCount:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSBFKeyBagInfoFailedAttempts"));

}

- (void)setPermanentlyBlocked:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSBFKeyBagInfoPermanentlyBlocked"));

}

- (void)setShouldWipe:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSBFKeyBagInfoShouldWipe"));

}

- (void)setRecoveryRequired:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->super._state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "longLongValue");
  v6 = 32;
  if (!v3)
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFFFFFFDFLL | v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("kSBFKeyBagInfoKeyBagState"));

}

- (void)setRecoveryPossible:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->super._state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "longLongValue");
  v6 = 64;
  if (v3)
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFFFFFFBFLL | v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("kSBFKeyBagInfoKeyBagState"));

}

- (void)setRecoveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->super._state, "objectForKeyedSubscript:", CFSTR("kSBFKeyBagInfoKeyBagState"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "longLongValue");
  v6 = 512;
  if (!v3)
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFFFFFDFFLL | v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("kSBFKeyBagInfoKeyBagState"));

}

- (void)setEscrowCount:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFMutableMobileKeyBagState _mutableState](self, "_mutableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSBFKeyBagInfoRecoveryCountdown"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBFMobileKeyBagState initWithKeyBagInfo:extended:]([SBFMobileKeyBagState alloc], "initWithKeyBagInfo:extended:", self->super._state, self->super._extended);
}

@end
