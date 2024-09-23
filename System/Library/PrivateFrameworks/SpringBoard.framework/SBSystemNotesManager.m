@implementation SBSystemNotesManager

- (SBSystemNotesManager)initWithControllerCoordinator:(id)a3 workspace:(id)a4 sceneManager:(id)a5 keyboardArbiterManager:(id)a6 fbSceneManager:(id)a7 sceneDeactivationManager:(id)a8 keyboardSuppressionManager:(id)a9 keyboardDismissalManager:(id)a10 applicationController:(id)a11 systemGestureManager:(id)a12 systemPointerInteractionManager:(id)a13 idleTimerCoordinator:(id)a14 managedProfileConnection:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SBSystemNotesManager *v26;
  SBSystemNotesPresentationRequestServer *v27;
  SBSystemNotesPresentationRequestServer *systemNotesRequestServer;
  uint64_t v29;
  SBSystemNotesSettings *pipSettings;
  uint64_t v31;
  FBSSceneSpecification *sceneSpecification;
  SBPIPSceneContentAdapter *v33;
  SBPIPSceneContentAdapter *sceneContentAdapter;
  id v35;
  SBPIPController *v36;
  double v37;
  id v38;
  void *v39;
  uint64_t v40;
  SBPIPController *pipController;
  void *v42;
  void *v43;
  SBSystemNotesInteractionManager *v44;
  SBSystemNotesInteractionManager *interactionManager;
  void *v46;
  uint64_t v47;
  SBSystemNotesManager *v48;
  uint64_t v49;
  PTTestRecipe *systemNotesTestRecipe;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  SBSystemNotesManager *v67;
  id v68;
  id location;
  objc_super v70;

  v61 = a3;
  v52 = a4;
  v20 = a4;
  v60 = a5;
  v53 = a6;
  v21 = a6;
  v22 = a7;
  v59 = v21;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v55 = a10;
  v54 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v62 = a15;
  v70.receiver = self;
  v70.super_class = (Class)SBSystemNotesManager;
  v26 = -[SBSystemNotesManager init](&v70, sel_init);
  if (v26)
  {
    v27 = objc_alloc_init(SBSystemNotesPresentationRequestServer);
    systemNotesRequestServer = v26->_systemNotesRequestServer;
    v26->_systemNotesRequestServer = v27;

    -[SBSystemNotesPresentationRequestServer setDelegate:](v26->_systemNotesRequestServer, "setDelegate:", v26);
    if (SBIsSystemNotesSupported())
    {
      +[SBSystemNotesSettingsDomain rootSettings](SBSystemNotesSettingsDomain, "rootSettings");
      v29 = objc_claimAutoreleasedReturnValue();
      pipSettings = v26->_pipSettings;
      v26->_pipSettings = (SBSystemNotesSettings *)v29;

      -[PTSettings addKeyPathObserver:](v26->_pipSettings, "addKeyPathObserver:", v26);
      -[SBSystemNotesManager _reloadLaunchBundleID](v26, "_reloadLaunchBundleID");
      objc_msgSend(MEMORY[0x1E0DAC558], "specification");
      v31 = objc_claimAutoreleasedReturnValue();
      sceneSpecification = v26->_sceneSpecification;
      v26->_sceneSpecification = (FBSSceneSpecification *)v31;

      objc_storeStrong((id *)&v26->_sceneManager, a5);
      objc_storeStrong((id *)&v26->_fbSceneManager, v22);
      objc_storeStrong((id *)&v26->_applicationController, a11);
      objc_storeStrong((id *)&v26->_managedProfileConnection, a15);
      -[MCProfileConnection registerObserver:](v26->_managedProfileConnection, "registerObserver:", v26);
      objc_storeStrong((id *)&v26->_workspace, v52);
      objc_storeStrong((id *)&v26->_keyboardArbiterManager, v53);
      objc_storeStrong((id *)&v26->_sceneDeactivationManager, a8);
      objc_storeStrong((id *)&v26->_keyboardSuppressionManager, a9);
      objc_storeStrong((id *)&v26->_keyboardDismissalManager, a10);
      v33 = -[SBPIPSceneContentAdapter initWithPIPContentType:sceneManager:]([SBPIPSceneContentAdapter alloc], "initWithPIPContentType:sceneManager:", 1, v26->_sceneManager);
      sceneContentAdapter = v26->_sceneContentAdapter;
      v26->_sceneContentAdapter = v33;

      v35 = v23;
      v36 = [SBPIPController alloc];
      v37 = *MEMORY[0x1E0CEBE28] + 5.0 + 10.0;
      -[SBSystemNotesSettings interactionSettings](v26->_pipSettings, "interactionSettings");
      v38 = v24;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[SBPIPController initWithIdleTimerCoordinator:windowLevel:interactionSettings:adapter:](v36, "initWithIdleTimerCoordinator:windowLevel:interactionSettings:adapter:", v25, v39, v26->_sceneContentAdapter, v37);
      pipController = v26->_pipController;
      v26->_pipController = (SBPIPController *)v40;

      objc_msgSend(v61, "registerController:forType:", v26->_pipController, 1);
      v42 = v35;
      v43 = v38;
      v44 = -[SBSystemNotesInteractionManager initWithWorkspace:systemGestureManager:systemPointerInteractionManager:dataSource:delegate:]([SBSystemNotesInteractionManager alloc], "initWithWorkspace:systemGestureManager:systemPointerInteractionManager:dataSource:delegate:", v20, v35, v38, v26, v26);
      interactionManager = v26->_interactionManager;
      v26->_interactionManager = v44;

      -[SBSystemNotesPresentationRequestServer activate](v26->_systemNotesRequestServer, "activate");
      objc_initWeak(&location, v26);
      v46 = (void *)MEMORY[0x1E0D83030];
      v47 = MEMORY[0x1E0C809B0];
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke;
      v66[3] = &unk_1E8E9F280;
      objc_copyWeak(&v68, &location);
      v48 = v26;
      v67 = v48;
      v64[0] = v47;
      v64[1] = 3221225472;
      v64[2] = __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke_2;
      v64[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v65, &location);
      objc_msgSend(v46, "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Trigger System Notes UI"), v66, v64);
      v49 = objc_claimAutoreleasedReturnValue();
      systemNotesTestRecipe = v48->_systemNotesTestRecipe;
      v48->_systemNotesTestRecipe = (PTTestRecipe *)v49;

      +[PTDomain registerTestRecipe:](SBSystemNotesSettingsDomain, "registerTestRecipe:", v48->_systemNotesTestRecipe);
      objc_destroyWeak(&v65);

      objc_destroyWeak(&v68);
      objc_destroyWeak(&location);
      v23 = v42;
      v24 = v43;
    }
    v26->_lock._os_unfair_lock_opaque = 0;
  }

  return v26;
}

