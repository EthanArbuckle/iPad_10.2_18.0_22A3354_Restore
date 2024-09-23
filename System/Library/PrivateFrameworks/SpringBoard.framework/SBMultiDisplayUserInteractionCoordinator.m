@implementation SBMultiDisplayUserInteractionCoordinator

- (SBWindowScene)activeWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);
}

- (void)handleSendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBMultiDisplayUserInteractionCoordinator _windowSceneForEvent:](self, "_windowSceneForEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMapTable objectForKey:](self->_sceneToEventSniffers, "objectForKey:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "handleEvent:", v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)eventSnifferHandledTouchInteractionQualifyingEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBMultiDisplayUserInteractionCoordinator _handleActiveDisplayQualifyingEventInWindowScene:source:](self, "_handleActiveDisplayQualifyingEventInWindowScene:source:", v4, CFSTR("touch"));
    v4 = v5;
  }

}

- (id)_windowSceneForEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  objc_msgSend(a3, "_hidEvent");
  BKSHIDEventGetBaseAttributes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contextID");
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_windowWithContextId:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "_fbsDisplayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "windowSceneForDisplayIdentity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleActiveDisplayQualifyingEventInWindowScene:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);
  if (v6)
  {
    objc_storeWeak((id *)&self->_activeDisplayWindowScene, v6);
    if (!WeakRetained || WeakRetained != v6)
    {
      SBLogActiveDisplay();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        SBStringForActiveDisplayTrackingMethodology(1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_sceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_sceneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v24 = v10;
        v25 = 2114;
        v26 = v11;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v7;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating active display from: %{public}@ to %{public}@ source: %{public}@", buf, 0x2Au);

      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = self->_activeWindowSceneObservers;
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "multiDisplayUserInteractionCoordinator:updatedActiveWindowScene:", self, v6, (_QWORD)v18);
          }
          while (v15 != v17);
          v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v15);
      }

    }
  }

}

- (SBMultiDisplayUserInteractionCoordinator)init
{
  SBMultiDisplayUserInteractionCoordinator *v2;
  uint64_t v3;
  NSMapTable *sceneToEventSniffers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMultiDisplayUserInteractionCoordinator;
  v2 = -[SBMultiDisplayUserInteractionCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    sceneToEventSniffers = v2->_sceneToEventSniffers;
    v2->_sceneToEventSniffers = (NSMapTable *)v3;

  }
  return v2;
}

- (SBWindowScene)activePointerWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_activePointerWindowScene);
}

- (void)addPointerInteractionObserver:(id)a3
{
  id v4;
  NSHashTable *pointerInteractionObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  pointerInteractionObservers = self->_pointerInteractionObservers;
  v8 = v4;
  if (!pointerInteractionObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pointerInteractionObservers;
    self->_pointerInteractionObservers = v6;

    v4 = v8;
    pointerInteractionObservers = self->_pointerInteractionObservers;
  }
  -[NSHashTable addObject:](pointerInteractionObservers, "addObject:", v4);

}

- (void)removePointerInteractionObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_pointerInteractionObservers, "removeObject:", a3);
}

- (void)updateActiveWindowScene:(id)a3 forUserInteraction:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMultiDisplayUserInteractionCoordinator.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionDescription"));

  }
  -[SBMultiDisplayUserInteractionCoordinator _handleActiveDisplayQualifyingEventInWindowScene:source:](self, "_handleActiveDisplayQualifyingEventInWindowScene:source:", v9, v7);

}

- (void)addActiveDisplayWindowSceneObserver:(id)a3
{
  id v4;
  NSHashTable *activeWindowSceneObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  activeWindowSceneObservers = self->_activeWindowSceneObservers;
  v8 = v4;
  if (!activeWindowSceneObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeWindowSceneObservers;
    self->_activeWindowSceneObservers = v6;

    v4 = v8;
    activeWindowSceneObservers = self->_activeWindowSceneObservers;
  }
  -[NSHashTable addObject:](activeWindowSceneObservers, "addObject:", v4);

}

