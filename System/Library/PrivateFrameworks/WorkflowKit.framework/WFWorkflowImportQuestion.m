@implementation WFWorkflowImportQuestion

- (WFWorkflowImportQuestion)initWithAction:(id)a3 parameter:(id)a4 question:(id)a5 defaultState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  WFWorkflowImportQuestion *v18;
  WFWorkflowImportQuestion *v19;
  uint64_t v20;
  NSString *question;
  WFWorkflowImportQuestion *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11
    || !v12
    || (objc_msgSend(v11, "visibleParametersWithProcessing:", 0),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "containsObject:", v12),
        v15,
        (v16 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowImportQuestion.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action && parameter && [[action visibleParametersWithProcessing:NO] containsObject:parameter]"));

  }
  v24.receiver = self;
  v24.super_class = (Class)WFWorkflowImportQuestion;
  v18 = -[WFWorkflowImportQuestion init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_action, v11);
    objc_storeWeak((id *)&v19->_parameter, v12);
    v20 = objc_msgSend(v13, "copy");
    question = v19->_question;
    v19->_question = (NSString *)v20;

    objc_storeStrong((id *)&v19->_defaultState, a6);
    v22 = v19;
  }

  return v19;
}

- (WFWorkflowImportQuestion)initWithSerializedRepresentation:(id)a3 workflowActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WFWorkflowImportQuestion *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  WFWorkflowImportQuestion *v27;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("ActionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("ParameterKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("Text"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  WFEnforceClass(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("DefaultValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Parameter")) && v13 && v16)
  {
    v22 = objc_msgSend(v13, "unsignedIntegerValue");
    if (v22 >= objc_msgSend(v6, "count"))
    {
      v21 = 0;
    }
    else
    {
      v27 = self;
      objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parameterForKey:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v23, "createStateForParameter:fromSerializedRepresentation:", v24, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[WFWorkflowImportQuestion initWithAction:parameter:question:defaultState:]([WFWorkflowImportQuestion alloc], "initWithAction:parameter:question:defaultState:", v23, v24, v19, v25);

      }
      else
      {
        v21 = 0;
      }

      self = v27;
    }
  }

  return v21;
}

- (id)serializedRepresentationWithWorkflowActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WFWorkflowImportQuestion action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowImportQuestion parameter](self, "parameter");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v4, "indexOfObject:", v5);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v10 = v9;
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setObject:forKey:", CFSTR("Parameter"), CFSTR("Category"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("ActionIndex"));

      objc_msgSend(v7, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("ParameterKey"));

      -[WFWorkflowImportQuestion question](self, "question");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("Text"));

      -[WFWorkflowImportQuestion defaultState](self, "defaultState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serializedRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("DefaultValue"));

    }
  }

  return v8;
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (WFParameter)parameter
{
  return (WFParameter *)objc_loadWeakRetained((id *)&self->_parameter);
}

- (NSString)question
{
  return self->_question;
}

- (WFParameterState)defaultState
{
  return self->_defaultState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultState, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_parameter);
  objc_destroyWeak((id *)&self->_action);
}

@end
