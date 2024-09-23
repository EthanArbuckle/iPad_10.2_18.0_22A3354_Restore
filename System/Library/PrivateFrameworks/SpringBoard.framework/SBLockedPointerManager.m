@implementation SBLockedPointerManager

uint64_t __67__SBLockedPointerManager__notInvalidated_updateLockForLayoutState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockForLayoutState:", *(_QWORD *)(a1 + 40));
}

uint64_t __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

uint64_t __99__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

uint64_t __97__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  UIApplicationSceneSettingsDiffInspector *v12;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInspector;
  UIApplicationSceneSettingsDiffInspector *v14;
  UIApplicationSceneSettingsDiffInspector *v15;
  NSObject *stateSerialQueue;
  _QWORD block[6];
  id location;
  id *p_location;
  uint64_t v20;
  char v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  if (!self->_sceneSettingsInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    sceneSettingsInspector = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_sceneSettingsInspector;
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v24[3] = &unk_1E8EA2658;
    objc_copyWeak(v25, &location);
    -[UIApplicationSceneSettingsDiffInspector observeDeactivationReasonsWithBlock:](v14, "observeDeactivationReasonsWithBlock:", v24);
    v15 = self->_sceneSettingsInspector;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v22[3] = &unk_1E8EA2658;
    objc_copyWeak(&v23, &location);
    -[UIApplicationSceneSettingsDiffInspector observeIsForegroundWithBlock:](v15, "observeIsForegroundWithBlock:", v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  location = 0;
  p_location = &location;
  v20 = 0x2020000000;
  v21 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_3;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &location;
  dispatch_sync(stateSerialQueue, block);
  if (!*((_BYTE *)p_location + 24))
    -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](self->_sceneSettingsInspector, "inspectDiff:withContext:", v9, 0);
  _Block_object_dispose(&location, 8);

}

- (id)_possibleSceneHandleForLockingPointerFromLayoutState:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v3 = a3;
  objc_msgSend(v3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    SBLogPointer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:].cold.1();
    goto LABEL_16;
  }
  if (!v5)
  {
    SBLogPointer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:].cold.2();
    goto LABEL_16;
  }
  v7 = objc_opt_class();
  SBSafeCast(v7, v3);
  v8 = objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v8)
  {
    if (-[NSObject unlockedEnvironmentMode](v8, "unlockedEnvironmentMode") == 3)
    {
      if (-[NSObject spaceConfiguration](v6, "spaceConfiguration") == 1)
        goto LABEL_8;
      SBLogPointer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:].cold.3();
    }
    else
    {
      SBLogPointer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:].cold.4();
    }

LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
LABEL_8:
  objc_msgSend(v3, "elements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "workspaceEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationSceneEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sceneHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

- (void)_queue_updateLockForLayoutState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSString *queue_sceneIdentifierThatHasLockedPointer;
  _BOOL4 v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  char v14;
  int v15;
  _BYTE v16[10];
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  if (self->_queue_isInvalidated)
  {
    SBLogPointer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      *(_QWORD *)v16 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to update pointer lock state for layout state: %@ because I'm invalidated", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:](self, "_possibleSceneHandleForLockingPointerFromLayoutState:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject sceneIdentifier](v5, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogPointer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      *(_QWORD *)v16 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Re-evaluating pointer lock state for scene %@", (uint8_t *)&v15, 0xCu);
    }

    queue_sceneIdentifierThatHasLockedPointer = self->_queue_sceneIdentifierThatHasLockedPointer;
    v9 = -[SBLockedPointerManager _queue_prefersLockForSceneIdentifier:](self, "_queue_prefersLockForSceneIdentifier:", v6);
    v10 = -[NSMutableSet containsObject:](self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus, "containsObject:", v6);
    if (v9)
      v11 = -[SBLockedPointerManager _shouldAllowPointerLockedForScene:](self, "_shouldAllowPointerLockedForScene:", v5) & (v10 ^ 1);
    else
      v11 = 0;
    SBLogPointer();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 67109632;
      *(_DWORD *)v16 = v9;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v11;
      v17 = 1024;
      v18 = queue_sceneIdentifierThatHasLockedPointer != 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "currentScenePrefersLock:%d shouldBeLocked:%d isCurrentlyLocked:%d", (uint8_t *)&v15, 0x14u);
    }

    if (!v11 || queue_sceneIdentifierThatHasLockedPointer)
    {
      if (queue_sceneIdentifierThatHasLockedPointer)
        v14 = v11;
      else
        v14 = 1;
      if ((v14 & 1) == 0)
        -[SBLockedPointerManager _queue_unlockPointer](self, "_queue_unlockPointer");
    }
    else
    {
      -[NSObject sceneIdentifier](v5, "sceneIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockedPointerManager _queue_lockPointerForSceneIdentifier:](self, "_queue_lockPointerForSceneIdentifier:", v13);

    }
  }

}

