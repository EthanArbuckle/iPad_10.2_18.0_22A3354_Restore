@implementation HKSPStateMachineContext

- (HKSPStateMachineContext)initWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5
{
  id v9;
  id v10;
  HKSPStateMachineContext *v11;
  HKSPStateMachineContext *v12;
  HKSPStateMachineContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPStateMachineContext;
  v11 = -[HKSPStateMachineContext init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_nextState, a3);
    objc_storeStrong((id *)&v12->_previousState, a4);
    v12->_isInitializing = a5;
    v13 = v12;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIsInitializing:", -[HKSPStateMachineContext isInitializing](self, "isInitializing"));
  -[HKSPStateMachineContext nextState](self, "nextState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextState:", v5);

  -[HKSPStateMachineContext previousState](self, "previousState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreviousState:", v6);

  return v4;
}

- (HKSPStateMachineContext)contextWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)-[HKSPStateMachineContext copy](self, "copy");
  objc_msgSend(v10, "setNextState:", v9);

  objc_msgSend(v10, "setPreviousState:", v8);
  objc_msgSend(v10, "setIsInitializing:", v5);
  return (HKSPStateMachineContext *)v10;
}

- (BOOL)hasStateTransition
{
  HKSPStateMachineState *nextState;

  nextState = self->_nextState;
  if (nextState && self->_previousState)
    return -[HKSPStateMachineState isMemberOfClass:](nextState, "isMemberOfClass:", objc_opt_class()) ^ 1;
  else
    return 1;
}

- (BOOL)hasStateTransitionAndNotInitializing
{
  _BOOL4 v3;

  v3 = -[HKSPStateMachineContext hasStateTransition](self, "hasStateTransition");
  if (v3)
    LOBYTE(v3) = !self->_isInitializing;
  return v3;
}

- (BOOL)hasStateTransitionOrInitializing
{
  return -[HKSPStateMachineContext hasStateTransition](self, "hasStateTransition") || self->_isInitializing;
}

- (id)description
{
  return -[HKSPStateMachineContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPStateMachineContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HKSPStateMachineContext isInitializing](self, "isInitializing"), CFSTR("isInitializing"), 1);
  -[HKSPStateMachineContext nextState](self, "nextState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("nextState"));

  -[HKSPStateMachineContext previousState](self, "previousState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("previousState"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPStateMachineContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (HKSPStateMachineState)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
  objc_storeStrong((id *)&self->_nextState, a3);
}

- (HKSPStateMachineState)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_previousState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