void __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_handleCreateNoteRequestWithMode:presentationSource:", 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "_setPresentedConnection:", 0);

  }
}

void __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    if (objc_msgSend(v3, "_currentPresentationMode") == -1)
      objc_msgSend(v3, "_handleCreateNoteRequestWithMode:presentationSource:", 1, 0);
    else
      objc_msgSend(v3, "_dismissNotesWithReason:", 1);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[MCProfileConnection unregisterObserver:](self->_managedProfileConnection, "unregisterObserver:", self);
  -[BSAbsoluteMachTimer invalidate](self->_interactionLoggingTimer, "invalidate");
  -[SBSystemNotesManager _setPresentedConnection:](self, "_setPresentedConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesManager;
  -[SBSystemNotesManager dealloc](&v3, sel_dealloc);
}

- (void)_reloadLaunchBundleID
{
  NSString *v3;
  NSString *launchBundleID;
  id v5;

  -[SBSystemNotesSettings launchSettings](self->_pipSettings, "launchSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationBundleID");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  launchBundleID = self->_launchBundleID;
  self->_launchBundleID = v3;

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  char v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a3, "isQuickNoteAllowed");
  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (v5 & 1) == 0)
  {
    v7 = v6;
    -[SBSystemNotesManager _dismissNotesWithReason:](self, "_dismissNotesWithReason:", 9);
    v6 = v7;
  }

}

- (void)showOrHideForKeyCommand:(id)a3
{
  id v4;

  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SBSystemNotesManager _dismissNotesWithReason:](self, "_dismissNotesWithReason:", 4);
  else
    -[SBSystemNotesManager _handleCreateNoteRequestWithMode:presentationSource:](self, "_handleCreateNoteRequestWithMode:presentationSource:", 0, 6);

}

- (id)server:(id)a3 targetForNewClientConnection:(id)a4
{
  id v5;
  NSMutableSet *lock_connections;
  NSMutableSet *v7;
  NSMutableSet *v8;

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_connections = self->_lock_connections;
  if (!lock_connections)
  {
    v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v8 = self->_lock_connections;
    self->_lock_connections = v7;

    lock_connections = self->_lock_connections;
  }
  -[NSMutableSet addObject:](lock_connections, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);

  return self;
}

- (void)server:(id)a3 connectionDidInvalidate:(id)a4
{
  id v5;
  NSMutableSet *lock_connections;
  id v7;

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_lock_connections, "removeObject:", v5);
  if (!-[NSMutableSet count](self->_lock_connections, "count"))
  {
    lock_connections = self->_lock_connections;
    self->_lock_connections = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  v7 = v5;
  BSDispatchMain();

}

uint64_t __55__SBSystemNotesManager_server_connectionDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "_currentPresentationMode");
    if (result == 1)
      return objc_msgSend(*(id *)(a1 + 40), "_dismissNotesWithReason:", 5);
  }
  return result;
}

- (void)activateConfiguration:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v3;
  BSDispatchMain();

}

void __46__SBSystemNotesManager_activateConfiguration___block_invoke(id *a1)
{
  uint64_t v2;
  SBSystemNotesContentPresentationContext *v3;
  id v4;
  char v5;
  id v6;
  void *v7;
  id v8;

  if (objc_msgSend(a1[4], "preferredPresentationMode") == 1)
    v2 = 2;
  else
    v2 = 3;
  v3 = -[SBSystemNotesContentPresentationContext initWithRequestedConfiguration:source:positionConfiguration:]([SBSystemNotesContentPresentationContext alloc], "initWithRequestedConfiguration:source:positionConfiguration:", a1[4], v2, 0);
  v4 = a1[5];
  v8 = 0;
  v5 = objc_msgSend(v4, "_handleCreateNoteRequestWithPresentationContext:error:", v3, &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1[5], "_setPresentedConnection:", a1[6]);
  }
  else
  {
    objc_msgSend(a1[6], "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration:didInvalidateWithError:", a1[4], v6);

  }
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

