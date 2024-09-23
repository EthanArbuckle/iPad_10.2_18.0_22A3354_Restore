@implementation WFShojiSystemActionsRunnerClient

- (WFShojiSystemActionsRunnerClient)initWithContextualAction:(id)a3
{
  id v5;
  WFContextualActionContext *v6;
  WFContextualActionRunDescriptor *v7;
  WFContextualActionRunRequest *v8;
  WFShojiSystemActionsRunnerClient *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShojiSystemActionsRunnerClient.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v6 = -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 9);
  v7 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v5, v6);
  v8 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v5, v6);
  v12.receiver = self;
  v12.super_class = (Class)WFShojiSystemActionsRunnerClient;
  v9 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v12, sel_initWithDescriptor_runRequest_, v7, v8);

  return v9;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  WFReverseContextualAction *v17;
  WFReverseContextualAction *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = v6;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    -[WFWorkflowRunnerClient descriptor](self, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    objc_msgSend(v15, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isReversible"))
    {
      objc_msgSend(v12, "reversalState");
      v17 = (WFReverseContextualAction *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = [WFReverseContextualAction alloc];
        objc_msgSend(v12, "reversalState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[WFReverseContextualAction initWithActionToReverse:reversalState:](v18, "initWithActionToReverse:reversalState:", v16, v19);

      }
    }
    else
    {
      v17 = 0;
    }
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workflowRunnerClient:didFinishRunningAction:withReverseAction:", self, v16, v17);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)WFShojiSystemActionsRunnerClient;
    -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v21, sel_handleWorkflowRunResult_completion_, v6, v7);
  }

}

@end
