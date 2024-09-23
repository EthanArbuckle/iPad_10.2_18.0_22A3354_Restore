@implementation SBSceneLayoutWorkspaceTransaction

- (void)_captureAppsForTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *foregroundingAppSceneEntities;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
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
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSMutableSet *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  SBSceneLayoutWorkspaceTransaction *v61;
  _QWORD v62[4];
  id v63;
  SBSceneLayoutWorkspaceTransaction *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  SBSceneLayoutWorkspaceTransaction *v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[5];
  _QWORD v75[5];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v6;
  objc_msgSend(v7, "applicationWithPid:", objc_msgSend(v6, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSDisplayLayoutTransitionReasonForSourceApplication();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWorkspaceTransaction _updatePreferredDisplayLayoutTransitionReason:](self, "_updatePreferredDisplayLayoutTransitionReason:", v10);

  }
  v56 = v8;
  -[NSMutableSet removeAllObjects](self->_scenesToBackground, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_fromAppSceneEntities, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_toAppSceneEntities, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_foregroundingAppSceneEntities, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_backgroundingAppSceneEntities, "removeAllObjects");
  v11 = SBFIsMoreForegroundAppsAvailable();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_msgSend(v4, "_sceneEntitiesToForeground");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSMutableSet *)objc_msgSend(v13, "mutableCopy");
    foregroundingAppSceneEntities = self->_foregroundingAppSceneEntities;
    self->_foregroundingAppSceneEntities = v14;

  }
  else
  {
    -[SBWorkspaceApplicationSceneTransitionContext applicationSceneEntities](self->_transitionContext, "applicationSceneEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v12;
    v75[1] = 3221225472;
    v75[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke;
    v75[3] = &unk_1E8EB31A0;
    v75[4] = self;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v75);

  }
  -[SBWorkspaceApplicationSceneTransitionContext previousApplicationSceneEntities](self->_transitionContext, "previousApplicationSceneEntities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v12;
  v74[1] = 3221225472;
  v74[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_2;
  v74[3] = &unk_1E8EB31A0;
  v74[4] = self;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v74);

  v18 = 0x1E0C99000uLL;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = v19;
  if (-[SBSceneLayoutWorkspaceTransaction _runningOnManagedDisplay](self, "_runningOnManagedDisplay"))
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isVisible");

    if (v21)
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lockScreenEnvironment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applicationHoster");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v24);

    }
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "secureAppViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isVisible") && v26)
      objc_msgSend(v19, "addObject:", v26);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "inCallPresentationManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v19, "addObject:", v28);
    objc_msgSend(v27, "pipCoordinator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v29);
    +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "iconController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leftOfHomeAppViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v58;
    if (v32)
      objc_msgSend(v58, "addObject:", v32);

    v4 = v55;
    v12 = MEMORY[0x1E0C809B0];
    v18 = 0x1E0C99000uLL;
  }
  v72[0] = v12;
  v72[1] = 3221225472;
  v72[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_3;
  v72[3] = &unk_1E8EB31F0;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v73 = v33;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v72);
  if (SBSpotlightIsVisible())
  {
    +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sceneIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v35);

  }
  -[SBWorkspaceApplicationSceneTransitionContext applicationSceneEntities](self->_transitionContext, "applicationSceneEntities");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v12;
  v69[1] = 3221225472;
  v69[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_5;
  v69[3] = &unk_1E8EB3218;
  v37 = v33;
  v70 = v37;
  v71 = self;
  objc_msgSend(v36, "enumerateObjectsUsingBlock:", v69);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBFIsMoreForegroundAppsAvailable())
  {
    v39 = v12;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v40 = self->_fromAppSceneEntities;
    v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v66 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "sceneHandle");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v45);

        }
        v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      }
      while (v42);
    }

    v12 = v39;
    v19 = v58;
    v18 = 0x1E0C99000;
  }
  else if (-[SBSceneLayoutWorkspaceTransaction _runningOnManagedDisplay](self, "_runningOnManagedDisplay"))
  {
    objc_msgSend(v4, "layoutStateApplicationSceneHandles");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
      objc_msgSend(v38, "unionSet:", v46);

  }
  if (-[SBSceneLayoutWorkspaceTransaction _runningOnManagedDisplay](self, "_runningOnManagedDisplay"))
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction displayIdentity](self, "displayIdentity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sceneManagerForDisplayIdentity:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "externalForegroundApplicationSceneHandles");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v50, "count"))
      objc_msgSend(v38, "unionSet:", v50);

    v19 = v58;
    v18 = 0x1E0C99000uLL;
  }
  v62[0] = v12;
  v62[1] = 3221225472;
  v62[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_6;
  v62[3] = &unk_1E8EB3240;
  v63 = v37;
  v64 = self;
  v51 = v37;
  objc_msgSend(v38, "objectsPassingTest:", v62);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_alloc_init(*(Class *)(v18 + 3616));
  v59[0] = v12;
  v59[1] = 3221225472;
  v59[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_7;
  v59[3] = &unk_1E8EB3268;
  v60 = v53;
  v61 = self;
  v54 = v53;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v59);
  -[NSMutableSet unionSet:](self->_scenesToBackground, "unionSet:", v54);

}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v10, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "addObject:", v10);
  objc_msgSend(v3, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.InCallService"));

  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "addObject:", v10);
    if (SBFIsMoreForegroundAppsAvailable())
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 328), "addObject:", v10);
  }

}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "addObject:", a2);
}

- (void)_willBegin
{
  void *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *displayLayoutTransitionAssertion;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction _willBegin](&v10, sel__willBegin);
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 217, CFSTR("No window scene to get a publisher: %@"), self);

  }
  objc_msgSend(v4, "displayLayoutPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 217, CFSTR("No publisher for window scene: %@; self: %@"),
      v4,
      self);

  }
  objc_msgSend(v5, "transitionAssertionWithReason:", self->_preferredDisplayLayoutTransitionReason);
  v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = v6;

}

