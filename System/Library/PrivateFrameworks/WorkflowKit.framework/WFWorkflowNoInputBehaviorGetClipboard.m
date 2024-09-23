@implementation WFWorkflowNoInputBehaviorGetClipboard

+ (id)behaviorName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)resolvesInput
{
  return 1;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"), v16);

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.getclipboard"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "noInputBehavior:wantsToRunAction:completionHandler:", self, v13, v11);
}

- (WFWorkflowNoInputBehaviorGetClipboard)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFWorkflowNoInputBehaviorGetClipboard *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFNoInputBehaviorParametersIfBehavior(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[WFWorkflowNoInputBehaviorGetClipboard init](self, "init");
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFNoInputBehaviorSerializedRepresentation(v2, MEMORY[0x1E0C9AA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
