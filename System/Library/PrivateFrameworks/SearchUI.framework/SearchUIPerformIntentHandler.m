@implementation SearchUIPerformIntentHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v6 = a3;
  objc_msgSend(v6, "intentMessageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SearchUIGeneralLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SearchUIPerformIntentHandler performCommand:triggerEvent:environment:].cold.1(v16);
    goto LABEL_22;
  }
  if (!objc_msgSend(v6, "isRunnableWorkflow"))
  {
    objc_msgSend(v6, "intentMessageName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentCreate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v28;
      if (v18)
      {
        SearchUIGeneralLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SearchUIPerformIntentHandler performCommand:triggerEvent:environment:].cold.2((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

      }
    }
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D68]), "initWithIntent:executionContext:", v9, 5);
    goto LABEL_19;
  }
  WFSpotlightResultRunnableFromData();
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SearchUICommandHandler rowModel](self, "rowModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifyingResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isLocalApplicationResult");

      if (v14)
        v15 = 4;
      else
        v15 = 1;
    }
    else
    {

      v15 = 1;
    }
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D68]), "initWithRunnable:surface:", v9, v15);
LABEL_19:
    v16 = v26;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SearchUIPerformIntentHandler runViewSource](self, "runViewSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setRunViewSource:](v16, "setRunViewSource:", v27);

    }
    -[NSObject setDelegate:](v16, "setDelegate:", self);
    -[NSObject start](v16, "start");
    -[SearchUIPerformIntentHandler setRunnerClient:](self, "setRunnerClient:", v16);
    objc_storeStrong(&s_intentHandler, self);
LABEL_22:

  }
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *, void *))a5;
  objc_msgSend(v12, "intentMessageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intentMessageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentCreate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithIntent:", v9);
    objc_msgSend(v10, "_setExecutionContext:", 5);
    objc_msgSend(v12, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, v11);

  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    SearchUITapLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SearchUIPerformIntentHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runViewSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("SearchUICommandHandlerShortcutDidEndNotification"), v19);

  }
}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_runViewSource, a3);
}

- (WFWorkflowRunnerClient)runnerClient
{
  return self->_runnerClient;
}

- (void)setRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_runnerClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runnerClient, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
}

- (void)performCommand:(os_log_t)log triggerEvent:environment:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUIPerformIntentHandler: empty intentMessageData", v1, 2u);
}

- (void)performCommand:(uint64_t)a3 triggerEvent:(uint64_t)a4 environment:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "SearchuiPerformIntentHandler: %@", a5, a6, a7, a8, 2u);
}

- (void)workflowRunnerClient:(uint64_t)a3 didFinishRunningWorkflowWithOutput:(uint64_t)a4 error:(uint64_t)a5 cancelled:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "SearchUIPerformIntentHandler: workflowRunnerClient didFinishRunningWorkflowWithError: %@", a5, a6, a7, a8, 2u);
}

@end
