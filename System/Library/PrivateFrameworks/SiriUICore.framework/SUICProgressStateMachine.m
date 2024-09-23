@implementation SUICProgressStateMachine

- (SUICProgressStateMachine)init
{
  SUICProgressStateMachine *v2;
  CUStateMachine *v3;
  CUStateMachine *underlyingStateMachine;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CUStateMachine *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *stateForStateName;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SUICProgressStateMachine;
  v2 = -[SUICProgressStateMachine init](&v25, sel_init);
  if (v2)
  {
    v3 = (CUStateMachine *)objc_alloc_init(MEMORY[0x1E0D1B448]);
    underlyingStateMachine = v2->_underlyingStateMachine;
    v2->_underlyingStateMachine = v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1B438]), "initWithName:parent:", CFSTR("Abstract"), 0);
    objc_msgSend(v5, "setEventHandler:", &__block_literal_global_1);
    objc_storeStrong((id *)&v2->_abstractState, v5);
    objc_initWeak(&location, v2);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1B438]), "initWithName:parent:", CFSTR("None"), v5);
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __32__SUICProgressStateMachine_init__block_invoke_2;
    v22[3] = &unk_1E4A550A8;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v6, "setEventHandler:", v22);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1B438]), "initWithName:parent:", CFSTR("Arbitrary"), v5);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __32__SUICProgressStateMachine_init__block_invoke_3;
    v20[3] = &unk_1E4A550A8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "setEventHandler:", v20);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1B438]), "initWithName:parent:", CFSTR("Percentage"), v5);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __32__SUICProgressStateMachine_init__block_invoke_4;
    v18[3] = &unk_1E4A550A8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "setEventHandler:", v18);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1B438]), "initWithName:parent:", CFSTR("Done"), v5);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __32__SUICProgressStateMachine_init__block_invoke_5;
    v16[3] = &unk_1E4A550A8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "setEventHandler:", v16);
    v11 = v2->_underlyingStateMachine;
    v28[0] = v5;
    v28[1] = v6;
    v28[2] = v8;
    v28[3] = v9;
    v28[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUStateMachine setStates:](v11, "setStates:", v12);

    v26[0] = CFSTR("None");
    v26[1] = CFSTR("Arbitrary");
    v27[0] = v6;
    v27[1] = v8;
    v26[2] = CFSTR("Percentage");
    v26[3] = CFSTR("Done");
    v27[2] = v9;
    v27[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v13 = objc_claimAutoreleasedReturnValue();
    stateForStateName = v2->_stateForStateName;
    v2->_stateForStateName = (NSDictionary *)v13;

    -[CUStateMachine setInitialState:](v2->_underlyingStateMachine, "setInitialState:", v6);
    -[CUStateMachine start](v2->_underlyingStateMachine, "start");
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v2;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke()
{
  return 2;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Start")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Report")) & 1) != 0)
    {

      v7 = 2;
      v8 = WeakRetained;
      v9 = 2;
      v10 = 1;
LABEL_5:
      objc_msgSend(v8, "_transitionToState:forEvent:", v9, v10);
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v11 = 4;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Fail")) & 1) == 0)
      {
        v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("Finish"));

        if ((v13 & 1) != 0)
        {
          v7 = 2;
          v8 = WeakRetained;
          v9 = 3;
          v10 = 2;
          goto LABEL_5;
        }
LABEL_11:
        v7 = 1;
        goto LABEL_12;
      }
      v11 = 3;
    }

    objc_msgSend(WeakRetained, "_ignoreEvent:", v11);
    goto LABEL_11;
  }

  objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 1, 0);
  v7 = 2;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Start")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Report")) & 1) != 0)
    {

      v7 = 2;
      v8 = WeakRetained;
      v9 = 2;
      v10 = 1;
      goto LABEL_6;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v11 = 4;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Fail")) & 1) == 0)
      {
        v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("Finish"));

        if ((v13 & 1) == 0)
          goto LABEL_3;
        v7 = 2;
        v8 = WeakRetained;
        v9 = 3;
        v10 = 2;
LABEL_6:
        objc_msgSend(v8, "_transitionToState:forEvent:", v9, v10);
        goto LABEL_12;
      }
      v11 = 3;
    }

    objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 0, v11);
    v7 = 2;
    goto LABEL_12;
  }

  objc_msgSend(WeakRetained, "_ignoreEvent:", 0);
