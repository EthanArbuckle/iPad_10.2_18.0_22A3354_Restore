@implementation SRUIFStateMachine

- (SRUIFStateMachine)initWithInitialState:(int64_t)a3
{
  SRUIFStateMachine *v4;
  SRUIFStateMachine *v5;
  uint64_t v6;
  NSMutableDictionary *endStatesByEventByStartState;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SRUIFStateMachine;
  v4 = -[SRUIFStateMachine init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    endStatesByEventByStartState = v5->_endStatesByEventByStartState;
    v5->_endStatesByEventByStartState = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)_setState:(int64_t)a3 forEvent:(int64_t)a4 eventTimeStamp:(double)a5
{
  int64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v9 = -[SRUIFStateMachine state](self, "state");
  -[SRUIFStateMachine _setState:](self, "_setState:", a3);
  -[SRUIFStateMachine delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  -[SRUIFStateMachine delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
    objc_msgSend(v12, "stateMachine:didTransitionFromState:forEvent:eventTimeStamp:", self, v9, a4, a5);
  else
    objc_msgSend(v12, "stateMachine:didTransitionFromState:forEvent:", self, v9, a4);

}

- (id)_descriptionForEvent:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[SRUIFStateMachine delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SRUIFStateMachine delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateMachine:descriptionForEvent:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)addTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SRUIFStateMachine _endStatesByEventByStartState](self, "_endStatesByEventByStartState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SRUIFStateMachine _endStatesByEventByStartState](self, "_endStatesByEventByStartState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, v12);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v13, v14);

}

- (id)_endStateNumberFromDictionary:(id)a3 forEvent:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFStateMachine _endStateNumberFromDictionary:forEvent:].cold.1(v10, self, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SRUIFStateMachine state](self, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)performTransitionForEvent:(int64_t)a3
{
  -[SRUIFStateMachine performTransitionForEvent:eventTimeStamp:](self, "performTransitionForEvent:eventTimeStamp:", a3, (double)mach_absolute_time());
}

- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SRUIFStateMachine _endStatesByEventByStartState](self, "_endStatesByEventByStartState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SRUIFStateMachine state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SRUIFStateMachine _endStateNumberFromDictionary:forEvent:](self, "_endStateNumberFromDictionary:forEvent:", v10, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFStateMachine _setState:forEvent:eventTimeStamp:](self, "_setState:forEvent:eventTimeStamp:", objc_msgSend(v9, "integerValue"), a3, a4);

}

- (SRUIFStateMachineDelegate)delegate
{
  return (SRUIFStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableDictionary)_endStatesByEventByStartState
{
  return self->_endStatesByEventByStartState;
}

- (void)setEndStatesByEventByStartState:(id)a3
{
  objc_storeStrong((id *)&self->_endStatesByEventByStartState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStatesByEventByStartState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_endStateNumberFromDictionary:(uint64_t)a3 forEvent:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(a2, "state");
  objc_msgSend(a2, "_descriptionForEvent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[SRUIFStateMachine _endStateNumberFromDictionary:forEvent:]";
  v10 = 2050;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_219F26000, v5, OS_LOG_TYPE_ERROR, "%s No transition is defined from state %{public}ld for event %{public}@. Let's not change state, then.", (uint8_t *)&v8, 0x20u);

}

@end
