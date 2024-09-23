@implementation WFStateMachine

- (WFStateMachine)init
{
  WFStateMachine *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *timerQueue;
  os_activity_t v6;
  OS_os_activity *activity;
  uint64_t v8;
  NSMutableArray *mutableStateHistory;
  WFStateMachine *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFStateMachine;
  v2 = -[WFStateMachine init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.shortcuts.WFStateMachine.timer", v3);
    timerQueue = v2->_timerQueue;
    v2->_timerQueue = (OS_dispatch_queue *)v4;

    v2->_transitionLock._os_unfair_lock_opaque = 0;
    v6 = _os_activity_create(&dword_1AF681000, "WFStateMachine", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v2->_activity;
    v2->_activity = (OS_os_activity *)v6;

    v2->_invalidated = 0;
    v8 = objc_opt_new();
    mutableStateHistory = v2->_mutableStateHistory;
    v2->_mutableStateHistory = (NSMutableArray *)v8;

    *(_WORD *)&v2->_blocksTransitionsOnInvalidation = 1;
    v10 = v2;

  }
  return v2;
}

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  os_unfair_lock_s *p_transitionLock;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  NSObject *v19;
  WFDispatchSourceTimer *v20;
  void *v21;
  uint64_t v22;
  id *p_timer;
  WFDispatchSourceTimer *timer;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  _BOOL4 v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  p_transitionLock = &self->_transitionLock;
  os_unfair_lock_assert_not_owner(&self->_transitionLock);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStateMachine.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

    if (v8)
      goto LABEL_3;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStateMachine.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionReason"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_29;
LABEL_3:
  os_unfair_lock_lock(&self->_transitionLock);
  -[WFStateMachine currentState](self, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || (objc_msgSend(v10, "canTransitionToState:", v7) & 1) != 0)
  {
    -[WFStateMachine lock_addTransitionEventToHistoryWithState:reason:valid:](self, "lock_addTransitionEventToHistoryWithState:reason:valid:", v7, v8, 1);
    -[WFStateMachine lock_cancelPendingTimers](self, "lock_cancelPendingTimers");
    -[WFStateMachine setCurrentState:](self, "setCurrentState:", v7);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    -[WFStateMachine activity](self, "activity");
    v12 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v12, &state);

    getWFVoiceShortcutClientLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "-[WFStateMachine transitionToState:withReason:]";
      v41 = 2112;
      v42 = *(double *)&v11;
      v43 = 2112;
      v44 = v7;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_DEFAULT, "%s Transitioning from %@ to %@, reason: %@", buf, 0x2Au);
    }

    v14 = v7;
    v15 = v14;
    if (v7)
    {
      if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEE82F18))
      {
        v16 = v15;
        if (!objc_msgSend(v15, "shouldStartTimer"))
        {
LABEL_19:
          os_unfair_lock_unlock(p_transitionLock);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "performAction");

          os_activity_scope_leave(&state);
          v30 = 1;
          goto LABEL_27;
        }
        objc_msgSend(v15, "timeoutDuration");
        v18 = v17;
        getWFVoiceShortcutClientLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[WFStateMachine transitionToState:withReason:]";
          v41 = 2048;
          v42 = v18;
          _os_log_impl(&dword_1AF681000, v19, OS_LOG_TYPE_DEFAULT, "%s This is a timed state - setting timer with a timeout of %f seconds", buf, 0x16u);
        }

        v20 = [WFDispatchSourceTimer alloc];
        -[WFStateMachine timerQueue](self, "timerQueue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __47__WFStateMachine_transitionToState_withReason___block_invoke;
        v36[3] = &unk_1E5FC7288;
        v16 = v15;
        v37 = v16;
        v22 = -[WFDispatchSourceTimer initWithInterval:queue:handler:](v20, "initWithInterval:queue:handler:", v21, v36, v18);
        timer = self->_timer;
        p_timer = (id *)&self->_timer;
        *p_timer = (id)v22;

        objc_msgSend(*p_timer, "start");
        v25 = v37;
      }
      else
      {
        v16 = 0;
        v25 = v15;
      }
    }
    else
    {
      v25 = 0;
      v16 = 0;
    }

    goto LABEL_19;
  }
  -[WFStateMachine lock_addTransitionEventToHistoryWithState:reason:valid:](self, "lock_addTransitionEventToHistoryWithState:reason:valid:", v7, v8, 0);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[WFStateMachine activity](self, "activity");
  v26 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v26, &state);

  v27 = -[WFStateMachine silentlyDropInvalidTransitions](self, "silentlyDropInvalidTransitions");
  getWFVoiceShortcutClientLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "-[WFStateMachine transitionToState:withReason:]";
      v41 = 2112;
      v42 = *(double *)&v11;
      v43 = 2112;
      v44 = v7;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_1AF681000, v29, OS_LOG_TYPE_DEBUG, "%s Invalid transition from current state: %@ to new state: %@, reason: %@ (Silently dropping.)", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    -[WFStateMachine lock_printedStateHistory](self, "lock_printedStateHistory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v40 = "-[WFStateMachine transitionToState:withReason:]";
    v41 = 2112;
    v42 = *(double *)&v11;
    v43 = 2112;
    v44 = v7;
    v45 = 2112;
    v46 = v8;
    v47 = 2112;
    v48 = v31;
    _os_log_impl(&dword_1AF681000, v29, OS_LOG_TYPE_FAULT, "%s Invalid transition from current state: %@ to new state: %@, reason: %@, events: %@", buf, 0x34u);

  }
  v32 = -[WFStateMachine lock_prepareForInvalidation](self, "lock_prepareForInvalidation");
  os_unfair_lock_unlock(&self->_transitionLock);
  if (v32)
    -[WFStateMachine invalidate](self, "invalidate");
  os_activity_scope_leave(&state);
  v30 = 0;
