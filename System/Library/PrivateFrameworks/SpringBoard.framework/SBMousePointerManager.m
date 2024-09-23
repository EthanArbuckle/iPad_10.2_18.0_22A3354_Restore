@implementation SBMousePointerManager

- (BOOL)isHardwarePointingDeviceAttached
{
  return self->_connectedPointingDevicesCount
      && -[SBMousePointerManager shouldAllowHardwarePointingDevices](self, "shouldAllowHardwarePointingDevices");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (SBMousePointerManager)init
{
  SBMousePointerManager *v2;
  uint64_t v3;
  BKSMousePointerService *mousePointerService;
  uint64_t v5;
  BSInvalidatable *mousePointerDeviceObserverToken;
  PSPointerClientController *v7;
  PSPointerClientController *pointerClientController;
  __CFNotificationCenter *LocalCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMousePointerManager;
  v2 = -[SBMousePointerManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    mousePointerService = v2->_mousePointerService;
    v2->_mousePointerService = (BKSMousePointerService *)v3;

    -[BKSMousePointerService addPointerDeviceObserver:](v2->_mousePointerService, "addPointerDeviceObserver:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    mousePointerDeviceObserverToken = v2->_mousePointerDeviceObserverToken;
    v2->_mousePointerDeviceObserverToken = (BSInvalidatable *)v5;

    v7 = (PSPointerClientController *)objc_alloc_init(MEMORY[0x1E0D7F420]);
    pointerClientController = v2->_pointerClientController;
    v2->_pointerClientController = v7;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_SBMousePointerManagerAssistiveTouchEnabledDidChange, (CFStringRef)*MEMORY[0x1E0DDDFF8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  BSInvalidatable *mousePointerDeviceObserverToken;
  PSPointerClientController *pointerClientController;
  __CFNotificationCenter *LocalCenter;
  objc_super v6;

  -[BSInvalidatable invalidate](self->_mousePointerDeviceObserverToken, "invalidate");
  mousePointerDeviceObserverToken = self->_mousePointerDeviceObserverToken;
  self->_mousePointerDeviceObserverToken = 0;

  -[PSPointerClientController invalidate](self->_pointerClientController, "invalidate");
  pointerClientController = self->_pointerClientController;
  self->_pointerClientController = 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0DDDFF8], 0);
  v6.receiver = self;
  v6.super_class = (Class)SBMousePointerManager;
  -[SBMousePointerManager dealloc](&v6, sel_dealloc);
}

- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayWithHardwareIdentifier:(id)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogPointer();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = v4;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Setting system pointer interaction contextID: 0x%x for displayUUID %{public}@", buf, 0x12u);
  }

  -[PSPointerClientController setSystemPointerInteractionContextID:displayUUID:](self->_pointerClientController, "setSystemPointerInteractionContextID:displayUUID:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMousePointerManager.m"), 69, CFSTR("failed to set the system pointer interaction contextID on display: %@, did you already set it and forget to invalidate it?"), v7);

  }
  return v9;
}

