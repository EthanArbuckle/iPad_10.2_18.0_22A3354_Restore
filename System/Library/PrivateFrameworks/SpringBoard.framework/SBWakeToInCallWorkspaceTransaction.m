@implementation SBWakeToInCallWorkspaceTransaction

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v12;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBWakeToInCallWorkspaceTransaction;
  -[SBWakeToInCallWorkspaceTransaction _begin](&v25, sel__begin);
  -[SBWakeToInCallWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBWakeToInCallWorkspaceTransactionMilestonePresentation"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inCallPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__61;
  v23 = __Block_byref_object_dispose__61;
  v24 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke;
  v15[3] = &unk_1E8EB0ED0;
  v8 = v6;
  v16 = v8;
  v18 = &v19;
  v9 = v5;
  v17 = v9;
  SBLayoutRoleEnumerateValidRoles(v15);
  v10 = (void *)v20[5];
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(v9, "_lastPresentationSession");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[SBWakeToInCallWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("_SBWakeToInCallWorkspaceTransactionMilestonePresentation"));
      goto LABEL_5;
    }
  }
  v12 = [SBInCallTransientOverlayPresentationWorkspaceTransaction alloc];
  v13 = -[SBInCallTransientOverlayPresentationWorkspaceTransaction initWithTransitionRequest:sourcePresentationSession:analyticsSource:](v12, "initWithTransitionRequest:sourcePresentationSession:analyticsSource:", v3, v11, *MEMORY[0x1E0DAC7E0]);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke_2;
  v14[3] = &unk_1E8E9E980;
  v14[4] = self;
  -[SBInCallTransientOverlayPresentationWorkspaceTransaction setCompletionBlock:](v13, "setCompletionBlock:", v14);
  -[SBWakeToInCallWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v13, 0);

LABEL_5:
  _Block_object_dispose(&v19, 8);

}

void __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceApplicationSceneEntity");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v12;
  if (v12)
  {
    objc_msgSend(v12, "sceneHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v5, "sceneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_sessionForSceneWithIdentifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    v4 = v12;
  }

}

uint64_t __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBWakeToInCallWorkspaceTransactionMilestonePresentation"));
}

@end
