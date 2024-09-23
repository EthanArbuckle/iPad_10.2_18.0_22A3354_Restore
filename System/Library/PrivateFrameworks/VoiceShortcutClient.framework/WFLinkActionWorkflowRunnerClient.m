@implementation WFLinkActionWorkflowRunnerClient

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 authenticationPolicy:(int64_t)a7
{
  return -[WFLinkActionWorkflowRunnerClient initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:runSource:runSourceOverride:authenticationPolicy:](self, "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:runSource:runSourceOverride:authenticationPolicy:", a3, a4, a5, a6, 0, a7);
}

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 runSourceOverride:(id)a7 authenticationPolicy:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  WFLinkContextualAction *v18;
  uint64_t v19;
  WFLinkContextualAction *v20;
  WFContextualActionContext *v21;
  uint64_t v22;
  WFContextualActionContext *v23;
  WFContextualActionRunDescriptor *v24;
  WFContextualActionRunRequest *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *linkRunnerClientRunSourceOverride;
  NSString *v30;
  WFLinkActionWorkflowRunnerClient *v31;
  WFLinkActionWorkflowRunnerClient *v32;
  void *v34;
  void *v35;
  NSString *v36;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v36 = (NSString *)a7;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionWorkflowRunnerClient.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionWorkflowRunnerClient.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  v18 = [WFLinkContextualAction alloc];
  if (a8 == 2)
    v19 = 2;
  else
    v19 = a8 == 1;
  v20 = -[WFLinkContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:](v18, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:", v15, v16, v17, v19);
  v21 = [WFContextualActionContext alloc];
  if ((unint64_t)a6 > 9)
    v22 = 0;
  else
    v22 = qword_1AF780878[a6];
  v23 = -[WFContextualActionContext initWithSurface:](v21, "initWithSurface:", v22);
  v24 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v20, v23);
  v25 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v20, v23);
  v26 = v15;
  if (-[WFContextualActionContext surface](v23, "surface") == 10
    || -[WFContextualActionContext surface](v23, "surface") == 11)
  {
    v27 = v17;
    v28 = 3;
  }
  else
  {
    v27 = v17;
    if (-[WFContextualActionContext surface](v23, "surface") == 18)
      v28 = 3;
    else
      v28 = 0;
  }
  -[WFWorkflowRunRequest setPresentationMode:](v25, "setPresentationMode:", v28);
  self->_linkRunnerClientRunSource = a6;
  linkRunnerClientRunSourceOverride = self->_linkRunnerClientRunSourceOverride;
  self->_linkRunnerClientRunSourceOverride = v36;
  v30 = v36;

  v37.receiver = self;
  v37.super_class = (Class)WFLinkActionWorkflowRunnerClient;
  v31 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v37, sel_initWithDescriptor_runRequest_, v24, v25);

  if (v31)
    v32 = v31;

  return v31;
}

- (unsigned)transcriptActionSourceForSurface:(unint64_t)a3
{
  if (a3 - 2 > 0xE)
    return 0;
  else
    return word_1AF7808C8[a3 - 2];
}