LABEL_3:
  v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Start")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Report")) & 1) != 0)
    {

      v7 = 2;
      v8 = WeakRetained;
      v9 = 2;
      v10 = 1;
      goto LABEL_6;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v11 = 4;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Fail")) & 1) == 0)
      {
        v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("Finish"));

        if ((v13 & 1) == 0)
          goto LABEL_3;
        v7 = 2;
        v8 = WeakRetained;
        v9 = 3;
        v10 = 2;
LABEL_6:
        objc_msgSend(v8, "_transitionToState:forEvent:", v9, v10);
        goto LABEL_12;
      }
      v11 = 3;
    }

    objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 0, v11);
    v7 = 2;
    goto LABEL_12;
  }

  objc_msgSend(WeakRetained, "_ignoreEvent:", 0);
LABEL_3:
  v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Start")) & 1) != 0)
  {
    v7 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Report")) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Reset")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
    {
      v7 = 3;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Finish")) & 1) == 0)
      {

        goto LABEL_12;
      }
      v7 = 2;
    }
LABEL_11:

    objc_msgSend(WeakRetained, "_ignoreEvent:", v7);
LABEL_12:
    v8 = 1;
    goto LABEL_13;
  }

  objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 0, 4);
  v8 = 2;
LABEL_13:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CUStateMachine invalidate](self->_underlyingStateMachine, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SUICProgressStateMachine;
  -[SUICProgressStateMachine dealloc](&v3, sel_dealloc);
}

- (void)handleEvent:(unint64_t)a3
{
  CUStateMachine *underlyingStateMachine;
  id v5;
  const __CFString *v6;
  id v7;

  underlyingStateMachine = self->_underlyingStateMachine;
  v5 = objc_alloc(MEMORY[0x1E0D1B440]);
  if (a3 + 1 > 5)
    v6 = CFSTR("Start");
  else
    v6 = off_1E4A550F0[a3 + 1];
  v7 = (id)objc_msgSend(v5, "initWithName:userInfo:", v6, 0);
  -[CUStateMachine dispatchEvent:](underlyingStateMachine, "dispatchEvent:", v7);

}

- (unint64_t)state
{
  return self->_currentState;
}

- (void)setObservers:(id)a3
{
  NSPointerArray *stateMachineObservers;
  id v5;

  stateMachineObservers = self->_stateMachineObservers;
  self->_stateMachineObservers = 0;
  v5 = a3;

  -[SUICProgressStateMachine addObservers:](self, "addObservers:", v5);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUICProgressStateMachine _stateMachineObservers](self, "_stateMachineObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPointer:", v4);

}

- (void)addObservers:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__SUICProgressStateMachine_addObservers___block_invoke;
  v3[3] = &unk_1E4A550D0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __41__SUICProgressStateMachine_addObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:", a2);
}

- (NSPointerArray)_stateMachineObservers
{
  NSPointerArray *stateMachineObservers;
  NSPointerArray *v4;
  NSPointerArray *v5;

  stateMachineObservers = self->_stateMachineObservers;
  if (!stateMachineObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v4 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stateMachineObservers;
    self->_stateMachineObservers = v4;

    stateMachineObservers = self->_stateMachineObservers;
  }
  -[NSPointerArray addPointer:](stateMachineObservers, "addPointer:", 0);
  -[NSPointerArray compact](self->_stateMachineObservers, "compact");
  return self->_stateMachineObservers;
}

- (void)_transitionToState:(unint64_t)a3 forEvent:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  CUStateMachine *underlyingStateMachine;
  const __CFString *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SUICProgressStateMachine _stateMachineObservers](self, "_stateMachineObservers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "progressStateMachine:didTransitionToState:fromState:forEvent:", self, a3, -[SUICProgressStateMachine state](self, "state"), a4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  underlyingStateMachine = self->_underlyingStateMachine;
  if (a3 + 1 > 4)
    v14 = CFSTR("None");
  else
    v14 = off_1E4A55120[a3 + 1];
  -[NSDictionary objectForKey:](self->_stateForStateName, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUStateMachine transitionToState:](underlyingStateMachine, "transitionToState:", v15);

  self->_currentState = a3;
}

- (void)_ignoreEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SUICProgressStateMachine _stateMachineObservers](self, "_stateMachineObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "progressStateMachine:ignoredEvent:", self, a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_setStateMachineObservers:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachineObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachineObservers, 0);
  objc_storeStrong((id *)&self->_abstractState, 0);
  objc_storeStrong((id *)&self->_stateForStateName, 0);
  objc_storeStrong((id *)&self->_underlyingStateMachine, 0);
}

@end