- (void)_performTransition
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SBApplicationSceneUpdateTransaction *v13;
  SBApplicationSceneUpdateTransaction *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  FBSynchronizedTransactionGroup *v24;
  FBSynchronizedTransactionGroup *sceneUpdateTransactionGroup;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  SBSceneLayoutSynchronizeTransitionTransaction *v30;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizePrepareTransitionTransaction;
  SBSceneLayoutSynchronizeTransitionTransaction *v32;
  id v33;
  SBSceneLayoutSynchronizeTransitionTransaction *v34;
  id v35;
  SBSceneLayoutSynchronizeTransitionTransaction *v36;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizeAddSlavesTransaction;
  void *v38;
  void *v39;
  void *v40;
  SBSceneBackgroundedStatusAssertion *v41;
  SBSceneBackgroundedStatusAssertion *scenesBackgroundedStatusAssertion;
  FBSynchronizedTransactionGroup *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id *p_synchronizeBeginTransitionTransaction;
  id *p_synchronizeSendActivationResultTransaction;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (-[SBSceneLayoutWorkspaceTransaction isComplete](self, "isComplete"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self isComplete]"));

  }
  if (self->_isTransitioning)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isTransitioning"));

  }
  if (self->_waitingForSynchronizedCommit)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_waitingForSynchronizedCommit == NO"));

  }
  if (!self->_transitionContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_transitionContext != nil"));

  }
  if (self->_scenesBackgroundedStatusAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 477, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_scenesBackgroundedStatusAssertion == nil"));

  }
  if (self->_synchronizePrepareTransitionTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_synchronizePrepareTransitionTransaction == nil"));

  }
  p_synchronizeSendActivationResultTransaction = (id *)&self->_synchronizeSendActivationResultTransaction;
  if (self->_synchronizeSendActivationResultTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_synchronizeSendActivationResultTransaction == nil"));

  }
  p_synchronizeBeginTransitionTransaction = (id *)&self->_synchronizeBeginTransitionTransaction;
  if (self->_synchronizeBeginTransitionTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_synchronizeBeginTransitionTransaction == nil"));

  }
  if (self->_synchronizeAddSlavesTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_synchronizeAddSlavesTransaction == nil"));

  }
  if (self->_sceneUpdateTransactionGroup)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sceneUpdateTransactionGroup == nil"));

  }
  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    NSStringFromSBWorkspaceSceneLayoutTransitionOptions(self->_options);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWorkspaceTransaction transitionContext](self, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "succinctDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("------ PERFORM TRANSITION - config=%@ : %@"), v4, v7);

  }
  self->_isTransitioning = 1;
  self->_transitionFailed = 0;
  self->_delegateTransitionComplete = 0;
  -[SBSceneLayoutWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("transitioning"));
  -[NSMutableSet removeAllObjects](self->_updateTransactions, "removeAllObjects");
  -[SBSceneLayoutWorkspaceTransaction _captureAppsForTransition](self, "_captureAppsForTransition");
  self->_performSceneUpdates = (self->_options & 1) == 0;
  -[SBSceneLayoutWorkspaceTransaction _prepareScenesForSceneUpdates](self, "_prepareScenesForSceneUpdates");
  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Starting layout transition."));
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginTransitionForWorkspaceTransaction:", self);

  if (self->_performSceneUpdates)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v9 = self->_foregroundingAppSceneEntities;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v70 != v11)
            objc_enumerationMutation(v9);
          v13 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i), self->super._transitionRequest);
          v14 = v13;
          if (v13)
          {
            -[FBApplicationUpdateScenesTransaction addObserver:](v13, "addObserver:", self);
            -[NSMutableSet addObject:](self->_updateTransactions, "addObject:", v14);
          }

        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v10);
    }

  }
  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0D016F0]);
  v16 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke;
  v66[3] = &unk_1E8EAE0A0;
  objc_copyWeak(&v67, &location);
  v17 = (void *)objc_msgSend(v15, "initWithBlock:", v66);
  objc_msgSend(v17, "setDebugName:", CFSTR("prepareTransition"));
  v18 = objc_alloc(MEMORY[0x1E0D016F0]);
  v64[0] = v16;
  v64[1] = 3221225472;
  v64[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_2;
  v64[3] = &unk_1E8EAE0A0;
  objc_copyWeak(&v65, &location);
  v19 = (void *)objc_msgSend(v18, "initWithBlock:", v64);
  objc_msgSend(v19, "setDebugName:", CFSTR("sendActivationResult"));
  v20 = objc_alloc(MEMORY[0x1E0D016F0]);
  v62[0] = v16;
  v62[1] = 3221225472;
  v62[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_3;
  v62[3] = &unk_1E8EAE0A0;
  objc_copyWeak(&v63, &location);
  v21 = (void *)objc_msgSend(v20, "initWithBlock:", v62);
  objc_msgSend(v21, "setDebugName:", CFSTR("beginTransition"));
  -[SBSceneLayoutWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("slaves"));
  v22 = objc_alloc(MEMORY[0x1E0D016F0]);
  v60[0] = v16;
  v60[1] = 3221225472;
  v60[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_4;
  v60[3] = &unk_1E8EAE0A0;
  objc_copyWeak(&v61, &location);
  v23 = (void *)objc_msgSend(v22, "initWithBlock:", v60);
  objc_msgSend(v23, "setDebugName:", CFSTR("addSlaves"));
  if (-[NSMutableSet count](self->_updateTransactions, "count"))
  {
    v24 = (FBSynchronizedTransactionGroup *)objc_alloc_init(MEMORY[0x1E0D22998]);
    sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
    self->_sceneUpdateTransactionGroup = v24;

    self->_waitingForSynchronizedCommit = 1;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v26 = self->_updateTransactions;
    v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v57 != v28)
            objc_enumerationMutation(v26);
          -[FBSynchronizedTransactionGroup addSynchronizedTransaction:](self->_sceneUpdateTransactionGroup, "addSynchronizedTransaction:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
        }
        v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      }
      while (v27);
    }

    if ((self->_options & 2) != 0)
    {
      if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Layout transition will NOT synchronize with scene updates."));
      v34 = -[SBSceneLayoutSynchronizeTransitionTransaction initWithDebugName:]([SBSceneLayoutSynchronizeTransitionTransaction alloc], "initWithDebugName:", CFSTR("synchronizeSendActivationResultTransition"));
      v35 = *p_synchronizeSendActivationResultTransaction;
      *p_synchronizeSendActivationResultTransaction = v34;

      objc_msgSend(*p_synchronizeSendActivationResultTransaction, "addChildTransaction:withSchedulingPolicy:", v19, 1);
    }
    else
    {
      if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Layout transition will synchronize with scene updates."));
      v30 = -[SBSceneLayoutSynchronizeTransitionTransaction initWithDebugName:]([SBSceneLayoutSynchronizeTransitionTransaction alloc], "initWithDebugName:", CFSTR("synchronizePrepareTransition"));
      synchronizePrepareTransitionTransaction = self->_synchronizePrepareTransitionTransaction;
      self->_synchronizePrepareTransitionTransaction = v30;

      -[SBSceneLayoutSynchronizeTransitionTransaction addChildTransaction:withSchedulingPolicy:](self->_synchronizePrepareTransitionTransaction, "addChildTransaction:withSchedulingPolicy:", v17, 1);
      -[SBSceneLayoutWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_synchronizePrepareTransitionTransaction);
      v32 = -[SBSceneLayoutSynchronizeTransitionTransaction initWithDebugName:]([SBSceneLayoutSynchronizeTransitionTransaction alloc], "initWithDebugName:", CFSTR("synchronizeBeginTransition"));
      v33 = *p_synchronizeBeginTransitionTransaction;
      *p_synchronizeBeginTransitionTransaction = v32;

      objc_msgSend(*p_synchronizeBeginTransitionTransaction, "addChildTransaction:withSchedulingPolicy:", v21, 1);
      p_synchronizeSendActivationResultTransaction = (id *)&self->_synchronizeBeginTransitionTransaction;
    }
    -[SBSceneLayoutWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", *p_synchronizeSendActivationResultTransaction);
    v36 = -[SBSceneLayoutSynchronizeTransitionTransaction initWithDebugName:]([SBSceneLayoutSynchronizeTransitionTransaction alloc], "initWithDebugName:", CFSTR("synchronizeAddSlaves"));
    synchronizeAddSlavesTransaction = self->_synchronizeAddSlavesTransaction;
    self->_synchronizeAddSlavesTransaction = v36;

    -[SBSceneLayoutSynchronizeTransitionTransaction addChildTransaction:withSchedulingPolicy:](self->_synchronizeAddSlavesTransaction, "addChildTransaction:withSchedulingPolicy:", v23, 1);
    -[SBSceneLayoutWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_synchronizeAddSlavesTransaction);
  }
  else if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Layout transition will run without scene updates."));
  }
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction displayIdentity](self, "displayIdentity");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sceneManagerForDisplayIdentity:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "assertBackgroundedStatusForScenes:", self->_scenesToBackground);
  v41 = (SBSceneBackgroundedStatusAssertion *)objc_claimAutoreleasedReturnValue();
  scenesBackgroundedStatusAssertion = self->_scenesBackgroundedStatusAssertion;
  self->_scenesBackgroundedStatusAssertion = v41;

  objc_msgSend(v21, "addChildTransaction:withSchedulingPolicy:", v23, 1);
  objc_msgSend(v17, "addChildTransaction:withSchedulingPolicy:", v19, 1);
  objc_msgSend(v17, "addChildTransaction:withSchedulingPolicy:", v21, 1);
  -[SBSceneLayoutWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", v17);
  v43 = self->_sceneUpdateTransactionGroup;
  if (v43)
  {
    -[FBSynchronizedTransactionGroup setSynchronizationDelegate:](v43, "setSynchronizationDelegate:", self);
    -[SBSceneLayoutWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_sceneUpdateTransactionGroup);
  }

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);
}

- (SBWorkspaceApplicationSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)_prepareScenesForSceneUpdates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  SBSceneLayoutWorkspaceTransaction *v46;
  NSMutableSet *obj;
  void *v48;
  _QWORD v49[5];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v61 = *MEMORY[0x1E0C80C00];
  if (self->_performSceneUpdates
    && -[SBSceneLayoutWorkspaceTransaction _runningOnManagedDisplay](self, "_runningOnManagedDisplay"))
  {
    v46 = self;
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switcherController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v48, "isChamoisWindowingUIEnabled");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v46->_foregroundingAppSceneEntities;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (!v5)
      goto LABEL_29;
    v6 = *(_QWORD *)v57;
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v45 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v43 = 4;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v57 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "layoutRole", v43);
        objc_msgSend(v10, "sceneHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLayoutRole:", v11);

        objc_msgSend(v10, "sceneHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isDeviceApplicationSceneHandle");

        if (v14)
        {
          v15 = objc_opt_class();
          -[SBSceneLayoutWorkspaceTransaction transitionContext](v46, "transitionContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layoutState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          SBSafeCast(v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 == 1 || v11 == 2)
          {
            objc_msgSend(v48, "coordinateSpaceForLayoutState:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "elementWithRole:", v11);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "coordinateSpaceForLayoutElement:layoutState:", v24, v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "statusBarAvoidanceFrameForLayoutRole:layoutState:", v11, v18);
            objc_msgSend(v23, "convertRect:toCoordinateSpace:", v25);
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;
            objc_msgSend(v25, "bounds");
            v64.origin.x = v34;
            v64.origin.y = v35;
            v64.size.width = v36;
            v64.size.height = v37;
            v62.origin.x = v27;
            v62.origin.y = v29;
            v62.size.width = v31;
            v62.size.height = v33;
            v63 = CGRectIntersection(v62, v64);
            x = v63.origin.x;
            y = v63.origin.y;
            width = v63.size.width;
            height = v63.size.height;

            if ((v4 & 1) != 0)
              goto LABEL_14;
            if (v11 != 1)
              goto LABEL_19;
            if (objc_msgSend(v18, "isFullScreen"))
              v40 = 0xFFFFLL;
            else
              v40 = 1;
          }
          else
          {
            y = v44;
            x = v45;
            width = v7;
            height = v8;
            if (!(_DWORD)v4)
            {
LABEL_19:
              v41 = 0xFFFFLL;
              if (v11 == v43)
                v41 = 0;
              if (v11 == 3)
                v41 = 0;
              if (v11 == 2)
                v40 = 2;
              else
                v40 = v41;
              goto LABEL_26;
            }
LABEL_14:
            v52 = 0;
            v53 = &v52;
            v54 = 0x2020000000;
            v55 = 0;
            objc_msgSend(v18, "appLayout");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __66__SBSceneLayoutWorkspaceTransaction__prepareScenesForSceneUpdates__block_invoke;
            v49[3] = &unk_1E8EB3338;
            v49[4] = v10;
            v39 = v38;
            v50 = v39;
            v51 = &v52;
            objc_msgSend(v39, "enumerate:", v49);
            v40 = v53[3];

            _Block_object_dispose(&v52, 8);
          }
LABEL_26:
          objc_msgSend(v10, "sceneHandle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setStatusBarParts:", v40);
          objc_msgSend(v42, "setStatusBarAvoidanceFrame:", x, y, width, height);
          objc_msgSend(v42, "setWantsEnhancedWindowingEnabled:", v4);

          continue;
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (!v5)
      {
LABEL_29:

        return;
      }
    }
  }
}

