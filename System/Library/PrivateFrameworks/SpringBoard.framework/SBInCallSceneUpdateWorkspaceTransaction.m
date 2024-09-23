@implementation SBInCallSceneUpdateWorkspaceTransaction

- (SBInCallSceneUpdateWorkspaceTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4
{
  id v7;
  SBInCallSceneUpdateWorkspaceTransaction *v8;
  SBInCallSceneUpdateWorkspaceTransaction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBInCallSceneUpdateWorkspaceTransaction;
  v8 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v11, sel_initWithTransitionRequest_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_applicationSceneEntity, a3);

  return v9;
}

- (void)_begin
{
  void *v3;
  id postSceneUpdateHandler;
  void *v5;
  SBApplicationSceneUpdateTransaction *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  SBInCallSceneUpdateWorkspaceTransaction *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBInCallSceneUpdateWorkspaceTransaction;
  -[SBInCallSceneUpdateWorkspaceTransaction _begin](&v14, sel__begin);
  v3 = (void *)MEMORY[0x1D17E5550](self->_postSceneUpdateHandler);
  postSceneUpdateHandler = self->_postSceneUpdateHandler;
  self->_postSceneUpdateHandler = 0;

  if (v3)
    -[SBInCallSceneUpdateWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBInCallSceneUpdateWorkspaceTransactionMilestonePostSceneUpdateBlocks"));
  -[SBInCallSceneUpdateWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBInCallSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", self->_applicationSceneEntity, v5);
  -[FBApplicationUpdateScenesTransaction setWaitsForSceneCommits:](v6, "setWaitsForSceneCommits:", 1);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke;
  v11 = &unk_1E8EAAA98;
  v12 = self;
  v13 = v3;
  v7 = v3;
  -[SBApplicationSceneUpdateTransaction setCompletionBlock:](v6, "setCompletionBlock:", &v8);
  -[SBInCallSceneUpdateWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v6, 0, v8, v9, v10, v11, v12);

}

uint64_t __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke_2;
    v5[3] = &unk_1E8E9E980;
    v5[4] = *(_QWORD *)(a1 + 32);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, a2, v5);
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBInCallSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"));
}

uint64_t __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, char a2)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isFailed") & 1) == 0 && (a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "failWithReason:", CFSTR("Post scene update failure"));
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBInCallSceneUpdateWorkspaceTransactionMilestonePostSceneUpdateBlocks"));
}

- (id)postSceneUpdateHandler
{
  return self->_postSceneUpdateHandler;
}

- (void)setPostSceneUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postSceneUpdateHandler, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

@end