void __60__SBSystemNotesManager_presentWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  SBSystemNotesContentPresentationContext *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "preferredPresentationMode") == 1)
    v2 = 2;
  else
    v2 = 3;
  v3 = -[SBSystemNotesContentPresentationContext initWithRequestedConfiguration:source:positionConfiguration:]([SBSystemNotesContentPresentationContext alloc], "initWithRequestedConfiguration:source:positionConfiguration:", *(_QWORD *)(a1 + 32), v2, 0);
  v4 = *(void **)(a1 + 40);
  v8 = 0;
  v5 = objc_msgSend(v4, "_handleCreateNoteRequestWithPresentationContext:error:", v3, &v8);
  v6 = v8;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "_setPresentedConnection:", 0);

}

- (void)_setPresentedConnection:(id)a3
{
  BSServiceConnection *v5;
  BSServiceConnection *presentedConnection;
  BSServiceConnection **p_presentedConnection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSServiceConnection *v12;

  v5 = (BSServiceConnection *)a3;
  p_presentedConnection = &self->_presentedConnection;
  presentedConnection = self->_presentedConnection;
  if (presentedConnection != v5)
  {
    v12 = v5;
    if (presentedConnection)
    {
      -[BSServiceConnection invalidate](presentedConnection, "invalidate");
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableSet removeObject:](self->_lock_connections, "removeObject:", self->_presentedConnection);
      os_unfair_lock_unlock(&self->_lock);
    }
    objc_storeStrong((id *)&self->_presentedConnection, a3);
    -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[BSServiceConnection remoteTarget](*p_presentedConnection, "remoteTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "presentationMode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configuration:didChangeToPresentationMode:", v10, v11);

    }
    v5 = v12;
  }

}

- (id)_sceneBundleIdentifierForNewConfiguration
{
  NSString *v3;
  void *v4;
  uint64_t v5;

  v3 = self->_launchBundleID;
  if (-[SBSystemNotesManager _currentPresentationMode](self, "_currentPresentationMode") != -1)
  {
    -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (BOOL)_handleCreateNoteRequestWithMode:(int64_t)a3 presentationSource:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  SBSystemNotesContentPresentationContext *v10;

  v7 = objc_alloc(MEMORY[0x1E0DAB028]);
  -[SBSystemNotesManager _sceneBundleIdentifierForNewConfiguration](self, "_sceneBundleIdentifierForNewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:", v8, 0, a3);

  v10 = -[SBSystemNotesContentPresentationContext initWithRequestedConfiguration:source:positionConfiguration:]([SBSystemNotesContentPresentationContext alloc], "initWithRequestedConfiguration:source:positionConfiguration:", v9, a4, 0);
  LOBYTE(self) = -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:](self, "_handleCreateNoteRequestWithPresentationContext:error:", v10, 0);

  return (char)self;
}

- (BOOL)_handleCreateNoteRequestWithPresentationContext:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  SBSystemNotesInteractionManager *interactionManager;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  SBPIPContentViewLayoutSettings *v23;
  void *v24;
  void *v25;
  SBPIPContentViewLayoutSettings *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  id *v39;
  int v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "requestedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "source");
  v10 = objc_msgSend(v8, "preferredPresentationMode");
  v11 = -[SBSystemNotesManager _currentPresentationMode](self, "_currentPresentationMode");
  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v12, "isStashed");

  v13 = v9 & 0xFFFFFFFFFFFFFFFELL;
  if (v10 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SBSSystemNotesPresentationModeDescription();
    v39 = a4;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesManager.m"), 433, CFSTR("asked to present in an invalid mode %@"), v36);

    a4 = v39;
  }
  if (v13 == 4)
  {
    objc_msgSend(v8, "userActivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesManager.m"), 436, CFSTR("unexpected NSUserActivity for a gesture-originated SBSSystemNotesPresentationConfiguration"));

    }
  }
  v43 = 0;
  LODWORD(v15) = SBIsSystemNotesEnabled(&v43);
  v16 = v43;
  if ((_DWORD)v15)
  {
    v38 = a4;
    interactionManager = self->_interactionManager;
    v42 = v16;
    LODWORD(v15) = -[SBSystemNotesInteractionManager canHandlePresentationRequests:](interactionManager, "canHandlePresentationRequests:", &v42);
    v18 = v42;

    if (!(_DWORD)v15)
    {
LABEL_41:
      v16 = v18;
      a4 = v38;
      goto LABEL_42;
    }
    LOBYTE(v15) = v11 == -1;
    if (v11 != -1)
    {
      if (!v11 && v10 == 1)
      {
        SBLogSystemNotes();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "ignoring SBSSystemNotesPresentationConfiguration for presenting a thumbnail, as we're already showing a full PIP window", buf, 2u);
        }
        goto LABEL_40;
      }
      -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "updateConfiguration:sendCreateActionIfNecessary:", v8, v40 ^ 1u);

      if (v30 == 1)
      {
        if (v9 == 5)
        {
          objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB07B8]);
          SBLogSystemNotes();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:].cold.3();
        }
        else
        {
          if (v9 != 4)
            goto LABEL_33;
          objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB07C0]);
          SBLogSystemNotes();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:].cold.2();
        }

      }