- (void)removeActiveDisplayWindowSceneObserver:(id)a3
{
  NSHashTable *activeWindowSceneObservers;

  -[NSHashTable removeObject:](self->_activeWindowSceneObservers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_activeWindowSceneObservers, "count"))
  {
    activeWindowSceneObservers = self->_activeWindowSceneObservers;
    self->_activeWindowSceneObservers = 0;

  }
}

- (void)windowSceneDidConnect:(id)a3
{
  _SBScrollEventSniffer *v4;
  _SBScrollEventSniffer *v5;
  _SBContinuityTouchEventSniffer *v6;
  NSMapTable *sceneToEventSniffers;
  _SBPointerInteractionEventSniffer *v8;
  _SBScrollEventSniffer *v9;
  NSMapTable *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (_SBScrollEventSniffer *)a3;
  if (-[_SBScrollEventSniffer isContinuityDisplayWindowScene](v4, "isContinuityDisplayWindowScene"))
  {
    v5 = objc_alloc_init(_SBScrollEventSniffer);
    -[_SBScrollEventSniffer setDelegate:](v5, "setDelegate:", self);
    -[_SBScrollEventSniffer setWindowScene:](v5, "setWindowScene:", v4);
    v6 = objc_alloc_init(_SBContinuityTouchEventSniffer);
    -[_SBContinuityTouchEventSniffer setDelegate:](v6, "setDelegate:", self);
    -[_SBContinuityTouchEventSniffer setWindowScene:](v6, "setWindowScene:", v4);
    sceneToEventSniffers = self->_sceneToEventSniffers;
    v13[0] = v5;
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (_SBPointerInteractionEventSniffer *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](sceneToEventSniffers, "setObject:forKey:", v8, v4);
  }
  else
  {
    v5 = objc_alloc_init(_SBPointerTouchDownEventSniffer);
    -[_SBScrollEventSniffer setDelegate:](v5, "setDelegate:", self);
    -[_SBScrollEventSniffer setWindowScene:](v5, "setWindowScene:", v4);
    v6 = objc_alloc_init(_SBTouchInteractionEventSniffer);
    -[_SBContinuityTouchEventSniffer setDelegate:](v6, "setDelegate:", self);
    -[_SBContinuityTouchEventSniffer setWindowScene:](v6, "setWindowScene:", v4);
    v8 = objc_alloc_init(_SBPointerInteractionEventSniffer);
    -[_SBPointerInteractionEventSniffer setDelegate:](v8, "setDelegate:", self);
    -[_SBPointerInteractionEventSniffer setWindowScene:](v8, "setWindowScene:", v4);
    v9 = objc_alloc_init(_SBScrollEventSniffer);
    -[_SBScrollEventSniffer setDelegate:](v9, "setDelegate:", self);
    -[_SBScrollEventSniffer setWindowScene:](v9, "setWindowScene:", v4);
    v10 = self->_sceneToEventSniffers;
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v8;
    v12[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v11, v4);

    v4 = v9;
  }

}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  SBWindowScene **p_activePointerWindowScene;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_sceneToEventSniffers, "removeObjectForKey:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
  v6 = WeakRetained;
  if (WeakRetained && WeakRetained == v4)
  {
    SBLogPointer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_sceneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Clearing pointer touch down window scene: %{public}@ - scene disconnected", (uint8_t *)&v12, 0xCu);

    }
    objc_storeWeak((id *)&self->_activeTouchDownOriginatedWindowScene, 0);
  }
  v9 = objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);

  if (v9 == v4)
    objc_storeWeak((id *)&self->_activeDisplayWindowScene, 0);
  p_activePointerWindowScene = &self->_activePointerWindowScene;
  v11 = objc_loadWeakRetained((id *)p_activePointerWindowScene);

  if (v11 == v4)
    objc_storeWeak((id *)p_activePointerWindowScene, 0);

}

