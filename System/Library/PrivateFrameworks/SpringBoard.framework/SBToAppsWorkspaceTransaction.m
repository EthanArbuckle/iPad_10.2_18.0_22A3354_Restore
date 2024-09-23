@implementation SBToAppsWorkspaceTransaction

uint64_t __44__SBToAppsWorkspaceTransaction__didComplete__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v4;
}

- (BOOL)isGoingToLauncher
{
  SBToAppsWorkspaceTransaction *v2;
  void *v3;

  v2 = self;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SBToAppsWorkspaceTransaction _isGoingToHomeScreenForTransitionRequest:](v2, "_isGoingToHomeScreenForTransitionRequest:", v3);

  return (char)v2;
}

- (BOOL)_isGoingToHomeScreenForTransitionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 IsValid;
  _BOOL4 v12;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unlockedEnvironmentMode");
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v8, "peekConfiguration"));
  if (v9 != 1 && !IsValid)
    LOBYTE(v12) = 0;
  else
    v12 = !-[SBToAppsWorkspaceTransaction isGoingToCoverSheet](self, "isGoingToCoverSheet");

  return v12;
}

- (BOOL)isGoingToCoverSheet
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "transitionType") == 1;
  else
    v7 = 0;
  v8 = v4 & v7;

  return v8;
}

- (NSSet)allLayoutTransactions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_layoutTransaction);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", self->_ancillaryLayoutTransactions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)isGoingToMainSwitcher
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "unlockedEnvironmentMode") == 2;
  return (char)v4;
}

- (void)performToAppStateCleanup
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SBToAppsWorkspaceTransaction _homeScreenAppearanceController](self, "_homeScreenAppearanceController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "source") == 8)
  {
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "retainsSiri");

    if ((v6 & 1) != 0)
      goto LABEL_5;
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissAssistantViewInEverySceneIfNecessaryWithAnimation:", 0);
  }

LABEL_5:
  v7 = -[SBToAppsWorkspaceTransaction _isGoingToHomeScreenInMainDisplayWindowScene](self, "_isGoingToHomeScreenInMainDisplayWindowScene");
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(v15, "beginRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));
      v8 = -[SBToAppsWorkspaceTransaction shouldAnimateOrientationChangeOnCompletion](self, "shouldAnimateOrientationChangeOnCompletion");
      if (-[SBWorkspaceTransaction isMainDisplayTransaction](self, "isMainDisplayTransaction"))
      {
        v9 = (void *)SBApp;
        -[SBToAppsWorkspaceTransaction _transitionContext](self, "_transitionContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", objc_msgSend(v11, "interfaceOrientation"), 1, v8, CFSTR("ToApps -performToAppStateCleanup"));

      }
      -[SBToAppsWorkspaceTransaction _iconManager](self, "_iconManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "iconToReveal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v12, "tryScrollToIconToRevealAnimated:", 1);

    }
  }
  else
  {
    objc_msgSend(v15, "endRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));
  }
  -[SBToAppsWorkspaceTransaction floatingDockBehaviorAssertion](self, "floatingDockBehaviorAssertion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  -[SBToAppsWorkspaceTransaction setFloatingDockBehaviorAssertion:](self, "setFloatingDockBehaviorAssertion:", 0);
}

- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSMutableSet *layoutTransitionCompletions;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void (**v51)(_QWORD);
  SBToAppsWorkspaceTransaction *v52;
  id obj;
  void *v54;
  uint64_t v55;
  _QWORD v56[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = (void (**)(_QWORD))a4;
  if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Performing layout transition now."));
  v7 = -[NSSet containsObject:](self->_ancillaryLayoutTransactions, "containsObject:", v6);
  layoutTransitionCompletions = self->_layoutTransitionCompletions;
  v50 = v6;
  if (!v7)
  {
    v13 = (void *)objc_msgSend(v51, "copy");
    v14 = (void *)MEMORY[0x1D17E5550]();
    -[NSMutableSet addObject:](layoutTransitionCompletions, "addObject:", v14);

    v52 = self;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[SBWorkspaceTransaction windowScene](self, "windowScene");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "sceneManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bs_map:", &__block_literal_global_138);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      obj = v19;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v72;
        v22 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v72 != v21)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
            v65 = 0;
            v66 = &v65;
            v67 = 0x3032000000;
            v68 = __Block_byref_object_copy__92;
            v69 = __Block_byref_object_dispose__92;
            v70 = 0;
            +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v61[0] = v22;
            v61[1] = 3221225472;
            v61[2] = __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_141;
            v61[3] = &unk_1E8EBADB0;
            v64 = &v65;
            v62 = v17;
            v63 = v24;
            objc_msgSend(v25, "enumerateSceneManagersWithBlock:", v61);

            v26 = v66[5];
            if (v26)
              objc_msgSend(v54, "setObject:forKey:", v26, v24);

            _Block_object_dispose(&v65, 8);
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
        }
        while (v20);
      }

      objc_msgSend(v49, "switcherController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v27, "windowManagementStyle");

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v28 = v54;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v58 != v30)
              objc_enumerationMutation(v28);
            v32 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
            objc_msgSend(v28, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "existingSceneHandleForSceneIdentity:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_sceneIdentity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "transferOwnershipOfSceneWithIdentity:toSceneManager:", v35, v17);

            objc_msgSend(v17, "existingSceneHandleForSceneIdentity:", v32);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_opt_class();
            v38 = v36;
            if (v37)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v39 = v38;
              else
                v39 = 0;
            }
            else
            {
              v39 = 0;
            }
            v40 = v39;

            objc_msgSend(v40, "setWantsEnhancedWindowingEnabled:", v55 == 2);
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
        }
        while (v29);
      }

    }
    objc_msgSend(v50, "transitionContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _synchronizeWithSceneUpdates](v52, "_synchronizeWithSceneUpdates");
    -[SBToAppsWorkspaceTransaction _configureAnimation](v52, "_configureAnimation");
    -[SBToAppsWorkspaceTransaction _isGoingToHomeScreenInMainDisplayWindowScene](v52, "_isGoingToHomeScreenInMainDisplayWindowScene");
    if (BSSettingFlagIsYes())
    {
      -[SBToAppsWorkspaceTransaction _homeScreenAppearanceController](v52, "_homeScreenAppearanceController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "beginRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));

    }
    objc_msgSend(v41, "previousLayoutState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if ((v45 & 1) != 0)
    {
      v46 = -[SBToAppsWorkspaceTransaction _beginAnimation](v52, "_beginAnimation");
      -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](v52, "toApplicationSceneEntities");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_2;
      v56[3] = &unk_1E8EB31A0;
      v56[4] = v52;
      objc_msgSend(v47, "enumerateObjectsUsingBlock:", v56);

      if (!v46)
        goto LABEL_38;
    }
    else
    {
      v48 = objc_msgSend(v41, "interfaceOrientation");
      if (v48)
        objc_msgSend((id)SBApp, "noteInterfaceOrientationChanged:duration:updateMirroredDisplays:logMessage:", v48, 0, CFSTR("ToApps performing transition"), 0.0);
      if (!-[SBToAppsWorkspaceTransaction _beginAnimation](v52, "_beginAnimation", v48))
        goto LABEL_38;
    }
    -[SBToAppsWorkspaceTransaction _checkForAnimationCompletion](v52, "_checkForAnimationCompletion");
