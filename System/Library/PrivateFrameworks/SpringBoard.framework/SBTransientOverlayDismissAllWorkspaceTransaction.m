@implementation SBTransientOverlayDismissAllWorkspaceTransaction

- (SBTransientOverlayDismissAllWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  SBTransientOverlayDismissAllWorkspaceTransaction *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissAllWorkspaceTransaction;
  result = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v4, sel_initWithTransitionRequest_, a3);
  if (result)
    result->_animatedOverride = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t IsYes;
  id v14;
  _QWORD v15[4];
  id v16;
  SBTransientOverlayDismissAllWorkspaceTransaction *v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBTransientOverlayDismissAllWorkspaceTransaction;
  -[SBTransientOverlayDismissAllWorkspaceTransaction _begin](&v25, sel__begin);
  -[SBTransientOverlayDismissAllWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBTransientOverlayDismissAllWorkspaceTransactionMilestoneDismissalRequest"));
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenePresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__16;
  v23[4] = __Block_byref_object_dispose__16;
  v24 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke;
  v19[3] = &unk_1E8EA5348;
  v10 = v4;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  v22 = v23;
  objc_msgSend(v10, "enumerateTransientOverlayViewControllersUsingBlock:", v19);
  if (v7)
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllersInWindowScene:](SBMutableTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllersInWindowScene:", v3);
  else
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers](SBMutableTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsYes = objc_msgSend(v6, "isAnimated");
  if (self->_animatedOverride != 0x7FFFFFFFFFFFFFFFLL)
    IsYes = BSSettingFlagIsYes();
  objc_msgSend(v12, "setAnimated:", IsYes);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke_2;
  v15[3] = &unk_1E8E9FD30;
  v18 = v23;
  v14 = v10;
  v16 = v14;
  v17 = self;
  objc_msgSend(v12, "setCompletionHandler:", v15);
  objc_msgSend(v11, "performDismissalRequest:", v12);

  _Block_object_dispose(v23, 8);
}

void __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAcquiredTransientOverlayViewController:", v5) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "isPresentingViewController:", v5))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v10);
  }

}

uint64_t __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addAcquiredTransientOverlayViewController:forAppLayout:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "removeMilestone:", CFSTR("_SBTransientOverlayDismissAllWorkspaceTransactionMilestoneDismissalRequest"));
}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "transitionType") == 1)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "switcherController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasTransientOverlayAppLayouts") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "scenePresenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "hasActivePresentation") & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v4, "presentationManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v9 = !v10 && (objc_msgSend(v11, "hasActivePresentation") & 1) != 0;

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)isAnimatedOverride
{
  return self->_animatedOverride;
}

- (void)setAnimatedOverride:(int64_t)a3
{
  self->_animatedOverride = a3;
}

@end
