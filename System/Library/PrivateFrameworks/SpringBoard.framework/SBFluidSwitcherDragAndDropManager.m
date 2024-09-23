@implementation SBFluidSwitcherDragAndDropManager

- (SBFluidSwitcherDragAndDropManager)initWithSwitcherController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SBFluidSwitcherDragAndDropManager *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMapTable *activeDropSessions;
  uint64_t v18;
  UIDropInteraction *dropInteraction;
  void *v20;
  NSMutableSet *v21;
  NSMutableSet *requiredContextIdentifiersForMedusaDraggingDestination;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBFluidSwitcherDragAndDropManager;
  v8 = -[SBFluidSwitcherDragAndDropManager init](&v24, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_storeWeak((id *)&v8->_switcherController, v6);
    objc_storeWeak((id *)&v8->_switcherContentController, v13);
    objc_msgSend(v6, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_sceneManager, v15);

    objc_storeWeak((id *)&v8->_delegate, v7);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    activeDropSessions = v8->_activeDropSessions;
    v8->_activeDropSessions = (NSMapTable *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA588]), "initWithDelegate:", v8);
    dropInteraction = v8->_dropInteraction;
    v8->_dropInteraction = (UIDropInteraction *)v18;

    -[UIDropInteraction _setWantsDefaultVisualBehavior:](v8->_dropInteraction, "_setWantsDefaultVisualBehavior:", 0);
    objc_msgSend(v13, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addInteraction:", v8->_dropInteraction);
    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requiredContextIdentifiersForMedusaDraggingDestination = v8->_requiredContextIdentifiersForMedusaDraggingDestination;
    v8->_requiredContextIdentifiersForMedusaDraggingDestination = v21;

  }
  return v8;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeInteraction:", self->_dropInteraction);
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherDragAndDropManager _removeMedusaDraggingDestinationWindow:](self, "_removeMedusaDraggingDestinationWindow:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherDragAndDropManager;
  -[SBFluidSwitcherDragAndDropManager dealloc](&v6, sel_dealloc);
}

- (BOOL)shouldBeginWindowDragGesture
{
  void *v2;
  char v3;

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDragging") ^ 1;

  return v3;
}

- (void)handleWindowDragGestureRecognizer:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SBWindowDragInteraction *v13;
  SBWindowDragInteraction *v14;
  void *v15;
  void *v16;
  void *v17;
  SBWindowDragInteraction *windowDragInteraction;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *windowDragSceneIdentifier;
  SBWindowDragInteraction *v30;
  void *v31;
  SBWindowDragInteraction *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_hasAddedSwitcherWindowAsDragTarget)
  {
    self->_hasAddedSwitcherWindowAsDragTarget = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherDragAndDropManager _addMedusaDraggingDestinationWindow:](self, "_addMedusaDraggingDestinationWindow:", v8);

  }
  v9 = objc_msgSend(v5, "state");
  if ((unint64_t)(v9 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if ((v9 != 4 || !-[UIDragInteraction _isActive](self->_windowDragInteraction, "_isActive"))
      && !self->_windowDragHandledByDruid)
    {
      -[SBFluidSwitcherDragAndDropManager _windowDragSessionDidEnd](self, "_windowDragSessionDidEnd");
    }
    -[UIDragInteraction view](self->_windowDragInteraction, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeInteraction:", self->_windowDragInteraction);

    windowDragInteraction = self->_windowDragInteraction;
    self->_windowDragInteraction = 0;

  }
  else
  {
    -[SBFluidSwitcherDragAndDropManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!self->_windowDragInteraction)
    {
      objc_msgSend(v10, "dragAndDropManager:sourceViewProviderForDraggingWindowWithGestureRecognizer:", self, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBWindowDragInteraction initWithDelegate:gestureRecognizer:]([SBWindowDragInteraction alloc], "initWithDelegate:gestureRecognizer:", self, v5);
      v14 = self->_windowDragInteraction;
      self->_windowDragInteraction = v13;

      -[UIDragInteraction setEnabled:](self->_windowDragInteraction, "setEnabled:", 0);
      -[SBWindowDragInteraction setSourceViewProvider:](self->_windowDragInteraction, "setSourceViewProvider:", v12);
      objc_msgSend(v12, "sourceView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addInteraction:", self->_windowDragInteraction);

    }
    if (self->_windowDragSession)
    {
      -[NSMapTable objectForKey:](self->_activeDropSessions, "objectForKey:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherDragAndDropManager _beginTrackingDropSessionIfNeeded:](self, "_beginTrackingDropSessionIfNeeded:", v16);

    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v5, "_activeEvents", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
LABEL_15:
        v23 = 0;
        while (1)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
          if (!objc_msgSend(v24, "type"))
            break;
          if (v21 == ++v23)
          {
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            if (v21)
              goto LABEL_15;
            goto LABEL_21;
          }
        }
        objc_msgSend(v5, "_activeTouchesForEvent:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "anyObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          goto LABEL_28;
        objc_msgSend(v11, "dragAndDropManager:displayItemForDraggingWindowWithGestureRecognizer:", self, v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(v11, "dragAndDropManager:displayItemForDraggingWindowWithGestureRecognizer:", self, v5);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 149, CFSTR("We expect a display item for this window drag"));

            v27 = 0;
          }
        }
        objc_msgSend(v27, "uniqueIdentifier");
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        windowDragSceneIdentifier = self->_windowDragSceneIdentifier;
        self->_windowDragSceneIdentifier = v28;

        v30 = self->_windowDragInteraction;
        objc_msgSend(v27, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWindowDragInteraction setSceneIdentifier:](v30, "setSceneIdentifier:", v31);

        v32 = self->_windowDragInteraction;
        objc_msgSend(v27, "bundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWindowDragInteraction setBundleIdentifier:](v32, "setBundleIdentifier:", v33);

        -[UIDragInteraction _immediatelyBeginDragWithTouch:completion:](self->_windowDragInteraction, "_immediatelyBeginDragWithTouch:completion:", v25, 0);
      }
      else
      {
LABEL_21:
        v25 = v19;
      }

    }
LABEL_28:

  }
}

