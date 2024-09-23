@implementation SBMainWorkspaceTransitionRequest

void __70__SBMainWorkspaceTransitionRequest_copyMainWorkspaceTransitionRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForLayoutRole:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setEntity:forLayoutRole:", v6, a2);
    v5 = v6;
  }

}

- (void)finalize
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest finalize](&v16, sel_finalize);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isApplicationSceneEntity")
          && (objc_msgSend(v10, "isDeviceApplicationSceneEntity") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainWorkspaceTransitionRequest.m"), 218, CFSTR("Entity for a device request must be a SBDeviceApplicationSceneEntity."));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (int64_t)source
{
  return self->_source;
}

- (BOOL)isCrossingDisplays
{
  return self->_crossingDisplays;
}

- (SBBannerUnfurlSourceContextProviding)bannerUnfurlSourceContextProvider
{
  return self->_bannerUnfurlSourceContextProvider;
}

id __84__SBMainWorkspaceTransitionRequest_ancillaryTransitionRequestsForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_ancillaryTransitionRequestForTransitionRequest:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyMainWorkspaceTransitionRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBWorkspaceApplicationSceneTransitionContext *v8;
  SBWorkspaceApplicationSceneTransitionContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBWorkspaceTransientOverlayTransitionContext *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  SBWorkspaceApplicationSceneTransitionContext *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[SBWorkspaceTransitionRequest workspace](self, "workspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionRequest displayConfiguration](self, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v3;
  objc_msgSend(v3, "createRequestWithOptions:displayConfiguration:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", -[SBMainWorkspaceTransitionRequest source](self, "source"));
  -[SBWorkspaceTransitionRequest eventLabel](self, "eventLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventLabel:", v6);

  -[SBMainWorkspaceTransitionRequest bannerUnfurlSourceContextProvider](self, "bannerUnfurlSourceContextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBannerUnfurlSourceContextProvider:", v7);

  objc_msgSend(v5, "setShouldPreventEmergencyNotificationBannerDismissal:", -[SBMainWorkspaceTransitionRequest shouldPreventEmergencyNotificationBannerDismissal](self, "shouldPreventEmergencyNotificationBannerDismissal"));
  objc_msgSend(v5, "setShouldPreventDismissalOfUnrelatedTransientOverlays:", -[SBMainWorkspaceTransitionRequest shouldPreventDismissalOfUnrelatedTransientOverlays](self, "shouldPreventDismissalOfUnrelatedTransientOverlays"));
  objc_msgSend(v5, "setCenterConfiguration:", -[SBMainWorkspaceTransitionRequest centerConfiguration](self, "centerConfiguration"));
  v8 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __70__SBMainWorkspaceTransitionRequest_copyMainWorkspaceTransitionRequest__block_invoke;
  v52[3] = &unk_1E8EABFB0;
  v52[4] = self;
  v9 = v8;
  v53 = v9;
  SBLayoutRoleEnumerateValidRoles(v52);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entitiesWithRemovalContexts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removalContextForEntity:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWorkspaceApplicationSceneTransitionContext setRemovalContext:forEntity:](v9, "setRemovalContext:forEntity:", v18, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v13);
  }

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activatingEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setActivatingEntity:](v9, "setActivatingEntity:", v20);

  -[SBWorkspaceTransitionRequest transientOverlayContext](self, "transientOverlayContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = objc_alloc_init(SBWorkspaceTransientOverlayTransitionContext);
    -[SBWorkspaceTransientOverlayTransitionContext setAnimated:](v22, "setAnimated:", objc_msgSend(v21, "isAnimated"));
    objc_msgSend(v21, "scenePresenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransientOverlayTransitionContext setScenePresenter:](v22, "setScenePresenter:", v23);

    objc_msgSend(v21, "presentationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransientOverlayTransitionContext setPresentationManager:](v22, "setPresentationManager:", v24);

    objc_msgSend(v21, "transientOverlay");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransientOverlayTransitionContext setTransientOverlay:](v22, "setTransientOverlay:", v25);

    -[SBWorkspaceTransientOverlayTransitionContext setTransitionType:](v22, "setTransitionType:", objc_msgSend(v21, "transitionType"));
  }
  else
  {
    v22 = 0;
  }
  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedUnlockedEnvironmentMode:](v9, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(v26, "requestedUnlockedEnvironmentMode"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingConfiguration:](v9, "setRequestedFloatingConfiguration:", objc_msgSend(v27, "requestedFloatingConfiguration"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterConfiguration:](v9, "setRequestedCenterConfiguration:", objc_msgSend(v28, "requestedCenterConfiguration"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedPeekConfiguration:](v9, "setRequestedPeekConfiguration:", objc_msgSend(v29, "requestedPeekConfiguration"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingSwitcherVisible:](v9, "setRequestedFloatingSwitcherVisible:", objc_msgSend(v30, "requestedFloatingSwitcherVisible"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterEntityModal:](v9, "setRequestedCenterEntityModal:", objc_msgSend(v31, "requestedCenterEntityModal"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setWaitsForSceneUpdates:](v9, "setWaitsForSceneUpdates:", objc_msgSend(v32, "waitsForSceneUpdates"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setPreferredInterfaceOrientation:](v9, "setPreferredInterfaceOrientation:", objc_msgSend(v33, "preferredInterfaceOrientation"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionContext setAnimationDisabled:](v9, "setAnimationDisabled:", objc_msgSend(v34, "animationDisabled"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setPrefersCrossfadeTransition:](v9, "setPrefersCrossfadeTransition:", objc_msgSend(v35, "prefersCrossfadeTransition"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setPrefersCenterZoomTransition:](v9, "setPrefersCenterZoomTransition:", objc_msgSend(v36, "prefersCenterZoomTransition"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setTransitioningToLessRecentSpace:](v9, "setTransitioningToLessRecentSpace:", objc_msgSend(v37, "isTransitioningToLessRecentSpace"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "requestedAppExposeBundleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedAppExposeBundleID:](v9, "setRequestedAppExposeBundleID:", v39);

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setDisablesAutoPIP:](v9, "setDisablesAutoPIP:", objc_msgSend(v40, "disablesAutoPIP"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "requestedEntityIdentifierToLayoutAttributes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedEntityIdentifierToLayoutAttributes:](v9, "setRequestedEntityIdentifierToLayoutAttributes:", v42);

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setRetainsSiri:](v9, "setRetainsSiri:", objc_msgSend(v43, "retainsSiri"));

  -[SBWorkspaceTransitionRequest applicationContext](self, "applicationContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setDelegate:](v9, "setDelegate:", v45);

  objc_msgSend(v5, "setApplicationContext:", v9);
  objc_msgSend(v5, "setTransientOverlayContext:", v22);

  return v5;
}

- (BOOL)shouldPreventEmergencyNotificationBannerDismissal
{
  return self->_shouldPreventEmergencyNotificationBannerDismissal;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)shouldPreventDismissalOfUnrelatedTransientOverlays
{
  return self->_shouldPreventDismissalOfUnrelatedTransientOverlays;
}

- (void)setTransientOverlayContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "presentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SBWorkspaceTransitionRequest workspace](self, "workspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transientOverlayPresentationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPresentationManager:", v8);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest setTransientOverlayContext:](&v9, sel_setTransientOverlayContext_, v5);

}

- (void)setShouldPreventEmergencyNotificationBannerDismissal:(BOOL)a3
{
  self->_shouldPreventEmergencyNotificationBannerDismissal = a3;
}

- (void)setShouldPreventDismissalOfUnrelatedTransientOverlays:(BOOL)a3
{
  self->_shouldPreventDismissalOfUnrelatedTransientOverlays = a3;
}

- (void)setCenterConfiguration:(int64_t)a3
{
  self->_centerConfiguration = a3;
}

- (void)setBannerUnfurlSourceContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContextProvider, a3);
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (id)compactDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest compactDescriptionBuilder](&v7, sel_compactDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBMainWorkspaceTransitionSourceDescription(self->_source);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("source"));

  return v3;
}

- (SBMainWorkspaceTransitionRequest)initWithDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  SBMainWorkspaceTransitionRequest *v6;
  objc_super v8;

  v4 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspaceTransitionRequest;
  v6 = -[SBWorkspaceTransitionRequest _initWithWorkspace:displayConfiguration:](&v8, sel__initWithWorkspace_displayConfiguration_, v5, v4);

  return v6;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBMainWorkspaceTransitionSourceDescription(self->_source);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("source"));

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBMainWorkspaceTransitionRequest _invalidateCompletionTasks](self, "_invalidateCompletionTasks");
  v3.receiver = self;
  v3.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBMainWorkspaceTransitionRequest dealloc](&v3, sel_dealloc);
}

- (void)_invalidateCompletionTasks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *completionTasks;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_completionTasks, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "invalidate", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_completionTasks, "removeAllObjects");
  completionTasks = self->_completionTasks;
  self->_completionTasks = 0;

}

+ (id)ancillaryTransitionRequestsForTransitionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedWindowScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBMainWorkspaceTransitionRequest_ancillaryTransitionRequestsForTransitionRequest___block_invoke;
  v9[3] = &unk_1E8EBBE98;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "bs_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerWindowSourceSceneID, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContextProvider, 0);
  objc_storeStrong((id *)&self->_completionTasks, 0);
  objc_storeStrong(&self->_transactionConfigurator, 0);
  objc_storeStrong(&self->_transactionProvider, 0);
}

- (BOOL)isMainWorkspaceTransitionRequest
{
  return 1;
}

- (id)transactionConfigurator
{
  return self->_transactionConfigurator;
}

- (id)transactionProvider
{
  return self->_transactionProvider;
}

- (id)completionBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_completionTasks)
    return (id)objc_msgSend(&__block_literal_global_329, "copy");
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBMainWorkspaceTransitionRequest_completionBlock__block_invoke_2;
  v4[3] = &unk_1E8EA1F50;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_msgSend(v4, "copy");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)declineWithReason:(id)a3
{
  NSMutableArray *completionTasks;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest declineWithReason:](&v15, sel_declineWithReason_, a3);
  if (!-[SBWorkspaceTransitionRequest isFinalized](self, "isFinalized"))
  {
    -[SBMainWorkspaceTransitionRequest setTransactionProvider:](self, "setTransactionProvider:", 0);
    -[SBMainWorkspaceTransitionRequest setTransactionConfigurator:](self, "setTransactionConfigurator:", 0);
    completionTasks = self->_completionTasks;
    if (completionTasks)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = completionTasks;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "task", (_QWORD)v11);
            v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v10[2](v10, 0);

            ++v9;
          }
          while (v7 != v9);
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v7);
      }

      -[SBMainWorkspaceTransitionRequest _invalidateCompletionTasks](self, "_invalidateCompletionTasks");
    }
  }
}

