@implementation SRUIFSiriSessionStateHandler

- (SRUIFSiriSessionStateHandler)initWithDelegate:(id)a3
{
  id v4;
  SRUIFSiriSessionStateHandler *v5;
  SRUIFSiriSessionStateHandler *v6;
  uint64_t v7;
  NSSet *siriSessionPassthroughEvents;
  SRUIFSiriSessionStateSignpostLogger *v9;
  SRUIFSiriSessionStateSignpostLogger *signpostLogger;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFSiriSessionStateHandler;
  v5 = -[SRUIFSiriSessionStateHandler init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC26580);
    v7 = objc_claimAutoreleasedReturnValue();
    siriSessionPassthroughEvents = v6->_siriSessionPassthroughEvents;
    v6->_siriSessionPassthroughEvents = (NSSet *)v7;

    v9 = objc_alloc_init(SRUIFSiriSessionStateSignpostLogger);
    signpostLogger = v6->_signpostLogger;
    v6->_signpostLogger = v9;

  }
  return v6;
}

- (id)_stateMachine
{
  SRUIFStateMachine *stateMachine;
  SRUIFStateMachine *v4;
  SRUIFStateMachine *v5;
  uint64_t v6;
  uint64_t v7;

  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    v4 = -[SRUIFStateMachine initWithInitialState:]([SRUIFStateMachine alloc], "initWithInitialState:", 0);
    v5 = self->_stateMachine;
    self->_stateMachine = v4;

    -[SRUIFStateMachine setDelegate:](self->_stateMachine, "setDelegate:", self);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 1, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 1, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 1, 14);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 7);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 10);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 0, 7);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 3, 6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 3, 6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 3, 10);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 3);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 0, 3);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 4);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 0, 4);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 5);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 0, 5);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 2, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 2, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 2);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 0, 2);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 2, 8);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 2, 8);
    if (objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled"))
      v6 = 15;
    else
      v6 = 2;
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 2, v6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 2, 8);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 0, 3);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 0, 4);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 0, 5);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 3, 6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 0, 7);
    if (objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled"))
      -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 0, 6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 1, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 0, 5);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 3, 6);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 0, 7);
    if (objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled"))
      v7 = 15;
    else
      v7 = 2;
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 2, v7);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 2, 4);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 2, 8);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 1, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 1, 12);
    stateMachine = self->_stateMachine;
  }
  return stateMachine;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[SRUIFSiriSessionStateHandler _stateMachine](self, "_stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4
{
  return (id)SRUIFSiriSessionEventGetDescription(a4);
}

- (void)performTransitionForEvent:(int64_t)a3
{
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:eventTimeStamp:](self, "performTransitionForEvent:eventTimeStamp:", a3, (double)mach_absolute_time());
}

- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSSet *siriSessionPassthroughEvents;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SRUIFSiriSessionStateGetDescription(-[SRUIFSiriSessionStateHandler state](self, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SRUIFSiriSessionEventGetDescription(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[SRUIFSiriSessionStateHandler performTransitionForEvent:eventTimeStamp:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s Current state %@; event %@", (uint8_t *)&v14, 0x20u);

  }
  siriSessionPassthroughEvents = self->_siriSessionPassthroughEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(siriSessionPassthroughEvents) = -[NSSet containsObject:](siriSessionPassthroughEvents, "containsObject:", v12);

  if ((_DWORD)siriSessionPassthroughEvents)
  {
    -[SRUIFSiriSessionStateHandler _reportTransitionFromState:toState:forEvent:machAbsoluteTime:](self, "_reportTransitionFromState:toState:forEvent:machAbsoluteTime:", -[SRUIFSiriSessionStateHandler state](self, "state"), -[SRUIFSiriSessionStateHandler state](self, "state"), a3, a4);
  }
  else
  {
    -[SRUIFSiriSessionStateHandler _stateMachine](self, "_stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performTransitionForEvent:eventTimeStamp:", a3, a4);

  }
}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5
{
  id v8;

  v8 = a3;
  -[SRUIFSiriSessionStateHandler stateMachine:didTransitionFromState:forEvent:eventTimeStamp:](self, "stateMachine:didTransitionFromState:forEvent:eventTimeStamp:", v8, a4, a5, (double)mach_absolute_time());

}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5 eventTimeStamp:(double)a6
{
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = -[SRUIFSiriSessionStateHandler state](self, "state", a3);
  v11 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    SRUIFSiriSessionStateGetDescription(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SRUIFSiriSessionStateGetDescription(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SRUIFSiriSessionEventGetDescription(a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[SRUIFSiriSessionStateHandler stateMachine:didTransitionFromState:forEvent:eventTimeStamp:]";
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, "%s From %@; To %@; Event %@", (uint8_t *)&v16, 0x2Au);

  }
  -[SRUIFSiriSessionStateHandler _reportTransitionFromState:toState:forEvent:machAbsoluteTime:](self, "_reportTransitionFromState:toState:forEvent:machAbsoluteTime:", a4, v10, a5, a6);
}

- (void)_reportTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5 machAbsoluteTime:(double)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sessionStateHandler:didTransitionFromState:toState:forEvent:machAbsoluteTime:", self, a3, a4, a5, a6);

  -[SRUIFSiriSessionStateSignpostLogger sessionStateHandler:didTransitionFromState:toState:forEvent:machAbsoluteTime:](self->_signpostLogger, "sessionStateHandler:didTransitionFromState:toState:forEvent:machAbsoluteTime:", self, a3, a4, a5, a6);
}

- (SRUIFSiriSessionStateHandlerDelegate)delegate
{
  return (SRUIFSiriSessionStateHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_signpostLogger, 0);
  objc_storeStrong((id *)&self->_siriSessionPassthroughEvents, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
