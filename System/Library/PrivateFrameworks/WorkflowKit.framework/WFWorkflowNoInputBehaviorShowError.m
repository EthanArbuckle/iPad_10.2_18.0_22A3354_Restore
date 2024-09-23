@implementation WFWorkflowNoInputBehaviorShowError

- (WFWorkflowNoInputBehaviorShowError)initWithErrorString:(id)a3
{
  id v5;
  WFWorkflowNoInputBehaviorShowError *v6;
  WFWorkflowNoInputBehaviorShowError *v7;
  WFWorkflowNoInputBehaviorShowError *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowNoInputBehaviorShowError;
  v6 = -[WFWorkflowNoInputBehaviorShowError init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_errorString, a3);
    v8 = v7;
  }

  return v7;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterface"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  -[WFWorkflowNoInputBehaviorShowError errorString](self, "errorString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMessage:", v13);
    v15 = (void *)MEMORY[0x1E0D13DE8];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __97__WFWorkflowNoInputBehaviorShowError_resolveWithUserInterface_runningDelegate_completionHandler___block_invoke;
    v19[3] = &unk_1E7AF8F48;
    v20 = v12;
    objc_msgSend(v15, "okButtonWithHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", v16);

    objc_msgSend(v9, "presentAlert:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v14);
  }

}

- (WFWorkflowNoInputBehaviorShowError)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFWorkflowNoInputBehaviorShowError *v9;
  id v10;
  WFWorkflowNoInputBehaviorShowError *v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFNoInputBehaviorParametersIfBehavior(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    v11 = -[WFWorkflowNoInputBehaviorShowError initWithErrorString:](self, "initWithErrorString:", v10);
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[WFWorkflowNoInputBehaviorShowError errorString](self, "errorString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = CFSTR("Error");
    -[WFWorkflowNoInputBehaviorShowError errorString](self, "errorString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFNoInputBehaviorSerializedRepresentation(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
}

void __97__WFWorkflowNoInputBehaviorShowError_resolveWithUserInterface_runningDelegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

+ (id)behaviorName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)resolvesInput
{
  return 0;
}

@end