LABEL_33:
      if (v11 == 1 && !v10)
        -[SBSystemNotesInteractionManager expandAnimated:](self->_interactionManager, "expandAnimated:", 1);
      v32 = v40 ^ 1;
      if (v10)
        v32 = 1;
      if ((v32 & 1) != 0)
      {
        LOBYTE(v15) = 0;
        goto LABEL_41;
      }
      LOBYTE(v15) = v11 == -1;
      -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject setStashed:](v19, "setStashed:", 0);
      goto LABEL_40;
    }
    SBLogSystemNotes();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = "gesture-originated";
      if (v13 != 4)
        v21 = "non-gesture-originated";
      *(_DWORD *)buf = 136315138;
      v45 = v21;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "presenting new PIP thumbnail for %s SBSSystemNotesPresentationConfiguration", buf, 0xCu);
    }

    v41 = v18;
    -[SBSystemNotesManager _createContentViewControllerForPresentationContext:error:](self, "_createContentViewControllerForPresentationContext:error:", v7, &v41);
    v19 = objc_claimAutoreleasedReturnValue();
    v15 = v41;

    v22 = objc_alloc_init(MEMORY[0x1E0DA9FC0]);
    objc_msgSend(v22, "setLastKnownSize:contentType:", CFSTR("SystemNotes-Thumbnail"), 0.0);

    v23 = [SBPIPContentViewLayoutSettings alloc];
    objc_msgSend(v7, "requestedConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:](SBPIPContentViewLayoutMetrics, "systemNotesMetricsForPresentationMode:", objc_msgSend(v24, "preferredPresentationMode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v23, "initWithPlatformMetrics:contentSize:", v25, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    objc_msgSend(v7, "positionConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      -[SBPIPContentViewLayoutSettings setContentViewPosition:](v26, "setContentViewPosition:", objc_msgSend(v27, "position"));
      -[SBSystemNotesManager _addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:](self, "_addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:", v19, v26, v13 != 4);
      if (v13 == 4)
        goto LABEL_29;
    }
    else
    {
      if (v13 == 4)
      {
        -[SBSystemNotesManager _addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:](self, "_addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:", v19, v26, 0);
        goto LABEL_29;
      }
      -[SBPIPContentViewLayoutSettings setContentViewPosition:](v26, "setContentViewPosition:", -[SBSystemNotesInteractionManager startingPositionForExternalPresentationRequest](self->_interactionManager, "startingPositionForExternalPresentationRequest"));
      -[SBSystemNotesManager _addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:](self, "_addContentViewControllerToPIPHierarchy:contentViewLayoutSettings:animated:", v19, v26, 1);
    }
    -[SBSystemNotesInteractionManager peepAnimated:](self->_interactionManager, "peepAnimated:", 1);
LABEL_29:

    v18 = v15;
    LOBYTE(v15) = 1;
LABEL_40:

    goto LABEL_41;
  }
LABEL_42:
  if (v16)
  {
    SBLogSystemNotes();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:].cold.1((uint64_t)v16, v33);

    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return (char)v15;
}

- (void)contentViewControllerDidReceiveTapToExpand:(id)a3
{
  void *v4;
  id v5;

  -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBSystemNotesInteractionManager expandAnimated:](self->_interactionManager, "expandAnimated:", 1);
    v4 = v5;
  }

}

- (void)contentViewController:(id)a3 didChangeToPresentationMode:(int64_t)a4
{
  BSServiceConnection *presentedConnection;
  id v6;
  void *v7;
  void *v8;
  id v9;

  presentedConnection = self->_presentedConnection;
  v6 = a3;
  -[BSServiceConnection remoteTarget](presentedConnection, "remoteTarget");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration:didChangeToPresentationMode:", v7, v8);

}

- (void)contentViewControllerWantsDismissal:(id)a3 forReason:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v5;

  if (a4 == 1)
    v5 = 6;
  else
    v5 = 8 * (a4 == 2);
  -[SBSystemNotesManager _dismissNotesWithReason:animated:](self, "_dismissNotesWithReason:animated:", v5, a5);
}

- (void)contentViewController:(id)a3 didReceiveScreenshotRequestForDisplays:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  SBSystemNotesScreenshotter *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  SBSystemNotesScreenshotter *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  SBSystemNotesScreenshotter *v26;
  id v27;
  id v28;
  id v29;
  SEL v30;
  int v31;

  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = a3;
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(SBSystemNotesScreenshotter);
  objc_msgSend(v12, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = objc_msgSend(v17, "disableUpdateMask");
  objc_msgSend(v17, "setDisableUpdateMask:", v16 | 2);
  v18 = (void *)SBApp;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke;
  v24[3] = &unk_1E8EA87B0;
  v24[4] = self;
  v25 = v9;
  v29 = v10;
  v30 = a2;
  v26 = v14;
  v27 = v13;
  v31 = (int)v16;
  v28 = v17;
  v19 = v10;
  v20 = v17;
  v21 = v13;
  v22 = v14;
  v23 = v9;
  objc_msgSend(v18, "sb_performBlockAfterCATransactionSynchronizedCommit:", v24);

}