- (BOOL)isDragAndDropTransactionRunning
{
  SBDragAndDropWorkspaceTransaction *activeTransaction;

  activeTransaction = self->_activeTransaction;
  if (activeTransaction)
    LOBYTE(activeTransaction) = -[SBDragAndDropWorkspaceTransaction isComplete](activeTransaction, "isComplete") ^ 1;
  return (char)activeTransaction;
}

- (void)dragAndDropTransaction:(id)a3 didBeginGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherDragAndDropManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragAndDropManager:didBeginGesture:", self, v5);

}

- (void)dragAndDropTransaction:(id)a3 didUpdateGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherDragAndDropManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragAndDropManager:didUpdateGesture:", self, v5);

}

- (void)dragAndDropTransaction:(id)a3 didEndGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherDragAndDropManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragAndDropManager:didEndGesture:", self, v5);

}

- (void)dragAndDropTransaction:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherDragAndDropManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragAndDropManager:didPlatterizeWindowDragWithSceneIdentifier:", self, v5);

}

- (BOOL)isApplicationActiveAndVisible:(id)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBFluidSwitcherDragAndDropManager_isApplicationActiveAndVisible___block_invoke;
  v7[3] = &unk_1E8E9F410;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[SBFluidSwitcherDragAndDropManager _anyActiveAndVisibleSceneEntityMatches:](self, "_anyActiveAndVisibleSceneEntityMatches:", v7);

  return (char)self;
}

uint64_t __67__SBFluidSwitcherDragAndDropManager_isApplicationActiveAndVisible___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  SBSceneManager **p_sceneManager;
  id v4;
  id WeakRetained;
  void *v6;

  p_sceneManager = &self->_sceneManager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  v6 = (void *)objc_msgSend(WeakRetained, "newSceneIdentityForApplication:", v4);

  return v6;
}

