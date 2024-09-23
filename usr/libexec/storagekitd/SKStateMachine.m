@implementation SKStateMachine

+ (id)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v11, "setState:", v9);

  objc_msgSend(v11, "setEvent:", v8);
  objc_msgSend(v11, "setTable:", v10);

  return v11;
}

- (BOOL)nextWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  uint64_t (*v24)(void *, id, id *);
  void *v25;
  uint64_t v26;
  void *v27;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine event](self, "event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryForState:event:", v6, v7));

  if (v8)
  {
    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine event](self, "event"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextState"));
      v29 = 136315906;
      v30 = "-[SKStateMachine nextWithError:]";
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s: State transition (%@,%@)->%@", (uint8_t *)&v29, 0x2Au);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));
    if (v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend(v8, "selector");

      if (v16)
        goto LABEL_6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));

    if (v18)
    {
      v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));
      v20 = ((uint64_t (**)(_QWORD, id *))v19)[2](v19, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }
    else
    {
      if (!objc_msgSend(v8, "selector"))
      {
LABEL_6:
        v17 = 0;
LABEL_13:
        -[SKStateMachine setEvent:](self, "setEvent:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextState"));
        -[SKStateMachine setState:](self, "setState:", v27);

        v21 = 1;
        goto LABEL_14;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectorTarget"));
      v24 = (uint64_t (*)(void *, id, id *))objc_msgSend(v23, "methodForSelector:", objc_msgSend(v8, "selector"));

      v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectorTarget"));
      v26 = v24(v25, objc_msgSend(v8, "selector"), a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v26);

    }
    if (!v17)
    {
      v21 = 0;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v21 = +[SKError failWithSKErrorCode:error:](SKError, "failWithSKErrorCode:error:", 102, a3);
LABEL_14:

  return v21;
}

- (BOOL)finished
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
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