LABEL_38:

    v10 = v51;
    goto LABEL_40;
  }
  if (-[NSMutableSet count](layoutTransitionCompletions, "count"))
  {
    v9 = self->_layoutTransitionCompletions;
    v10 = v51;
    v11 = (void *)objc_msgSend(v51, "copy");
    v12 = (void *)MEMORY[0x1D17E5550]();
    -[NSMutableSet addObject:](v9, "addObject:", v12);

  }
  else
  {
    v10 = v51;
    v51[2](v51);
  }
LABEL_40:

}

- (int64_t)_isGoingToHomeScreenInMainDisplayWindowScene
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBToAppsWorkspaceTransaction allTransitionRequests](self, "allTransitionRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "displayIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isMainDisplay"))
        {

LABEL_13:
          -[SBToAppsWorkspaceTransaction _isGoingToHomeScreenForTransitionRequest:](self, "_isGoingToHomeScreenForTransitionRequest:", v8);
          v12 = BSSettingFlagForBool();
          goto LABEL_14;
        }
        objc_msgSend(v8, "displayIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isContinuityDisplay");

        if ((v11 & 1) != 0)
          goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_14:

  return v12;
}

- (NSSet)allTransitionRequests
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->super.super._transitionRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", self->_ancillaryTransitionRequests);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)_configureAnimation
{
  void *v3;
  const __CFString *v4;
  SBUIAnimationController *v5;
  SBUIAnimationController *animationController;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  SBDismissOverlaysAnimationController *v14;
  SBUIAnimationController *p_super;
  SBUIAnimationController *v16;
  SBUIAnimationController *v17;
  unint64_t v18;
  SBDismissOverlaysAnimationController *v19;
  const __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SBSceneLayoutWorkspaceTransaction transitionContext](self->_layoutTransaction, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBToAppsWorkspaceTransaction _clearAnimation](self, "_clearAnimation");
  if ((objc_msgSend(v3, "animationDisabled") & 1) != 0)
  {
    if (!-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      goto LABEL_9;
    v4 = CFSTR("Skipping animation.");
  }
  else
  {
    -[SBToAppsWorkspaceTransaction _setupAnimation](self, "_setupAnimation");
    v5 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
    animationController = self->_animationController;
    self->_animationController = v5;

    if (!-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      goto LABEL_9;
    if (self->_animationController)
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Subclass specified animation: %@."), v7);

      goto LABEL_9;
    }
    v20 = CFSTR("(none)");
    v4 = CFSTR("Subclass specified animation: %@.");
  }
  -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", v4, v20);
LABEL_9:
  if (!self->_dismissedOverlays)
  {
    self->_dismissedOverlays = 1;
    if (self->_shouldSerialDismissOverlays)
    {
      v13 = -[SBToAppsWorkspaceTransaction _serialOverlayPreDismissalOptions](self, "_serialOverlayPreDismissalOptions");
      if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:](SBDismissOverlaysAnimationController, "willDismissOverlaysForDismissOptions:", v13))
      {
        v14 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", self->super.super._transitionRequest, v13);
        p_super = &v14->super;
        v16 = self->_animationController;
        if (v16)
          -[SBUIAnimationController addCoordinatingChildTransaction:withSchedulingPolicy:](v14, "addCoordinatingChildTransaction:withSchedulingPolicy:", v16, 1);
        v17 = self->_animationController;
        self->_animationController = p_super;

      }
    }
    else
    {
      v13 = 0;
    }
    v18 = -[SBToAppsWorkspaceTransaction _concurrentOverlayDismissalOptions](self, "_concurrentOverlayDismissalOptions") & ~v13;
    if (v18
      && +[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:](SBDismissOverlaysAnimationController, "willDismissOverlaysForDismissOptions:", v18))
    {
      v19 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", self->super.super._transitionRequest, v18);
      if (self->_animationController)
        -[SBUIAnimationController addCoordinatingChildTransaction:withSchedulingPolicy:](self->_animationController, "addCoordinatingChildTransaction:withSchedulingPolicy:", v19, 0);
      else
        objc_storeStrong((id *)&self->_animationController, v19);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SBToAppsWorkspaceTransaction allLayoutTransactions](self, "allLayoutTransactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        -[SBUIAnimationController delayCleanupUntilTransactionFinishes:](self->_animationController, "delayCleanupUntilTransactionFinishes:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBToAppsWorkspaceTransaction _fireAndClearResultBlockIfNecessaryForFailure:](self, "_fireAndClearResultBlockIfNecessaryForFailure:", 1);
  -[SBToAppsWorkspaceTransaction _clearAnimation](self, "_clearAnimation");
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  -[SBToAppsWorkspaceTransaction floatingDockBehaviorAssertion](self, "floatingDockBehaviorAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction dealloc](&v4, sel_dealloc);
}

- (void)_clearAnimation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SBUIAnimationController *animationController;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_animationController)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[SBToAppsWorkspaceTransaction allLayoutTransactions](self, "allLayoutTransactions", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[SBUIAnimationController stopDelayingCleanupForTransaction:](self->_animationController, "stopDelayingCleanupForTransaction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[SBUIAnimationController removeObserver:](self->_animationController, "removeObserver:", self);
    animationController = self->_animationController;
    self->_animationController = 0;

  }
}

- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion
{
  return self->_floatingDockBehaviorAssertion;
}

- (void)activateApplications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SBToAppsWorkspaceTransaction allLayoutTransactions](self, "allLayoutTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        -[SBToAppsWorkspaceTransaction _milestoneForLayoutTransaction:](self, "_milestoneForLayoutTransaction:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBToAppsWorkspaceTransaction addMilestone:](self, "addMilestone:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  -[SBToAppsWorkspaceTransaction layoutTransaction](self, "layoutTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", v9);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBToAppsWorkspaceTransaction ancillaryLayoutTransactions](self, "ancillaryLayoutTransactions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[SBToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)_milestoneForLayoutTransaction:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), *MEMORY[0x1E0D22878], a3);
}