- (BOOL)_queue_prefersLockForSceneIdentifier:(id)a3
{
  NSObject *stateSerialQueue;
  id v5;
  void *v6;
  BOOL v7;

  stateSerialQueue = self->_stateSerialQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateSerialQueue);
  -[NSMutableDictionary objectForKey:](self->_queue_preferredLockStatusBySceneIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue") == 1;
  else
    v7 = 0;

  return v7;
}

uint64_t __86__SBLockedPointerManager_sceneManager_didAddExternalForegroundApplicationSceneHandle___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBLockedPointerManager_sceneManager_didAddExternalForegroundApplicationSceneHandle___block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateSerialQueue, v9);
  if (!*((_BYTE *)v11 + 24))
    objc_msgSend(v7, "addObserver:", self);
  _Block_object_dispose(&v10, 8);

}

void __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notInvalidated_updateLockForLayoutState:", 0);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateSerialQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    SBLogPointer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring layout state transition didEnd because I'm invalidated", v10, 2u);
    }
  }
  else
  {
    objc_msgSend(v7, "toLayoutState");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", v9);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateSerialQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    SBLogPointer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring layout state transition didBegin because I'm invalidated", v10, 2u);
    }
  }
  else
  {
    objc_msgSend(v7, "toLayoutState");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", v9);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_notInvalidated_updateLockForLayoutState:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *stateSerialQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "layoutStateProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutState");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBLockedPointerManager__notInvalidated_updateLockForLayoutState___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(stateSerialQueue, v9);

}

- (SBLockedPointerManager)initWithWindowScene:(id)a3
{
  id v4;
  SBLockedPointerManager *v5;
  PSPointerClientController *v6;
  PSPointerClientController *pointerClientController;
  uint64_t Serial;
  OS_dispatch_queue *stateSerialQueue;
  uint64_t v10;
  NSMutableDictionary *queue_preferredLockStatusBySceneIdentifier;
  uint64_t v12;
  NSMutableSet *queue_sceneIdentifiersThatSuppressPreferredLockStatus;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBLockedPointerManager;
  v5 = -[SBLockedPointerManager init](&v17, sel_init);
  if (v5)
  {
    v6 = (PSPointerClientController *)objc_alloc_init(MEMORY[0x1E0D7F420]);
    pointerClientController = v5->_pointerClientController;
    v5->_pointerClientController = v6;

    Serial = BSDispatchQueueCreateSerial();
    stateSerialQueue = v5->_stateSerialQueue;
    v5->_stateSerialQueue = (OS_dispatch_queue *)Serial;

    v10 = objc_opt_new();
    queue_preferredLockStatusBySceneIdentifier = v5->_queue_preferredLockStatusBySceneIdentifier;
    v5->_queue_preferredLockStatusBySceneIdentifier = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    queue_sceneIdentifiersThatSuppressPreferredLockStatus = v5->_queue_sceneIdentifiersThatSuppressPreferredLockStatus;
    v5->_queue_sceneIdentifiersThatSuppressPreferredLockStatus = (NSMutableSet *)v12;

    objc_msgSend(v4, "sceneManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v5);

    objc_msgSend(v4, "layoutStateTransitionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v5);

    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v5;
}

- (void)clientWithSceneIdentifier:(id)a3 prefersPointerLockStatus:(int64_t)a4
{
  id v6;
  NSObject *stateSerialQueue;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *);
  void *v14;
  SBLockedPointerManager *v15;
  id v16;
  uint64_t *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __77__SBLockedPointerManager_clientWithSceneIdentifier_prefersPointerLockStatus___block_invoke;
  v14 = &unk_1E8E9FD80;
  v17 = &v19;
  v18 = a4;
  v15 = self;
  v8 = v6;
  v16 = v8;
  dispatch_sync(stateSerialQueue, &v11);
  if (*((_BYTE *)v20 + 24))
  {
    SBLogPointer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, v11, v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v8;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request from %{public}@ to set pointerLockStatus %{public}@ because I'm invalidated", buf, 0x16u);

    }
  }
  else
  {
    -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", 0, v11, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v19, 8);
}

void __77__SBLockedPointerManager_clientWithSceneIdentifier_prefersPointerLockStatus___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 80);
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = *(void **)(a1[4] + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);

  }
}

