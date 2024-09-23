@implementation WFBackgroundShortcutRunnerStateMachine

- (WFBackgroundShortcutRunnerStateMachine)initWithProcessPolicy:(unint64_t)a3
{
  WFBackgroundShortcutRunnerStateMachine *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *delegateQueue;
  WFBackgroundShortcutRunnerStateMachine *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFBackgroundShortcutRunnerStateMachine;
  v4 = -[WFStateMachine init](&v10, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.shortcuts.WFBackgroundShortcutRunnerStateMachine.delegate-queue", v5);
    delegateQueue = v4->_delegateQueue;
    v4->_delegateQueue = (OS_dispatch_queue *)v6;

    v4->_processPolicy = a3;
    v8 = v4;

  }
  return v4;
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return 0;
}

- (BOOL)isRunningShortcut
{
  void *v2;
  char isKindOfClass;

  -[WFStateMachine currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)idleStateWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setStage:", 0);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)handlingRequestStateWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setStage:", 1);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)startRunningShortcutWithEnvironment:(int64_t)a3 reference:(id)a4 isPersonalAutomation:(BOOL)a5 reason:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  WFRunnerRunningState *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  WFBackgroundShortcutRunnerStateMachine *v19;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = -[WFRunnerRunningState initWithEnvironment:isPersonalAutomation:]([WFRunnerRunningState alloc], "initWithEnvironment:isPersonalAutomation:", a3, v7);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __116__WFBackgroundShortcutRunnerStateMachine_startRunningShortcutWithEnvironment_reference_isPersonalAutomation_reason___block_invoke;
  v17 = &unk_1E7AF92C0;
  v18 = v10;
  v19 = self;
  v13 = v10;
  -[WFRunnerRunningState setTimeoutHandler:](v12, "setTimeoutHandler:", &v14);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v12, v11, v14, v15, v16, v17);

}

- (void)stopShortcutWithError:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFStateMachine currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v8, "stage") < 3)
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setStage:", 3);
        if (-[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v10, v7))
        {
          -[WFBackgroundShortcutRunnerStateMachine delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            -[WFBackgroundShortcutRunnerStateMachine delegateQueue](self, "delegateQueue");
            v12 = objc_claimAutoreleasedReturnValue();
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __71__WFBackgroundShortcutRunnerStateMachine_stopShortcutWithError_reason___block_invoke;
            v13[3] = &unk_1E7AF92C0;
            v13[4] = self;
            v14 = v6;
            dispatch_async(v12, v13);

          }
        }

      }
      else
      {
        getWFStateMachineLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "-[WFBackgroundShortcutRunnerStateMachine stopShortcutWithError:reason:]";
          v17 = 2114;
          v18 = v7;
          v19 = 2048;
          v20 = objc_msgSend(v8, "stage");
          _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s stop was requested because %{public}@, but we're already in the process of stopping/finishing (current stage: %lu)", buf, 0x20u);
        }

      }
    }
  }

}

- (void)finishRunningWithReason:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setStage:", 4);
  v9 = -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v8, v7);

  if (v9)
  {
    -[WFBackgroundShortcutRunnerStateMachine delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFBackgroundShortcutRunnerStateMachine delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__WFBackgroundShortcutRunnerStateMachine_finishRunningWithReason_result___block_invoke;
      v12[3] = &unk_1E7AF92C0;
      v12[4] = self;
      v13 = v6;
      dispatch_async(v11, v12);

    }
  }

}

- (void)exitWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFBackgroundShortcutRunnerStateMachine processPolicy](self, "processPolicy") == 1)
  {
    getWFStateMachineLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFBackgroundShortcutRunnerStateMachine exitWithReason:]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s exit was requested for reason '%{public}@', but not exiting because process policy is a shared runner", buf, 0x16u);
    }
  }
  else
  {
    v5 = objc_opt_new();
    -[NSObject setStage:](v5, "setStage:", 5);
    if (-[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4))
    {
      -[WFBackgroundShortcutRunnerStateMachine delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[WFBackgroundShortcutRunnerStateMachine delegateQueue](self, "delegateQueue");
        v7 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__WFBackgroundShortcutRunnerStateMachine_exitWithReason___block_invoke;
        block[3] = &unk_1E7AF94B0;
        block[4] = self;
        dispatch_async(v7, block);

      }
    }
  }

}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFStateMachineLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunnerStateMachine invalidate]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s State machine invalidated", (uint8_t *)&v4, 0xCu);
  }

  -[WFBackgroundShortcutRunnerStateMachine invalidateWithReason:](self, "invalidateWithReason:", CFSTR("state machine invalidated"));
}

- (void)connectionInvalidatedOrInterrupted
{
  -[WFBackgroundShortcutRunnerStateMachine invalidateWithReason:](self, "invalidateWithReason:", CFSTR("connection invalidated/interrupted"));
}

- (void)invalidateWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v5, "stage") > 2)
    {
      if (objc_msgSend(v5, "stage") == 4 || objc_msgSend(v5, "stage") == 5)
      {
        getWFStateMachineLogObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315394;
          v8 = "-[WFBackgroundShortcutRunnerStateMachine invalidateWithReason:]";
          v9 = 2112;
          v10 = v4;
          _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ while finishing shortcut or exiting runner. Exiting should already be in process, not transitioning.", (uint8_t *)&v7, 0x16u);
        }

      }
    }
    else
    {
      -[WFBackgroundShortcutRunnerStateMachine stopShortcutWithError:reason:](self, "stopShortcutWithError:reason:", 0, v4);
    }
  }
  else
  {

    v5 = 0;
  }

}

- (WFBackgroundShortcutRunnerStateMachineDelegate)delegate
{
  return (WFBackgroundShortcutRunnerStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)processPolicy
{
  return self->_processPolicy;
}

- (WFWorkflow)shortcut
{
  return self->_shortcut;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__WFBackgroundShortcutRunnerStateMachine_exitWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runnerStateMachineDidRequestProcessExit:", *(_QWORD *)(a1 + 32));

}

void __73__WFBackgroundShortcutRunnerStateMachine_finishRunningWithReason_result___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runnerStateMachine:didFinishRunningShortcutWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __71__WFBackgroundShortcutRunnerStateMachine_stopShortcutWithError_reason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runnerStateMachine:didRequestStoppingShortcutWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __116__WFBackgroundShortcutRunnerStateMachine_startRunningShortcutWithEnvironment_reference_isPersonalAutomation_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("“%@” took too long to run."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringWithFormat:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("The shortcut took too long to run."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10[0] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Shortcut Timed Out"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x1E0CB2D68];
  v11[0] = v7;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stopShortcutWithError:reason:", v9, CFSTR("runner timed out"));
}

@end