- (void)_evaluateTransitionCompletion
{
  FBSynchronizedTransactionGroup *sceneUpdateTransactionGroup;

  if (!self->_waitingForSynchronizedCommit
    && (!self->_waitForSceneUpdates
     || (sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup) == 0
     || -[FBSynchronizedTransactionGroup isComplete](sceneUpdateTransactionGroup, "isComplete"))
    && (-[SBSceneLayoutWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("waitingForDelegate")) & 1) == 0)
  {
    -[SBSceneLayoutWorkspaceTransaction _completeTransition](self, "_completeTransition");
  }
}

- (void)_completeTransition
{
  void *v4;
  void *v5;
  SBSceneBackgroundedStatusAssertion *scenesBackgroundedStatusAssertion;
  FBSynchronizedTransactionGroup *sceneUpdateTransactionGroup;
  FBSynchronizedTransactionGroup *v8;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizePrepareTransitionTransaction;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizeSendActivationResultTransaction;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizeBeginTransitionTransaction;
  SBSceneLayoutSynchronizeTransitionTransaction *synchronizeAddSlavesTransaction;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  SBWorkspaceApplicationSceneTransitionContext *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  _QWORD v27[3];
  char v28;

  if (!self->_isTransitioning)
    return;
  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    NSStringFromBOOL();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("------ TRANSITION COMPLETE with success: %@"), v4);

  }
  if (self->_waitingForSynchronizedCommit)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 604, CFSTR("the transition can't complete if we're still waiting for the synchronize"));

  }
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willEndTransition");

  -[SBSceneLayoutWorkspaceTransaction _updateScenesForTransitionCompletion](self, "_updateScenesForTransitionCompletion");
  -[NSMutableSet removeAllObjects](self->_scenesToBackground, "removeAllObjects");
  -[SBSceneBackgroundedStatusAssertion invalidate](self->_scenesBackgroundedStatusAssertion, "invalidate");
  scenesBackgroundedStatusAssertion = self->_scenesBackgroundedStatusAssertion;
  self->_scenesBackgroundedStatusAssertion = 0;

  sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
  if (sceneUpdateTransactionGroup)
  {
    -[FBSynchronizedTransactionGroup setSynchronizationDelegate:](sceneUpdateTransactionGroup, "setSynchronizationDelegate:", 0);
    v8 = self->_sceneUpdateTransactionGroup;
    self->_sceneUpdateTransactionGroup = 0;

  }
  synchronizePrepareTransitionTransaction = self->_synchronizePrepareTransitionTransaction;
  self->_synchronizePrepareTransitionTransaction = 0;

  synchronizeSendActivationResultTransaction = self->_synchronizeSendActivationResultTransaction;
  self->_synchronizeSendActivationResultTransaction = 0;

  synchronizeBeginTransitionTransaction = self->_synchronizeBeginTransitionTransaction;
  self->_synchronizeBeginTransitionTransaction = 0;

  synchronizeAddSlavesTransaction = self->_synchronizeAddSlavesTransaction;
  self->_synchronizeAddSlavesTransaction = 0;

  self->_isTransitioning = 0;
  -[FBSynchronizedTransactionGroup allErrors](self->_sceneUpdateTransactionGroup, "allErrors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (self->_transitionFailed)
  {
    objc_msgSend(v13, "bs_firstObjectPassingTest:", &__block_literal_global_220);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endTransitionWithError:", v15);

  if (self->_performSceneUpdates
    && (-[SBSceneLayoutWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    v17 = (void *)SBApp;
    -[SBWorkspaceTransaction displayIdentity](self, "displayIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "noteSceneLayoutDidUpdateOnDisplayWithIdentity:", v18);

  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke_2;
  v26[3] = &unk_1E8EB32D0;
  v26[5] = v27;
  v26[6] = a2;
  v26[4] = self;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v26);
  v20 = self->_transitionContext;
  -[SBSceneLayoutWorkspaceTransaction delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    goto LABEL_18;
  if ((self->_options & 8) != 0)
  {
    objc_msgSend(v21, "transaction:didEndLayoutTransitionWithContinuation:", self, 0);
LABEL_18:
    v19[2](v19, 0, 0);
    goto LABEL_19;
  }
  objc_msgSend(v21, "transaction:didEndLayoutTransitionWithContinuation:", self, v19);
LABEL_19:
  if (-[NSMutableSet count](self->_backgroundingAppSceneEntities, "count"))
  {
    +[SBSceneDisconnectionManager sharedManager](SBSceneDisconnectionManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_beginSceneCleanupWithBackgroundedSceneEntities:", self->_backgroundingAppSceneEntities);

    objc_msgSend((id)SBApp, "hungApplicationInteractionObserver");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "observeBackgroundingApplicationSceneEntities:withTransitionContext:", self->_backgroundingAppSceneEntities, v20);

  }
  _Block_object_dispose(v27, 8);

}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  if (objc_msgSend(v4, "isHostingAnApp"))
  {
    objc_msgSend(v4, "hostedAppSceneHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_4;
    v5[3] = &unk_1E8EB31C8;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  }
}

- (void)_begin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction _begin](&v3, sel__begin);
  -[SBSceneLayoutWorkspaceTransaction _performTransition](self, "_performTransition");
}

- (NSSet)fromApplicationSceneEntities
{
  return (NSSet *)self->_fromAppSceneEntities;
}

- (NSSet)toApplicationSceneEntities
{
  return (NSSet *)self->_toAppSceneEntities;
}

- (void)setSynchronizationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_synchronizationDelegate, a3);
}

- (SBSceneLayoutWorkspaceTransaction)initWithTransitionRequest:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBSceneLayoutWorkspaceTransaction *v10;
  SBSceneLayoutWorkspaceTransaction *v11;
  NSMutableSet *v12;
  NSMutableSet *updateTransactions;
  NSMutableSet *v14;
  NSMutableSet *toAppSceneEntities;
  NSMutableSet *v16;
  NSMutableSet *fromAppSceneEntities;
  NSMutableSet *v18;
  NSMutableSet *foregroundingAppSceneEntities;
  NSMutableSet *v20;
  NSMutableSet *backgroundingAppSceneEntities;
  NSMutableSet *v22;
  NSMutableSet *scenesToBackground;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *preferredDisplayLayoutTransitionReason;
  void *v29;
  void *v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  }
  if (objc_msgSend(v9, "isBackground"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![context isBackground]"));

  }
  v31.receiver = self;
  v31.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  v10 = -[SBWorkspaceTransaction initWithTransitionRequest:](&v31, sel_initWithTransitionRequest_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_transitionContext, v9);
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updateTransactions = v11->_updateTransactions;
    v11->_updateTransactions = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    toAppSceneEntities = v11->_toAppSceneEntities;
    v11->_toAppSceneEntities = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    fromAppSceneEntities = v11->_fromAppSceneEntities;
    v11->_fromAppSceneEntities = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundingAppSceneEntities = v11->_foregroundingAppSceneEntities;
    v11->_foregroundingAppSceneEntities = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    backgroundingAppSceneEntities = v11->_backgroundingAppSceneEntities;
    v11->_backgroundingAppSceneEntities = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    scenesToBackground = v11->_scenesToBackground;
    v11->_scenesToBackground = v22;

    if ((objc_msgSend(v9, "waitsForSceneUpdates") & 1) == 0)
      v11->_options |= 4uLL;
    if (SBFIsMoreForegroundAppsAvailable())
    {
      -[SBWorkspaceTransaction windowScene](v11, "windowScene");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "switcherController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_prepareForSceneLayoutTransitionWithTransitionContext:", v9);

    }
    -[SBSceneLayoutWorkspaceTransaction _defaultDisplayLayoutTransitionReason](v11, "_defaultDisplayLayoutTransitionReason");
    v26 = objc_claimAutoreleasedReturnValue();
    preferredDisplayLayoutTransitionReason = v11->_preferredDisplayLayoutTransitionReason;
    v11->_preferredDisplayLayoutTransitionReason = (NSString *)v26;

    -[SBSceneLayoutWorkspaceTransaction _captureAppsForTransition](v11, "_captureAppsForTransition");
  }

  return v11;
}