- (void)_childTransactionDidComplete:(id)a3
{
  SBAppRepairTransaction *v4;
  SBAppRepairTransaction *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  SBVPPAppRequiresHealingAlertItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  SBMainWorkspaceLayoutStateContingencyPlan *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  SBVPPAppRequiresHealingAlertItem *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  id layoutTransitionContinuation;
  void *v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (SBAppRepairTransaction *)a3;
  v5 = v4;
  if (self->_appRepairTransaction != v4)
  {
    -[SBToAppsWorkspaceTransaction allLayoutTransactions](self, "allLayoutTransactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      -[SBToAppsWorkspaceTransaction _milestoneForLayoutTransaction:](self, "_milestoneForLayoutTransaction:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBToAppsWorkspaceTransaction removeMilestone:](self, "removeMilestone:", v8);

    }
    goto LABEL_35;
  }
  if ((-[SBAppRepairTransaction isFailed](v4, "isFailed") & 1) != 0)
    v9 = 0;
  else
    v9 = -[SBAppRepairTransaction isInterrupted](v5, "isInterrupted") ^ 1;
  if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("App repair completed. Success = %@."), v10);

  }
  -[SBSceneLayoutWorkspaceTransaction transitionContext](self->_layoutTransaction, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[SBAppRepairTransaction appInfos](self->_appRepairTransaction, "appInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "applicationSceneEntityForBundleID:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v18);
    }

    v23 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
    -[SBSceneLayoutWorkspaceTransaction transitionContext](self->_layoutTransaction, "transitionContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspaceLayoutStateContingencyPlan transitionContextForLayoutContext:failedEntities:](v23, "transitionContextForLayoutContext:failedEntities:", v24, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAppRepairTransaction error](v5, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D01658]))
    {
      v27 = objc_msgSend(v25, "code");

      if (v27 == 1)
      {
        v28 = 0;
        goto LABEL_25;
      }
    }
    else
    {

    }
    v28 = 1;
LABEL_25:
    objc_msgSend(v14, "setAnimationDisabled:", v28);
    if (objc_msgSend(v15, "count")
      && (objc_msgSend(v25, "userInfo"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D01660]),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("appRepairRequiresNetwork")),
          v30,
          v29,
          v31))
    {
      v32 = [SBVPPAppRequiresHealingAlertItem alloc];
      objc_msgSend(v15, "anyObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "application");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBVPPAppRequiresHealingAlertItem initWithApplication:](v32, "initWithApplication:", v34);

    }
    else
    {
      v13 = 0;
    }

    goto LABEL_30;
  }
  objc_msgSend(v11, "setAnimationDisabled:", 1);
  v13 = 0;
  v14 = v12;
LABEL_30:
  if (self->_layoutTransitionContinuation)
  {
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550]();
    layoutTransitionContinuation = self->_layoutTransitionContinuation;
    self->_layoutTransitionContinuation = 0;

    ((void (**)(_QWORD, void *, uint64_t))v35)[2](v35, v14, 2);
  }
  if (v13)
  {
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateAlertItem:", v13);

  }
LABEL_35:
  v38.receiver = self;
  v38.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _childTransactionDidComplete:](&v38, sel__childTransactionDidComplete_, v5);

}

- (SBSceneLayoutWorkspaceTransaction)layoutTransaction
{
  return self->_layoutTransaction;
}

- (NSSet)ancillaryLayoutTransactions
{
  return self->_ancillaryLayoutTransactions;
}

- (void)_checkForAnimationCompletion
{
  if (!self->_animationController)
    -[SBToAppsWorkspaceTransaction _noteAnimationFinished](self, "_noteAnimationFinished");
}

- (BOOL)_beginAnimation
{
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = -[SBToAppsWorkspaceTransaction _hasPreAnimationTasks](self, "_hasPreAnimationTasks");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[SBToAppsWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBWaitingForPreAnimationTasksMilestone"));
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke;
    v8[3] = &unk_1E8E9DED8;
    v8[4] = self;
    -[SBToAppsWorkspaceTransaction _performPreAnimationTasksWithCompletion:](self, "_performPreAnimationTasksWithCompletion:", v8);
  }
  else
  {
    -[SBToAppsWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("SBWaitingForPreAnimationTasksMilestone"));
  }
  v5 = -[SBToAppsWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("SBWaitingForPreAnimationTasksMilestone"));
  if (v5)
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke_2;
    v7[3] = &unk_1E8E9DED8;
    v7[4] = self;
    -[SBToAppsWorkspaceTransaction listenForSatisfiedMilestone:withBlock:](self, "listenForSatisfiedMilestone:withBlock:", CFSTR("SBWaitingForPreAnimationTasksMilestone"), v7);
  }
  else
  {
    -[SBToAppsWorkspaceTransaction _beginAnimationIfNecessary](self, "_beginAnimationIfNecessary");
  }
  return v5 ^ 1;
}

- (void)setFloatingDockBehaviorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, a3);
}

- (void)animationController:(id)a3 willBeginAnimation:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  SBUIAnimationController *v8;

  v4 = a4;
  v8 = (SBUIAnimationController *)a3;
  if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Animation will begin: %@"), v6);

  }
  if (self->_animationController == v8)
  {
    -[SBToAppsWorkspaceTransaction _animationWillBegin:](self, "_animationWillBegin:", v4);
  }
  else if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("!!!! Animation began that we weren't tracking: %@"), v7);

  }
}

- (NSSet)fromApplicationSceneEntities
{
  return -[SBSceneLayoutWorkspaceTransaction fromApplicationSceneEntities](self->_layoutTransaction, "fromApplicationSceneEntities");
}

- (void)transactionWillBeginLayoutTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  char v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  SBFloatingDockBehaviorAssertion *v32;
  objc_class *v33;
  void *v34;
  SBFloatingDockBehaviorAssertion *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];

  v4 = a3;
  if (!-[NSSet containsObject:](self->_ancillaryLayoutTransactions, "containsObject:", v4))
  {
    if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("------ Will begin layout transition."));
    objc_msgSend(v4, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previousLayoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      -[SBToAppsWorkspaceTransaction _iconManager](self, "_iconManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEditing:", 0);

    }
    if (-[SBToAppsWorkspaceTransaction _shouldResignActiveForAnimation](self, "_shouldResignActiveForAnimation"))
      -[SBToAppsWorkspaceTransaction _acquireResignActiveAssertion](self, "_acquireResignActiveAssertion");
    -[SBToAppsWorkspaceTransaction _captureApplicationState](self, "_captureApplicationState");
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__SBToAppsWorkspaceTransaction_transactionWillBeginLayoutTransition___block_invoke;
    v37[3] = &unk_1E8E9F320;
    v37[4] = v38;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v37);

    SBSetMinimumBrightnessLevel(1);
    v11 = objc_opt_class();
    objc_msgSend(v5, "layoutState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v5, "previousLayoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "elements");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "elements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = BSEqualObjects();
    v36 = (void *)v17;
    v20 = objc_msgSend(v13, "unlockedEnvironmentMode");
    if (v20 == objc_msgSend(v16, "unlockedEnvironmentMode"))
      v21 = v19;
    else
      v21 = 0;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 && !self->_underLockScreenInForeground && !self->_gestureInitiated)
    {
      v24 = self->_touchCancellationDisabled ? 1 : v21;
      if ((v24 & 1) == 0)
      {
        dispatch_get_global_queue(0, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v25, &__block_literal_global_133_1);

      }
    }
    v26 = v36;
    if (objc_msgSend(v13, "unlockedEnvironmentMode") == 3 && objc_msgSend(v16, "unlockedEnvironmentMode") == 3)
    {
      v27 = objc_msgSend(v13, "interfaceOrientation");
      v28 = objc_msgSend(v16, "interfaceOrientation");
    }
    else
    {
      v27 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
      v28 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
    }
    if (!((v27 == v28) | v19 & 1))
    {
      -[SBToAppsWorkspaceTransaction floatingDockBehaviorAssertion](self, "floatingDockBehaviorAssertion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "invalidate");

      -[SBWorkspaceTransaction windowScene](self, "windowScene");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatingDockController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = [SBFloatingDockBehaviorAssertion alloc];
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v32, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v31, 1, 0, 10, v34, 0, 0.0);

      -[SBToAppsWorkspaceTransaction setFloatingDockBehaviorAssertion:](self, "setFloatingDockBehaviorAssertion:", v35);
      v26 = v36;
    }
    -[SBToAppsWorkspaceTransaction _beginTransition](self, "_beginTransition");

    _Block_object_dispose(v38, 8);
  }

}