- (void)eventSnifferHandledPointerTouchDown:(id)a3
{
  void *v4;
  SBWindowScene **p_activeTouchDownOriginatedWindowScene;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_activeTouchDownOriginatedWindowScene = &self->_activeTouchDownOriginatedWindowScene;
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
    SBLogPointer();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v8)
      {
        objc_msgSend(WeakRetained, "_sceneIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Pointer touch down window scene: %{public}@ but we're already tracking it down in scene", (uint8_t *)&v11, 0xCu);

      }
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v4, "_sceneIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Setting pointer touch down window scene: %{public}@", (uint8_t *)&v11, 0xCu);

      }
      objc_storeWeak((id *)p_activeTouchDownOriginatedWindowScene, v4);
    }

  }
}

- (void)eventSnifferHandledPointerTouchUp:(id)a3
{
  SBWindowScene **p_activeTouchDownOriginatedWindowScene;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_activeTouchDownOriginatedWindowScene = &self->_activeTouchDownOriginatedWindowScene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
  if (WeakRetained)
  {
    SBLogPointer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "_sceneIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Clearing pointer touch down window scene: %{public}@ - touch up", (uint8_t *)&v7, 0xCu);

    }
    objc_storeWeak((id *)p_activeTouchDownOriginatedWindowScene, 0);
  }

}

- (void)eventSnifferHandledPointerInteractionQualifyingEvent:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activePointerWindowScene);
  objc_msgSend(v4, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeWeak((id *)&self->_activePointerWindowScene, v6);
    if (WeakRetained != v6)
    {
      SBLogActiveDisplay();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        SBStringForActiveDisplayTrackingMethodology(1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_sceneIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_sceneIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v8;
        v23 = 2114;
        v24 = v9;
        v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating active pointer display from: %{public}@ to %{public}@", buf, 0x20u);

      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = (void *)-[NSHashTable copy](self->_pointerInteractionObservers, "copy", 0);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "pointerDidMoveToFromWindowScene:toWindowScene:", WeakRetained, v6);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }
  -[SBMultiDisplayUserInteractionCoordinator _handleActiveDisplayQualifyingEventInWindowScene:source:](self, "_handleActiveDisplayQualifyingEventInWindowScene:source:", v6, CFSTR("pointer"));

}

- (void)eventSnifferHandledQualifyingScroll:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBMultiDisplayUserInteractionCoordinator _handleActiveDisplayQualifyingEventInWindowScene:source:](self, "_handleActiveDisplayQualifyingEventInWindowScene:source:", v4, CFSTR("scroll"));
    v4 = v5;
  }

}

- (void)eventSnifferHandledQualifyingContinuityTouch:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBMultiDisplayUserInteractionCoordinator _handleActiveDisplayQualifyingEventInWindowScene:source:](self, "_handleActiveDisplayQualifyingEventInWindowScene:source:", v4, CFSTR("continuity touch"));
    v4 = v5;
  }

}

- (SBMultiDisplayUserInteractionCoordinatorDelegate)delegate
{
  return (SBMultiDisplayUserInteractionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)activeTouchDownOriginatedWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
}

- (NSMapTable)sceneToEventSniffers
{
  return self->_sceneToEventSniffers;
}

- (void)setSceneToEventSniffers:(id)a3
{
  objc_storeStrong((id *)&self->_sceneToEventSniffers, a3);
}

- (NSHashTable)activeWindowSceneObservers
{
  return self->_activeWindowSceneObservers;
}

- (void)setActiveWindowSceneObservers:(id)a3
{
  objc_storeStrong((id *)&self->_activeWindowSceneObservers, a3);
}

- (NSHashTable)pointerInteractionObservers
{
  return self->_pointerInteractionObservers;
}

- (void)setPointerInteractionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteractionObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteractionObservers, 0);
  objc_storeStrong((id *)&self->_activeWindowSceneObservers, 0);
  objc_storeStrong((id *)&self->_sceneToEventSniffers, 0);
  objc_destroyWeak((id *)&self->_activeTouchDownOriginatedWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activePointerWindowScene);
  objc_destroyWeak((id *)&self->_activeDisplayWindowScene);
}

@end