- (id)mostRecentSceneIdentityExcludingLiveScenesForApplication:(id)a3
{
  SBSceneManager **p_sceneManager;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;

  p_sceneManager = &self->_sceneManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  v7 = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v7, "activeAndVisibleSceneIdentifiersForApplication:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sceneIdentityForApplication:excludingIdentifiers:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)preferredSceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 preferNewScene:(BOOL)a5
{
  _BOOL8 v5;
  SBSceneManager **p_sceneManager;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;

  v5 = a5;
  p_sceneManager = &self->_sceneManager;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  v12 = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v12, "activeAndVisibleSceneIdentifiersForApplication:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:visibleIdentifiers:", v10, v9, 0, v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_dragInteraction:(id)a3 prepareForSession:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  UIDragSession *windowDragSession;
  id v21;
  void *v22;
  id windowDragSessionPrepareCompletionBlock;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  SBLogMedusaDropDestination();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop prepareForSession: %{public}@", buf, 0xCu);
  }

  if (self->_windowDragSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 231, CFSTR("We already have a _windowDragSession."));

  }
  if (self->_windowDragSessionPrepareCompletionBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 232, CFSTR("We already have a _windowDragSessionPrepareCompletionBlock."));

  }
  v13 = objc_opt_class();
  SBSafeCast(v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("switcherDragInteraction != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBFluidSwitcherDragAndDropManager _dragInteraction:prepareForSession:completion:].cold.1(a2, (uint64_t)self, (uint64_t)v27);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D06D9480);
  }
  v15 = v14;
  objc_msgSend(v14, "sceneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0DAAD68]);
  objc_msgSend(v15, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithUniqueIdentifier:withLaunchActions:startLocation:", v18, 0, 8);

  objc_msgSend(v19, "setDraggedSceneIdentifier:", v16);
  objc_msgSend(v10, "setLocalContext:", v19);
  windowDragSession = self->_windowDragSession;
  self->_windowDragSession = (UIDragSession *)v10;
  v21 = v10;

  v22 = (void *)MEMORY[0x1D17E5550](v11);
  windowDragSessionPrepareCompletionBlock = self->_windowDragSessionPrepareCompletionBlock;
  self->_windowDragSessionPrepareCompletionBlock = v22;

  +[SBApplicationDropSession dropSessionWithWindowUIDragSession:](SBApplicationDropSession, "dropSessionWithWindowUIDragSession:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_activeDropSessions, "setObject:forKey:", v24, v21);

  -[SBFluidSwitcherDragAndDropManager _beginTrackingDropSessionIfNeeded:](self, "_beginTrackingDropSessionIfNeeded:", v24);
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogMedusaDropDestination();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBAppDrop _dragInteractionDidCancelLiftWithoutDragging: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_windowDragHandledByDruid)
    -[SBFluidSwitcherDragAndDropManager _windowDragSessionDidEnd](self, "_windowDragSessionDidEnd");
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragInteractionDidCancelLiftWithoutDragging:", v4);

}

- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SBLogMedusaDropDestination();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop customSpringAnimationBehaviorForCancellingItem: for activeDropSessions:%{public}@", (uint8_t *)&v13, 0xCu);

  }
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dragInteraction:customSpringAnimationBehaviorForCancellingItem:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogMedusaDropDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBAppDrop itemsForBeginningSession: %{public}@", buf, 0xCu);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "matchesUIDragDropSession:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 287, CFSTR("%s called without an active transaction to handle the drag."), "-[SBFluidSwitcherDragAndDropManager dragInteraction:itemsForBeginningSession:]");

  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v9, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.springboard.private.windowdrag"), 3, &__block_literal_global_22);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v9);
  objc_msgSend(v6, "localContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalObject:", v11);

  v15 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __78__SBFluidSwitcherDragAndDropManager_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  v3 = a2;
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  SBLogMedusaDropDestination();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForLiftingItem: %{public}@", buf, 0xCu);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "matchesUIDragDropSession:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 306, CFSTR("%s called without an active transaction to handle the drag."), "-[SBFluidSwitcherDragAndDropManager dragInteraction:previewForLiftingItem:session:]");

  }
  objc_msgSend(v13, "dragInteraction:previewForLiftingItem:session:", v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  SBLogMedusaDropDestination();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateLiftWithAnimator: %{public}@", buf, 0xCu);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "matchesUIDragDropSession:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 314, CFSTR("%s called without an active transaction to handle the drag."), "-[SBFluidSwitcherDragAndDropManager dragInteraction:willAnimateLiftWithAnimator:session:]");

  }
  objc_msgSend(v13, "dragInteraction:willAnimateLiftWithAnimator:session:", v9, v10, v11);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  SBLogMedusaDropDestination();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionWillBegin: %{public}@", buf, 0xCu);
  }

  self->_windowDragHandledByDruid = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dragAndDropManager:didBeginDraggingWindowWithSceneIdentifier:", self, self->_windowDragSceneIdentifier);

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "matchesUIDragDropSession:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherDragAndDropManager.m"), 325, CFSTR("%s called without an active transaction to handle the drag."), "-[SBFluidSwitcherDragAndDropManager dragInteraction:sessionWillBegin:]");

  }
  objc_msgSend(v11, "dragInteraction:sessionWillBegin:", v7, v8);

}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "matchesUIDragDropSession:", v6))
    objc_msgSend(v7, "dragInteraction:sessionDidMove:", v8, v6);

}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SBLogMedusaDropDestination();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v9;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBAppDrop session: %{public}@ willEndWithOperation: %ld", (uint8_t *)&v13, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dragAndDropManager:willEndDraggingWindowWithSceneIdentifier:", self, self->_windowDragSceneIdentifier);

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "matchesUIDragDropSession:", v9))
    objc_msgSend(v12, "dragInteraction:session:willEndWithOperation:", v8, v9, a5);
  -[SBFluidSwitcherDragAndDropManager _windowDragSessionDidEnd](self, "_windowDragSessionDidEnd");

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SBLogMedusaDropDestination();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = a5;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBAppDrop session: %{public}@ didEndWithOperation: %ld", (uint8_t *)&v12, 0x16u);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "matchesUIDragDropSession:", v9))
    objc_msgSend(v11, "dragInteraction:session:didEndWithOperation:", v8, v9, a5);

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  SBLogMedusaDropDestination();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForCancellingItem: for activeDropSessions:%{public}@", (uint8_t *)&v16, 0xCu);

  }
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dragInteraction:previewForCancellingItem:withDefault:", v10, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  SBLogMedusaDropDestination();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateCancelWithAnimator: for activeDropSessions:%{public}@", (uint8_t *)&v14, 0xCu);

  }
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dragInteraction:item:willAnimateCancelWithAnimator:", v10, v9, v8);

}