- (id)_defaultDisplayLayoutTransitionReason
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id WeakRetained;
  void (**v5)(id, uint64_t);

  v3 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_prepareLayoutTransition");

  v5[2](v5, 1);
}

- (void)_prepareLayoutTransition
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transactionWillBeginLayoutTransition:", self);

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayLayoutPublisher");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "flush");
}

- (void)_didComplete
{
  void *v4;
  BSInvalidatable *displayLayoutTransitionAssertion;
  void *v6;
  objc_super v7;

  SBWTErrorCreateForTransaction(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneLayoutWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v4);

  -[SBSceneLayoutWorkspaceTransaction _completeTransition](self, "_completeTransition");
  objc_storeWeak((id *)&self->_delegate, 0);
  -[BSInvalidatable invalidate](self->_displayLayoutTransitionAssertion, "invalidate");
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = 0;

  if (self->_scenesBackgroundedStatusAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_scenesBackgroundedStatusAssertion == nil"));

  }
  v7.receiver = self;
  v7.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBWorkspaceTransaction _didComplete](&v7, sel__didComplete);
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id WeakRetained;
  void (**v5)(id, uint64_t);

  v3 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_sendActivationResultWithError:", 0);

  v5[2](v5, 1);
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SBWorkspaceApplicationSceneTransitionContext needsToSendActivationResult](self->_transitionContext, "needsToSendActivationResult"))
  {
    if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; success = %d"),
        v4 == 0);
    -[SBWorkspaceApplicationSceneTransitionContext sendActivationResultError:](self->_transitionContext, "sendActivationResultError:", v4);
  }

}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 1;
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childTransactionsForTransitionRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "addChildTransaction:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)sceneManager
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBWorkspaceTransaction sceneManager](&v3, sel_sceneManager);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  objc_super v3;

  -[SBSceneBackgroundedStatusAssertion invalidate](self->_scenesBackgroundedStatusAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (void)_childTransactionDidComplete:(id)a3
{
  FBSynchronizedTransactionGroup *v4;
  objc_super v5;

  v4 = (FBSynchronizedTransactionGroup *)a3;
  if (self->_sceneUpdateTransactionGroup == v4)
    -[SBSceneLayoutWorkspaceTransaction _evaluateTransitionCompletion](self, "_evaluateTransitionCompletion");
  v5.receiver = self;
  v5.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction _childTransactionDidComplete:](&v5, sel__childTransactionDidComplete_, v4);

}

- (void)synchronizedTransaction:(id)a3 didCommitSynchronizedTransactions:(id)a4
{
  _QWORD v5[5];

  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled", a3, a4))
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Synchronizing with scene updates NOW."));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__SBSceneLayoutWorkspaceTransaction_synchronizedTransaction_didCommitSynchronizedTransactions___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D22968], "synchronizeChanges:", v5);
}

uint64_t __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D01660]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D22880]);

  return v4;
}

