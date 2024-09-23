@implementation WFSpotlightResultWorkflowRunnerClient

- (WFSpotlightResultWorkflowRunnerClient)initWithRunnable:(id)a3 surface:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WFSpotlightResultWorkflowRunnerClient *v11;

  v7 = a3;
  objc_storeStrong((id *)&self->_runnable, a3);
  objc_msgSend(v7, "runDescriptorForSurface:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runRequestForSurface:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingBiomeStreamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v9, "setPresentationMode:", 3);
  v11 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v8, v9);

  return v11;
}

- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3
{
  WFSpotlightResultWorkflowRunnerClient *v3;
  WFSpotlightResultWorkflowRunnerClient *v4;
  void *v5;
  WFSpotlightResultWorkflowRunnerClient *v6;

  v3 = -[WFSpotlightResultWorkflowRunnerClient initWithIntent:executionContext:](self, "initWithIntent:executionContext:", a3, 0);
  v4 = v3;
  if (v3)
  {
    -[WFWorkflowRunnerClient runRequest](v3, "runRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRunSource:", CFSTR("spotlight-search-detail-page"));

    v6 = v4;
  }

  return v4;
}

- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3 executionContext:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  WFWorkflowRunRequest *v10;
  void *v11;
  WFSpotlightResultWorkflowRunnerClient *v12;

  v6 = (objc_class *)MEMORY[0x1E0CBDBE8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "_initWithIntent:", v7);

  WFWorkflowRunDescriptorForINShortcut(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  WFRunSourceForSpotlightExecutionContext(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRunSource:](v10, "setRunSource:", v11);

  -[WFWorkflowRunRequest setDonateInteraction:](v10, "setDonateInteraction:", 0);
  v12 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v9, v10);

  return v12;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[1] = 3221225472;
  v9[2] = __76__WFSpotlightResultWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke;
  v9[3] = &unk_1E5FC7900;
  v10 = a3;
  v11 = a4;
  v9[4] = self;
  v8.receiver = self;
  v8.super_class = (Class)WFSpotlightResultWorkflowRunnerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v10;
  v7 = v11;
  -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v8, sel_handleWorkflowRunResult_completion_, v6, v9);

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
  objc_super v10;

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

  objc_msgSend(v5, "actionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_launchAppIfNeededUsingSurface:", objc_msgSend(v9, "surface"));

  v10.receiver = self;
  v10.super_class = (Class)WFSpotlightResultWorkflowRunnerClient;
  -[WFWorkflowRunnerClient start](&v10, sel_start);

}

- (BOOL)runnableRequiresSpotlightRefresh:(id)a3
{
  id v5;
  void *v6;
  id v7;
  char isKindOfClass;
  char v9;
  id v10;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpotlightResultWorkflowRunnerClient.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runnable"));

    v9 = 0;
    goto LABEL_5;
  }
  v7 = v5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v10 = v7;
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();
LABEL_5:

    goto LABEL_6;
  }
  v9 = 1;
LABEL_6:

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runnable, 0);
}

void __76__WFSpotlightResultWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  char v5;
  int v6;
  _QWORD *v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[11];
  v7 = v2;
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  v5 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  v4 = v7;
  if (v7)
  {
    if ((v5 & 1) == 0)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "runnableRequiresSpotlightRefresh:", v7);
      v4 = v7;
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.shortcuts.spotlight.refresh"), 0);
LABEL_4:

        v4 = v7;
      }
    }
  }

}

@end