- (void)setTransactionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setTransactionConfigurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  SBMainWorkspaceTransitionRequest *v9;

  v6 = (void *)MEMORY[0x1E0CB3488];
  v7 = a4;
  objc_msgSend(v6, "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainWorkspaceTransitionRequest.m"), 65, CFSTR("call init instead"));

  v9 = -[SBMainWorkspaceTransitionRequest initWithDisplayConfiguration:](self, "initWithDisplayConfiguration:", v7);
  return v9;
}

- (id)addCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *completionTasks;
  SBMainWorkspaceTransitionRequestCompletionTask *v7;
  SBMainWorkspaceTransitionRequestCompletionTask *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  if (v4)
  {
    if (!self->_completionTasks)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      completionTasks = self->_completionTasks;
      self->_completionTasks = v5;

    }
    objc_initWeak(&location, self);
    v7 = [SBMainWorkspaceTransitionRequestCompletionTask alloc];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __57__SBMainWorkspaceTransitionRequest_addCompletionHandler___block_invoke;
    v13 = &unk_1E8E9E468;
    objc_copyWeak(&v14, &location);
    v8 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](v7, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBMainWorkspaceTransitionRequest"), CFSTR("Completion"), &v10);
    -[SBMainWorkspaceTransitionRequestCompletionTask setTask:](v8, "setTask:", v4, v10, v11, v12, v13);
    -[NSMutableArray addObject:](self->_completionTasks, "addObject:", v8);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __57__SBMainWorkspaceTransitionRequest_addCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[14], "removeObject:", v5);

}