uint64_t __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SBSecureWindow *v13;
  void *v14;
  void *v15;
  SBSecureWindow *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SBSecureWindow *v21;
  __IOSurface *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[6];
  SBSecureWindow *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D8C0C8], "playScreenshotSound");
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 200))
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 200);
    *(_QWORD *)(v4 + 200) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 208))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 208);
    *(_QWORD *)(v7 + 208) = v6;

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 40);
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v36;
    v9 = *MEMORY[0x1E0CEB660];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17E5334]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "objectForKey:", v11);
        v13 = (SBSecureWindow *)objc_claimAutoreleasedReturnValue();
        -[SBSecureWindow rootViewController](v13, "rootViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "countForObject:", v11))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("SBSystemNotesManager.m"), 569, CFSTR("not tracking a window but apparently tracking work"));

          }
          v16 = [SBSecureWindow alloc];
          objc_msgSend((id)SBApp, "windowSceneManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "windowSceneForDisplayIdentity:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SBWindow initWithWindowScene:role:debugName:](v16, "initWithWindowScene:role:debugName:", v18, CFSTR("SBTraitsParticipantRoleScreenFlash"), CFSTR("NotesScreenshotFlash"));

          -[SBSecureWindow setWindowLevel:](v13, "setWindowLevel:", v9);
          -[SBSecureWindow setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);

          -[SBSecureWindow setRootViewController:](v13, "setRootViewController:", v19);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setObject:forKey:", v13, v11);
          objc_msgSend(MEMORY[0x1E0D8C0B8], "flashViewForStyle:", 2);
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setView:", v20);
          v15 = (void *)v20;
          v14 = v19;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addObject:", v11);
        -[SBWindow setHidden:](v13, "setHidden:", 0);
        objc_msgSend(v15, "setNeedsLayout");
        objc_msgSend(v15, "layoutIfNeeded");
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke_2;
        v33[3] = &unk_1E8E9E270;
        v33[4] = *(_QWORD *)(a1 + 32);
        v33[5] = v11;
        v34 = v13;
        v21 = v13;
        objc_msgSend(v15, "flashWithCompletion:", v33);
        objc_msgSend(*(id *)(a1 + 48), "takeScreenshotOfDisplay:", v11);
        v22 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", IOSurfaceCreateMachPort(v22));
        objc_msgSend(v11, "UIScreen");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "scale");
        v26 = v25;

        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAB040]), "initWithDisplay:sendRight:scale:", v11, v23, v26);
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v27);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v32 != v10);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v32);
  }

  objc_msgSend(*(id *)(a1 + 64), "setDisableUpdateMask:", *(unsigned int *)(a1 + 88));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "countForObject:", *(_QWORD *)(a1 + 40));
  if (!result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 48), "setHidden:", 1);
  }
  return result;
}

- (id)_sceneHandleForApplication:(id)a3 sceneSpecification:(id)a4
{
  SBMainDisplaySceneManager *sceneManager;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  sceneManager = self->_sceneManager;
  v7 = a4;
  v8 = a3;
  v9 = -[SBSceneManager newSceneIdentityForApplication:](sceneManager, "newSceneIdentityForApplication:", v8);
  -[SBSceneManager displayIdentity](self->_sceneManager, "displayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sceneDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setSpecification:", v7);
  objc_msgSend(v11, "setSceneDefinition:", v13);
  -[SBMainDisplaySceneManager fetchOrCreateApplicationSceneHandleForRequest:](self->_sceneManager, "fetchOrCreateApplicationSceneHandleForRequest:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultBackgroundStyle:", 3);
  objc_msgSend(v14, "setKeyboardContextMaskStyle:", 2);

  return v14;
}

- (id)_createContentViewControllerForPresentationContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SBSystemNotesContentViewController *v16;
  SBMainWorkspace *workspace;
  void *v18;
  void *v19;
  SBSystemNotesContentViewController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  SBSystemNotesContentViewController *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "requestedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SBSystemNotesManager _sceneHandleForApplication:sceneSpecification:](self, "_sceneHandleForApplication:sceneSpecification:", v9, self->_sceneSpecification);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v30 = a4;
      objc_msgSend((id)SBApp, "windowSceneManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneManager displayIdentity](self->_sceneManager, "displayIdentity");
      v12 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowSceneForDisplayIdentity:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "switcherController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWantsEnhancedWindowingEnabled:", objc_msgSend(v15, "isChamoisWindowingUIEnabled"));

      v16 = [SBSystemNotesContentViewController alloc];
      workspace = self->_workspace;
      objc_msgSend(v14, "transientUIInteractionManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemNotesSettings interactionSettings](self->_pipSettings, "interactionSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v12;
      v20 = -[SBSystemNotesContentViewController initWithSceneHandle:workspace:transientUIInteractionManager:notesInteractionSettings:presentationContext:](v16, "initWithSceneHandle:workspace:transientUIInteractionManager:notesInteractionSettings:presentationContext:", v10, workspace, v18, v19, v12);

      SBLogSystemNotes();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        v40 = 2114;
        v41 = v20;
        _os_log_debug_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] created contentVC: %{public}@", buf, 0x16u);

      }
      -[SBSystemNotesContentViewController setDelegate:](v20, "setDelegate:", self);
      a4 = v30;
      v6 = v31;
    }
    else
    {
      if (!a4)
      {
        v20 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create SBSystemNotesContentViewController; scene handle creation failed. bundleID: %@"),
        v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SBPIPSceneContentPresentationErrorDomain"), 2, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v20 = 0;
    }
  }
  else
  {
    if (!a4)
    {
LABEL_15:
      v20 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create SBSystemNotesContentViewController; couldn't find application bundleID: %@"),
      v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SBPIPSceneContentPresentationErrorDomain"), 1, v14);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (a4 && !v20)
  {
    if (!*a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create SBSystemNotesContentViewController; bundleID: %@"),
        v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("SBPIPSceneContentPresentationErrorDomain"), 0, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
LABEL_16:

  return v20;
}

- (void)_addContentViewControllerToPIPHierarchy:(id)a3 contentViewLayoutSettings:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SBPIPSceneContentContainerAdapter *v16;
  void *v17;
  void *v18;
  void *v19;
  __UIKeyboardArbiterManager *keyboardArbiterManager;
  void *v21;
  SBPIPSceneContentContainerAdapter *v22;
  SBPIPContainerViewController *v23;
  SBPIPController *pipController;
  void *v25;
  SBPIPContainerViewController *v26;
  BSInvalidatable *v27;
  BSInvalidatable *pegasusWindowLevelAssertion;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  id v43;

  v5 = a5;
  v9 = a4;
  if (a3)
  {
    v40 = v5;
    v43 = v9;
    objc_storeStrong((id *)&self->_contentViewLayoutSettings, a4);
    v10 = a3;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManager displayIdentity](self->_sceneManager, "displayIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowSceneForDisplayIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "layoutStateTransitionCoordinator");
    v14 = objc_claimAutoreleasedReturnValue();
    v41 = v13;
    objc_msgSend(v13, "pictureInPictureManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [SBPIPSceneContentContainerAdapter alloc];
    -[SBSystemNotesSettings stashVisualSettings](self->_pipSettings, "stashVisualSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemNotesSettings shadowSettings](self->_pipSettings, "shadowSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemNotesSettings interactionSettings](self->_pipSettings, "interactionSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    keyboardArbiterManager = self->_keyboardArbiterManager;
    -[SBMainWorkspace keyboardFocusController](self->_workspace, "keyboardFocusController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v14;
    v22 = -[SBPIPSceneContentContainerAdapter initWithSceneContentViewController:contentViewLayoutSettings:stashSettings:shadowSettings:interactionSettings:keyboardArbiterManager:keyboardFocusController:keyboardSuppressionManager:keyboardDismissalManager:deactivationManager:transitionCoordinator:delegate:](v16, "initWithSceneContentViewController:contentViewLayoutSettings:stashSettings:shadowSettings:interactionSettings:keyboardArbiterManager:keyboardFocusController:keyboardSuppressionManager:keyboardDismissalManager:deactivationManager:transitionCoordinator:delegate:", v10, v43, v17, v18, v19, keyboardArbiterManager, v21, self->_keyboardSuppressionManager, self->_keyboardDismissalManager, self->_sceneDeactivationManager, v14, self->_interactionManager);

    v23 = [SBPIPContainerViewController alloc];
    pipController = self->_pipController;
    -[SBSystemNotesSettings interactionSettings](self->_pipSettings, "interactionSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:](v23, "initWithPIPController:interactionSettings:adapter:", pipController, v25, v22);

    if (v26)
    {
      -[SBPIPController addContainerViewController:dataSource:](self->_pipController, "addContainerViewController:dataSource:", v26, self->_interactionManager);
      objc_msgSend(v15, "acquireWindowLevelOverrideAssertionForControllerWithContentType:toWindowLevel:withReason:identifier:", 0, (unint64_t)(*MEMORY[0x1E0CEBE28] + 5.0 + 10.0 + -1.0), 9, CFSTR("SBSystemNotesManager-ActivePresentation"));
      v27 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      pegasusWindowLevelAssertion = self->_pegasusWindowLevelAssertion;
      self->_pegasusWindowLevelAssertion = v27;

    }
    if (v40)
    {
      +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fadeInOutSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fadeInOutAnimationSettings");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "fadeInOutSettings");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fadeInInitialValues");
      v35 = v34;
      v37 = v36;
      v39 = v38;

    }
    else
    {
      v31 = 0;
      v35 = 0.0;
      v37 = 0.0;
      v39 = 0.0;
    }
    -[SBPIPContainerViewController startShowingContentWithAnimationSettings:parameters:completion:](v26, "startShowingContentWithAnimationSettings:parameters:completion:", v31, 0, v35, v37, v39);
    objc_storeWeak((id *)&self->_presentedContainerAdapter, v22);

    v9 = v43;
  }

}

- (id)_presentedNotesContentViewController
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_4;
  objc_msgSend(WeakRetained, "sceneContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesManager.m"), 723, CFSTR("we have a presentedContainerAdapter but the sceneContentVC is nil"));

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (void)_dismissNotesWithReason:(unint64_t)a3
{
  -[SBSystemNotesManager _dismissNotesWithReason:animated:](self, "_dismissNotesWithReason:animated:", a3, 1);
}

- (void)_dismissNotesWithReason:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  BSAbsoluteMachTimer *interactionLoggingTimer;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  unint64_t v28;
  BOOL v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD v32[5];
  id v33;
  BOOL v34;
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  SBLogSystemNotes();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBSystemNotesManager _dismissNotesWithReason:animated:].cold.1(a3, v7);

  self->_interactionRequests = 0;
  -[BSAbsoluteMachTimer invalidate](self->_interactionLoggingTimer, "invalidate");
  interactionLoggingTimer = self->_interactionLoggingTimer;
  self->_interactionLoggingTimer = 0;

  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostedAppSceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", 0);
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke;
  v32[3] = &unk_1E8E9EE00;
  v32[4] = self;
  v34 = v4;
  v15 = v10;
  v33 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v32);
  v17 = v16;
  if (a3 != 7 || !v4)
  {
    v16[2](v16);
    if (!v12)
      goto LABEL_9;
    goto LABEL_8;
  }
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_3;
  v30[3] = &unk_1E8E9E8D0;
  v31 = v16;
  objc_msgSend(v13, "animateOutLeftStashTabWithCompletion:", v30);

  if (v12)
  {
LABEL_8:
    -[BSServiceConnection remoteTarget](self->_presentedConnection, "remoteTarget");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configuration:didChangeToPresentationMode:", v12, &unk_1E91D0938);

  }
LABEL_9:
  -[SBSystemNotesManager _setPresentedConnection:](self, "_setPresentedConnection:", 0);
  switch(a3)
  {
    case 2uLL:
      v19 = (_QWORD *)MEMORY[0x1E0DB07D0];
      break;
    case 6uLL:
      v19 = (_QWORD *)MEMORY[0x1E0DB07D8];
      break;
    case 4uLL:
      v19 = (_QWORD *)MEMORY[0x1E0DB07C8];
      break;
    default:
      goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0DB0758], "logDismissEvent:", *v19);
LABEL_16:
  SBLogSystemNotes();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 8)
      v21 = CFSTR("undefined");
    else
      v21 = off_1E8EA87F8[a3 - 1];
    *(_DWORD *)buf = 138543362;
    v36 = v21;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Dismissed Notes PIP for reason: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v15, "sceneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEnabled");

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_74;
    v26[3] = &unk_1E8EA87D8;
    v27 = v22;
    v28 = a3;
    v29 = v4;
    objc_msgSend(v25, "logBlock:", v26);

  }
}

