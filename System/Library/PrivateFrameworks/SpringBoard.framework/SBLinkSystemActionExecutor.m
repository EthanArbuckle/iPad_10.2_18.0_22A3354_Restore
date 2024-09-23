@implementation SBLinkSystemActionExecutor

- (SBLinkSystemActionExecutor)initWithSystemAction:(id)a3
{
  SBLinkSystemActionExecutor *v3;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *prewarmQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLinkSystemActionExecutor;
  v3 = -[SBAbstractSystemActionExecutor initWithSystemAction:](&v7, sel_initWithSystemAction_, a3);
  if (v3)
  {
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    prewarmQueue = v3->_prewarmQueue;
    v3->_prewarmQueue = (OS_dispatch_queue *)SerialWithQoS;

  }
  return v3;
}

- (BOOL)_canBeExecuted
{
  return -[WFStaccatoWorkflowRunnerClient hasCompletedRun](self->_runnerClient, "hasCompletedRun") ^ 1;
}

- (BOOL)_isExecuting
{
  return -[WFStaccatoWorkflowRunnerClient isRunning](self->_runnerClient, "isRunning");
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  return 1;
}

- (id)_previewWithCoordinator:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  SBSystemActionPreviewContext *v11;
  void *v12;
  void *v13;
  int v14;
  WFStaccatoWorkflowRunnerClient *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *prewarmQueue;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  SBSystemActionPreviewInvalidatable *v35;
  SBSystemActionPreviewInvalidatable *previewAssertion;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id result;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  const char *v50;
  _QWORD block[5];

  v5 = a3;
  -[SBAbstractSystemActionExecutor systemAction](self, "systemAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = v7;
    objc_msgSend(v10, "intent");
    v11 = (SBSystemActionPreviewContext *)objc_claimAutoreleasedReturnValue();
    -[SBSystemActionPreviewContext linkAction](v11, "linkAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) Cannot execute action without link action; app intent: %@, configured action: %@"),
        self,
        v11,
        v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogSystemActionExecution();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        -[SBLinkSystemActionExecutor _previewWithCoordinator:].cold.1((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);

      SBSystemActionExecutionErrorCreate(1, v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    }

  }
  objc_msgSend(v7, "associatedBundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) Cannot execute action without bundle ID; configured action: %@"),
      self,
      v7);
    v11 = (SBSystemActionPreviewContext *)objc_claimAutoreleasedReturnValue();
    SBLogSystemActionExecution();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[SBLinkSystemActionExecutor _previewWithCoordinator:].cold.1((uint64_t)v11, v17, v18, v19, v20, v21, v22, v23);

    SBSystemActionExecutionErrorCreate(1, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_msgSend(v7, "sectionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Shortcuts"));

  v15 = self->_runnerClient;
  if (v15)
  {
    v16 = v15;
    v11 = 0;
LABEL_20:
    prewarmQueue = self->_prewarmQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SBLinkSystemActionExecutor__previewWithCoordinator___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(prewarmQueue, block);
    if (v11)
      v31 = 0;
    else
      v31 = v14;
    if (v31 == 1)
    {
      v11 = objc_alloc_init(SBSystemActionPreviewContext);
      objc_msgSend(v16, "presentableRequester");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemActionPreviewContext setClientIdentifier:](v11, "setClientIdentifier:", v32);

      objc_msgSend(v16, "presentableIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemActionPreviewContext setElementIdentifier:](v11, "setElementIdentifier:", v33);

      -[SBSystemActionPreviewContext userInfo](v11, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v16, CFSTR("SBLinkSystemActionRunnerClient"));

    }
    objc_msgSend(v5, "showPreviewForAction:withContext:", v6, v11);
    v35 = (SBSystemActionPreviewInvalidatable *)objc_claimAutoreleasedReturnValue();
    previewAssertion = self->_previewAssertion;
    self->_previewAssertion = v35;

    v24 = 0;
LABEL_29:

    return v24;
  }
  v50 = a2;
  objc_msgSend(v5, "previewContextForAction:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    v27 = v14;
  else
    v27 = 0;
  if (v27 != 1)
    goto LABEL_18;
  objc_msgSend(v25, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("SBLinkSystemActionRunnerClient"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_17:

LABEL_18:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D90]), "initWithStaccatoAction:", v7);
    v11 = 0;