LABEL_27:

  return v30;
}

- (NSArray)stateHistory
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_transitionLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__WFStateMachine_stateHistory__block_invoke;
  aBlock[3] = &unk_1E5FC7288;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFStateMachine mutableStateHistory](self, "mutableStateHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v3[2](v3);
  return (NSArray *)v5;
}

- (BOOL)lock_prepareForInvalidation
{
  BOOL v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_transitionLock);
  -[WFStateMachine lock_cancelPendingTimers](self, "lock_cancelPendingTimers");
  v3 = -[WFStateMachine isInvalidated](self, "isInvalidated");
  if (!v3)
  {
    -[WFStateMachine setInvalidated:](self, "setInvalidated:", 1);
    if (-[WFStateMachine blocksTransitionsOnInvalidation](self, "blocksTransitionsOnInvalidation"))
    {
      v4 = (void *)objc_opt_new();
      -[WFStateMachine setCurrentState:](self, "setCurrentState:", v4);

    }
  }
  return !v3;
}

- (void)lock_cancelPendingTimers
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  os_unfair_lock_assert_owner(&self->_transitionLock);
  -[WFStateMachine timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFStateMachine timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCancelled");

    if ((v6 & 1) == 0)
    {
      -[WFStateMachine timer](self, "timer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancel");

    }
  }
}

- (void)lock_addTransitionEventToHistoryWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  _BOOL8 v5;
  os_unfair_lock_s *p_transitionLock;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  p_transitionLock = &self->_transitionLock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(p_transitionLock);
  +[WFStateMachineTransitionEvent transitionEventWithState:reason:valid:](WFStateMachineTransitionEvent, "transitionEventWithState:reason:valid:", v10, v9, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[WFStateMachine mutableStateHistory](self, "mutableStateHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

}

- (id)lock_printedStateHistory
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_transitionLock);
  -[WFStateMachine mutableStateHistory](self, "mutableStateHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" -> "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFState)currentState
{
  return (WFState *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return self->_blocksTransitionsOnInvalidation;
}

- (void)setBlocksTransitionsOnInvalidation:(BOOL)a3
{
  self->_blocksTransitionsOnInvalidation = a3;
}

- (BOOL)silentlyDropInvalidTransitions
{
  return self->_silentlyDropInvalidTransitions;
}

- (void)setSilentlyDropInvalidTransitions:(BOOL)a3
{
  self->_silentlyDropInvalidTransitions = a3;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (os_unfair_lock_s)transitionLock
{
  return self->_transitionLock;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (WFDispatchSourceTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSMutableArray)mutableStateHistory
{
  return self->_mutableStateHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableStateHistory, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

void __30__WFStateMachine_stateHistory__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

uint64_t __47__WFStateMachine_transitionToState_withReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[WFStateMachine transitionToState:withReason:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_DEFAULT, "%s State %@ hit a timeout, cancelling it", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
