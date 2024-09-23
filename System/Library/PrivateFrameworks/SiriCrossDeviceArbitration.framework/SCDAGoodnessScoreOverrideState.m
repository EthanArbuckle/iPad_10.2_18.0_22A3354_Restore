@implementation SCDAGoodnessScoreOverrideState

- (SCDAGoodnessScoreOverrideState)initWithBuilder:(id)a3
{
  void (**v4)(id, _SCDAGoodnessScoreOverrideStateMutation *);
  SCDAGoodnessScoreOverrideState *v5;
  SCDAGoodnessScoreOverrideState *v6;
  _SCDAGoodnessScoreOverrideStateMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v4 = (void (**)(id, _SCDAGoodnessScoreOverrideStateMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SCDAGoodnessScoreOverrideState;
  v5 = -[SCDAGoodnessScoreOverrideState init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SCDAGoodnessScoreOverrideStateMutation initWithBase:]([_SCDAGoodnessScoreOverrideStateMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SCDAGoodnessScoreOverrideStateMutation isDirty](v7, "isDirty"))
    {
      v6->_overrideOption = -[_SCDAGoodnessScoreOverrideStateMutation getOverrideOption](v7, "getOverrideOption");
      -[_SCDAGoodnessScoreOverrideStateMutation getReason](v7, "getReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v9;

    }
  }

  return v6;
}

- (SCDAGoodnessScoreOverrideState)init
{
  return -[SCDAGoodnessScoreOverrideState initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SCDAGoodnessScoreOverrideState)initWithOverrideOption:(int64_t)a3 reason:(id)a4
{
  id v6;
  id v7;
  SCDAGoodnessScoreOverrideState *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__SCDAGoodnessScoreOverrideState_initWithOverrideOption_reason___block_invoke;
  v10[3] = &unk_25174A5F0;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = -[SCDAGoodnessScoreOverrideState initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[SCDAGoodnessScoreOverrideState _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t overrideOption;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SCDAGoodnessScoreOverrideState;
  -[SCDAGoodnessScoreOverrideState description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  overrideOption = self->_overrideOption;
  if (overrideOption > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_25174A470[overrideOption];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {overrideOption = %@, reason = %@}"), v5, v8, self->_reason);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_overrideOption);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_reason, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SCDAGoodnessScoreOverrideState *v4;
  SCDAGoodnessScoreOverrideState *v5;
  int64_t overrideOption;
  NSString *v7;
  NSString *reason;
  BOOL v9;

  v4 = (SCDAGoodnessScoreOverrideState *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      overrideOption = self->_overrideOption;
      if (overrideOption == -[SCDAGoodnessScoreOverrideState overrideOption](v5, "overrideOption"))
      {
        -[SCDAGoodnessScoreOverrideState reason](v5, "reason");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        reason = self->_reason;
        v9 = reason == v7 || -[NSString isEqual:](reason, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SCDAGoodnessScoreOverrideState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SCDAGoodnessScoreOverrideState *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAGoodnessScoreOverrideState::overrideOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAGoodnessScoreOverrideState::reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SCDAGoodnessScoreOverrideState initWithOverrideOption:reason:](self, "initWithOverrideOption:reason:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t overrideOption;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  overrideOption = self->_overrideOption;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", overrideOption);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SCDAGoodnessScoreOverrideState::overrideOption"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_reason, CFSTR("SCDAGoodnessScoreOverrideState::reason"));
}

- (int64_t)overrideOption
{
  return self->_overrideOption;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

void __64__SCDAGoodnessScoreOverrideState_initWithOverrideOption_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setOverrideOption:", v3);
  objc_msgSend(v4, "setReason:", *(_QWORD *)(a1 + 32));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SCDAGoodnessScoreOverrideStateMutation *);
  _SCDAGoodnessScoreOverrideStateMutation *v5;
  SCDAGoodnessScoreOverrideState *v6;
  void *v7;
  uint64_t v8;
  NSString *reason;

  v4 = (void (**)(id, _SCDAGoodnessScoreOverrideStateMutation *))a3;
  if (v4)
  {
    v5 = -[_SCDAGoodnessScoreOverrideStateMutation initWithBase:]([_SCDAGoodnessScoreOverrideStateMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SCDAGoodnessScoreOverrideStateMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SCDAGoodnessScoreOverrideState);
      v6->_overrideOption = -[_SCDAGoodnessScoreOverrideStateMutation getOverrideOption](v5, "getOverrideOption");
      -[_SCDAGoodnessScoreOverrideStateMutation getReason](v5, "getReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v8;

    }
    else
    {
      v6 = (SCDAGoodnessScoreOverrideState *)-[SCDAGoodnessScoreOverrideState copy](self, "copy");
    }

  }
  else
  {
    v6 = (SCDAGoodnessScoreOverrideState *)-[SCDAGoodnessScoreOverrideState copy](self, "copy");
  }

  return v6;
}

@end
