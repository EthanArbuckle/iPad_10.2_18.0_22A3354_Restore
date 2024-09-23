@implementation HKSPStateMachine

+ (id)_contextKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@Context"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HKSPStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  id v6;
  id v7;
  HKSPStateMachine *v8;
  HKSPStateMachine *v9;
  HKSPStateMachine *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSPStateMachine;
  v8 = -[HKSPStateMachine init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_infoProvider, v7);
    v10 = v9;
  }

  return v9;
}

- (void)setInitialState:(id)a3
{
  HKSPStateMachineState *v4;
  HKSPStateMachineState *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HKSPStateMachineState *currentState;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (HKSPStateMachineState *)a3;
  if (self->_currentState)
    __assert_rtn("-[HKSPStateMachine setInitialState:]", "HKSPStateMachine.m", 41, "_currentState == nil");
  v5 = v4;
  HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HKSPStateMachine stateMachineName](self, "stateMachineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateName](v5, "stateName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting in state %{public}@", (uint8_t *)&v10, 0x16u);

  }
  currentState = self->_currentState;
  self->_currentState = v5;

}

- (NSArray)allStates
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)currentStateIdentifier
{
  void *v2;
  void *v3;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)perform:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);

  v16 = (void (**)(void))a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_contextKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = v11;

    objc_msgSend(v12, "addObject:", v5);
    objc_msgSend((id)objc_opt_class(), "_contextKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

    v16[2]();
    objc_msgSend((id)objc_opt_class(), "_contextKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeLastObject");

  }
  else
  {
    v16[2]();
  }

}

- (HKSPStateMachineContext)currentContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_contextKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPStateMachineContext *)v6;
}

- (void)enterState:(id)a3
{
  HKSPStateMachineState *v4;
  HKSPStateMachineState *v5;
  HKSPStateMachineState *currentState;
  HKSPStateMachineState *v7;
  HKSPStateMachineState *v8;
  void *v9;
  void *v10;
  HKSPStateMachineContext *v11;
  HKSPStateMachineContext *v12;
  void *v13;
  HKSPStateMachineState *v14;
  HKSPStateMachineState *v15;
  _QWORD v16[4];
  HKSPStateMachineState *v17;
  HKSPStateMachine *v18;
  HKSPStateMachineState *v19;
  BOOL v20;

  v4 = (HKSPStateMachineState *)a3;
  v5 = v4;
  currentState = self->_currentState;
  if (currentState == v4)
    v7 = (HKSPStateMachineState *)-[HKSPStateMachineState copy](v4, "copy");
  else
    v7 = currentState;
  v8 = v7;
  -[HKSPStateMachine currentContext](self, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init(HKSPStateMachineContext);
  v12 = v11;

  -[HKSPStateMachineContext contextWithNextState:previousState:isInitializing:](v12, "contextWithNextState:previousState:isInitializing:", v5, v8, !self->_initialized);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __31__HKSPStateMachine_enterState___block_invoke;
  v16[3] = &unk_1E4E3A810;
  v20 = currentState != v5;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v14 = v5;
  v15 = v8;
  -[HKSPStateMachine perform:withContext:](self, "perform:withContext:", v16, v13);
  self->_initialized = 1;

}

uint64_t __31__HKSPStateMachine_enterState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  void *v8;
  int v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  _BYTE v16[24];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_willExit");
    if (*(_BYTE *)(a1 + 56))
    {
      if ((HKSPIsUnitTesting() & 1) != 0)
        goto LABEL_11;
      HKSPLogForCategory(objc_msgSend(*(id *)(a1 + 40), "loggingCategory"));
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 40), "stateMachineName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "stateName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stateName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543874;
      *(_QWORD *)&v16[4] = v3;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v4;
      *(_WORD *)&v16[22] = 2114;
      v17 = v5;
      _os_log_impl(&dword_1A4F0E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will enter state %{public}@ with previous state %{public}@", v16, 0x20u);

      goto LABEL_9;
    }
  }
  if ((HKSPIsUnitTesting() & 1) != 0)
    goto LABEL_11;
  HKSPLogForCategory(objc_msgSend(*(id *)(a1 + 40), "loggingCategory"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "stateMachineName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stateName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v16 = 138543618;
    *(_QWORD *)&v16[4] = v3;
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v4;
    _os_log_impl(&dword_1A4F0E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will update current state %{public}@", v16, 0x16u);
LABEL_9:

  }
LABEL_10:

LABEL_11:
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    result = objc_msgSend(v6, "_willEnter");
    if (!(_DWORD)result)
      return result;
    v8 = *(void **)(a1 + 48);
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v8);
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = HKSPIsUnitTesting();
  if (v9)
  {
    if ((v10 & 1) != 0)
      goto LABEL_24;
    HKSPLogForCategory(objc_msgSend(*(id *)(a1 + 40), "loggingCategory"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    objc_msgSend(*(id *)(a1 + 40), "stateMachineName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stateName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stateName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v16 = 138543874;
    *(_QWORD *)&v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v13;
    *(_WORD *)&v16[22] = 2114;
    v17 = v14;
    v15 = "[%{public}@] Did enter state %{public}@ with previous state %{public}@";
    goto LABEL_22;
  }
  if ((v10 & 1) != 0)
    goto LABEL_24;
  HKSPLogForCategory(objc_msgSend(*(id *)(a1 + 40), "loggingCategory"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "stateMachineName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stateName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stateName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v16 = 138543874;
    *(_QWORD *)&v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v13;
    *(_WORD *)&v16[22] = 2114;
    v17 = v14;
    v15 = "[%{public}@] Did update current state %{public}@ with previous state %{public}@";
LABEL_22:
    _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, v15, v16, 0x20u);

  }
LABEL_23:

LABEL_24:
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "_didEnter", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "_didExit");
  return result;
}

- (void)updateState
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachine stateMachineName](self, "stateMachineName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPStateMachine.m"), 119, CFSTR("%@ currentState is nil"), v12);

  }
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateState");

  if (!self->_initialized)
  {
    HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HKSPStateMachine stateMachineName](self, "stateMachineName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPStateMachine currentState](self, "currentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stateName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] State not yet initialized, re-entering state %{public}@", buf, 0x16u);

    }
    -[HKSPStateMachine currentState](self, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachine enterState:](self, "enterState:", v10);

  }
}

- (void)notifyDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[HKSPStateMachine delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HKSPStateMachine delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callbackScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke;
    v14[3] = &unk_1E4E3A738;
    v9 = &v15;
    v14[4] = self;
    v15 = v4;
    v10 = v4;
    objc_msgSend(v8, "performBlock:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke_2;
    v12[3] = &unk_1E4E3A738;
    v9 = &v13;
    v12[4] = self;
    v13 = v4;
    v11 = v4;
    objc_msgSend(v7, "performBlock:", v12);
  }

}

void __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (unint64_t)loggingCategory
{
  return 0;
}

- (id)stateMachineName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSPStateMachine;
  -[HKSPStateMachine description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; currentState: %@>"), v5);

  return (NSString *)v4;
}

- (HKSPStateMachineState)currentState
{
  return self->_currentState;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (HKSPStateMachineDelegate)delegate
{
  return (HKSPStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HKSPStateMachineInfoProvider)infoProvider
{
  return (HKSPStateMachineInfoProvider *)objc_loadWeakRetained((id *)&self->_infoProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