- (void)clientWithSceneIdentifier:(id)a3 suppressPreferredLockStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *stateSerialQueue;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *(*v17)(_QWORD *);
  void *v18;
  SBLockedPointerManager *v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __80__SBLockedPointerManager_clientWithSceneIdentifier_suppressPreferredLockStatus___block_invoke;
  v18 = &unk_1E8EB0E18;
  v21 = &v23;
  v19 = self;
  v8 = v6;
  v20 = v8;
  v22 = v4;
  dispatch_sync(stateSerialQueue, &v15);
  if (*((_BYTE *)v24 + 24))
  {
    SBLogPointer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4, v15, v16, v17, v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request from %{public}@ to set suppressPreferredLockStatus %{public}@ because I'm invalidated", buf, 0x16u);

    }
  }
  else
  {
    v11 = objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "switcherController", v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v11, v14);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      -[NSObject clientWithSceneIdentifier:suppressPreferredPointerLockStatusUpdated:](v9, "clientWithSceneIdentifier:suppressPreferredPointerLockStatusUpdated:", v8, v4);
    -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", 0);
  }

  _Block_object_dispose(&v23, 8);
}

_QWORD *__80__SBLockedPointerManager_clientWithSceneIdentifier_suppressPreferredLockStatus___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 80);
  if (!*(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24))
  {
    v1 = result;
    result = (_QWORD *)objc_msgSend(*(id *)(result[4] + 48), "containsObject:", result[5]);
    if ((_DWORD)result)
    {
      if (!*((_BYTE *)v1 + 56))
        return (_QWORD *)objc_msgSend(*(id *)(v1[4] + 48), "removeObject:", v1[5]);
    }
    else if (*((_BYTE *)v1 + 56))
    {
      return (_QWORD *)objc_msgSend(*(id *)(v1[4] + 48), "addObject:", v1[5]);
    }
  }
  return result;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  NSObject *stateSerialQueue;
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(WeakRetained, "layoutStateTransitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLockedPointerManager_invalidate__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(stateSerialQueue, block);

}

void __36__SBLockedPointerManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__SBLockedPointerManager_sceneManager_didRemoveExternalForegroundApplicationSceneHandle___block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateSerialQueue, v9);
  if (!*((_BYTE *)v11 + 24))
    objc_msgSend(v7, "removeObserver:", self);
  _Block_object_dispose(&v10, 8);

}

uint64_t __89__SBLockedPointerManager_sceneManager_didRemoveExternalForegroundApplicationSceneHandle___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