- (BOOL)shouldUseRunnerInfrastructureForRequest:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v5, "actionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "surface") != 10)
  {
    objc_msgSend(v5, "actionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "surface") == 11)
    {

      goto LABEL_5;
    }
    objc_msgSend(v5, "actionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "surface");

    if (v11 == 18)
      goto LABEL_6;
LABEL_8:
    v9 = 1;
    goto LABEL_9;
  }
LABEL_5:

LABEL_6:
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WFLinkActionExecutor *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  WFLinkActionExecutor *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD v23[4];
  WFLinkActionExecutor *v24;
  WFLinkActionWorkflowRunnerClient *v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  id v30;
  objc_super v31;

  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
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
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (-[WFLinkActionWorkflowRunnerClient shouldUseRunnerInfrastructureForRequest:action:](self, "shouldUseRunnerInfrastructureForRequest:action:", v5, v8))
  {
    v31.receiver = self;
    v31.super_class = (Class)WFLinkActionWorkflowRunnerClient;
    -[WFWorkflowRunnerClient start](&v31, sel_start);
  }
  else
  {
    objc_msgSend(v8, "linkAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFLinkActionWorkflowRunnerClient transcriptActionSourceForSurface:](self, "transcriptActionSourceForSurface:", objc_msgSend(v10, "surface"));

    v12 = [WFLinkActionExecutor alloc];
    objc_msgSend(v8, "appBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "authenticationPolicy");
    -[WFLinkActionWorkflowRunnerClient linkRunnerClientRunSourceOverride](self, "linkRunnerClientRunSourceOverride");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v17 = -[WFLinkActionExecutor initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:sourceOverride:error:](v12, "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:sourceOverride:error:", v9, v13, v14, v15, v11, v16, &v30);
    v18 = v30;

    if (v17)
    {
      -[WFLinkActionExecutor metadata](v17, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "systemProtocols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D43E18], "sessionStartingProtocol");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "containsObject:", v21);

      if (v22)
      {
        v29.receiver = self;
        v29.super_class = (Class)WFLinkActionWorkflowRunnerClient;
        -[WFWorkflowRunnerClient start](&v29, sel_start);
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __41__WFLinkActionWorkflowRunnerClient_start__block_invoke;
        v23[3] = &unk_1E5FC6308;
        v24 = v17;
        v25 = self;
        v26 = v8;
        v27 = v9;
        v28 = v5;
        -[WFLinkActionExecutor performWithCompletionHandler:](v24, "performWithCompletionHandler:", v23);

      }
    }
    else
    {
      -[WFLinkActionWorkflowRunnerClient finishWithError:](self, "finishWithError:", v18);
    }

  }
}

- (void)finishWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", self, 0, v11, 0);
LABEL_7:

    goto LABEL_8;
  }
  v8 = objc_opt_respondsToSelector();

  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "workflowRunnerClient:didFinishRunningWorkflowWithAllResults:error:cancelled:", self, 0, v11, 0);
    goto LABEL_7;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled:", self, v11, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 bundleIdentifier:(id)a4 runSource:(int64_t)a5
{
  return -[WFLinkActionWorkflowRunnerClient initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:runSource:authenticationPolicy:](self, "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:runSource:authenticationPolicy:", a3, a4, 0, a5, 0);
}

- (int64_t)linkRunnerClientRunSource
{
  return self->_linkRunnerClientRunSource;
}

- (NSString)linkRunnerClientRunSourceOverride
{
  return self->_linkRunnerClientRunSourceOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkRunnerClientRunSourceOverride, 0);
}

void __41__WFLinkActionWorkflowRunnerClient_start__block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  void (*v7)(const __CFString *, uint64_t *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v3 = a2;
  objc_msgSend(a1[5], "finishWithError:", v3);
  v4 = MEMORY[0x1E0C809B0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __41__WFLinkActionWorkflowRunnerClient_start__block_invoke_2;
  v13 = &unk_1E5FC62E0;
  v14 = a1[6];
  v15 = a1[7];
  v5 = v3;
  v16 = v5;
  v17 = a1[8];
  v6 = &v10;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v7 = (void (*)(const __CFString *, uint64_t *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v22 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v18[3] = &unk_1E5FC8858;
    v18[4] = &v19;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke(v18);
    v7 = (void (*)(const __CFString *, uint64_t *))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    v7(CFSTR("com.apple.shortcuts.RunActionFinish"), v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_AnalyticsSendEventLazy(const NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFLinkActionWorkflowRunnerClient.m"), 26, CFSTR("%s"), dlerror(), v10, v11, v12, v13, v14, v15, v16);

    __break(1u);
  }
}

id __41__WFLinkActionWorkflowRunnerClient_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("actionIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("completed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 48) == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("runSource");
  objc_msgSend(*(id *)(a1 + 56), "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
