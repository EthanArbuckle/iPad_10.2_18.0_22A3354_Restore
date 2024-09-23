@implementation WGWidgetLifeCycleSequence

- (WGWidgetLifeCycleSequence)initWithSequenceIdentifier:(id)a3
{
  id v4;
  WGWidgetLifeCycleSequence *v5;
  uint64_t v6;
  NSString *sequenceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetLifeCycleSequence;
  v5 = -[WGWidgetLifeCycleSequence init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sequenceIdentifier = v5->_sequenceIdentifier;
    v5->_sequenceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (WGWidgetLifeCycleSequence)sequenceWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  unint64_t v9;
  const __CFString *v10;

  v5 = a3;
  if (!-[WGWidgetLifeCycleSequence isCurrentStateAtLeast:](self, "isCurrentStateAtLeast:", 5))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WGWidgetLifeCycleSequence currentState](self, "currentState");
    if (v9 > 6)
      v10 = CFSTR("[Invalid]");
    else
      v10 = off_24D731AE8[v9];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetLifeCycleSequence.m"), 39, CFSTR("Invalid initial state: %@"), v10);

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSequenceIdentifier:", v5);

  objc_msgSend(v6, "_setPreviousSequence:", self);
  return (WGWidgetLifeCycleSequence *)v6;
}

- (int64_t)currentState
{
  WGWidgetLifeCycleSequence *previousSequence;

  previousSequence = self->_previousSequence;
  if (previousSequence)
    return -[WGWidgetLifeCycleSequence currentState](previousSequence, "currentState");
  else
    return self->_currentState;
}

- (BOOL)isCurrentState:(int64_t)a3
{
  return -[WGWidgetLifeCycleSequence currentState](self, "currentState") == a3;
}

- (BOOL)isCurrentStateNotYet:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && -[WGWidgetLifeCycleSequence currentState](self, "currentState") < a3;
}

- (BOOL)isCurrentStateAtLeast:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && -[WGWidgetLifeCycleSequence currentState](self, "currentState") >= a3;
}

- (BOOL)isCurrentStateAtMost:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && -[WGWidgetLifeCycleSequence currentState](self, "currentState") <= a3;
}

- (BOOL)_isValidTransitionToState:(int64_t)a3
{
  WGWidgetLifeCycleSequence *previousSequence;
  unint64_t currentState;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetLifeCycleSequence.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IsValidState(finalState)"));

  }
  previousSequence = self->_previousSequence;
  if (previousSequence)
  {
    if ((unint64_t)-[WGWidgetLifeCycleSequence currentState](previousSequence, "currentState") >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetLifeCycleSequence.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IsValidState([_previousSequence currentState])"));

    }
    if (-[WGWidgetLifeCycleSequence currentState](self->_previousSequence, "currentState") < a3)
      return 1;
  }
  else if ((unint64_t)-[WGWidgetLifeCycleSequence currentState](self, "currentState") >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetLifeCycleSequence.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IsValidState([self currentState])"));

  }
  currentState = self->_currentState;
  v9 = currentState <= 6 && a3 - 1 >= currentState;
  return (unint64_t)a3 <= 6 && v9;
}

- (void)_setCurrentState:(int64_t)a3
{
  WGWidgetLifeCycleSequence *v5;
  WGWidgetLifeCycleSequence *previousSequence;
  NSObject *v7;
  WGWidgetLifeCycleSequence *v8;

  if (a3 <= 0 && (v5 = self->_previousSequence) != 0)
  {
    -[WGWidgetLifeCycleSequence _setCurrentState:](v5, "_setCurrentState:", a3);
    if (-[WGWidgetLifeCycleSequence isCurrentState:](self->_previousSequence, "isCurrentState:", 0))
    {
      previousSequence = self->_previousSequence;
      self->_previousSequence = 0;

    }
  }
  else
  {
    v7 = (id)WGLogWidgets;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[WGWidgetLifeCycleSequence _setCurrentState:].cold.1(self, a3, v7);

    v8 = self->_previousSequence;
    self->_previousSequence = 0;

    self->_currentState = a3;
  }
}

- (id)beginTransitionToState:(int64_t)a3 error:(id *)a4
{
  unint64_t v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[4];
  id v26[3];
  uint64_t v27;
  void *v28;
  _BYTE location[12];
  __int16 v30;
  WGWidgetLifeCycleSequence *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = -[WGWidgetLifeCycleSequence currentState](self, "currentState");
  v8 = -[WGWidgetLifeCycleSequence _isValidTransitionToState:](self, "_isValidTransitionToState:", a3);
  v9 = (void *)WGLogWidgets;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetLifeCycleSequence beginTransitionToState:error:].cold.1(v7, a3, v9);
      if (a4)
        goto LABEL_6;
    }
    else if (a4)
    {
LABEL_6:
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = -[WGWidgetLifeCycleSequence currentState](self, "currentState");
      if (v13 > 6)
        v14 = CFSTR("[Invalid]");
      else
        v14 = off_24D731AE8[v13];
      if ((unint64_t)a3 > 6)
        v15 = CFSTR("[Invalid]");
      else
        v15 = off_24D731AE8[a3];
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Invalid transition from '%@' to '%@' attempted"), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetLifeCycleErrorDomain"), 0, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
    goto LABEL_14;
  }
  v10 = (id)WGLogWidgets;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[WGWidgetLifeCycleSequence sequenceIdentifier](self, "sequenceIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v7 > 6)
      v23 = CFSTR("[Invalid]");
    else
      v23 = off_24D731AE8[v7];
    if ((unint64_t)a3 > 6)
      v24 = CFSTR("[Invalid]");
    else
      v24 = off_24D731AE8[a3];
    *(_DWORD *)location = 138544130;
    *(_QWORD *)&location[4] = v21;
    v30 = 2050;
    v31 = self;
    v32 = 2114;
    v33 = v23;
    v34 = 2114;
    v35 = v24;
    _os_log_debug_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p> Beginning transition from '%{public}@' to '%{public}@'", location, 0x2Au);

  }
  objc_initWeak((id *)location, self);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __58__WGWidgetLifeCycleSequence_beginTransitionToState_error___block_invoke;
  v25[3] = &unk_24D731AC8;
  objc_copyWeak(v26, (id *)location);
  v26[1] = (id)v7;
  v26[2] = (id)a3;
  v11 = (void *)MEMORY[0x219A0A970](v25);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)location);
