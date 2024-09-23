@implementation SBSATimerDescription

- (SBSATimerDescription)initWithTimeInterval:(double)a3
{
  id v5;
  SBSATimerDescription *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v6 = -[SBSATimerDescription _initWithIdentifier:timeInterval:](self, "_initWithIdentifier:timeInterval:", v5, a3);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  char v4;

  -[SBSATimerDescription _equalsBuilder:](self, "_equalsBuilder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual");

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBSATimerDescription _hashBuilder](self, "_hashBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v2;

  -[SBSATimerDescription _mutableDescriptionMissingClosingAngleBracket](self, "_mutableDescriptionMissingClosingAngleBracket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  return (NSString *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:timeInterval:", self->_timerDescriptionIdentifier, self->_timeInterval);
}

- (id)_initWithIdentifier:(id)a3 timeInterval:(double)a4
{
  id v8;
  SBSATimerDescription *v9;
  double *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSATimerDescription.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBSATimerDescription;
  v9 = -[SBSATimerDescription init](&v13, sel_init);
  v10 = (double *)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerDescriptionIdentifier, a3);
    v10[2] = a4;
  }

  return v10;
}

- (id)_equalsBuilder:(id)a3
{
  id v4;
  void *v5;
  NSUUID *timerDescriptionIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  double timeInterval;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  timerDescriptionIdentifier = self->_timerDescriptionIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__SBSATimerDescription__equalsBuilder___block_invoke;
  v16[3] = &unk_1E8EA4320;
  v8 = v4;
  v17 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", timerDescriptionIdentifier, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  timeInterval = self->_timeInterval;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __39__SBSATimerDescription__equalsBuilder___block_invoke_2;
  v14[3] = &unk_1E8EA8460;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendDouble:counterpart:", v14, timeInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __39__SBSATimerDescription__equalsBuilder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerDescriptionIdentifier");
}

uint64_t __39__SBSATimerDescription__equalsBuilder___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timeInterval");
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_timerDescriptionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDouble:", self->_timeInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mutableDescriptionMissingClosingAngleBracket
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; timerDescriptionIdentifier: %@; timeInterval: %f>"),
               objc_opt_class(),
               self,
               self->_timerDescriptionIdentifier,
               *(_QWORD *)&self->_timeInterval);
}

- (NSUUID)timerDescriptionIdentifier
{
  return self->_timerDescriptionIdentifier;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDescriptionIdentifier, 0);
}

@end