void __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 104);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v5[4] = v1;
  v6 = v2;
  objc_msgSend(v3, "dismissAnimated:completion:", v4, v5);

}

uint64_t __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownContainerViewControllerForSceneHandle:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_74(uint64_t a1)
{
  const __CFString *v1;
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("[SBSystemNotesManager _dismissNotesContentForReason:animated:]");
  v1 = CFSTR("Unknown");
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v1 = *(const __CFString **)(a1 + 32);
  v9[0] = v1;
  v8[0] = CFSTR("SceneID");
  v8[1] = CFSTR("Reason");
  if ((unint64_t)(v2 - 1) > 8)
    v3 = CFSTR("undefined");
  else
    v3 = off_1E8EA87F8[v2 - 1];
  v9[1] = v3;
  v8[2] = CFSTR("Animated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_tearDownContainerViewControllerForSceneHandle:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *pegasusWindowLevelAssertion;
  _BOOL4 v10;
  SBPIPController *pipController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostedAppSceneHandle");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = -[NSObject isEqual:](v7, "isEqual:", v5);
    SBLogSystemNotes();
    pegasusWindowLevelAssertion = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(pegasusWindowLevelAssertion, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        -[SBSystemNotesManager _tearDownContainerViewControllerForSceneHandle:].cold.2(self, (uint64_t)a2, pegasusWindowLevelAssertion);

      pipController = self->_pipController;
      -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPController removeContainerViewController:](pipController, "removeContainerViewController:", v12);

      objc_storeWeak((id *)&self->_presentedContainerAdapter, 0);
      -[BSInvalidatable invalidate](self->_pegasusWindowLevelAssertion, "invalidate");
      pegasusWindowLevelAssertion = self->_pegasusWindowLevelAssertion;
      self->_pegasusWindowLevelAssertion = 0;
    }
    else if (v10)
    {
      _SBFLoggingMethodProem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v7;
      _os_log_debug_impl(&dword_1D0540000, pegasusWindowLevelAssertion, OS_LOG_TYPE_DEBUG, "[%{public}@] not tearing down contentVC as it's not tracking sceneHandle: %{public}@; tracked handle: %{public}@",
        buf,
        0x20u);

    }
    objc_msgSend(v5, "sceneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSceneManager sceneWithIdentifier:](self->_fbSceneManager, "sceneWithIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[FBSceneManager destroyScene:withTransitionContext:](self->_fbSceneManager, "destroyScene:withTransitionContext:", v13, 0);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEnabled");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __71__SBSystemNotesManager__tearDownContainerViewControllerForSceneHandle___block_invoke;
      v19[3] = &unk_1E8E9E6B0;
      v20 = v13;
      objc_msgSend(v17, "logBlock:", v19);

    }
  }
  else
  {
    SBLogSystemNotes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesManager _tearDownContainerViewControllerForSceneHandle:].cold.1(self, (uint64_t)a2, v7);
  }

}

id __71__SBSystemNotesManager__tearDownContainerViewControllerForSceneHandle___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("SceneID");
  v1 = CFSTR("Unknown");
  if (*(_QWORD *)(a1 + 32))
    v1 = *(const __CFString **)(a1 + 32);
  v6 = v1;
  v7 = CFSTR("[SBSystemNotesManager _tearDownContainerViewControllerForSceneHandle:]");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_currentPresentationMode
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "presentationMode");
  if (v6 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesManager.m"), 847, CFSTR("we have a presented contentVC but our presentationMode is invalid"));

LABEL_4:
    v6 = -1;
  }

  return v6;
}