- (NSSet)sceneUpdateTransactions
{
  return &self->_updateTransactions->super;
}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  void *v4;
  id v5;

  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled", a3))
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Scene updates ready to commit."));
  -[SBSceneLayoutSynchronizeTransitionTransaction synchronize](self->_synchronizeSendActivationResultTransaction, "synchronize");
  -[SBSceneLayoutSynchronizeTransitionTransaction synchronize](self->_synchronizePrepareTransitionTransaction, "synchronize");
  -[SBSceneLayoutWorkspaceTransaction synchronizationDelegate](self, "synchronizationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBSceneLayoutWorkspaceTransaction addMilestone:](self, "addMilestone:", *MEMORY[0x1E0D22878]);
    if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Deferring commit to synchronization delegate: %@"), v4);

    }
    objc_msgSend(v5, "synchronizedTransactionReadyToCommit:", self);
  }
  else
  {
    -[FBSynchronizedTransactionGroup performSynchronizedCommit](self->_sceneUpdateTransactionGroup, "performSynchronizedCommit");
  }

}

uint64_t __95__SBSceneLayoutWorkspaceTransaction_synchronizedTransaction_didCommitSynchronizedTransactions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "synchronize");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 360));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 288), "synchronizedTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "synchronizedTransaction:didCommitSynchronizedTransactions:", v3, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "synchronize");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 245) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateTransitionCompletion");
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  return (FBSynchronizedTransactionDelegate *)objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
}

- (void)performSynchronizedCommit
{
  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Delegate says perform commit now."));
  -[FBSynchronizedTransactionGroup performSynchronizedCommit](self->_sceneUpdateTransactionGroup, "performSynchronizedCommit");
  -[SBSceneLayoutWorkspaceTransaction satisfyMilestone:](self, "satisfyMilestone:", *MEMORY[0x1E0D22878]);
}

uint64_t __59__SBSceneLayoutWorkspaceTransaction__beginLayoutTransition__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("waitingForDelegate"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 244) = (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) & 4) == 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 304);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setWaitsForSceneCommits:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 244), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_evaluateTransitionCompletion");
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  void (**v4)(id, uint64_t);
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[5];

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_5;
    v8[3] = &unk_1E8E9DED8;
    v8[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D22968], "synchronizeChanges:", v8);
    WeakRetained = v6;
  }
  objc_msgSend(WeakRetained, "satisfyMilestone:", CFSTR("slaves"), v6);
  v4[2](v4, 1);

}

- (void)synchronizedTransaction:(id)a3 willCommitSynchronizedTransactions:(id)a4
{
  id WeakRetained;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
  v7[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "synchronizedTransaction:willCommitSynchronizedTransactions:", self, v6);

}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id WeakRetained;
  void (**v5)(id, uint64_t);

  v3 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_beginLayoutTransition");

  v5[2](v5, 1);
}

- (void)_beginLayoutTransition
{
  void *v3;
  _QWORD v4[5];

  -[SBSceneLayoutWorkspaceTransaction _prepareScenesForTransition](self, "_prepareScenesForTransition");
  -[SBSceneLayoutWorkspaceTransaction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBSceneLayoutWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("waitingForDelegate"));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__SBSceneLayoutWorkspaceTransaction__beginLayoutTransition__block_invoke;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = self;
    objc_msgSend(v3, "transaction:performTransitionWithCompletion:", self, v4);
  }
  else
  {
    self->_waitForSceneUpdates = 1;
    -[SBSceneLayoutWorkspaceTransaction _evaluateTransitionCompletion](self, "_evaluateTransitionCompletion");
  }

}

- (SBSceneLayoutWorkspaceTransactionDelegate)delegate
{
  return (SBSceneLayoutWorkspaceTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateScenesForTransitionCompletion
{
  void *v3;
  void *v4;
  SBWorkspaceTransitionRequest *interruptingTransitionRequest;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  SBSceneLayoutWorkspaceTransaction *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_performSceneUpdates)
  {
    -[SBSceneLayoutWorkspaceTransaction _updateKeyboardContextMaskStyles:](self, "_updateKeyboardContextMaskStyles:", 0);
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "medusaHostedKeyboardWindowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateMedusaHostedKeyboardWindow");

    if (-[SBSceneLayoutWorkspaceTransaction isInterrupted](self, "isInterrupted")
      && (interruptingTransitionRequest = self->_interruptingTransitionRequest) != 0)
    {
      -[SBWorkspaceTransitionRequest applicationContext](interruptingTransitionRequest, "applicationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applicationSceneEntities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bs_map:", &__block_literal_global_161_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = self;
    v9 = self->_scenesToBackground;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (objc_msgSend(v14, "isValid"))
          {
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "containsObject:", v15);

            if ((v16 & 1) == 0)
            {
              objc_msgSend(v14, "updateUISettingsWithBlock:", &__block_literal_global_163);
              objc_msgSend(v14, "uiPresentationManager");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "modifyDefaultPresentationContext:", &__block_literal_global_165);

            }
          }
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    if (SBFIsMoreForegroundAppsAvailable())
    {
      -[SBWorkspaceTransaction windowScene](v27, "windowScene");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "switcherController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v20 = v27->_foregroundingAppSceneEntities;
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "sceneHandle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sceneIfExists");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              v28[0] = MEMORY[0x1E0C809B0];
              v28[1] = 3221225472;
              v28[2] = __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_4;
              v28[3] = &unk_1E8EB0DF0;
              v29 = v19;
              v30 = v26;
              objc_msgSend(v30, "updateSettingsWithBlock:", v28);

            }
          }
          v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v22);
      }

    }
  }
}

- (void)_prepareScenesForTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_performSceneUpdates
    && -[SBSceneLayoutWorkspaceTransaction _runningOnManagedDisplay](self, "_runningOnManagedDisplay"))
  {
    -[SBSceneLayoutWorkspaceTransaction _updateKeyboardContextMaskStyles:](self, "_updateKeyboardContextMaskStyles:", 1);
    v4 = *MEMORY[0x1E0CEB4B0];
    v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_foregroundingAppSceneEntities;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      v11 = v5;
      v12 = v6;
      v13 = v3;
      v14 = v4;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v16, "sceneHandle", (_QWORD)v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sceneIfExists");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "isValid"))
          {
            v19 = objc_msgSend(v16, "layoutRole");
            if (SBLayoutRoleIsValidForSplitView(v19))
            {
              objc_msgSend(v18, "clientSettings");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "isUISubclass"))
              {
                objc_msgSend(v20, "primaryWindowOverlayInsets");
                if (v19 == 1)
                {
                  v11 = v24;
                  v12 = v23;
                }
                else
                {
                  v5 = v24;
                  v6 = v23;
                  v3 = v22;
                  v4 = v21;
                }
                if (v19 == 1)
                {
                  v13 = v22;
                  v14 = v21;
                }
              }

            }
          }

        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }
    else
    {
      v11 = v5;
      v12 = v6;
      v13 = v3;
      v14 = v4;
    }

    objc_msgSend((id)SBApp, "windowSceneManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction displayIdentity](self, "displayIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "windowSceneForDisplayIdentity:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pictureInPictureManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "applyPictureInPictureInsets:forSource:", 2, v14, v13, v12, v11);
    objc_msgSend(v28, "applyPictureInPictureInsets:forSource:", 3, v4, v3, v6, v5);

  }
}

