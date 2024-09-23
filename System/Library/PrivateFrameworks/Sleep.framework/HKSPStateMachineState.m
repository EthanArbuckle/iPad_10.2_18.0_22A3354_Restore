@implementation HKSPStateMachineState

- (HKSPStateMachineState)initWithStateMachine:(id)a3
{
  id v4;
  HKSPStateMachineState *v5;
  HKSPStateMachineState *v6;
  HKSPStateMachineState *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPStateMachineState;
  v5 = -[HKSPStateMachineState init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_stateMachine, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isCurrentState
{
  HKSPStateMachineState *v2;
  void *v3;
  HKSPStateMachineState *v4;

  v2 = self;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (HKSPStateMachineState *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v2;

  return (char)v2;
}

- (BOOL)_willEnter
{
  -[HKSPStateMachineState willEnter](self, "willEnter");
  return 1;
}

- (HKSPStateMachine)stateMachine
{
  return (HKSPStateMachine *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (id)stateName
{
  return &stru_1E4E3E220;
}

- (id)stateIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isEqual:(id)a3
{
  HKSPStateMachineState *v4;
  void *v5;
  char v6;

  v4 = (HKSPStateMachineState *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKSPStateMachineState equalsBuilderWithObject:](self, "equalsBuilderWithObject:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual");

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v4 + 1, v5);

  return v4;
}

- (id)equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateName](self, "stateName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HKSPStateMachineState_equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E4E3B360;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  return v5;
}

uint64_t __49__HKSPStateMachineState_equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateName");
}

- (NSString)description
{
  return (NSString *)-[HKSPStateMachineState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPStateMachineState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateName](self, "stateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("stateName"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPStateMachineState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateMachine);
}

@end
