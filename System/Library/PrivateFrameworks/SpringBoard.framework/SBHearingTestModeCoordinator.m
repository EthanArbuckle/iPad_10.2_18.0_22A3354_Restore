@implementation SBHearingTestModeCoordinator

+ (id)dndModeAssertionClientIdentifier
{
  return CFSTR("com.apple.private.SpringBoard.focus.hearingTestMode");
}

- (SBHearingTestModeCoordinator)init
{
  SBHearingTestModeCoordinator *v2;
  SBHearingTestModeCoordinator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHearingTestModeCoordinator;
  v2 = -[SBHearingTestModeCoordinator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBHearingTestModeCoordinator _invalidateDNDModeAssertion](v2, "_invalidateDNDModeAssertion");
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)setHearingTestMode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_hearingTestMode != a3)
  {
    self->_hearingTestMode = a3;
    if (a3 == 1)
    {
      -[SBHearingTestModeCoordinator _acquireDNDModeAssertion](self, "_acquireDNDModeAssertion");
    }
    else if (!a3)
    {
      -[SBHearingTestModeCoordinator _invalidateDNDModeAssertion](self, "_invalidateDNDModeAssertion");
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "hearingTestModeCoordinatorDidChangeActiveState:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_noteHearingTestModeActiveForProviderWithIdentifier:(id)a3
{
  id v4;
  NSMutableSet *identifiersForHearingTestModeActiveProviders;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
  v8 = v4;
  if (!identifiersForHearingTestModeActiveProviders)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_identifiersForHearingTestModeActiveProviders;
    self->_identifiersForHearingTestModeActiveProviders = v6;

    v4 = v8;
    identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
  }
  -[NSMutableSet addObject:](identifiersForHearingTestModeActiveProviders, "addObject:", v4);
  -[SBHearingTestModeCoordinator _recalculateHearingTestMode](self, "_recalculateHearingTestMode");

}

- (void)_noteHearingTestModeInactiveForProviderWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_identifiersForHearingTestModeActiveProviders, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_identifiersForHearingTestModeActiveProviders, "removeObject:", v4);
    -[SBHearingTestModeCoordinator _recalculateHearingTestMode](self, "_recalculateHearingTestMode");
  }

}

- (void)_recalculateHearingTestMode
{
  NSMutableSet *identifiersForHearingTestModeActiveProviders;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_identifiersForHearingTestModeActiveProviders, "count"))
  {
    -[SBHearingTestModeCoordinator setHearingTestMode:](self, "setHearingTestMode:", 1);
  }
  else
  {
    -[SBHearingTestModeCoordinator setHearingTestMode:](self, "setHearingTestMode:", 0);
    identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
    self->_identifiersForHearingTestModeActiveProviders = 0;

  }
  SBLogHearingTestMode();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    SBSHearingTestModeDescription();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Updating coordinator hearing test mode to: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_acquireDNDModeAssertion
{
  void *v3;
  void *v4;
  DNDModeSelectionService *v5;
  DNDModeSelectionService *dndService;
  void *v7;
  id v8;

  if (!self->_dndService)
  {
    v3 = (void *)MEMORY[0x1E0D1D6B0];
    objc_msgSend((id)objc_opt_class(), "dndModeAssertionClientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceForClientIdentifier:", v4);
    v5 = (DNDModeSelectionService *)objc_claimAutoreleasedReturnValue();
    dndService = self->_dndService;
    self->_dndService = v5;

    v8 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
    objc_msgSend((id)objc_opt_class(), "dndModeAssertionClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v7);

    objc_msgSend(v8, "setModeIdentifier:", *MEMORY[0x1E0D1D3C0]);
    objc_msgSend(v8, "setReason:", 3);
    -[DNDModeSelectionService activateModeWithDetails:error:](self->_dndService, "activateModeWithDetails:error:", v8, 0);

  }
}

- (void)_invalidateDNDModeAssertion
{
  DNDModeSelectionService *dndService;
  NSObject *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  DNDModeSelectionService *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__75;
  v6[4] = __Block_byref_object_dispose__75;
  v7 = self->_dndService;
  dndService = self->_dndService;
  self->_dndService = 0;

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBHearingTestModeCoordinator__invalidateDNDModeAssertion__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

void __59__SBHearingTestModeCoordinator__invalidateDNDModeAssertion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0D1D6B0];
    objc_msgSend((id)objc_opt_class(), "dndModeAssertionClientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceForClientIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v2, "activeModeAssertionWithError:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dndModeAssertionClientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v14, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateModeAssertionWithUUID:error:", v13, 0);

  }
}

- (void)addSceneExtensionIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  SBSUIHearingTestModeHostComponent *v9;
  SBSUIHearingTestModeHostComponent *hearingTestModeHostComponent;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.springboard.hearing-test-mode")))
  {
    objc_msgSend(v4, "addExtension:", objc_opt_class());
    SBLogHearingTestMode();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added scene extension to scene with hearing test mode entitlement: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v8 = objc_opt_class();
    objc_msgSend(v4, "componentForExtension:ofClass:", v8, objc_opt_class());
    v9 = (SBSUIHearingTestModeHostComponent *)objc_claimAutoreleasedReturnValue();
    hearingTestModeHostComponent = self->_hearingTestModeHostComponent;
    self->_hearingTestModeHostComponent = v9;

    -[SBSUIHearingTestModeHostComponent setDelegate:](self->_hearingTestModeHostComponent, "setDelegate:", self);
  }

}

- (void)hearingTestModeHostComponentDidChangeActiveState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogHearingTestMode();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hearingTestMode");
    SBSHearingTestModeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Coordinator did receive %{public}@ for hearing test mode via delegate", (uint8_t *)&v9, 0xCu);

  }
  v7 = objc_msgSend(v4, "hearingTestMode");
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
    -[SBHearingTestModeCoordinator _noteHearingTestModeActiveForProviderWithIdentifier:](self, "_noteHearingTestModeActiveForProviderWithIdentifier:", v8);
  else
    -[SBHearingTestModeCoordinator _noteHearingTestModeInactiveForProviderWithIdentifier:](self, "_noteHearingTestModeInactiveForProviderWithIdentifier:", v8);

}

- (int64_t)hearingTestMode
{
  return self->_hearingTestMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndService, 0);
  objc_storeStrong((id *)&self->_hearingTestModeHostComponent, 0);
  objc_storeStrong((id *)&self->_identifiersForHearingTestModeActiveProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