- (void)_updateKeyboardContextMaskStyles:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMedusaCapable");

  if (v6)
  {
    -[SBSceneLayoutWorkspaceTransaction transitionContext](self, "transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previousLayoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneLayoutWorkspaceTransaction transitionContext](self, "transitionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v8;
    objc_msgSend(v8, "elements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(v10, "elements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    v32 = v10;

    objc_msgSend(v18, "setByAddingObjectsFromSet:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
      objc_msgSend(v20, "unionSet:", v18);
    if (v3 && (unint64_t)objc_msgSend(v14, "count") >= 2)
      objc_msgSend(v20, "unionSet:", v14);
    v31 = v14;
    objc_msgSend(v19, "bs_map:", &__block_literal_global_156, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bs_map:", &__block_literal_global_156);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v22, "containsObject:", v28))
            v29 = 2;
          else
            v29 = 26;
          objc_msgSend(v28, "setKeyboardContextMaskStyle:", v29);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_synchronizationDelegate);
  objc_storeStrong((id *)&self->_interruptingTransitionRequest, 0);
  objc_storeStrong((id *)&self->_scenesToBackground, 0);
  objc_storeStrong((id *)&self->_backgroundingAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_foregroundingAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_fromAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_toAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_updateTransactions, 0);
  objc_storeStrong((id *)&self->_scenesBackgroundedStatusAssertion, 0);
  objc_storeStrong((id *)&self->_sceneUpdateTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_synchronizeAddSlavesTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizeBeginTransitionTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizeSendActivationResultTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizePrepareTransitionTransaction, 0);
  objc_storeStrong((id *)&self->_preferredDisplayLayoutTransitionReason, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__SBSceneLayoutWorkspaceTransaction_transaction_willCommitSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:willCommitSceneUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __70__SBSceneLayoutWorkspaceTransaction_transaction_didCommitSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:didCommitSceneUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __67__SBSceneLayoutWorkspaceTransaction_transaction_willLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:willLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66__SBSceneLayoutWorkspaceTransaction_transaction_didLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:didLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64__SBSceneLayoutWorkspaceTransaction_transaction_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:didCreateScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SBSceneLayoutWorkspaceTransaction_transaction_willCommitSceneUpdate___block_invoke;
  v10[3] = &unk_1E8EB33E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBSceneLayoutWorkspaceTransaction_transaction_didLaunchProcess___block_invoke;
  v10[3] = &unk_1E8EB33E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SBSceneLayoutWorkspaceTransaction_transaction_didCreateScene___block_invoke;
  v10[3] = &unk_1E8EB33E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SBSceneLayoutWorkspaceTransaction_transaction_didCommitSceneUpdate___block_invoke;
  v10[3] = &unk_1E8EB33E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)-[NSMutableSet count](self->_updateTransactions, "count") <= 1
    && -[NSMutableSet containsObject:](self->_updateTransactions, "containsObject:", v6))
  {
    if (objc_msgSend(v7, "isRunning"))
    {
      -[SBSceneLayoutWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", 0);
    }
    else
    {
      objc_msgSend(v7, "exitContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneLayoutWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v9);

    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SBSceneLayoutWorkspaceTransaction_transaction_willLaunchProcess___block_invoke;
  v12[3] = &unk_1E8EB33E0;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v12);

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

- (void)_willInterruptWithReason:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction _willInterruptWithReason:](&v5, sel__willInterruptWithReason_, a3);
  self->_transitionFailed = 1;
  -[SBWorkspaceTransaction _transitionRequestForInterruption](self, "_transitionRequestForInterruption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong((id *)&self->_interruptingTransitionRequest, v4);

}

- (void)_willFailWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  -[SBSceneLayoutWorkspaceTransaction _willFailWithReason:](&v4, sel__willFailWithReason_, a3);
  self->_transitionFailed = 1;
}

- (BOOL)_runningOnManagedDisplay
{
  void *v2;
  BOOL v3;

  -[SBWorkspaceTransaction displayIdentity](self, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sb_displayWindowingMode") == 1;

  return v3;
}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "addObject:", a2);
}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sceneIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_sceneEntities:hasEntityRepresentingSceneID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328), v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "_shouldKeepSceneForSceneHandleForeground:", v3) ^ 1;
  }

  return v5;
}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(v3, "clientProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "previousApplicationSceneEntityForBundleID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 208)),
          objc_msgSend(WeakRetained, "createSceneEntityForHandle:", v11),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          WeakRetained,
          v6))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 336), "addObject:", v6);
      v8 = *(_QWORD **)(a1 + 40);
      v9 = v8[40];
      objc_msgSend(v11, "sceneIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v8, "_sceneEntities:hasEntityRepresentingSceneID:", v9, v10);

      if ((v8 & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "addObject:", v6);
    }

  }
}

