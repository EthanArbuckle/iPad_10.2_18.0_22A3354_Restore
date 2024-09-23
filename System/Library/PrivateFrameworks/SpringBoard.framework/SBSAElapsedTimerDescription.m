@implementation SBSAElapsedTimerDescription

- (id)initElapsedTimerDescriptionWithDescription:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  _BYTE *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "timerDescriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeInterval");
  v7 = v6;

  v10.receiver = self;
  v10.super_class = (Class)SBSAElapsedTimerDescription;
  v8 = -[SBSATimerDescription _initWithIdentifier:timeInterval:](&v10, sel__initWithIdentifier_timeInterval_, v5, v7);

  if (v8)
    v8[24] = 1;
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  _BYTE *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SBSATimerDescription timerDescriptionIdentifier](self, "timerDescriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSATimerDescription timeInterval](self, "timeInterval");
  v6 = (_BYTE *)objc_msgSend(v4, "_initWithIdentifier:timeInterval:", v5);

  v6[24] = self->_elapsed;
  return v6;
}

- (id)_equalsBuilder:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 elapsed;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSAElapsedTimerDescription;
  -[SBSATimerDescription _equalsBuilder:](&v12, sel__equalsBuilder_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  elapsed = self->_elapsed;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__SBSAElapsedTimerDescription__equalsBuilder___block_invoke;
  v10[3] = &unk_1E8EA3E78;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "appendBool:counterpart:", elapsed, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __46__SBSAElapsedTimerDescription__equalsBuilder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isElapsed");
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSAElapsedTimerDescription;
  -[SBSATimerDescription _hashBuilder](&v6, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBool:", self->_elapsed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mutableDescriptionMissingEndAngleBracket
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSAElapsedTimerDescription;
  -[SBSATimerDescription _mutableDescriptionMissingClosingAngleBracket](&v5, sel__mutableDescriptionMissingClosingAngleBracket);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("; isElapsed: %@"), v3);

  return v2;
}

- (BOOL)isElapsed
{
  return self->_elapsed;
}

@end