- (void)_windowDragSessionDidEnd
{
  UIDragSession *windowDragSession;
  id windowDragSessionPrepareCompletionBlock;
  NSString *windowDragSceneIdentifier;

  -[NSMapTable removeObjectForKey:](self->_activeDropSessions, "removeObjectForKey:", self->_windowDragSession);
  windowDragSession = self->_windowDragSession;
  self->_windowDragSession = 0;

  windowDragSessionPrepareCompletionBlock = self->_windowDragSessionPrepareCompletionBlock;
  self->_windowDragSessionPrepareCompletionBlock = 0;

  windowDragSceneIdentifier = self->_windowDragSceneIdentifier;
  self->_windowDragSceneIdentifier = 0;

  self->_windowDragHandledByDruid = 0;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = +[SBApplicationDropSession canHandleUIDragDropSession:](SBApplicationDropSession, "canHandleUIDragDropSession:", v5)|| -[SBFluidSwitcherDragAndDropManager _continuousExposeStripsOccluded](self, "_continuousExposeStripsOccluded");
  SBLogMedusaDropDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBAppDrop canHandleSession: %{public}@ -> %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMapTable *activeDropSessions;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSMapTable *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSMapTable *v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  SBFluidSwitcherDragAndDropManager *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_activeDropSessions, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    SBLogMedusaDropDestination();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBFluidSwitcherDragAndDropManager dropInteraction:sessionDidEnter:].cold.1((uint64_t)v7, v16, v17);
  }
  else
  {
    if (!v8)
    {
      activeDropSessions = self->_activeDropSessions;
      objc_msgSend(v7, "localDragSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](activeDropSessions, "objectForKey:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogMedusaDropDestination();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138543362;
          v28 = v7;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [local drag session]", buf, 0xCu);
        }

        v14 = self->_activeDropSessions;
        objc_msgSend(v7, "localDragSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable removeObjectForKey:](v14, "removeObjectForKey:", v15);

        -[NSMapTable setObject:forKey:](self->_activeDropSessions, "setObject:forKey:", v8, v7);
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 138543362;
          v28 = v7;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [loading drop session]", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = self->_activeDropSessions;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v19, "setObject:forKey:", v20, v7);

        v21 = -[SBFluidSwitcherDragAndDropManager _continuousExposeStripsOccluded](self, "_continuousExposeStripsOccluded");
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke;
        v23[3] = &unk_1E8EA19D0;
        v24 = v7;
        v25 = v18;
        v26 = self;
        v22 = v18;
        +[SBApplicationDropSession getDropSessionWithUIDropSession:sceneProvider:defaultToSourceApplication:completion:](SBApplicationDropSession, "getDropSessionWithUIDropSession:sceneProvider:defaultToSourceApplication:completion:", v24, self, v21, v23);

        v8 = 0;
      }
    }
    -[SBFluidSwitcherDragAndDropManager _beginTrackingDropSessionIfNeeded:](self, "_beginTrackingDropSessionIfNeeded:", v8);
    -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
    v16 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject matchesUIDragDropSession:](v16, "matchesUIDragDropSession:", v7))
      -[NSObject dropInteraction:sessionDidEnter:](v16, "dropInteraction:sessionDidEnter:", v6, v7);
  }

}