- (BOOL)shouldAllowHardwarePointingDevices
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || _AXSAssistiveTouchEnabled() != 0;
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)requestPointerActivationForScene:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  PSPointerSystemClientController *v8;
  PSPointerSystemClientController *systemClientController;
  NSMapTable *springBoardScenesToPointerAssertions;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  SBMousePointerManager *v28;
  id v29[2];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogPointer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Requesting pointer for scene %{public}@", buf, 0xCu);
  }

  if (!self->_systemClientController)
  {
    v8 = (PSPointerSystemClientController *)objc_opt_new();
    systemClientController = self->_systemClientController;
    self->_systemClientController = v8;

    -[PSPointerSystemClientController setDelegate:](self->_systemClientController, "setDelegate:", self);
  }
  springBoardScenesToPointerAssertions = self->_springBoardScenesToPointerAssertions;
  if (!springBoardScenesToPointerAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_springBoardScenesToPointerAssertions;
    self->_springBoardScenesToPointerAssertions = v11;

    springBoardScenesToPointerAssertions = self->_springBoardScenesToPointerAssertions;
  }
  -[NSMapTable objectForKey:](springBoardScenesToPointerAssertions, "objectForKey:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMousePointerManager.m"), 106, CFSTR("attempting to take an assertion when we already have one: %@"), v13);

  }
  objc_msgSend(v5, "_sbDisplayConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v16 = objc_alloc(MEMORY[0x1E0D01868]);
  v17 = MEMORY[0x1E0C80D38];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__SBMousePointerManager_requestPointerActivationForScene___block_invoke;
  v24[3] = &unk_1E8EA8668;
  v18 = v6;
  v25 = v18;
  objc_copyWeak(v29, (id *)buf);
  v19 = v5;
  v26 = v19;
  v20 = v15;
  v29[1] = (id)a2;
  v27 = v20;
  v28 = self;
  v21 = (void *)objc_msgSend(v16, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("com.apple.springboard.SBMousePointerManager"), v18, MEMORY[0x1E0C80D38], v24);

  -[NSMapTable setObject:forKey:](self->_springBoardScenesToPointerAssertions, "setObject:forKey:", v21, v19);
  -[SBMousePointerManager _updatePointerAssertionsAndScenes](self, "_updatePointerAssertionsAndScenes");

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __58__SBMousePointerManager_requestPointerActivationForScene___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogPointer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating pointer for scene %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sbDisplayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), CFSTR("SBMousePointerManager.m"), 116, CFSTR("the display identity of our windowScene changed from %@ to %@; the world has changed around us and we've been forgotten."),
        *(_QWORD *)(a1 + 48),
        v6);

    }
    v7 = (void *)*((_QWORD *)WeakRetained + 4);
    objc_msgSend(*(id *)(a1 + 40), "_sbDisplayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateScenesForPointerForDisplayConfiguration:", v8);

    objc_msgSend(*((id *)WeakRetained + 9), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (void)mousePointerDevicesDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBMousePointerManager_mousePointerDevicesDidChange___block_invoke;
  block[3] = &unk_1E8E9F280;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__SBMousePointerManager_mousePointerDevicesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPointerUIDWithConnectedDeviceCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

}

- (void)pointerClientController:(id)a3 sceneDidActivate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_displayIdentityForSceneManagers");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneManagerForDisplayIdentity:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addPointerUISceneToPresentationBinder:", v4);
}

- (void)pointerClientController:(id)a3 sceneWillDeactivate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_displayIdentityForSceneManagers");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneManagerForDisplayIdentity:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removePointerUISceneFromPresentationBinder:", v4);
}

- (void)_notifyObserversPointingDeviceBecameAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
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

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mousePointerManager:hardwarePointingDeviceAttachedDidChange:", self, v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_handleAssistiveTouchEnabledDidChangeNotification
{
  BSDispatchMain();
}

uint64_t __74__SBMousePointerManager__handleAssistiveTouchEnabledDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePointerAssertionsAndScenes");
}