void __51__SBMainWorkspaceTransitionRequest_completionBlock__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = WeakRetained[14];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "task", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "task");
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v12[2](v12, a2);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "_invalidateCompletionTasks");
  }

}

- (void)modifyTransientOverlayContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMainWorkspaceTransitionRequest;
  -[SBWorkspaceTransitionRequest modifyTransientOverlayContext:](&v11, sel_modifyTransientOverlayContext_, a3);
  -[SBWorkspaceTransitionRequest transientOverlayContext](self, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "transitionType"))
  {
    if (objc_msgSend(v6, "prefersContinuityDisplayPresentation")
      && +[SBContinuitySessionManager areContinuitySessionsAllowed](SBContinuitySessionManager, "areContinuitySessionsAllowed"))
    {
      +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "state") == 10)
      {
        objc_msgSend(v8, "mainWindowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_10:
          objc_msgSend(v4, "setWindowScene:", v9);

          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v6, "prefersEmbeddedDisplayPresentation"))
    {
      -[SBWorkspaceTransitionRequest workspace](self, "workspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainWindowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)setCrossingDisplays:(BOOL)a3
{
  self->_crossingDisplays = a3;
}

- (NSString)centerWindowSourceSceneID
{
  return self->_centerWindowSourceSceneID;
}

- (void)setCenterWindowSourceSceneID:(id)a3
{
  objc_storeStrong((id *)&self->_centerWindowSourceSceneID, a3);
}

@end
