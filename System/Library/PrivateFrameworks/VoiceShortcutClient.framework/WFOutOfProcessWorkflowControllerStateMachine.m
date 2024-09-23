@implementation WFOutOfProcessWorkflowControllerStateMachine

- (WFOutOfProcessWorkflowControllerStateMachine)init
{
  WFOutOfProcessWorkflowControllerStateMachine *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *delegateQueue;
  WFOutOfProcessWorkflowControllerStateMachine *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFOutOfProcessWorkflowControllerStateMachine;
  v2 = -[WFStateMachine init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.shortcuts.WFOutOfProcessWorkflowControllerStateMachine.delegate-queue", v3);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return 0;
}

- (BOOL)isRunningShortcut
{
  void *v2;
  BOOL v3;

  -[WFStateMachine currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v2, "stage") == 3;

  return v3;
}

- (BOOL)isFinishingShortcut
{
  void *v2;
  BOOL v3;

  -[WFStateMachine currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v2, "stage") == 6;

  return v3;
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

- (void)handlingRequestWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setStage:", 1);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)acquiringRunnerWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setStage:", 2);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)startRunningShortcutWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setStage:", 3);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)pauseAndWriteShortcutToDiskState
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setStage:", 4);
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v3, CFSTR("pause and write shortcut to disk requested"));

}

- (void)stopShortcutWithError:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFStateMachine currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setStage:", 5);
      if ((unint64_t)objc_msgSend(v8, "stage") > 1)
      {
        if (objc_msgSend(v8, "stage") != 2)
        {
          if (objc_msgSend(v8, "stage") == 3)
          {
            if (-[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v9, v7))
            {
              -[WFOutOfProcessWorkflowControllerStateMachine delegate](self, "delegate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                -[WFOutOfProcessWorkflowControllerStateMachine delegateQueue](self, "delegateQueue");
                v12 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __77__WFOutOfProcessWorkflowControllerStateMachine_stopShortcutWithError_reason___block_invoke;
                block[3] = &unk_1E5FC7AC0;
                block[4] = self;
                v15 = v6;
                dispatch_async(v12, block);

              }
            }
          }
          else if ((unint64_t)objc_msgSend(v8, "stage") >= 4)
          {
            getWFVoiceShortcutClientLogObject();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v17 = "-[WFOutOfProcessWorkflowControllerStateMachine stopShortcutWithError:reason:]";
              v18 = 2048;
              v19 = objc_msgSend(v8, "stage");
              _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_DEFAULT, "%s stop was requested, but we're ignoring it because the current stage (%lu) will already result in a stop.", buf, 0x16u);
            }

          }
          goto LABEL_8;
        }
        -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v9, v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stop was requested because %@, tearing down runner"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFOutOfProcessWorkflowControllerStateMachine tearDownRunnerWithReason:](self, "tearDownRunnerWithReason:", v10);
      }
      else
      {
        -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v9, v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stop was requested because %@, but we haven't yet acquired a runner, so just exiting"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFOutOfProcessWorkflowControllerStateMachine exitWithReason:](self, "exitWithReason:", v10);
      }

LABEL_8:
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
  objc_msgSend(v8, "setStage:", 6);
  v9 = -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v8, v7);

  if (v9)
  {
    -[WFOutOfProcessWorkflowControllerStateMachine delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFOutOfProcessWorkflowControllerStateMachine delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__WFOutOfProcessWorkflowControllerStateMachine_finishRunningWithReason_result___block_invoke;
      v12[3] = &unk_1E5FC7AC0;
      v12[4] = self;
      v13 = v6;
      dispatch_async(v11, v12);

    }
  }

}