void __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  SBLogMedusaDropDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke_cold_1(a1, (uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = -v10;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [loaded drop session] %.2fs", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
  }

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_activeDropSessions, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v8 == v9;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA590]), "initWithDropOperation:", 0);
  }
  else
  {
    -[SBFluidSwitcherDragAndDropManager _beginTrackingDropSessionIfNeeded:](self, "_beginTrackingDropSessionIfNeeded:", v8);
    -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "matchesUIDragDropSession:", v7))
    {
      objc_msgSend(v12, "dropInteraction:sessionDidUpdate:", v6, v7);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA590]), "initWithDropOperation:", 0);
    }
    v11 = (void *)v13;

  }
  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogMedusaDropDestination();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidExit: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "matchesUIDragDropSession:", v7))
    objc_msgSend(v9, "dropInteraction:sessionDidExit:", v6, v7);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogMedusaDropDestination();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = v6;
    v12 = 1024;
    v13 = objc_msgSend(v8, "matchesUIDragDropSession:", v6);
    v14 = 1024;
    v15 = v8 != 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop performDrop: %{public}@, transaction exists for session: %{BOOL}u, transaction exists: %{BOOL}u", (uint8_t *)&v10, 0x18u);
  }

  objc_msgSend(v8, "dropInteraction:performDrop:", v7, v6);
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogMedusaDropDestination();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop concludeDrop: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "matchesUIDragDropSession:", v7))
    objc_msgSend(v9, "dropInteraction:concludeDrop:", v6, v7);

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogMedusaDropDestination();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_activeTransaction != 0;
    v11 = 138543618;
    v12 = v7;
    v13 = 1024;
    v14 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnd: %{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_activeDropSessions, "removeObjectForKey:", v7);
  if (objc_msgSend(v10, "matchesUIDragDropSession:", v7))
    objc_msgSend(v10, "dropInteraction:sessionDidEnd:", v6, v7);

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogMedusaDropDestination();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v13;
    v18 = 1024;
    v19 = v11 != 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForDroppingItem: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v16, 0x12u);

  }
  objc_msgSend(v11, "dropInteraction:previewForDroppingItem:withDefault:", v10, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogMedusaDropDestination();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 1024;
    v17 = v11 != 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateDropWithAnimator: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v14, 0x12u);

  }
  objc_msgSend(v11, "dropInteraction:item:willAnimateDropWithAnimator:", v10, v9, v8);

}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogMedusaDropDestination();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeDropSessions](self, "activeDropSessions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 1024;
    v16 = v8 != 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop customSpringAnimationBehaviorForDroppingItem: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v13, 0x12u);

  }
  objc_msgSend(v8, "_dropInteraction:customSpringAnimationBehaviorForDroppingItem:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_anyActiveAndVisibleSceneEntityMatches:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  objc_msgSend(WeakRetained, "currentLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__SBFluidSwitcherDragAndDropManager__anyActiveAndVisibleSceneEntityMatches___block_invoke;
  v12[3] = &unk_1E8EA19F8;
  v15 = &v16;
  v9 = v8;
  v13 = v9;
  v10 = v4;
  v14 = v10;
  SBLayoutRoleEnumerateValidRoles(v12);
  LOBYTE(v8) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v8;
}