void __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notInvalidated_updateLockForLayoutState:", 0);

}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SBLockedPointerManager_sceneHandle_didDestroyScene___block_invoke;
  v10[3] = &unk_1E8E9DFA0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateSerialQueue, v10);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_queue_preferredLockStatusBySceneIdentifier, "removeObjectForKey:", v9);
      -[NSMutableSet removeObject:](self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus, "removeObject:", v9);
      -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", 0);
    }

  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __54__SBLockedPointerManager_sceneHandle_didDestroyScene___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (BOOL)_shouldAllowPointerLockedForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_controlCenterWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (objc_msgSend(v7, "isEqual:", WeakRetained))
    v9 = objc_msgSend(v5, "isPresented") ^ 1;
  else
    v9 = 1;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPresented") ^ 1;

  objc_msgSend(v4, "sceneIfExists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(v4, "isEffectivelyForeground");
    objc_msgSend(v12, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isUISubclass"))
      v15 = (objc_msgSend(v14, "deactivationReasons") & 0xFFFFFFFFFFFFFEFFLL) == 0;
    else
      v15 = 1;
    v16 = v13 & v15;

  }
  else
  {
    v16 = 0;
  }
  SBLogPointer();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109888;
    v19[1] = v9 & v11 & v16;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v11;
    v24 = 1024;
    v25 = v16;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "shouldAllow:%d isAllowedBasedOnControlCenterState:%d isAllowedBasedOnCoverSheetState:%d isAllowedFromActivationState:%d", (uint8_t *)v19, 0x1Au);
  }

  return v9 & v11 & v16;
}

- (void)_queue_lockPointerForSceneIdentifier:(id)a3
{
  NSString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *queue_backboardLockedPointerAssertion;
  BSInvalidatable *v13;
  BSInvalidatable *queue_pointerHiddenAssertion;
  NSString *queue_sceneIdentifierThatHasLockedPointer;
  NSString *v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  SBLogPointer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Locking pointer for scene %{public}@", buf, 0xCu);
  }

  if (self->_queue_sceneIdentifierThatHasLockedPointer)
    -[SBLockedPointerManager _setPointerLockStatus:forSceneWithIdentifier:](self, "_setPointerLockStatus:forSceneWithIdentifier:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scene %@ requested locked pointer"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hardwareIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerSuppressionAssertionOnDisplay:forReason:withOptionsMask:", v10, v6, 2);
  v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  queue_backboardLockedPointerAssertion = self->_queue_backboardLockedPointerAssertion;
  self->_queue_backboardLockedPointerAssertion = v11;

  -[PSPointerClientController persistentlyHidePointerAssertionForReason:](self->_pointerClientController, "persistentlyHidePointerAssertionForReason:", 4);
  v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  queue_pointerHiddenAssertion = self->_queue_pointerHiddenAssertion;
  self->_queue_pointerHiddenAssertion = v13;

  queue_sceneIdentifierThatHasLockedPointer = self->_queue_sceneIdentifierThatHasLockedPointer;
  self->_queue_sceneIdentifierThatHasLockedPointer = v4;
  v16 = v4;

  -[SBLockedPointerManager _setPointerLockStatus:forSceneWithIdentifier:](self, "_setPointerLockStatus:forSceneWithIdentifier:", 1, v16);
}

- (void)_queue_unlockPointer
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1D0540000, v0, OS_LOG_TYPE_ERROR, "Shouldn't be unlocking pointer because it's not locked", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_setPointerLockStatus:(int64_t)a3 forSceneWithIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke;
  v7[3] = &unk_1E8E9DE88;
  v8 = v5;
  v9 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneWithIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke_2;
  v4[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "updateSettingsWithBlock:", v4);

}

uint64_t __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPointerLockStatus:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_queue_pointerHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_queue_backboardLockedPointerAssertion, 0);
  objc_storeStrong((id *)&self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus, 0);
  objc_storeStrong((id *)&self->_queue_sceneIdentifierThatHasLockedPointer, 0);
  objc_storeStrong((id *)&self->_queue_preferredLockStatusBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Disallowing pointer lock because >1 elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Disallowing pointer lock because 0 elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Disallowing pointer lock because not fullscreen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Disallowing pointer lock because not application mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