LABEL_14:
  v19 = (void *)objc_msgSend(v11, "copy");

  return v19;
}

id __58__WGWidgetLifeCycleSequence_beginTransitionToState_error___block_invoke(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  int v5;
  uint64_t v6;
  BOOL v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  unint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "isCurrentState:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  if (v5)
    v7 = v6 == a2;
  else
    v7 = 0;
  if (!v7)
  {
    if ((v5 & 1) != 0)
    {
      if (v6 == a2)
      {
        v8 = CFSTR("Unexpected error");
LABEL_27:
        v21 = (void *)MEMORY[0x24BDD1540];
        v25 = *MEMORY[0x24BDD0FC8];
        v26[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetLifeCycleErrorDomain"), 0, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      v14 = objc_msgSend(WeakRetained, "currentState");
      if (v14 > 6)
        v15 = CFSTR("[Invalid]");
      else
        v15 = off_24D731AE8[v14];
      if (a2 > 6)
        v18 = CFSTR("[Invalid]");
      else
        v18 = off_24D731AE8[a2];
      v19 = *(_QWORD *)(a1 + 48);
      if (v19 > 6)
        v20 = CFSTR("[Invalid]");
      else
        v20 = off_24D731AE8[v19];
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Unexpected state transition from '%@' to '%@' ('%@' was promised)"), v15, v18, v20);
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = objc_msgSend(WeakRetained, "currentState");
      if (v11 > 6)
        v12 = CFSTR("[Invalid]");
      else
        v12 = off_24D731AE8[v11];
      v16 = *(_QWORD *)(a1 + 40);
      if (v16 > 6)
        v17 = CFSTR("[Invalid]");
      else
        v17 = off_24D731AE8[v16];
      objc_msgSend(v10, "stringWithFormat:", CFSTR("A transition has occurred (to '%@') since this transition was begun (from '%@')"), v12, v17, v24);
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend(WeakRetained, "_setCurrentState:", a2);
  v9 = 0;
LABEL_28:

  return v9;
}

- (id)transitionToState:(int64_t)a3
{
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v9;
  id v10;

  v10 = 0;
  -[WGWidgetLifeCycleSequence beginTransitionToState:error:](self, "beginTransitionToState:error:", a3, &v10);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetLifeCycleSequence.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock"));

    }
    v6[2](v6, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  WGWidgetLifeCycleSequence *previousSequence;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[WGWidgetLifeCycleSequence sequenceIdentifier](self, "sequenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WGWidgetLifeCycleSequence currentState](self, "currentState");
  if (v6 > 6)
    v7 = CFSTR("[Invalid]");
  else
    v7 = off_24D731AE8[v6];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; sequenceID: %@; currentState: %@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  previousSequence = self->_previousSequence;
  if (previousSequence)
  {
    -[WGWidgetLifeCycleSequence description](previousSequence, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("; _previousSeqeunce: %@"), v10);

  }
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (NSString)sequenceIdentifier
{
  return self->_sequenceIdentifier;
}

- (WGWidgetLifeCycleSequence)_previousSequence
{
  return self->_previousSequence;
}

- (void)_setPreviousSequence:(id)a3
{
  objc_storeStrong((id *)&self->_previousSequence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSequence, 0);
  objc_storeStrong((id *)&self->_sequenceIdentifier, 0);
}

- (void)_setCurrentState:(NSObject *)a3 .cold.1(_QWORD *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  _QWORD *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sequenceIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = a1[1];
  if (v8 >= 7)
    v9 = CFSTR("[Invalid]");
  else
    v9 = off_24D731AE8[v8];
  if (a2 >= 7)
    v10 = CFSTR("[Invalid]");
  else
    v10 = off_24D731AE8[a2];
  v11 = 138544130;
  v12 = v6;
  v13 = 2050;
  v14 = a1;
  v15 = 2114;
  v16 = v9;
  v17 = 2114;
  v18 = v10;
  _os_log_debug_impl(&dword_2172E1000, a3, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p> Transitioned from '%{public}@' to '%{public}@'", (uint8_t *)&v11, 0x2Au);

}

- (void)beginTransitionToState:(void *)a3 error:.cold.1(unint64_t a1, unint64_t a2, void *a3)
{
  const __CFString *v3;
  const __CFString *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 7)
    v3 = CFSTR("[Invalid]");
  else
    v3 = off_24D731AE8[a1];
  if (a2 >= 7)
    v4 = CFSTR("[Invalid]");
  else
    v4 = off_24D731AE8[a2];
  v6 = 138543618;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  v5 = a3;
  _os_log_error_impl(&dword_2172E1000, v5, OS_LOG_TYPE_ERROR, "Invalid transition from '%{public}@' to '%{public}@' attempted", (uint8_t *)&v6, 0x16u);

}

@end
