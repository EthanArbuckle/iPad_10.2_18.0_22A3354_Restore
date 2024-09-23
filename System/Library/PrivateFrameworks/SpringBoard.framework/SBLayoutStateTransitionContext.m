@implementation SBLayoutStateTransitionContext

- (SBLayoutStateTransitionContext)initWithWorkspaceTransaction:(id)a3
{
  id v4;
  SBLayoutStateTransitionContext *v5;
  SBLayoutStateTransitionContext *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBLayoutState *fromLayoutState;
  uint64_t v11;
  SBLayoutState *toLayoutState;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBLayoutStateTransitionContext;
  v5 = -[SBLayoutStateTransitionContext init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workspaceTransaction, v4);
    objc_msgSend(v4, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "previousLayoutState");
    v9 = objc_claimAutoreleasedReturnValue();
    fromLayoutState = v6->_fromLayoutState;
    v6->_fromLayoutState = (SBLayoutState *)v9;

    objc_msgSend(v8, "layoutState");
    v11 = objc_claimAutoreleasedReturnValue();
    toLayoutState = v6->_toLayoutState;
    v6->_toLayoutState = (SBLayoutState *)v11;

    objc_storeWeak((id *)&v6->_applicationTransitionContext, v8);
    v6->_animationsDisabled = objc_msgSend(v8, "animationDisabled");

  }
  return v6;
}

- (SBLayoutState)toLayoutState
{
  return self->_toLayoutState;
}

- (void)transitionCompletedWithError:(id)a3
{
  self->_complete = 1;
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (SBLayoutState)fromLayoutState
{
  return self->_fromLayoutState;
}

- (SBWorkspaceApplicationSceneTransitionContext)applicationTransitionContext
{
  return (SBWorkspaceApplicationSceneTransitionContext *)objc_loadWeakRetained((id *)&self->_applicationTransitionContext);
}

- (BOOL)isInterrupted
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SBLayoutStateTransitionContext workspaceTransaction](self, "workspaceTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInterrupted") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBLayoutStateTransitionContext error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (NSError)error
{
  return self->_error;
}

- (SBWorkspaceTransaction)workspaceTransaction
{
  return (SBWorkspaceTransaction *)objc_loadWeakRetained((id *)&self->_workspaceTransaction);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationTransitionContext);
  objc_destroyWeak((id *)&self->_workspaceTransaction);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_toLayoutState, 0);
  objc_storeStrong((id *)&self->_fromLayoutState, 0);
}

- (SBLayoutStateTransitionContext)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support initialization."), v6);

  return -[SBLayoutStateTransitionContext initWithWorkspaceTransaction:](self, "initWithWorkspaceTransaction:", 0);
}

- (BOOL)animationsDisabled
{
  return self->_animationsDisabled;
}

@end