- (void)_captureApplicationState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  SBToAppsWorkspaceTransaction *v16;
  _QWORD v17[5];

  if (self->_applicationStateNeedsCapture)
  {
    self->_applicationStateNeedsCapture = 0;
    self->_underLockScreenInForeground = 0;
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_gestureInitiated = objc_msgSend(v3, "source") == 11;

    self->_preactivationForegroundRunningApplicationCount = 0;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke;
    v17[3] = &unk_1E8EB31A0;
    v17[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);

    self->_toAndFromApplicationsDiffer = 0;
    -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (objc_msgSend(v6, "count") == v8)
    {
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_2;
      v14[3] = &unk_1E8EB3218;
      v9 = v7;
      v15 = v9;
      v16 = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
      if (self->_toAndFromApplicationsDiffer || objc_msgSend(v9, "count") != 1)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v9, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sceneHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sceneIfExists");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v12, "uiSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_touchCancellationDisabled = objc_msgSend(v13, "deviceOrientationEventsEnabled");

    }
    else
    {
      self->_toAndFromApplicationsDiffer = 1;
    }

  }
}

- (NSSet)toApplicationSceneEntities
{
  return -[SBSceneLayoutWorkspaceTransaction toApplicationSceneEntities](self->_layoutTransaction, "toApplicationSceneEntities");
}

- (BOOL)_shouldResignActiveForAnimation
{
  void *v3;
  char v4;

  -[SBSceneLayoutWorkspaceTransaction transitionContext](self->_layoutTransaction, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animationDisabled");

  return (v4 & 1) == 0
      && -[SBUIAnimationController shouldResignActiveForAnimation](self->_animationController, "shouldResignActiveForAnimation");
}

- (SBToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SBToAppsWorkspaceTransaction *v15;
  NSMutableSet *v16;
  NSMutableSet *layoutTransitionCompletions;
  SBSceneLayoutWorkspaceTransaction *v18;
  SBSceneLayoutWorkspaceTransaction *layoutTransaction;
  NSSet *ancillaryTransitionRequests;
  SBToAppsWorkspaceTransaction *v21;
  uint64_t v22;
  NSSet *ancillaryLayoutTransactions;
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
  uint64_t v35;
  SBSwitcherCoordinatedLayoutStateTransitionContext *coordinatedLayoutStateTransitionContext;
  void *v38;
  void *v39;
  _QWORD v40[4];
  SBToAppsWorkspaceTransaction *v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBToAppsWorkspaceTransaction.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  }
  if (objc_msgSend(v6, "isBackground"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBToAppsWorkspaceTransaction.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![context isBackground]"));

  }
  v7 = (void *)objc_msgSend(v5, "copyMainWorkspaceTransitionRequest");
  +[SBMainWorkspaceTransitionRequest ancillaryTransitionRequestsForTransitionRequest:](SBMainWorkspaceTransitionRequest, "ancillaryTransitionRequestsForTransitionRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    if ((objc_msgSend(v5, "isFinalized") & 1) == 0)
    {
      objc_msgSend(v5, "setCrossingDisplays:", 1);
      objc_msgSend(v5, "finalize");
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v14, "setCrossingDisplays:", 1);
          objc_msgSend(v14, "finalize");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
    }

  }
  v42.receiver = self;
  v42.super_class = (Class)SBToAppsWorkspaceTransaction;
  v15 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v42, sel_initWithTransitionRequest_, v5);
  if (v15)
  {
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    layoutTransitionCompletions = v15->_layoutTransitionCompletions;
    v15->_layoutTransitionCompletions = v16;

    v18 = -[SBSceneLayoutWorkspaceTransaction initWithTransitionRequest:delegate:]([SBSceneLayoutWorkspaceTransaction alloc], "initWithTransitionRequest:delegate:", v5, v15);
    layoutTransaction = v15->_layoutTransaction;
    v15->_layoutTransaction = v18;

    -[SBSceneLayoutWorkspaceTransaction setSynchronizationDelegate:](v15->_layoutTransaction, "setSynchronizationDelegate:", v15);
    -[SBSceneLayoutWorkspaceTransaction addObserver:](v15->_layoutTransaction, "addObserver:", v15);
    objc_storeStrong((id *)&v15->_ancillaryTransitionRequests, v8);
    ancillaryTransitionRequests = v15->_ancillaryTransitionRequests;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__SBToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke;
    v40[3] = &unk_1E8EBACE0;
    v21 = v15;
    v41 = v21;
    -[NSSet bs_map:](ancillaryTransitionRequests, "bs_map:", v40);
    v22 = objc_claimAutoreleasedReturnValue();
    ancillaryLayoutTransactions = v21->_ancillaryLayoutTransactions;
    v21->_ancillaryLayoutTransactions = (NSSet *)v22;

    v21->_applicationStateNeedsCapture = 1;
    -[SBToAppsWorkspaceTransaction _captureApplicationState](v21, "_captureApplicationState");
    v21->_shouldSerialDismissOverlays = 1;
    if (objc_msgSend(v5, "isCrossingDisplays"))
    {
      -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](v21, "fromApplicationSceneEntities");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "valueForKey:", CFSTR("displayItemRepresentation"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](v21, "toApplicationSceneEntities");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueForKey:", CFSTR("displayItemRepresentation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(v27, "mutableCopy");
      objc_msgSend(v28, "minusSet:", v25);

      -[SBWorkspaceTransaction windowScene](v21, "windowScene");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "switcherController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "applicationContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "appLayout");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSwitcherCoordinatedLayoutStateTransitionContext coordinatedLayoutStateTransitionContextForMovingDisplayItems:toSwitcherController:toAppLayout:withApplicationController:](SBSwitcherCoordinatedLayoutStateTransitionContext, "coordinatedLayoutStateTransitionContextForMovingDisplayItems:toSwitcherController:toAppLayout:withApplicationController:", v28, v30, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      coordinatedLayoutStateTransitionContext = v21->_coordinatedLayoutStateTransitionContext;
      v21->_coordinatedLayoutStateTransitionContext = (SBSwitcherCoordinatedLayoutStateTransitionContext *)v35;

    }
  }

  return v15;
}

