@implementation WFContextualActionRunnerClient

- (WFContextualActionRunnerClient)initWithContextualAction:(id)a3 actionContext:(id)a4
{
  id v6;
  id v7;
  WFContextualActionRunDescriptor *v8;
  WFContextualActionRunRequest *v9;
  WFContextualActionRunnerClient *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v7, v6);
  v9 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v7, v6);

  v10 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v8, v9);
  return v10;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  +[WFContextualActionRunQueue sharedQueue](WFContextualActionRunQueue, "sharedQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runFinished:", self);

  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = v6;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "files");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "workflowRunnerClient:didFinishRunningWorkflowWithOutputFiles:error:cancelled:", self, v13, v14, objc_msgSend(v11, "isCancelled"));

    }
    else
    {

      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "workflowRunnerClient:didFinishRunningWorkflowWithOutputFiles:error:cancelled:", self, 0, v12, objc_msgSend(v11, "isCancelled"));
      v11 = v15;
    }

    v7[2](v7);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFContextualActionRunnerClient;
    -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v16, sel_handleWorkflowRunResult_completion_, v6, v7);
  }

}

- (void)start
{
  id v3;

  +[WFContextualActionRunQueue sharedQueue](WFContextualActionRunQueue, "sharedQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueRun:", self);

}

- (void)startFromQueue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__WFContextualActionRunnerClient_startFromQueue__block_invoke;
  v9[3] = &unk_1E5FC47E8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "configureIfNeededForContext:completion:", v8, v9);

}

void __48__WFContextualActionRunnerClient_startFromQueue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  WFContextualActionRunRequest *v8;
  WFContextualActionRunDescriptor *v9;
  void *v10;
  void *v11;
  WFContextualActionRunRequest *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v5, *(_QWORD *)(a1 + 40));
    v9 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setRunRequest:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setDescriptor:", v9);
    objc_msgSend(*(id *)(a1 + 32), "runRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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
    v13 = v11;

    objc_msgSend(v13, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    objc_msgSend(v13, "actionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "wf_launchAppIfNeededUsingSurface:", objc_msgSend(v17, "surface"));

    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)WFContextualActionRunnerClient;
    objc_msgSendSuper2(&v18, sel_start);

  }
  else
  {
    if (v6)
    {
      v12 = (WFContextualActionRunRequest *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v12 = (WFContextualActionRunRequest *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v12;
    v9 = -[WFWorkflowRunResult initWithError:]([WFWorkflowRunResult alloc], "initWithError:", v12);
    objc_msgSend(*(id *)(a1 + 32), "dispatchWorkflowResultHandlingWithResult:", v9);
  }

}

@end
