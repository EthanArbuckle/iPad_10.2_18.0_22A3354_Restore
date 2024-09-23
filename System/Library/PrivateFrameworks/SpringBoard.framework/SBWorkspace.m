@implementation SBWorkspace

+ (id)mainWorkspace
{
  return +[SBMainWorkspace _sharedInstanceWithNilCheckPolicy:](SBMainWorkspace, "_sharedInstanceWithNilCheckPolicy:", 1);
}

- (FBWorkspaceEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4
{
  return -[SBWorkspace _executeTransitionRequest:options:validator:](self, "_executeTransitionRequest:options:validator:", a3, 0, a4);
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  void *v12;
  BOOL v13;

  v10 = (void (**)(id, void *))a5;
  v11 = a6;
  -[SBWorkspace createRequestWithOptions:displayConfiguration:](self, "createRequestWithOptions:displayConfiguration:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v10[2](v10, v12);
  v13 = -[SBWorkspace _executeTransitionRequest:options:validator:](self, "_executeTransitionRequest:options:validator:", v12, a3, v11);

  return v13;
}

void __86__SBWorkspace_createRequestForApplicationActivation_withDisplayConfiguration_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLForActivationSetting:", 3))
    objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setActivatingEntity:", *(_QWORD *)(a1 + 32));

}

- (BOOL)requestTransitionWithBuilder:(id)a3
{
  return -[SBWorkspace requestTransitionWithOptions:builder:validator:](self, "requestTransitionWithOptions:builder:validator:", 0, a3, 0);
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  void *v10;
  BOOL v11;

  v8 = (void (**)(id, void *))a4;
  v9 = a5;
  -[SBWorkspace createRequestWithOptions:](self, "createRequestWithOptions:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8, v10);
  v11 = -[SBWorkspace _executeTransitionRequest:options:validator:](self, "_executeTransitionRequest:options:validator:", v10, a3, v9);

  return v11;
}

- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  -[SBWorkspace createRequestWithOptions:displayConfiguration:](self, "createRequestWithOptions:displayConfiguration:", a5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEventLabelWithFormat:", CFSTR("ActivateApplicationScene = %@"), v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__SBWorkspace_createRequestForApplicationActivation_withDisplayConfiguration_options___block_invoke;
  v13[3] = &unk_1E8E9EE50;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v9, "modifyApplicationContext:", v13);

  return v9;
}

- (SBWorkspace)init
{
  return -[SBWorkspace initWithEventQueue:](self, "initWithEventQueue:", 0);
}

- (SBWorkspace)initWithEventQueue:(id)a3
{
  id v6;
  SBWorkspace *v7;
  SBWorkspace *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 1593, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventQueue"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBWorkspace;
  v7 = -[SBWorkspace init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_eventQueue, a3);

  return v8;
}

- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4
{
  return -[SBWorkspace createRequestForApplicationActivation:withDisplayConfiguration:options:](self, "createRequestForApplicationActivation:withDisplayConfiguration:options:", a3, 0, a4);
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5
{
  return -[SBWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](self, "requestTransitionWithOptions:displayConfiguration:builder:validator:", a3, a4, a5, 0);
}

- (BOOL)executeTransitionRequest:(id)a3
{
  return -[SBWorkspace _executeTransitionRequest:options:validator:](self, "_executeTransitionRequest:options:validator:", a3, 0, 0);
}

- (SBWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (id)createRequestWithOptions:(unint64_t)a3
{
  id result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4
{
  id result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)transactionForTransitionRequest:(id)a3
{
  id result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return objc_alloc_init(SBDisabledIdleTimer);
}

- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return 0;
}

@end