- (double)watchdogTimeout
{
  return 30.0;
}

- (void)_fireAndClearResultBlockIfNecessaryForFailure:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBToAppsWorkspaceTransaction _transitionContext](self, "_transitionContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "needsToSendActivationResult"))
  {
    if (v3)
    {
      SBWTErrorCreate(self, (void *)1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendActivationResultError:", v5);

    }
    else
    {
      objc_msgSend(v6, "sendActivationResultError:", 0);
    }
    if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; success = %d"),
        !v3);
  }

}

- (id)_transitionContext
{
  return -[SBWorkspaceTransitionRequest applicationContext](self->super.super._transitionRequest, "applicationContext");
}

- (NSSet)ancillaryTransitionRequests
{
  return self->_ancillaryTransitionRequests;
}

- (void)_beginAnimationIfNecessary
{
  SBUIAnimationController *animationController;

  animationController = self->_animationController;
  if (animationController)
  {
    -[SBUIAnimationController addObserver:](animationController, "addObserver:", self);
    -[SBToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_animationController);
  }
  else if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("No animation specified."));
  }
}

+ (BOOL)canInterruptTransaction:(id)a3 forTransitionRequest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  objc_class *v14;
  void *v15;
  void *v16;
  char v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  BOOL v26;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  SBSafeCast(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyMainWorkspaceTransitionRequest");
  if (!objc_msgSend(v5, "isInterrupted"))
  {
    objc_msgSend(v9, "applicationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isBackground");

    if (v13)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  request is for background activation"), v11, v5);
      goto LABEL_15;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isInSetupMode") & 1) != 0)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isInSetupModeReadyToExit");

      if ((v17 & 1) == 0)
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in setup mode"), v11, v5);
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "transitionRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "source");

    if (v20 == 31)
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in a startup transition"), v11, v5);
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "source") == 44)
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: transitions from app clip placeholders must be pended"), v11, v5);
      goto LABEL_15;
    }
    objc_msgSend(v5, "transitionRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "source");

    if (v24 == 45)
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: view morph animations are not interruptible"), v11, v5);
      goto LABEL_15;
    }
    objc_msgSend(v5, "animationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v5 && v28)
    {
      if ((objc_msgSend(v28, "isInterruptible") & 1) == 0)
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  transaction animation isn't interruptible : animationController=<%@:%p>"), v46, v5, v48, v29);

        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v76 = 0;
        v77 = &v76;
        v78 = 0x2020000000;
        v79 = 0;
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __77__SBToAppsWorkspaceTransaction_canInterruptTransaction_forTransitionRequest___block_invoke;
        v75[3] = &unk_1E8E9E040;
        v75[4] = &v76;
        objc_msgSend(v29, "_enumerateCoordinatingAnimationsWithBlock:", v75);
        if (!*((_BYTE *)v77 + 24))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  transaction animation isnt switcher animation and doesn't have switcher animation as a child"), v58, v5);

          _Block_object_dispose(&v76, 8);
          goto LABEL_38;
        }
        _Block_object_dispose(&v76, 8);
      }
    }
    if (v9 && objc_msgSend(v9, "source") == 14)
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  rotation"), v31, v5);

LABEL_38:
      v26 = 0;
LABEL_39:

      goto LABEL_16;
    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v5, "_childWorkspaceTransactions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v72;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v72 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((objc_msgSend(v36, "canInterruptForTransitionRequest:", v6) & 1) == 0)
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> NOT Interruptible due to child transaction not being interruptible: <%@:%p>"), v40, v5, v42, v36);

            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  children aren't interruptible"), v44, v5);

            goto LABEL_38;
          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        if (v33)
          continue;
        break;
      }
    }

    if (objc_msgSend(v9, "source") == 27)
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  cannot interrupt for drag and drop requests"), v38, v5);

      goto LABEL_38;
    }
    if (objc_msgSend(v9, "source") == 48)
    {
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  cannot interrupt for InCall scene update requests"), v50, v5);

      goto LABEL_38;
    }
    objc_msgSend(v5, "transitionRequest");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "applicationContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "previousLayoutState");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutState");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "unlockedEnvironmentMode") == 3 && objc_msgSend(v69, "unlockedEnvironmentMode") == 1)
    {
      objc_msgSend(v9, "applicationContext");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "layoutState");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "unlockedEnvironmentMode") == 2)
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  zoom down animation cannot be interrupted by home -> switcher transition"), v56, v5);

LABEL_50:
        v26 = 0;
LABEL_57:

        goto LABEL_39;
      }

    }
    objc_msgSend(v9, "transientOverlayContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: The transition request contains a transient overlay context "), v53, v5);
      goto LABEL_50;
    }
    objc_msgSend(v9, "workspace");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "transactionForTransitionRequest:", v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_opt_class();
    SBSafeCast(v62, v53);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
    {
      objc_msgSend(v63, "_setupAnimation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> interruptible because:  next request is switcher-controllable"), v67, v5);

        v26 = 1;
LABEL_56:

        goto LABEL_57;
      }

    }
    v68 = (objc_class *)objc_opt_class();
    NSStringFromClass(v68);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  other"), v65, v5);
    v26 = 0;
    goto LABEL_56;
  }
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  already interrupted"), v11, v5);
LABEL_15:

  v26 = 0;
LABEL_16:

  return v26;
}