- (BOOL)_sceneEntities:(id)a3 hasEntityRepresentingSceneID:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "sceneHandle", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sceneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)_shouldKeepSceneForSceneHandleForeground:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = 0;
    v6 = objc_msgSend(WeakRetained, "transaction:shouldKeepSceneForeground:withReason:", self, v4, &v11);
    v7 = v11;
    if (v7)
    {
      SBLogTransaction();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v9;
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Keeping scene %{public}@ foreground for reason:\n%{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 642, CFSTR("can't call this more than once"));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v6 + 24) = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled"))
  {
    v7 = *(void **)(a1 + 32);
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_addAuditHistoryItem:", CFSTR("Transition continuation called with follow-up transition: %@."), v8);

  }
  v9 = *(id **)(a1 + 32);
  if (v9[35] == v14)
  {
    if (v14)
      goto LABEL_7;
  }
  else
  {
    objc_storeStrong(v9 + 35, a2);
    v9 = *(id **)(a1 + 32);
    if (v9[35])
    {
LABEL_7:
      if ((objc_msgSend(v9, "isComplete") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isInterrupted") & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled"))
          objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("Ignoring continuation because we have already completed."));
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = a3;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setApplicationContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
        v10 = *(_QWORD **)(a1 + 32);
        v11 = (void *)v10[35];
        objc_msgSend(v10, "layoutStateTransitionCoordinator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDelegate:", v12);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "finalize");
        objc_msgSend(*(id *)(a1 + 32), "_performTransition");
      }
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v9, "isAuditHistoryEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("Scene layout completed."));
  objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("transitioning"));
LABEL_16:

}

id __70__SBSceneLayoutWorkspaceTransaction__updateKeyboardContextMaskStyles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "workspaceEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceApplicationSceneEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __66__SBSceneLayoutWorkspaceTransaction__prepareScenesForSceneUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL IsOccluded;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = v13;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "layoutAttributesForItem:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IsOccluded = SBDisplayItemLayoutAttributesOcclusionStateIsOccluded(objc_msgSend(v10, "occlusionState"));
    v12 = objc_msgSend(v10, "sizingPolicy");
    if (!IsOccluded && v12 == 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0xFFFFLL;
      *a4 = 1;
    }

    v9 = v13;
  }

}

id __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setForeground:", 0);
  objc_msgSend(v2, "ignoreOcclusionReasons");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeAllObjects");
}

uint64_t __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentedLayerTypes:", 26);
}

void __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "setJetsamMode:", objc_msgSend(v3, "_jetsamModeForScene:", v4));
  objc_msgSend(v5, "setActivityMode:", objc_msgSend(*(id *)(a1 + 32), "_activityModeForScene:", *(_QWORD *)(a1 + 40)));

}

- (BOOL)_overrideInterfaceOrientationForOrientationMismatch:(int64_t *)a3
{
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL result;
  SEL v29;
  int64_t *v30;
  uint64_t v31;
  SBSceneLayoutWorkspaceTransaction *v32;
  NSMutableSet *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = self->_updateTransactions;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v29 = a2;
    v30 = a3;
    v32 = self;
    obj = v6;
    v9 = 0;
    v10 = *(_QWORD *)v35;
    v31 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "applicationSceneEntity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sceneIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sceneWithIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "sceneSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sceneSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "interfaceOrientation");

        objc_msgSend(v16, "uiClientSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "sb_effectiveInterfaceOrientation");

        if (objc_msgSend(v16, "isValid") && objc_msgSend(v17, "isUISubclass"))
        {
          if ((objc_msgSend(v17, "deviceOrientationEventsEnabled") & 1) == 0)
          {
            if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](v32, "isAuditHistoryEnabled"))
              -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](v32, "_addAuditHistoryItem:", CFSTR("Don't need to do any orientation override, the settings don't have orientation events enabled"));

            return 0;
          }
          if (v19 != v21)
          {
            if (v9 && v9 != v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              BSInterfaceOrientationDescription();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              BSInterfaceOrientationDescription();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v29, v32, CFSTR("SBSceneLayoutWorkspaceTransaction.m"), 926, CFSTR("Multiple override interface orientations don't make sense (%@ vs %@)"), v26, v27);

            }
            if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](v32, "isAuditHistoryEnabled"))
            {
              BSInterfaceOrientationDescription();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "application");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "bundleIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](v32, "_addAuditHistoryItem:", CFSTR("Scene Layout Transaction needs to override orientation to %@ for %@"), v22, v24);

              v10 = v31;
            }
            v9 = v21;
          }
        }

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v8)
        continue;
      break;
    }

    result = v9 != 0;
    if (v30)
    {
      if (v9)
      {
        *v30 = v9;
        return 1;
      }
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)_updatePreferredDisplayLayoutTransitionReason:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *preferredDisplayLayoutTransitionReason;
  void *v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *displayLayoutTransitionAssertion;
  NSString *v11;

  v4 = (NSString *)a3;
  v11 = v4;
  if (!v4)
  {
    -[SBSceneLayoutWorkspaceTransaction _defaultDisplayLayoutTransitionReason](self, "_defaultDisplayLayoutTransitionReason");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  if (v4 != self->_preferredDisplayLayoutTransitionReason)
  {
    v5 = (NSString *)-[NSString copy](v4, "copy");
    preferredDisplayLayoutTransitionReason = self->_preferredDisplayLayoutTransitionReason;
    self->_preferredDisplayLayoutTransitionReason = v5;

    if (self->_displayLayoutTransitionAssertion)
    {
      -[SBWorkspaceTransaction windowScene](self, "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayLayoutPublisher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "transitionAssertionWithReason:", self->_preferredDisplayLayoutTransitionReason);
      v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      -[BSInvalidatable invalidate](self->_displayLayoutTransitionAssertion, "invalidate");
      displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
      self->_displayLayoutTransitionAssertion = v9;

    }
  }

}

- (void)transaction:(id)a3 willUpdateScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBSceneLayoutWorkspaceTransaction_transaction_willUpdateScene___block_invoke;
  v10[3] = &unk_1E8EB33E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneLayoutWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

void __65__SBSceneLayoutWorkspaceTransaction_transaction_willUpdateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:willUpdateScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)isReadyForSynchronizedCommit
{
  FBSynchronizedTransactionGroup *sceneUpdateTransactionGroup;

  sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
  return !sceneUpdateTransactionGroup
      || -[FBSynchronizedTransactionGroup isReadyForSynchronizedCommit](sceneUpdateTransactionGroup, "isReadyForSynchronizedCommit");
}

- (BOOL)synchronizedTransactionGroup:(id)a3 shouldFailForSynchronizedTransaction:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  self->_transitionFailed = 1;
  if (-[SBSceneLayoutWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Update transaction failed: %@"), v6);

  }
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

@end
