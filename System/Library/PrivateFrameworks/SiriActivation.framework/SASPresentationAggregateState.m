@implementation SASPresentationAggregateState

- (SASPresentationAggregateState)initWithBuilder:(id)a3
{
  SASPresentationAggregateState *v4;

  v4 = +[SASPresentationAggregateState newWithBuilder:](SASPresentationAggregateState, "newWithBuilder:", a3);

  return v4;
}

- (SASPresentationAggregateState)initWithCanAcceptNewActivations:(BOOL)a3 didNewActivationAcceptanceChange:(BOOL)a4 requestState:(int64_t)a5
{
  SASPresentationAggregateState *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SASPresentationAggregateState;
  result = -[SASPresentationAggregateState init](&v9, sel_init);
  if (result)
  {
    result->_canAcceptNewActivations = a3;
    result->_didNewActivationAcceptanceChange = a4;
    result->_requestState = a5;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)SASPresentationAggregateState;
  -[SASPresentationAggregateState description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_canAcceptNewActivations)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("canAcceptNewActivations = %@"), v6);
  v19[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_didNewActivationAcceptanceChange)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("didNewActivationAcceptanceChange = %@"), v9);
  v19[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("requestState = %@"), v12);
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v15);

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canAcceptNewActivations);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didNewActivationAcceptanceChange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SASPresentationAggregateState *v4;
  SASPresentationAggregateState *v5;
  _BOOL4 canAcceptNewActivations;
  _BOOL4 didNewActivationAcceptanceChange;
  int64_t requestState;
  BOOL v9;

  v4 = (SASPresentationAggregateState *)a3;
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
      canAcceptNewActivations = self->_canAcceptNewActivations;
      if (canAcceptNewActivations == -[SASPresentationAggregateState canAcceptNewActivations](v5, "canAcceptNewActivations")&& (didNewActivationAcceptanceChange = self->_didNewActivationAcceptanceChange, didNewActivationAcceptanceChange == -[SASPresentationAggregateState didNewActivationAcceptanceChange](v5, "didNewActivationAcceptanceChange")))
      {
        requestState = self->_requestState;
        v9 = requestState == -[SASPresentationAggregateState requestState](v5, "requestState");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASPresentationAggregateState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASPresentationAggregateState::canAcceptNewActivations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASPresentationAggregateState::didNewActivationAcceptanceChange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASPresentationAggregateState::requestState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  return -[SASPresentationAggregateState initWithCanAcceptNewActivations:didNewActivationAcceptanceChange:requestState:](self, "initWithCanAcceptNewActivations:didNewActivationAcceptanceChange:requestState:", v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 canAcceptNewActivations;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  canAcceptNewActivations = self->_canAcceptNewActivations;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", canAcceptNewActivations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SASPresentationAggregateState::canAcceptNewActivations"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didNewActivationAcceptanceChange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SASPresentationAggregateState::didNewActivationAcceptanceChange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestState);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("SASPresentationAggregateState::requestState"));

}

- (BOOL)canAcceptNewActivations
{
  return self->_canAcceptNewActivations;
}

- (BOOL)didNewActivationAcceptanceChange
{
  return self->_didNewActivationAcceptanceChange;
}

- (int64_t)requestState
{
  return self->_requestState;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SASPresentationAggregateStateMutation *);
  _SASPresentationAggregateStateMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SASPresentationAggregateStateMutation *))a3;
  v4 = objc_alloc_init(_SASPresentationAggregateStateMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SASPresentationAggregateStateMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SASPresentationAggregateStateMutation *);
  _SASPresentationAggregateStateMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SASPresentationAggregateStateMutation *))a3;
  if (v4)
  {
    v5 = -[_SASPresentationAggregateStateMutation initWithBaseModel:]([_SASPresentationAggregateStateMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SASPresentationAggregateStateMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SASPresentationAggregateState copy](self, "copy");
  }

  return v6;
}

@end