- (void)_didComplete
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  SBToAppsWorkspaceTransaction *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[SBToAppsWorkspaceTransaction _relinquishResignActiveAssertion](self, "_relinquishResignActiveAssertion");
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBToAppsWorkspaceTransaction isGoingToLauncher](self, "isGoingToLauncher")
    && (objc_msgSend(v4, "transientOverlayPresentationManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasActivePresentation"),
        v5,
        (v6 & 1) == 0))
  {
    +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "checkPasscodeCompliance");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC330], self, 0);

    pid_hibernate();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissAppIconForceTouchControllers:", 0);

  }
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isInSetupMode") & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "updateInSetupMode");

  if (v12)
  {
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isInSetupModeReadyToExit");

    if ((v14 & 1) == 0)
    {
      -[SBWorkspaceTransaction windowScene](self, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "switcherController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "layoutState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "elementWithRole:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "workspaceEntity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deviceApplicationSceneEntity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sceneHandle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "workspace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "transientOverlayPresentationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasActivePresentation");

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v20, "application");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "info");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isLaunchableDuringSetup");

        if ((v27 & 1) == 0)
        {
          SBLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v38 = self;
            v39 = 1024;
            v40 = 0;
            v41 = 2112;
            v42 = v20;
            _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Activating setup because in setup mode at end of transaction %@. hasActiveTransientOverlayPresentation = %{BOOL}u activeApplicationSceneHandle = %@. Forcibly launching setup.", buf, 0x1Cu);
          }

          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setupApplication");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          SBWorkspaceActivateApplication(v30);

        }
      }

      goto LABEL_14;
    }
  }
LABEL_15:
  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "bs_containsObjectPassingTest:", &__block_literal_global_314);

  if (v32)
    objc_msgSend((id)SBApp, "_performBlockAfterCATransactionCommits:", &__block_literal_global_101_1);
  v36.receiver = self;
  v36.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v36, sel__didComplete);
  if (self->_coordinatedLayoutStateTransitionContext)
  {
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "switcherController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "switcherCoordinator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cleanUpAfterCoordinatedLayoutStateTransitionWithContext:", self->_coordinatedLayoutStateTransitionContext);

  }
}

- (void)_relinquishResignActiveAssertion
{
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
}

- (id)animationController
{
  return self->_animationController;
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v12);
    if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("%@"), v7);
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

  }
}

- (void)_willBegin
{
  SBToAppsWorkspaceTransaction *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SBWorkspaceTransitionRequest applicationContext](self->super.super._transitionRequest, "applicationContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self;
  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v8, "application");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)SBApp, "privacyPreflightController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "info");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "applicationIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "requiresPreflightForApplication:", v12);

        objc_msgSend(v9, "processState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14 && (v13 & 1) == 0)
        {
          objc_msgSend(v8, "sceneHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_createProcessExecutionContextFromContext:entity:", v29, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[SBWorkspaceTransitionRequest displayConfiguration](v3->super.super._transitionRequest, "displayConfiguration");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (id)objc_msgSend(v9, "_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:", v17);

            objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "launchProcessWithContext:", v16);

          }
          goto LABEL_13;
        }
        if (v13 && -[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](v3, "isAuditHistoryEnabled"))
        {
          objc_msgSend(v9, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](v3, "_addAuditHistoryItem:", CFSTR("%@ requires preflight. Skipping prelaunch."), v16);
LABEL_13:

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  if (v3->_coordinatedLayoutStateTransitionContext)
  {
    -[SBWorkspaceTransaction windowScene](v3, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "switcherController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "switcherCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "prepareForCoordinatedLayoutStateTransitionWithContext:", v3->_coordinatedLayoutStateTransitionContext);

  }
  v31.receiver = v3;
  v31.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _willBegin](&v31, sel__willBegin);
  -[SBWorkspaceTransaction transitionRequest](v3, "transitionRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "workspace");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBToAppsWorkspaceTransaction isGoingToLauncher](v3, "isGoingToLauncher"))
  {
    objc_msgSend(v24, "transientOverlayPresentationManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasActivePresentation");

    if ((v26 & 1) == 0)
    {
      if (!v3->_gestureInitiated)
      {
        +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activateOrientationSource:", 2);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC338], v3, 0);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_ancillaryTransitionRequests, 0);
  objc_storeStrong((id *)&self->_ancillaryLayoutTransactions, 0);
  objc_storeStrong((id *)&self->_layoutTransaction, 0);
  objc_storeStrong((id *)&self->_completionDelayRequesters, 0);
  objc_storeStrong((id *)&self->_coordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_appRepairTransaction, 0);
  objc_storeStrong(&self->_layoutTransitionContinuation, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_layoutTransitionCompletions, 0);
}

- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4
{
  id v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id layoutTransitionContinuation;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  char v29;
  void *v30;
  void *v31;
  SBMainWorkspaceLayoutStateContingencyPlan *v32;
  void *v33;
  SBUIAnimationController *v34;
  void *v35;
  id v36;
  SBAppRepairTransaction *v37;
  SBAppRepairTransaction *appRepairTransaction;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(void);
  SEL v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void))a4;
  if (!-[NSSet containsObject:](self->_ancillaryLayoutTransactions, "containsObject:", v7))
  {
    v45 = a2;
    self->_applicationStateNeedsCapture = 1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v7, "sceneUpdateTransactions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v15, "isFailed"))
          {
            objc_msgSend(v9, "addObject:", v15);
            -[SBToAppsWorkspaceTransaction _handleApplicationUpdateScenesTransactionFailed:](self, "_handleApplicationUpdateScenesTransactionFailed:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v12);
    }

    if (-[SBToAppsWorkspaceTransaction shouldPerformToAppStateCleanupOnCompletion](self, "shouldPerformToAppStateCleanupOnCompletion"))
    {
      -[SBToAppsWorkspaceTransaction performToAppStateCleanup](self, "performToAppStateCleanup");
    }
    -[SBToAppsWorkspaceTransaction _fireAndClearResultBlockIfNecessaryForFailure:](self, "_fireAndClearResultBlockIfNecessaryForFailure:", objc_msgSend(v9, "count") != 0);
    -[SBToAppsWorkspaceTransaction _endTransition](self, "_endTransition");
    layoutTransitionContinuation = self->_layoutTransitionContinuation;
    self->_layoutTransitionContinuation = 0;

    if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("------ Layout transition completed!"));
    if (!objc_msgSend(v9, "count") || (objc_msgSend(v7, "isInterrupted") & 1) != 0)
    {
      if (v8)
        ((void (*)(void (**)(void), _QWORD, _QWORD))v8[2])(v8, 0, 0);
      goto LABEL_46;
    }
    v43 = v7;
    v44 = v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v22, "applicationSceneEntity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v23);

          objc_msgSend(v22, "process");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "exitContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "applicationInfo");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (!v28)
          {
            v29 = objc_msgSend(v25, "exitReason");
            v30 = v47;
            if ((v29 & 0x20) != 0
              || (v29 & 1) != 0
              && (objc_msgSend(v25, "terminationRequest"),
                  v31 = (void *)objc_claimAutoreleasedReturnValue(),
                  v31,
                  v30 = v46,
                  !v31))
            {
              objc_msgSend(v30, "addObject:", v27);
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v47, "count")
      && !-[SBAppRepairTransaction isComplete](self->_appRepairTransaction, "isComplete"))
    {
      v7 = v43;
      if (self->_appRepairTransaction)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v45, self, CFSTR("SBToAppsWorkspaceTransaction.m"), 1237, CFSTR("can't run this twice"));

      }
      v35 = (void *)objc_msgSend(v44, "copy");
      v36 = self->_layoutTransitionContinuation;
      self->_layoutTransitionContinuation = v35;

      v34 = self->_animationController;
      -[SBToAppsWorkspaceTransaction _clearAnimation](self, "_clearAnimation");
      -[SBUIAnimationController failWithReason:](v34, "failWithReason:", CFSTR("App Repair"));
      v37 = -[SBAppRepairTransaction initWithApplicationInfos:]([SBAppRepairTransaction alloc], "initWithApplicationInfos:", v47);
      appRepairTransaction = self->_appRepairTransaction;
      self->_appRepairTransaction = v37;

      -[SBToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_appRepairTransaction);
      goto LABEL_45;
    }
    v7 = v43;
    if (self->_retriedAfterVoluntaryExit || !objc_msgSend(v46, "count"))
    {
      v32 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
      objc_msgSend(v43, "transitionContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainWorkspaceLayoutStateContingencyPlan transitionContextForLayoutContext:failedEntities:](v32, "transitionContextForLayoutContext:failedEntities:", v33, v48);
      v34 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();

      if (v34)
        goto LABEL_40;
    }
    else
    {
      self->_retriedAfterVoluntaryExit = 1;
      if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      {
        objc_msgSend(v46, "anyObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bundleIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Retrying after voluntary exit of %@"), v40);

      }
      +[SBWorkspaceTransitionContext context](SBWorkspaceApplicationSceneTransitionContext, "context");
      v34 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
      if (v34)
        goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v45, self, CFSTR("SBToAppsWorkspaceTransaction.m"), 1230, CFSTR("we better have a follow-up transition"));

LABEL_40:
    -[SBUIAnimationController setAnimationDisabled:](v34, "setAnimationDisabled:", 1);
    if (v44)
      v44[2]();
LABEL_45:

    v8 = v44;
LABEL_46:

    goto LABEL_47;
  }
  if (v8)
    ((void (*)(void (**)(void), _QWORD, _QWORD))v8[2])(v8, 0, 0);