- (void)notifyDelegateWithReason:(id)a3 result:(id)a4 currentDialogAttribution:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFStateMachine currentState](self, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v11, "stage") < 7)
      {
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setStage:", 7);
        if (-[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v13, v8))
        {
          -[WFOutOfProcessWorkflowControllerStateMachine delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[WFOutOfProcessWorkflowControllerStateMachine delegateQueue](self, "delegateQueue");
            v15 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __105__WFOutOfProcessWorkflowControllerStateMachine_notifyDelegateWithReason_result_currentDialogAttribution___block_invoke;
            block[3] = &unk_1E5FC7260;
            block[4] = self;
            v17 = v9;
            v18 = v10;
            dispatch_async(v15, block);

          }
        }

      }
      else
      {
        getWFVoiceShortcutClientLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WFOutOfProcessWorkflowControllerStateMachine notifyDelegateWithReason:result:currentDialogAttribution:]";
          v21 = 2112;
          v22 = v8;
          _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_DEFAULT, "%s Asked to notify delegate because %@ but we're already >= notifying delegate. Ignoring the request.", buf, 0x16u);
        }

      }
    }
  }

}

- (void)tearDownRunnerWithReason:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setStage:", 8);
  v6 = -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

  if (v6)
  {
    -[WFOutOfProcessWorkflowControllerStateMachine delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFOutOfProcessWorkflowControllerStateMachine delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__WFOutOfProcessWorkflowControllerStateMachine_tearDownRunnerWithReason___block_invoke;
      block[3] = &unk_1E5FC7288;
      block[4] = self;
      dispatch_async(v8, block);

    }
  }

}

- (void)exitWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v5, v4);

}

- (void)handleXPCErrorWithDescription:(id)a3 reason:(id)a4 currentDialogAttribution:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  WFWorkflowRunResult *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFStateMachine currentState](self, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v11, "stage") <= 6)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = WFOutOfProcessWorkflowControllerErrorDomain;
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[WFWorkflowRunResult initWithError:]([WFWorkflowRunResult alloc], "initWithError:", v15);
      -[WFOutOfProcessWorkflowControllerStateMachine notifyDelegateWithReason:result:currentDialogAttribution:](self, "notifyDelegateWithReason:result:currentDialogAttribution:", v9, v16, v10);

    }
  }
  else
  {

    v11 = 0;
  }

}

- (void)handleRunnerWillExit
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[WFStateMachine currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v6 = v3, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v3 = v6, (isKindOfClass & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v6, "stage") > 4)
    {
      getWFVoiceShortcutClientLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v8 = "-[WFOutOfProcessWorkflowControllerStateMachine handleRunnerWillExit]";
        _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEFAULT, "%s Runner will exit, but we're already in the proper cleanup. Ignore.", buf, 0xCu);
      }

    }
    else
    {
      -[WFOutOfProcessWorkflowControllerStateMachine stopShortcutWithError:reason:](self, "stopShortcutWithError:reason:", 0, CFSTR("runner notified us of exit, moving to stop and cleanup"));

    }
  }
  else
  {

  }
}

- (void)invalidate
{
  -[WFOutOfProcessWorkflowControllerStateMachine stopShortcutWithError:reason:](self, "stopShortcutWithError:reason:", 0, CFSTR("state machine invalidated"));
}

- (WFOutOfProcessWorkflowControllerStateMachineDelegate)delegate
{
  return (WFOutOfProcessWorkflowControllerStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __73__WFOutOfProcessWorkflowControllerStateMachine_tearDownRunnerWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerStateMachineDidRequestRunnerTearDown:", *(_QWORD *)(a1 + 32));

}

void __105__WFOutOfProcessWorkflowControllerStateMachine_notifyDelegateWithReason_result_currentDialogAttribution___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerStateMachine:shouldNotifyDelegateWithResult:currentDialogAttribution:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[WFOutOfProcessWorkflowControllerStateMachine notifyDelegateWithReason:result:currentDialogAttribution:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEFAULT, "%s Notifying delegate with result: %@", (uint8_t *)&v5, 0x16u);
  }

}

void __79__WFOutOfProcessWorkflowControllerStateMachine_finishRunningWithReason_result___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerStateMachine:didFinishRunningShortcutWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __77__WFOutOfProcessWorkflowControllerStateMachine_stopShortcutWithError_reason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerStateMachine:didRequestStoppingShortcutWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