void __76__SBFluidSwitcherDragAndDropManager__anyActiveAndVisibleSceneEntityMatches___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workspaceEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationSceneEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_beginTrackingDropSessionIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (-[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "matchesApplicationDropSession:", v4),
          v6,
          (v7 & 1) == 0))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
      if (+[SBDragAndDropWorkspaceTransaction shouldTrackLocationOfDropSession:forSwitcherController:](SBDragAndDropWorkspaceTransaction, "shouldTrackLocationOfDropSession:forSwitcherController:", v4, WeakRetained))
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transientOverlayPresentationManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancelEventsWithName:", CFSTR("SBDragAndDrop"));

        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "windowScene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_fbsDisplayConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2;
        v16[3] = &unk_1E8EA1A90;
        v16[4] = self;
        v17 = v4;
        v18 = v10;
        v19 = WeakRetained;
        v15 = v10;
        objc_msgSend(v12, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v14, &__block_literal_global_45, v16);

      }
      else
      {
        SBLogMedusaDropDestination();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v4;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "SBAppDrop _beginTrackingDropSessionIfNedeed: not starting tracking %{public}@ [not within drop boundary]", buf, 0xCu);
        }
      }

    }
  }

}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSource:", 27);
  objc_msgSend(v2, "setEventLabel:", CFSTR("SBDragAndDrop"));

}

uint64_t __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v3 = a2;
  NSAllMapTableValues(*((NSMapTable **)a1[4] + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", a1[5]);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 4);
    objc_msgSend(WeakRetained, "currentLayoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1[4], "_workspaceWouldAllowTransitionToApplication:", v8);
    v10 = objc_msgSend(v7, "unlockedEnvironmentMode");
    objc_msgSend(a1[5], "localContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "startLocation");

    objc_msgSend(a1[5], "localContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "startLocation");

    if (v8)
    {
      if (v10 == 2
        && (objc_msgSend(a1[5], "localContext"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "startLocation"),
            v15,
            v16 != 11))
      {
        SBLogMedusaDropDestination();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_8();
      }
      else
      {
        objc_msgSend(v7, "elements");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 || v10 == 2)
        {
          if ((unint64_t)(v10 - 4) > 0xFFFFFFFFFFFFFFFDLL)
          {
            if (SBPeekConfigurationIsValid(objc_msgSend(v7, "peekConfiguration")))
            {
              SBLogMedusaDropDestination();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_4();
            }
            else if (objc_msgSend(a1[6], "hasActivePresentation")
                   && objc_msgSend(a1[6], "activePresentationPreventsDragAndDrop"))
            {
              SBLogMedusaDropDestination();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_5();
            }
            else
            {
              if ((v9 & 1) != 0)
              {
                v21 = MEMORY[0x1E0C809B0];
                if (v12 != 8 && v14 != 11 && (objc_msgSend(a1[7], "isChamoisWindowingUIEnabled") & 1) == 0)
                {
                  v31[0] = v21;
                  v31[1] = 3221225472;
                  v31[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_46;
                  v31[3] = &unk_1E8EA1A40;
                  v22 = a1[5];
                  v32 = a1[4];
                  v33 = v22;
                  if (objc_msgSend(v32, "_anyActiveAndVisibleSceneEntityMatches:", v31))
                  {
                    SBLogMedusaDropDestination();
                    v23 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                      __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_6();

                    goto LABEL_35;
                  }

                }
                v27[0] = v21;
                v27[1] = 3221225472;
                v27[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_47;
                v27[3] = &unk_1E8EA1A68;
                v28 = a1[7];
                v25 = a1[5];
                v26 = a1[4];
                v29 = v25;
                v30 = v26;
                objc_msgSend(v3, "setTransactionProvider:", v27);

                v20 = 1;
                goto LABEL_36;
              }
              SBLogMedusaDropDestination();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_7();
            }
          }
          else
          {
            SBLogMedusaDropDestination();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_3(v7, v19);
          }
        }
        else
        {
          SBLogMedusaDropDestination();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_2();
        }
      }
    }
    else
    {
      SBLogMedusaDropDestination();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_1();
    }

LABEL_35:
    v20 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v20 = 0;
LABEL_37:

  return v20;
}

uint64_t __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "sceneIdentityForApplication:uniqueIdentifier:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "sceneIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  return v10;
}

SBDragAndDropWorkspaceTransaction *__71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  SBDragAndDropWorkspaceTransaction *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v4 = -[SBDragAndDropWorkspaceTransaction initWithTransitionRequest:switcherController:dropSession:delegate:]([SBDragAndDropWorkspaceTransaction alloc], "initWithTransitionRequest:switcherController:dropSession:delegate:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "uiDragDropSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeProtocolCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SBDragAndDropWorkspaceTransaction dropInteraction:sessionDidEnter:](v4, "dropInteraction:sessionDidEnter:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), v6);
  -[SBDragAndDropWorkspaceTransaction addObserver:](v4, "addObserver:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "setActiveTransaction:", v4);
  objc_msgSend(*(id *)(a1 + 40), "uiDragDropSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  if (v7 != *(void **)(v8 + 80))
    goto LABEL_6;
  v9 = *(_QWORD *)(v8 + 88);

  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 88) + 16))();
    v10 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = 0;
LABEL_6:

  }
  return v4;
}

- (BOOL)_workspaceWouldAllowTransitionToApplication:(id)a3
{
  id v3;
  SBWorkspaceApplicationSceneTransitionContext *v4;
  SBDeviceApplicationSceneEntity *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v3);

  -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v4, "setEntity:forLayoutRole:", v5, 1);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createRequestWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSource:", 27);
  objc_msgSend(v7, "setEventLabel:", CFSTR("DragAndDrop"));
  objc_msgSend(v7, "setApplicationContext:", v4);
  v8 = objc_msgSend(v6, "canExecuteTransitionRequest:", v7);

  return v8;
}

