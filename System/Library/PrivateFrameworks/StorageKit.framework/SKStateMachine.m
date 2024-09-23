@implementation SKStateMachine

+ (SKStateMachine)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "setState:", v8);

  objc_msgSend(v10, "setEvent:", v7);
  objc_msgSend(v10, "setTable:", v9);

  return (SKStateMachine *)v10;
}

- (BOOL)nextWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  BOOL v21;
  void *v22;
  void *v23;
  void (*v24)(void *, uint64_t, id *);
  void *v25;
  void *v26;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[SKStateMachine table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStateMachine state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStateMachine event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryForState:event:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[SKStateMachine state](self, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKStateMachine event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nextState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 136315906;
      v29 = "-[SKStateMachine nextWithError:]";
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_DEBUG, "%s: State transition (%@,%@)->%@", (uint8_t *)&v28, 0x2Au);

    }
    objc_msgSend(v9, "action");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend(v9, "selector");

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SKStateMachine.m"), 140, CFSTR("Should have either action or selector, not both"));

LABEL_7:
        v18 = 0;
LABEL_14:
        -[SKStateMachine setEvent:](self, "setEvent:", v18);
        objc_msgSend(v9, "nextState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKStateMachine setState:](self, "setState:", v26);

        v21 = 1;
        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "action");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "action");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id *))v20)[2](v20, a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "selector"))
        goto LABEL_7;
      -[SKStateMachine table](self, "table");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectorTarget");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void (*)(void *, uint64_t, id *))objc_msgSend(v23, "methodForSelector:", objc_msgSend(v9, "selector"));

      -[SKStateMachine table](self, "table");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectorTarget");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24(v25, objc_msgSend(v9, "selector"), a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v18)
    {
      v21 = 0;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v21 = +[SKError failWithSKErrorCode:error:](SKError, "failWithSKErrorCode:error:", 102, a3);
LABEL_15:

  return v21;
}

- (BOOL)finished
{
  void *v2;
  BOOL v3;

  -[SKStateMachine state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)runWithError:(id *)a3
{
  BOOL v5;

  do
    v5 = -[SKStateMachine finished](self, "finished");
  while (!v5 && -[SKStateMachine nextWithError:](self, "nextWithError:", a3));
  return v5;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (SKStateTransitionTable)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
  objc_storeStrong((id *)&self->_table, a3);
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
