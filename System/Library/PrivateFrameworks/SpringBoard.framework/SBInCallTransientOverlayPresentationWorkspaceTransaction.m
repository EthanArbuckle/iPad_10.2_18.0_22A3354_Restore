@implementation SBInCallTransientOverlayPresentationWorkspaceTransaction

- (SBInCallTransientOverlayPresentationWorkspaceTransaction)initWithTransitionRequest:(id)a3 sourcePresentationSession:(id)a4 analyticsSource:(id)a5
{
  id v9;
  id v10;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v11;
  uint64_t v12;
  NSString *analyticsSource;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBInCallTransientOverlayPresentationWorkspaceTransaction;
  v11 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v15, sel_initWithTransitionRequest_, a3);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    analyticsSource = v11->_analyticsSource;
    v11->_analyticsSource = (NSString *)v12;

    objc_storeStrong((id *)&v11->_sourcePresentationSession, a4);
  }

  return v11;
}

- (void)_begin
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBInCallTransientOverlayPresentationWorkspaceTransaction;
  -[SBInCallTransientOverlayPresentationWorkspaceTransaction _begin](&v19, sel__begin);
  if (!self->_sourcePresentationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallTransientOverlayPresentationWorkspaceTransaction.m"), 38, CFSTR("Source presentation session required."));

  }
  -[SBInCallTransientOverlayPresentationWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession sceneHandle](self->_sourcePresentationSession, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(v4, "copyMainWorkspaceTransitionRequest");
    objc_msgSend(v11, "modifyApplicationContext:", &__block_literal_global_175);
    -[SBInCallTransientOverlayPresentationWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestoneToAppsTransaction"));
    objc_msgSend(v5, "transactionForTransitionRequest:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_3;
    v17[3] = &unk_1E8EAAA98;
    v17[4] = self;
    v18 = v13;
    v14 = v13;
    objc_msgSend(v12, "setCompletionBlock:", v17);
    -[SBInCallTransientOverlayPresentationWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v12, 0);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_5;
    v16[3] = &unk_1E8E9E980;
    v16[4] = self;
    -[SBInCallTransientOverlayPresentationWorkspaceTransaction _performInCallPresentationWithCompletion:](self, "_performInCallPresentationWithCompletion:", v16);
  }

}

void __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_2;
  v5[3] = &unk_1E8EA2880;
  v6 = v2;
  v4 = v2;
  SBLayoutRoleEnumerateValidRoles(v5);
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivatingEntity:", v3);

  objc_msgSend(v4, "setAnimationDisabled:", 1);
}

void __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  v5 = *(void **)(a1 + 32);
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_4;
    v7[3] = &unk_1E8E9E980;
    v7[4] = v5;
    objc_msgSend(v5, "_performInCallPresentationWithCompletion:", v7);
  }
  else
  {
    objc_msgSend(v5, "removeMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"));
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestoneToAppsTransaction"));
}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"));
}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "failWithReason:", CFSTR("PreparationFailure"));
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"));
}

- (void)_performInCallPresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBInCallPresentationSession *sourcePresentationSession;
  void *v8;
  uint64_t v9;
  NSString *analyticsSource;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v15;
  id v16;

  v4 = a3;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sourcePresentationSession = self->_sourcePresentationSession;
  objc_msgSend(v5, "transientOverlayContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAnimated");
  analyticsSource = self->_analyticsSource;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke;
  v13[3] = &unk_1E8EAFC10;
  v15 = self;
  v16 = v4;
  v14 = v6;
  v11 = v4;
  v12 = v6;
  -[SBInCallPresentationSession _prepareForTransientOverlayPresentationTransactionWithAnimation:analyticsSource:completion:](sourcePresentationSession, "_prepareForTransientOverlayPresentationTransactionWithAnimation:analyticsSource:completion:", v9, analyticsSource, v13);

}

void __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke(id *a1, int a2, void *a3)
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;

  if (a2)
  {
    objc_msgSend(a3, "requestBuilder");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "createRequestWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);
    objc_msgSend(a1[4], "transactionForTransitionRequest:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke_2;
    v12 = &unk_1E8EAFBE8;
    v13 = v7;
    v14 = a1[6];
    v8 = v7;
    objc_msgSend(v6, "setCompletionBlock:", &v9);
    objc_msgSend(a1[5], "addChildTransaction:withSchedulingPolicy:", v6, 0, v9, v10, v11, v12);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)analyticsSource
{
  return self->_analyticsSource;
}

- (SBInCallPresentationSession)sourcePresentationSession
{
  return self->_sourcePresentationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePresentationSession, 0);
  objc_storeStrong((id *)&self->_analyticsSource, 0);
}

@end