- (id)_requiredContextIdentifiersForMedusaDraggingDestination
{
  return (id)-[NSMutableSet allObjects](self->_requiredContextIdentifiersForMedusaDraggingDestination, "allObjects");
}

- (void)_addMedusaDraggingDestinationWindow:(id)a3
{
  uint64_t v4;
  NSMutableSet *requiredContextIdentifiersForMedusaDraggingDestination;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = objc_msgSend(v8, "_contextId");
    if ((_DWORD)v4)
    {
      requiredContextIdentifiersForMedusaDraggingDestination = self->_requiredContextIdentifiersForMedusaDraggingDestination;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](requiredContextIdentifiersForMedusaDraggingDestination, "addObject:", v6);

    }
  }
  -[SBFluidSwitcherDragAndDropManager _requiredContextIdentifiersForMedusaDraggingDestination](self, "_requiredContextIdentifiersForMedusaDraggingDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly();

}

- (void)_removeMedusaDraggingDestinationWindow:(id)a3
{
  uint64_t v4;
  NSMutableSet *requiredContextIdentifiersForMedusaDraggingDestination;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = objc_msgSend(v8, "_contextId");
    if ((_DWORD)v4)
    {
      requiredContextIdentifiersForMedusaDraggingDestination = self->_requiredContextIdentifiersForMedusaDraggingDestination;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](requiredContextIdentifiersForMedusaDraggingDestination, "removeObject:", v6);

    }
  }
  -[SBFluidSwitcherDragAndDropManager _requiredContextIdentifiersForMedusaDraggingDestination](self, "_requiredContextIdentifiersForMedusaDraggingDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly();

}

