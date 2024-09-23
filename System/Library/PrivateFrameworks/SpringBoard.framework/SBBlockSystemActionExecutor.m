@implementation SBBlockSystemActionExecutor

- (SBBlockSystemActionExecutor)initWithSystemAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBBlockSystemActionExecutor;
  return -[SBAbstractSystemActionExecutor initWithSystemAction:](&v4, sel_initWithSystemAction_, a3);
}

- (SBSystemActionActionBlockProviding)systemAction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBBlockSystemActionExecutor;
  -[SBAbstractSystemActionExecutor systemAction](&v3, sel_systemAction);
  return (SBSystemActionActionBlockProviding *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_canBeExecuted
{
  return !self->_executing;
}

- (BOOL)_isExecuting
{
  return self->_executing;
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  void *v2;
  void *v3;
  void *v4;

  -[SBBlockSystemActionExecutor systemAction](self, "systemAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "hasSuffix:", *MEMORY[0x1E0DAACB8]);
  return (char)v2;
}

- (id)_previewWithCoordinator:(id)a3
{
  id v4;
  void *v5;
  SBSystemActionPreviewInvalidatable *v6;
  SBSystemActionPreviewInvalidatable *previewAssertion;

  v4 = a3;
  -[SBBlockSystemActionExecutor systemAction](self, "systemAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showPreviewForAction:withContext:", v5, 0);
  v6 = (SBSystemActionPreviewInvalidatable *)objc_claimAutoreleasedReturnValue();

  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = v6;

  return 0;
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
  id v7;
  SBSystemActionPreviewInvalidatable *previewAssertion;
  void (**v9)(id, void *);
  void *v10;
  SBSystemActionPreviewInvalidatable *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v7 = a3;
  previewAssertion = self->_previewAssertion;
  v9 = (void (**)(id, void *))a4;
  -[SBSystemActionPreviewInvalidatable acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed](previewAssertion, "acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_previewAssertion;
  self->_previewAssertion = 0;

  self->_executing = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke;
  v15[3] = &unk_1E8EA93C0;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  v13 = (void *)MEMORY[0x1D17E5550](v15);
  v9[2](v9, v13);

  return v10;
}

void __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "systemAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke_2;
    v7[3] = &unk_1E8EA78D8;
    v6 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    ((void (**)(_QWORD, uint64_t, _QWORD *))v5)[2](v5, v6, v7);

  }
  else
  {
    objc_msgSend(v3, "_handleExecutionBlockFinishedWithResult:");
  }
}

uint64_t __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleExecutionBlockFinishedWithResult:", a2);
}

- (void)_handleExecutionBlockFinishedWithResult:(id)a3
{
  self->_executing = 0;
  -[SBAbstractSystemActionExecutor _finishExecutingWithResult:](self, "_finishExecutingWithResult:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAssertion, 0);
}

@end