LABEL_47:

}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBToAppsWorkspaceTransaction allLayoutTransactions](self, "allLayoutTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    objc_msgSend(v7, "performSynchronizedCommit");
    -[SBToAppsWorkspaceTransaction _milestoneForLayoutTransaction:](self, "_milestoneForLayoutTransaction:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction removeMilestone:](self, "removeMilestone:", v6);

  }
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  void *v4;
  void *v5;
  SBUIAnimationController *v6;

  v6 = (SBUIAnimationController *)a3;
  if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Animation did finish: %@"), v4);

  }
  if (self->_animationController == v6)
  {
    -[SBToAppsWorkspaceTransaction _animationDidFinish](self, "_animationDidFinish");
    -[SBToAppsWorkspaceTransaction _noteAnimationFinished](self, "_noteAnimationFinished");
  }
  else if (-[SBToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("!!!! Animation completed that we weren't tracking: %@"), v5);

  }
}

- (void)_noteAnimationFinished
{
  uint64_t v3;
  void (**v4)(_QWORD);
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke;
  v6[3] = &unk_1E8E9DED8;
  v6[4] = self;
  v4 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v6, a2);
  if (-[SBToAppsWorkspaceTransaction _hasPostAnimationTasks](self, "_hasPostAnimationTasks"))
  {
    -[SBToAppsWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBWaitingForPostAnimationTasksMilestone"));
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke_2;
    v5[3] = &unk_1E8E9DED8;
    v5[4] = self;
    -[SBToAppsWorkspaceTransaction _performPostAnimationTasksWithCompletion:](self, "_performPostAnimationTasksWithCompletion:", v5);
  }
  else
  {
    -[SBToAppsWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("SBWaitingForPostAnimationTasksMilestone"));
  }
  if (-[SBToAppsWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("SBWaitingForPostAnimationTasksMilestone")))-[SBToAppsWorkspaceTransaction listenForSatisfiedMilestone:withBlock:](self, "listenForSatisfiedMilestone:withBlock:", CFSTR("SBWaitingForPostAnimationTasksMilestone"), v4);
  else
    v4[2](v4);

}

uint64_t __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_completeCurrentTransition");
  return result;
}

- (void)_completeCurrentTransition
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_layoutTransitionCompletions, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)-[NSMutableSet copy](self->_layoutTransitionCompletions, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_layoutTransitionCompletions, "removeAllObjects");
  }
}

void __69__SBToAppsWorkspaceTransaction_transactionWillBeginLayoutTransition___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  float v5;
  id v6;

  objc_msgSend(a2, "application");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v6, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumBrightnessLevel");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fmax(v3, v5);

}

id __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D231F0];
  objc_msgSend(a2, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  if (v5)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) && objc_msgSend(v6, "BOOLForActivationSetting:", 59))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 1;

}

SBSceneLayoutWorkspaceTransaction *__58__SBToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBSceneLayoutWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBSceneLayoutWorkspaceTransaction initWithTransitionRequest:delegate:]([SBSceneLayoutWorkspaceTransaction alloc], "initWithTransitionRequest:delegate:", v3, *(_QWORD *)(a1 + 32));

  -[SBSceneLayoutWorkspaceTransaction setSynchronizationDelegate:](v4, "setSynchronizationDelegate:", *(_QWORD *)(a1 + 32));
  return v4;
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  void *v3;
  BOOL v4;

  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[SBToAppsWorkspaceTransaction isGoingToLauncher](self, "isGoingToLauncher");

  return v4;
}

- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion
{
  return 0;
}

- (BOOL)shouldAnimateOrientationChangeOnCompletion
{
  return 1;
}

- (BOOL)toAndFromAppsDiffer
{
  return self->_toAndFromApplicationsDiffer;
}

- (void)_acquireResignActiveAssertion
{
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  void *v4;
  void *v5;
  UIApplicationSceneDeactivationAssertion *v6;
  UIApplicationSceneDeactivationAssertion *v7;
  void *v8;
  id v9;

  resignActiveAssertion = self->_resignActiveAssertion;
  if (!resignActiveAssertion)
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneDeactivationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v5, "newAssertionWithReason:", 5);
    v7 = self->_resignActiveAssertion;
    self->_resignActiveAssertion = v6;

    resignActiveAssertion = self->_resignActiveAssertion;
  }
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationSceneDeactivationAssertion sb_acquireForDisplayIdentity:](resignActiveAssertion, "sb_acquireForDisplayIdentity:", v8);

}

- (void)_delayTransitionCompletionForRequester:(id)a3
{
  id v4;
  NSCountedSet *completionDelayRequesters;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  completionDelayRequesters = self->_completionDelayRequesters;
  v8 = v4;
  if (!completionDelayRequesters)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v7 = self->_completionDelayRequesters;
    self->_completionDelayRequesters = v6;

    v4 = v8;
    completionDelayRequesters = self->_completionDelayRequesters;
  }
  -[NSCountedSet addObject:](completionDelayRequesters, "addObject:", v4);

}