- (BOOL)_continuousExposeStripsOccluded
{
  id WeakRetained;
  id v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if (objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
  {
    v4 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    v5 = objc_msgSend(v4, "_areContinuousExposeStripsUnoccluded") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)transactionDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogMedusaDropDestination();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  SBLogMedusaDropDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBFluidSwitcherDragAndDropManager transactionDidComplete:].cold.1(v4, self, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109120;
    v11[1] = v9 == v4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop transactionDidComplete: Matches active transaction: %{BOOL}u", (uint8_t *)v11, 8u);

  }
  -[SBFluidSwitcherDragAndDropManager activeTransaction](self, "activeTransaction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
    -[SBFluidSwitcherDragAndDropManager setActiveTransaction:](self, "setActiveTransaction:", 0);

}

- (SBSwitcherController)switcherController
{
  return (SBSwitcherController *)objc_loadWeakRetained((id *)&self->_switcherController);
}

- (SBFluidSwitcherViewController)switcherContentController
{
  return (SBFluidSwitcherViewController *)objc_loadWeakRetained((id *)&self->_switcherContentController);
}

- (SBSceneManager)sceneManager
{
  return (SBSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (SBFluidSwitcherDragAndDropManagerDelegate)delegate
{
  return (SBFluidSwitcherDragAndDropManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (SBDragAndDropWorkspaceTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransaction, a3);
}

- (NSMapTable)activeDropSessions
{
  return self->_activeDropSessions;
}

- (void)setActiveDropSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeDropSessions, a3);
}

- (SBWindowDragInteraction)windowDragInteraction
{
  return self->_windowDragInteraction;
}

- (void)setWindowDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_windowDragInteraction, a3);
}

- (UIDragSession)windowDragSession
{
  return self->_windowDragSession;
}

- (void)setWindowDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_windowDragSession, a3);
}

- (id)windowDragSessionPrepareCompletionBlock
{
  return self->_windowDragSessionPrepareCompletionBlock;
}

- (void)setWindowDragSessionPrepareCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)windowDragSceneIdentifier
{
  return self->_windowDragSceneIdentifier;
}

- (void)setWindowDragSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_windowDragSceneIdentifier, a3);
}

- (BOOL)windowDragHandledByDruid
{
  return self->_windowDragHandledByDruid;
}

- (void)setWindowDragHandledByDruid:(BOOL)a3
{
  self->_windowDragHandledByDruid = a3;
}

- (BOOL)hasAddedSwitcherWindowAsDragTarget
{
  return self->_hasAddedSwitcherWindowAsDragTarget;
}

- (void)setHasAddedSwitcherWindowAsDragTarget:(BOOL)a3
{
  self->_hasAddedSwitcherWindowAsDragTarget = a3;
}

- (NSMutableSet)requiredContextIdentifiersForMedusaDraggingDestination
{
  return self->_requiredContextIdentifiersForMedusaDraggingDestination;
}

- (void)setRequiredContextIdentifiersForMedusaDraggingDestination:(id)a3
{
  objc_storeStrong((id *)&self->_requiredContextIdentifiersForMedusaDraggingDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredContextIdentifiersForMedusaDraggingDestination, 0);
  objc_storeStrong((id *)&self->_windowDragSceneIdentifier, 0);
  objc_storeStrong(&self->_windowDragSessionPrepareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_windowDragSession, 0);
  objc_storeStrong((id *)&self->_windowDragInteraction, 0);
  objc_storeStrong((id *)&self->_activeDropSessions, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_dragInteraction:(const char *)a1 prepareForSession:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBFluidSwitcherDragAndDropManager.m");
  v16 = 1024;
  v17 = 235;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)dropInteraction:(uint64_t)a3 sessionDidEnter:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "SBAppDrop sessionDidEnter: %{public}@ ignoring already attempted session", (uint8_t *)&v3);
}

void __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBAppDrop getDropSessionWithUIDropSession: %{public}@ error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction [could not bind drop item to application]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction [layout state has 0 elements]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBStringForUnlockedEnvironmentMode(objc_msgSend(a1, "unlockedEnvironmentMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "SBAppDrop not creating transaction [unlocked environment is %{public}@]", (uint8_t *)&v5);

}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction because a peek state is active.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction [transient overlay presentation manager has active presentation that prevents Drag and Drop]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction [scene already visible]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction [workspace would not allow the child transaction to run]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "SBAppDrop not creating transaction because we're in the app switcher and the drag did not start from a switcher card.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)transactionDidComplete:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "activeTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 1024;
  v9 = v5 == a1;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "SBAppDrop transactionDidComplete: %{public}@ Matches active transaction: %{BOOL}u", (uint8_t *)&v6, 0x12u);

}

@end