LABEL_19:
    objc_msgSend(v16, "setDelegate:", self);
    objc_storeStrong((id *)&self->_runnerClient, v16);

    goto LABEL_20;
  }
  objc_msgSend(v16, "action");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v29, "isEqual:", v7);

  if ((v49 & 1) != 0)
  {
    if (!objc_msgSend(v16, "hasCompletedRun"))
    {
      v11 = v26;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v46 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v16, "action");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringWithFormat:", CFSTR("The found runner client should be for the same system action; runner client action: %@"),
    v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBLinkSystemActionExecutor _previewWithCoordinator:].cold.3(v50, (uint64_t)self, (uint64_t)v48);
  objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __54__SBLinkSystemActionExecutor__previewWithCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "userInteractionBegan");
}

- (void)_cancelPreviewing
{
  SBSystemActionPreviewInvalidatable *previewAssertion;

  -[SBSystemActionPreviewInvalidatable invalidateAfterDefaultTimeoutForActionCancelled](self->_previewAssertion, "invalidateAfterDefaultTimeoutForActionCancelled");
  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = 0;

}

- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  SBSystemActionPreviewInvalidatable *previewAssertion;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;

  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  -[SBCameraActivationManager workspace]((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)*MEMORY[0x1E0DC82E8];
  v11 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v8);

  if (!v11)
  {
    v12 = (id *)MEMORY[0x1E0DC82E0];
    goto LABEL_5;
  }
  if (v11 == 1)
  {
    v12 = (id *)MEMORY[0x1E0DC82D8];
LABEL_5:
    v13 = *v12;

    v10 = v13;
  }
  -[SBSystemActionPreviewInvalidatable acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed](self->_previewAssertion, "acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = 0;

  v16 = -[SBAbstractSystemActionExecutor executionGeneration](self, "executionGeneration");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__SBLinkSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke;
  v21[3] = &unk_1E8EB7940;
  v21[4] = self;
  v22 = v10;
  v23 = v9;
  v24 = v16;
  v17 = v9;
  v18 = v10;
  v19 = (void *)MEMORY[0x1D17E5550](v21);
  v7[2](v7, v19);

  return v14;
}

void __91__SBLinkSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (a2)
  {
    objc_msgSend(v5, "startWithInteractionType:preciseTimeStamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_msgSend(v5, "isRunning") & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 == objc_msgSend(*(id *)(a1 + 32), "executionGeneration"))
      objc_msgSend(*(id *)(a1 + 32), "_finishExecutingWithResult:", v7);
  }

}

- (void)_finishExecutingWithResult:(id)a3
{
  WFStaccatoWorkflowRunnerClient *runnerClient;
  id v5;
  objc_super v6;

  runnerClient = self->_runnerClient;
  self->_runnerClient = 0;
  v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)SBLinkSystemActionExecutor;
  -[SBAbstractSystemActionExecutor _finishExecutingWithResult:](&v6, sel__finishExecutingWithResult_, v5);

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = a6;
  v8 = a5;
  if (v6)
  {
    v10 = v8;
    SBSystemActionExecutionErrorCreateWithError(2, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  v11 = v8;
  -[SBLinkSystemActionExecutor _finishExecutingWithResult:](self, "_finishExecutingWithResult:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmQueue, 0);
  objc_storeStrong((id *)&self->_runnerClient, 0);
  objc_storeStrong((id *)&self->_previewAssertion, 0);
}

- (void)_previewWithCoordinator:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_9(&dword_1D0540000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

- (void)_previewWithCoordinator:(uint64_t)a3 .cold.3(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBLinkSystemActionExecutor.m");
  v16 = 1024;
  v17 = 95;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