- (void)_setPointerUIDWithConnectedDeviceCount:(unint64_t)a3
{
  NSObject *v4;
  unint64_t connectedPointingDevicesCount;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_connectedPointingDevicesCount != a3)
  {
    self->_connectedPointingDevicesCount = a3;
    -[SBMousePointerManager _updatePointerAssertionsAndScenes](self, "_updatePointerAssertionsAndScenes");
    SBLogPointer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connectedPointingDevicesCount = self->_connectedPointingDevicesCount;
      v6 = 134217984;
      v7 = connectedPointingDevicesCount;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Updating to %lu pointing devices connected", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_updatePointerAssertionsAndScenes
{
  _BOOL4 v3;
  BSInvalidatable *suppressEventsAssertion;
  BSInvalidatable *v5;
  char v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  BSInvalidatable *serviceKeepAliveAssertion;
  _QWORD block[4];
  id v13;
  char v14;
  id location;

  v3 = -[SBMousePointerManager shouldAllowHardwarePointingDevices](self, "shouldAllowHardwarePointingDevices");
  suppressEventsAssertion = self->_suppressEventsAssertion;
  if (!v3)
  {
    if (!suppressEventsAssertion)
    {
      -[BKSMousePointerService suppressPointerEventsForReason:](self->_mousePointerService, "suppressPointerEventsForReason:", CFSTR("SpringBoard policy"));
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_suppressEventsAssertion;
      self->_suppressEventsAssertion = v7;

    }
    goto LABEL_10;
  }
  if (suppressEventsAssertion)
  {
    -[BSInvalidatable invalidate](suppressEventsAssertion, "invalidate");
    v5 = self->_suppressEventsAssertion;
    self->_suppressEventsAssertion = 0;

  }
  if (!self->_connectedPointingDevicesCount)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  if (-[NSMapTable count](self->_springBoardScenesToPointerAssertions, "count"))
  {
    if (self->_serviceKeepAliveAssertion)
    {
      v6 = 1;
    }
    else
    {
      -[PSPointerClientController acquireServiceKeepAliveAssertion](self->_pointerClientController, "acquireServiceKeepAliveAssertion");
      v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      serviceKeepAliveAssertion = self->_serviceKeepAliveAssertion;
      self->_serviceKeepAliveAssertion = v10;

      v6 = 1;
      -[SBMousePointerManager _notifyObserversPointingDeviceBecameAvailable:](self, "_notifyObserversPointingDeviceBecameAvailable:", 1);
    }
    goto LABEL_13;
  }
  v6 = 1;
LABEL_11:
  if (self->_serviceKeepAliveAssertion)
  {
    -[SBMousePointerManager _notifyObserversPointingDeviceBecameAvailable:](self, "_notifyObserversPointingDeviceBecameAvailable:", 0);
    -[BSInvalidatable invalidate](self->_serviceKeepAliveAssertion, "invalidate");
    v9 = self->_serviceKeepAliveAssertion;
    self->_serviceKeepAliveAssertion = 0;

  }
LABEL_13:
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBMousePointerManager__updatePointerAssertionsAndScenes__block_invoke;
  block[3] = &unk_1E8EA8690;
  objc_copyWeak(&v13, &location);
  v14 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__SBMousePointerManager__updatePointerAssertionsAndScenes__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateScenesForPointerWithHardwareAttached:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_updateScenesForPointerWithHardwareAttached:(BOOL)a3
{
  _BOOL4 v3;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  PSPointerSystemClientController *systemClientController;
  void *v17;
  uint64_t v18;
  PSPointerSystemClientController *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  PSPointerSystemClientController *v35;
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_springBoardScenesToPointerAssertions;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "_sbDisplayConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMousePointerManager.m"), 225, CFSTR("window scene %@ doesn't have a displayConfiguration, why are we tracking disconnected scenes???"), v10);

        }
        SBLogPointer();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
        if (v3)
        {
          if (v13)
          {
            objc_msgSend(v10, "_sceneIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "hardwareIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            systemClientController = self->_systemClientController;
            *(_DWORD *)buf = 138543874;
            v29 = v14;
            v30 = 2114;
            v31 = v15;
            v32 = 2048;
            v33 = (uint64_t)systemClientController;
            _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "Activating pointer scenes for SB windowScene %{public}@ (%{public}@) - systemClientController: %p", buf, 0x20u);

          }
          -[PSPointerSystemClientController prepareScenesForPointerForDisplayConfiguration:](self->_systemClientController, "prepareScenesForPointerForDisplayConfiguration:", v11);
        }
        else
        {
          if (v13)
          {
            objc_msgSend(v10, "_sceneIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "hardwareIdentifier");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = self->_systemClientController;
            *(_DWORD *)buf = 138544130;
            v29 = v23;
            v30 = 2112;
            v31 = v17;
            v32 = 2114;
            v33 = v18;
            v20 = (void *)v18;
            v34 = 2048;
            v35 = v19;
            _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "Invalidating pointer scenes for SB windowScene %{public}@ displayIdentity: %@ (%{public}@) - systemClientController: %p", buf, 0x2Au);

          }
          -[PSPointerSystemClientController invalidateScenesForPointerForDisplayConfiguration:](self->_systemClientController, "invalidateScenesForPointerForDisplayConfiguration:", v11);
        }

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springBoardScenesToPointerAssertions, 0);
  objc_storeStrong((id *)&self->_suppressEventsAssertion, 0);
  objc_storeStrong((id *)&self->_serviceKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_mousePointerDeviceObserverToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemClientController, 0);
  objc_storeStrong((id *)&self->_mousePointerService, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
}

@end
