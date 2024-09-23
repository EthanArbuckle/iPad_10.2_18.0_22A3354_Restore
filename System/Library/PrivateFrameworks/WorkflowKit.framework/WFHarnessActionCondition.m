@implementation WFHarnessActionCondition

- (WFHarnessActionCondition)initWithSelector:(id)a3 eventClass:(Class)a4 eventHandler:(id)a5
{
  id v10;
  id v11;
  WFHarnessActionCondition *v12;
  WFHarnessActionCondition *v13;
  void *v14;
  id eventHandler;
  WFHarnessActionCondition *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  if (v10)
  {
    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventClass"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

  if (!a4)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFHarnessActionCondition;
  v12 = -[WFHarnessActionCondition init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selector, a3);
    objc_storeStrong((id *)&v13->_eventClass, a4);
    v14 = _Block_copy(v11);
    eventHandler = v13->_eventHandler;
    v13->_eventHandler = v14;

    v16 = v13;
  }

  return v13;
}

- (void)evaluateWithEvent:(id)a3 context:(id)a4 withResponse:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if (v15)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseBlock"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionCondition.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  -[WFHarnessActionCondition eventHandler](self, "eventHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id))v11)[2](v11, v15, v9, v10);

}

- (WFHarnessActionSelector)selector
{
  return self->_selector;
}

- (Class)eventClass
{
  return self->_eventClass;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventClass, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

@end
