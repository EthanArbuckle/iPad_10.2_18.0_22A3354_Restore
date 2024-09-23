@implementation WFStateMachineTransitionEvent

- (WFStateMachineTransitionEvent)initWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  id v9;
  id v10;
  WFStateMachineTransitionEvent *v11;
  WFStateMachineTransitionEvent *v12;
  uint64_t v13;
  NSString *reason;
  WFStateMachineTransitionEvent *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFStateMachineTransitionEvent;
  v11 = -[WFStateMachineTransitionEvent init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_state, a3);
    v13 = objc_msgSend(v10, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v12->_valid = a5;
    v15 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[WFStateMachineTransitionEvent isValid](self, "isValid"))
    v4 = &stru_1E5FC92C0;
  else
    v4 = CFSTR("<INVALID TRANSITION>");
  -[WFStateMachineTransitionEvent state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStateMachineTransitionEvent reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@, reason: %@]"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFState)state
{
  return self->_state;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (id)transitionEventWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:reason:valid:", v9, v8, v5);

  return v10;
}

@end
