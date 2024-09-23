@implementation WFShowResultAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[WFAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WFShowResultAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E7AF7B78;
  v6[4] = self;
  WFShowResult(v4, v5, 1, v6);

}

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((WFGetVariableInputContentForPreviewing(v8, v9, v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFShowResultAction;
    v11 = -[WFAction getInputContentFromVariablesInParameterState:context:completionHandler:](&v13, sel_getInputContentFromVariablesInParameterState_context_completionHandler_, v8, v9, v10);
  }

  return v11;
}

uint64_t __49__WFShowResultAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