- (void)_stopDelayingTransitionCompletionForRequester:(id)a3
{
  NSCountedSet *completionDelayRequesters;

  -[NSCountedSet removeObject:](self->_completionDelayRequesters, "removeObject:", a3);
  if (!-[NSCountedSet count](self->_completionDelayRequesters, "count"))
  {
    completionDelayRequesters = self->_completionDelayRequesters;
    self->_completionDelayRequesters = 0;

    -[SBToAppsWorkspaceTransaction _completeCurrentTransition](self, "_completeCurrentTransition");
  }
}

- (BOOL)_transitionWasCancelled
{
  return 0;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  return 0;
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -1;
}

- (BOOL)_shouldSerialDismissOverlays
{
  return self->_shouldSerialDismissOverlays;
}

- (void)_setShouldSerialDismissOverlays:(BOOL)a3
{
  self->_shouldSerialDismissOverlays = a3;
}

- (id)_setupAnimation
{
  return 0;
}

- (BOOL)_hasPreAnimationTasks
{
  return 0;
}

- (BOOL)_hasPostAnimationTasks
{
  return 0;
}

uint64_t __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("SBWaitingForPreAnimationTasksMilestone"));
}

uint64_t __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_beginAnimationIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_checkForAnimationCompletion");
}

uint64_t __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("SBWaitingForPostAnimationTasksMilestone"));
}

void __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_3;
  v9[3] = &unk_1E8EBAD08;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 280) = 1;
    *a3 = 1;
  }

}

uint64_t __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_3(uint64_t a1, void *a2)
{
  return SBWorkspaceEntitiesAreAnalagous(*(void **)(a1 + 32), a2);
}

void __77__SBToAppsWorkspaceTransaction_canInterruptTransaction_forTransitionRequest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)_canBeInterrupted
{
  void *v2;
  void *v3;
  char v4;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInSetupMode"))
  {
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInSetupModeReadyToExit");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __44__SBToAppsWorkspaceTransaction__didComplete__block_invoke_2()
{
  id v0;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postLaunchCompleteNotificationForSetup");

}

- (void)_willFailWithReason:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBToAppsWorkspaceTransaction;
  v4 = a3;
  -[SBToAppsWorkspaceTransaction _willFailWithReason:](&v5, sel__willFailWithReason_, v4);
  -[SBAppRepairTransaction failWithReason:](self->_appRepairTransaction, "failWithReason:", v4, v5.receiver, v5.super_class);

}

- (void)_willInterruptWithReason:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBToAppsWorkspaceTransaction;
  v4 = a3;
  -[SBToAppsWorkspaceTransaction _willInterruptWithReason:](&v5, sel__willInterruptWithReason_, v4);
  -[SBAppRepairTransaction failWithReason:](self->_appRepairTransaction, "failWithReason:", v4, v5.receiver, v5.super_class);

  -[SBToAppsWorkspaceTransaction _delayTransitionCompletionForRequester:](self, "_delayTransitionCompletionForRequester:", CFSTR("SBDelayForInterruptionReason"));
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  objc_super v4;

  if (self->_appRepairTransaction == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  return -[SBToAppsWorkspaceTransaction _shouldFailForChildTransaction:](&v4, sel__shouldFailForChildTransaction_);
}

- (void)_didInterruptWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didInterruptWithReason:](&v4, sel__didInterruptWithReason_, a3);
  -[SBToAppsWorkspaceTransaction _fireAndClearResultBlockIfNecessaryForFailure:](self, "_fireAndClearResultBlockIfNecessaryForFailure:", 1);
  -[SBToAppsWorkspaceTransaction _stopDelayingTransitionCompletionForRequester:](self, "_stopDelayingTransitionCompletionForRequester:", CFSTR("SBDelayForInterruptionReason"));
}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SBToAppsWorkspaceTransaction;
  -[SBWorkspaceTransaction _customizedDescriptionProperties](&v29, sel__customizedDescriptionProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "succinctDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString addObject:](v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = CFSTR("(SpringBoard)");
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("To Application Scene Entities"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "succinctDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("From Application Scene Entities"));

  return v3;
}

- (id)createSceneEntityForHandle:(id)a3
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", v3);
  else
    v4 = 0;

  return v4;
}

void __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_141(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "isEqual:", a1[4]);
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v8, "existingSceneHandleForSceneIdentity:", a1[5]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
      if (v7)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
        v5 = v8;
      }
    }
  }

}

uint64_t __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleApplicationDidNotChange:", a2);
}

- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;

  v7 = a4;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __81__SBToAppsWorkspaceTransaction_transaction_shouldKeepSceneForeground_withReason___block_invoke;
  v20 = &unk_1E8EA2148;
  v12 = v7;
  v21 = v12;
  v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", &v17);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Keeping %@ foreground because it's part of the transition request"), v15, v17, v18, v19, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

uint64_t __81__SBToAppsWorkspaceTransaction_transaction_shouldKeepSceneForeground_withReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)shouldWatchdog:(id *)a3
{
  BOOL v4;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (!self->_appRepairTransaction)
  {
    v6 = &v15;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__92;
    v19 = __Block_byref_object_dispose__92;
    v20 = 0;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__SBToAppsWorkspaceTransaction_shouldWatchdog___block_invoke;
    v14[3] = &unk_1E8E9F320;
    v14[4] = &v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

    v13.receiver = self;
    v13.super_class = (Class)SBToAppsWorkspaceTransaction;
    if (-[SBToAppsWorkspaceTransaction shouldWatchdog:](&v13, sel_shouldWatchdog_, a3))
    {
      v4 = v16[5] == 0;
      if (!a3)
        goto LABEL_15;
    }
    else
    {
      v4 = 0;
      if (!a3)
      {
LABEL_15:
        _Block_object_dispose(&v15, 8);

        return v4;
      }
    }
    if (!v4)
    {
      v8 = (void *)v16[5];
      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v6 = (uint64_t *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "processName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "stringWithFormat:", CFSTR("\"%@\" is being debugged"), v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {

        }
      }
    }
    goto LABEL_15;
  }
  v4 = 0;
  if (a3)
    *a3 = CFSTR("performing app repair");
  return v4;
}

void __47__SBToAppsWorkspaceTransaction_shouldWatchdog___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v8 = v4;
    objc_msgSend(v4, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBeingDebugged");

    v4 = v8;
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v4 = v8;
    }
  }

}

- (void)animationControllerDidRevealApplication:(id)a3
{
  if (self->_animationController == a3)
    -[SBToAppsWorkspaceTransaction _animationDidRevealApplication](self, "_animationDidRevealApplication");
}

- (id)_homeScreenAppearanceController
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_iconManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
