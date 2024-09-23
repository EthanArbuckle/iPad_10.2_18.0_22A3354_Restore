@implementation SBPIPSceneContentSceneUpdateWorkspaceTransaction

- (SBPIPSceneContentSceneUpdateWorkspaceTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4
{
  id v7;
  SBPIPSceneContentSceneUpdateWorkspaceTransaction *v8;
  SBPIPSceneContentSceneUpdateWorkspaceTransaction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPIPSceneContentSceneUpdateWorkspaceTransaction;
  v8 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v11, sel_initWithTransitionRequest_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_applicationSceneEntity, a3);

  return v9;
}

- (void)_begin
{
  void *v3;
  SBApplicationSceneUpdateTransaction *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBPIPSceneContentSceneUpdateWorkspaceTransaction;
  -[SBPIPSceneContentSceneUpdateWorkspaceTransaction _begin](&v6, sel__begin);
  -[SBPIPSceneContentSceneUpdateWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBPIPSceneContentSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", self->_applicationSceneEntity, v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBPIPSceneContentSceneUpdateWorkspaceTransaction__begin__block_invoke;
  v5[3] = &unk_1E8E9E980;
  v5[4] = self;
  -[SBApplicationSceneUpdateTransaction setCompletionBlock:](v4, "setCompletionBlock:", v5);
  -[SBPIPSceneContentSceneUpdateWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v4, 0);

}

uint64_t __58__SBPIPSceneContentSceneUpdateWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBPIPSceneContentSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"));
}

- (void)_didComplete
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPSceneContentSceneUpdateWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v5, sel__didComplete);
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medusaHostedKeyboardWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateMedusaHostedKeyboardWindow");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

@end