- (id)_presentedContainerViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  objc_msgSend(WeakRetained, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentedPIPContentViewControllerForInteractionManager:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  -[SBSystemNotesManager _presentedContainerViewController](self, "_presentedContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentViewControllerForContainerViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)launchBundleIDForInteractionManager:(id)a3
{
  return self->_launchBundleID;
}

- (id)launchApplicationIdentityForInteractionManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", self->_launchBundleID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentContentViewLayoutSettingsForInteractionManager:(id)a3
{
  return self->_contentViewLayoutSettings;
}

- (BOOL)interactionManager:(id)a3 requestsPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  unint64_t interactionRequests;
  NSObject *v9;
  NSObject *v10;
  BSAbsoluteMachTimer *v11;
  BSAbsoluteMachTimer *interactionLoggingTimer;
  BSAbsoluteMachTimer *v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  interactionRequests = self->_interactionRequests;
  self->_interactionRequests = interactionRequests + 1;
  if (interactionRequests == 2)
  {
    SBLogSystemNotes();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SBSystemNotesManager interactionManager:requestsPresentationWithContext:].cold.1((uint64_t *)&self->_interactionRequests, v9);

  }
  else if (!interactionRequests)
  {
    SBLogSystemNotes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesManager interactionManager:requestsPresentationWithContext:].cold.2();

    if (!self->_interactionLoggingTimer)
    {
      v11 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBSystemNotesManager.interactionLoggingTimer"));
      interactionLoggingTimer = self->_interactionLoggingTimer;
      self->_interactionLoggingTimer = v11;

    }
    objc_initWeak(&location, self);
    v13 = self->_interactionLoggingTimer;
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke;
    v21 = &unk_1E8E9EEC8;
    objc_copyWeak(&v22, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", v14, &v18, 3.0, 0.1);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  v16 = -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:](self, "_handleCreateNoteRequestWithPresentationContext:error:", v7, 0, v18, v19, v20, v21);

  return v16;
}

void __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogSystemNotes();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke_cold_1();

    WeakRetained[23] = 0;
  }

}

- (void)interactionManager:(id)a3 requestsNotesDismissalForSource:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  if (a4 - 1 > 3)
    v7 = 0;
  else
    v7 = qword_1D0E89220[a4 - 1];
  SBLogSystemNotes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if ((unint64_t)(v7 - 1) > 7)
      v11 = CFSTR("undefined");
    else
      v11 = off_1E8EA8840[v7 - 1];
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] reason: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[SBSystemNotesManager _dismissNotesWithReason:animated:](self, "_dismissNotesWithReason:animated:", v7, v5);
}

- (void)interactionManager:(id)a3 requestsUpdatePresentationMode:(int64_t)a4
{
  id v5;

  -[SBSystemNotesManager _presentedNotesContentViewController](self, "_presentedNotesContentViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationMode:", a4);

}

- (void)interactionManager:(id)a3 requestsStartSuppressingKeyboardForReason:(id)a4
{
  SBKeyboardSuppressionManager *keyboardSuppressionManager;
  SBMainDisplaySceneManager *sceneManager;
  id v6;
  id v7;

  keyboardSuppressionManager = self->_keyboardSuppressionManager;
  sceneManager = self->_sceneManager;
  v6 = a4;
  -[SBSceneManager displayIdentity](sceneManager, "displayIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardSuppressionManager startSuppressingKeyboardWithReason:predicate:displayIdentity:](keyboardSuppressionManager, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", v6, 0, v7);

}

- (void)interactionManager:(id)a3 requestsStopSuppressingKeyboardForReason:(id)a4
{
  -[SBKeyboardSuppressionManager stopSuppressingKeyboardWithReason:](self->_keyboardSuppressionManager, "stopSuppressingKeyboardWithReason:", a4);
}

- (id)interactionManager:(id)a3 requestsStashAssertionForReason:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)SBApp;
  v6 = a4;
  objc_msgSend(v5, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "embeddedDisplayWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPController acquireStashAssertionForWindowScene:withReason:identifier:](self->_pipController, "acquireStashAssertionForWindowScene:withReason:identifier:", v8, 9, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedContainerAdapter);
  objc_storeStrong((id *)&self->_displaysToScreenshotFlashWindows, 0);
  objc_storeStrong((id *)&self->_displaysWithPendingScreenshots, 0);
  objc_storeStrong((id *)&self->_managedProfileConnection, 0);
  objc_storeStrong((id *)&self->_interactionLoggingTimer, 0);
  objc_storeStrong((id *)&self->_pegasusWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_presentedConnection, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_contentViewLayoutSettings, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_pipSettings, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_systemNotesTestRecipe, 0);
  objc_storeStrong((id *)&self->_systemNotesRequestServer, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_sceneContentAdapter, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_sceneSpecification, 0);
}

- (void)_handleCreateNoteRequestWithPresentationContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to create note: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleCreateNoteRequestWithPresentationContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeWithPIPPencil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handleCreateNoteRequestWithPresentationContext:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeWithPIPFinger", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_dismissNotesWithReason:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 - 1) > 8)
    v2 = CFSTR("undefined");
  else
    v2 = off_1E8EA87F8[a1 - 1];
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Dismissing Notes PIP for reason: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_tearDownContainerViewControllerForSceneHandle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_presentedNotesContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] asked to tear down but no scene handle to tear: %{public}@", v7, 0x16u);

  OUTLINED_FUNCTION_20();
}

- (void)_tearDownContainerViewControllerForSceneHandle:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_presentedNotesContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] tearing down contentVC: %{public}@", v7, 0x16u);

  OUTLINED_FUNCTION_20();
}

- (void)interactionManager:(uint64_t *)a1 requestsPresentationWithContext:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134218240;
  v4 = v2;
  v5 = 2048;
  v6 = 0x4008000000000000;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "user swiped %lu times within %g seconds. is PIP not showing?", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)interactionManager:requestsPresentationWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "starting interactionLoggingTimer for new interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "interactionLoggingTimer expired -- resetting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
