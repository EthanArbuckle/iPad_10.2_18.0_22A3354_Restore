@implementation SBKeyboardFocusCoordinator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBKeyboardFocusCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_59 != -1)
    dispatch_once(&sharedInstance_onceToken_59, block);
  return (id)sharedInstance_sharedInstance_9;
}

void __44__SBKeyboardFocusCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_sharedInstance_9;
  sharedInstance_sharedInstance_9 = v1;

}

- (SBKeyboardFocusCoordinator)initWithPolicyEnforcer:(id)a3 sceneControllerFactory:(id)a4 coalitionFactory:(id)a5 sceneProvider:(id)a6 uiKitDependencyProvider:(id)a7 visibilityGraphNavigator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SBKeyboardFocusCoordinator *v19;
  uint64_t v20;
  BKSHIDEventDeliveryManager *deliveryManager;
  NSMutableSet *v22;
  NSMutableSet *sceneControllers;
  uint64_t v24;
  UIKeyboardArbiterManager *keyboardArbiterManager;
  _SBRecentlyUsedSceneIdentityCache *v26;
  _SBRecentlyUsedSceneIdentityCache *recentlyUsedScenes;
  uint64_t v28;
  BSCompoundAssertion *observers;
  BSCompoundAssertion *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void (**v36)(_QWORD);
  NSObject *v37;
  id v39;
  id v40;
  _QWORD block[4];
  void (**v42)(_QWORD);
  _QWORD v43[4];
  SBKeyboardFocusCoordinator *v44;
  id v45;
  objc_super v46;

  v40 = a3;
  v39 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v46.receiver = self;
  v46.super_class = (Class)SBKeyboardFocusCoordinator;
  v19 = -[SBKeyboardFocusCoordinator init](&v46, sel_init);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    deliveryManager = v19->_deliveryManager;
    v19->_deliveryManager = (BKSHIDEventDeliveryManager *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sceneControllers = v19->_sceneControllers;
    v19->_sceneControllers = v22;

    objc_storeStrong((id *)&v19->_policyEnforcer, a3);
    objc_storeStrong((id *)&v19->_keyboardFocusSceneControllerFactory, a4);
    objc_storeStrong((id *)&v19->_keyboardFocusCoalitionFactory, a5);
    objc_storeStrong((id *)&v19->_sceneProvider, a6);
    objc_msgSend(v17, "keyboardArbiterManager");
    v24 = objc_claimAutoreleasedReturnValue();
    keyboardArbiterManager = v19->_keyboardArbiterManager;
    v19->_keyboardArbiterManager = (UIKeyboardArbiterManager *)v24;

    objc_storeStrong((id *)&v19->_visibilityGraphNavigator, a8);
    v26 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
    recentlyUsedScenes = v19->_recentlyUsedScenes;
    v19->_recentlyUsedScenes = v26;

    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("keyboardFocusObservers"));
    v28 = objc_claimAutoreleasedReturnValue();
    observers = v19->_observers;
    v19->_observers = (BSCompoundAssertion *)v28;

    v30 = v19->_observers;
    SBLogKeyboardFocus();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v30, "setLog:", v31);

    objc_msgSend(v17, "setSystemShellBehaviorDelegate:", v19);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v19, sel__setNeedsArbitrationForKeyWindowNotification, *MEMORY[0x1E0CEBDF8], 0);

    objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addActiveDisplayWindowSceneObserver:", v19);

    v34 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke;
    v43[3] = &unk_1E8E9E820;
    v44 = v19;
    v35 = v17;
    v45 = v35;
    v36 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v43);
    if (objc_msgSend(v35, "shouldInitAsync"))
    {
      dispatch_get_global_queue(21, 0);
      v37 = objc_claimAutoreleasedReturnValue();
      block[0] = v34;
      block[1] = 3221225472;
      block[2] = __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke_2;
      block[3] = &unk_1E8E9E8D0;
      v42 = v36;
      dispatch_async(v37, block);

    }
    else
    {
      v36[2](v36);
    }

  }
  return v19;
}

void __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "inputUISceneController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 40), "launchAdvisorWithOmniscientDelegate:sceneDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v5;

  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 96));
}

uint64_t __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_init
{
  SBKeyboardFocusSceneProvider *v3;
  SBKeyboardFocusSceneSettingPolicyEnforcer *v4;
  SBAdditionalEnvironmentDeferralsPolicyEnforcer *v5;
  SBKeyboardFocusPolicyEnforcerPipeline *v6;
  void *v7;
  SBKeyboardFocusPolicyEnforcerPipeline *v8;
  _SBKeyboardFocusSceneControllerFactory *v9;
  _SBKeyboardFocusCoalitionFactory *v10;
  _SBKeyboardFocusUIKitDependency *v11;
  SBKeyboardFocusCoordinator *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SBKeyboardFocusSceneProvider);
  v4 = -[SBKeyboardFocusSceneSettingPolicyEnforcer initWithSceneProvider:]([SBKeyboardFocusSceneSettingPolicyEnforcer alloc], "initWithSceneProvider:", v3);
  v5 = objc_alloc_init(SBAdditionalEnvironmentDeferralsPolicyEnforcer);
  v6 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
  v14[0] = v4;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBKeyboardFocusPolicyEnforcerPipeline initWithEnforcers:](v6, "initWithEnforcers:", v7);

  v9 = objc_alloc_init(_SBKeyboardFocusSceneControllerFactory);
  v10 = objc_alloc_init(_SBKeyboardFocusCoalitionFactory);
  v11 = objc_alloc_init(_SBKeyboardFocusUIKitDependency);
  v12 = -[SBKeyboardFocusCoordinator initWithPolicyEnforcer:sceneControllerFactory:coalitionFactory:sceneProvider:uiKitDependencyProvider:visibilityGraphNavigator:](self, "initWithPolicyEnforcer:sceneControllerFactory:coalitionFactory:sceneProvider:uiKitDependencyProvider:visibilityGraphNavigator:", v8, v9, v10, v3, v11, 0);

  -[SBAdditionalEnvironmentDeferralsPolicyEnforcer setDelegate:](v5, "setDelegate:", v12);
  return v12;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBKeyboardFocusCoordinator *v10;
  _QWORD v11[4];
  id v12;
  SBKeyboardFocusCoordinator *v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v6 = v4;
  v12 = v6;
  v13 = self;
  objc_msgSend(v6, "appendProem:block:", self, v11);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke_2;
  v8[3] = &unk_1E8E9E820;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "appendBodySectionWithName:block:", 0, v8);

}

void __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "keyboardFocusTarget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("target"));

}

id __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200), CFSTR("enforcedPolicy"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("coalition"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("externalSceneWithFocus"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("sceneWithFocusIncludingSpringBoard"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224), CFSTR("overlayUISceneRequestingFocus"));
}

- (BOOL)hasExternalSceneWithFocus
{
  return self->_externalSceneWithFocus != 0;
}

- (SBWindowScene)windowSceneWithFocus
{
  return -[SBKeyboardFocusPolicy sbWindowSceneAncestor](self->_enforcedPolicy, "sbWindowSceneAncestor");
}

- (SBInputUISceneController)inputUISceneController
{
  return self->_inputUISceneController;
}

- (unint64_t)userFocusRequestGeneration
{
  return self->_userFocusRequestGeneration;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[coordinator] scene connected: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = -[_SBKeyboardFocusSceneControllerFactory newKeyboardFocusSceneControllerForScene:deliveryManager:sceneProvider:](self->_keyboardFocusSceneControllerFactory, "newKeyboardFocusSceneControllerForScene:deliveryManager:sceneProvider:", v4, self->_deliveryManager, self->_sceneProvider);
  objc_msgSend(v6, "setDelegate:", self);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We need a keyboard focus scene controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator windowSceneDidConnect:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D79428);
  }
  -[NSMutableSet addObject:](self->_sceneControllers, "addObject:", v6);
  objc_msgSend(v4, "sceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  -[SBKeyboardFocusCoordinator _updateCoalitionForSceneControllersAddedOrRemoved](self, "_updateCoalitionForSceneControllersAddedOrRemoved");
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[coordinator] scene disconnected: %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_sceneControllers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
  {
LABEL_11:

    goto LABEL_12;
  }
  v8 = v7;
  v9 = *(_QWORD *)v17;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
    objc_msgSend(v11, "sbWindowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqual:", v12);

    if ((v13 & 1) != 0)
      break;
    if (v8 == ++v10)
    {
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v8)
        goto LABEL_11;
      goto LABEL_5;
    }
  }
  v15 = v11;

  if (!v15)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no such scene <%@: %p>"), objc_opt_class(), v4, (_QWORD)v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator windowSceneDidDisconnect:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D795D4);
  }
  objc_msgSend(v15, "invalidate");
  -[NSMutableSet removeObject:](self->_sceneControllers, "removeObject:", v15);
  -[SBKeyboardFocusCoordinator _updateCoalitionForSceneControllersAddedOrRemoved](self, "_updateCoalitionForSceneControllersAddedOrRemoved");

}

- (id)addKeyboardFocusObserver:(id)a3
{
  BSCompoundAssertion *observers;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  observers = self->_observers;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](observers, "acquireForReason:withContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bufferEventsForSpringBoardScene:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t *p_eventBufferingRequestGeneration;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:].cold.1();
    goto LABEL_16;
  }
  v8 = v7;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    -[SBKeyboardFocusCoordinator _sceneControllerForScene:](self, "_sceneControllerForScene:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      p_eventBufferingRequestGeneration = &self->_eventBufferingRequestGeneration;
      do
        v12 = __ldaxr(p_eventBufferingRequestGeneration);
      while (__stlxr(v12 + 1, p_eventBufferingRequestGeneration));
      v13 = atomic_load(p_eventBufferingRequestGeneration);
      objc_msgSend(v9, "bufferEventsForReason:generation:", v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "_sceneIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("[coordinator] buffer events requested but we don't have a matching sceneController for its windowScene %@"), v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:].cold.3();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D79810);
  }
  SBLogKeyboardFocus();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:].cold.2();

  v14 = 0;
LABEL_10:

  return v14;
}

- (id)deferAdditionalEnvironments:(id)a3 whenTargetHasKeyboardFocus:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *focusServiceEventDeferralRequests;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  SBKeyboardFocusPolicyEnforcer *policyEnforcer;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(id *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  focusServiceEventDeferralRequests = self->_focusServiceEventDeferralRequests;
  if (!focusServiceEventDeferralRequests)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_focusServiceEventDeferralRequests;
    self->_focusServiceEventDeferralRequests = v9;

    focusServiceEventDeferralRequests = self->_focusServiceEventDeferralRequests;
  }
  -[NSMutableDictionary setObject:forKey:](focusServiceEventDeferralRequests, "setObject:forKey:", v6, v7);
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke;
  v25 = &unk_1E8EC1BB8;
  objc_copyWeak(&v28, &location);
  v14 = v6;
  v26 = v14;
  v15 = v7;
  v27 = v15;
  v16 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", v13, CFSTR("focus service requesting deferral"), &v22);

  SBLogKeyboardFocus();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[coordinator] deferKeyboardEventsForEnvironment: adding requested deferrals for environments: %{public}@ when target %{public}@ has focus", buf, 0x16u);
  }

  +[SBKeyboardFocusArbitrationReason deferAdditionalEnvironments](SBKeyboardFocusArbitrationReason, "deferAdditionalEnvironments", v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator _setNeedsArbitrationForReason:](self, "_setNeedsArbitrationForReason:", v18);

  policyEnforcer = self->_policyEnforcer;
  -[SBKeyboardFocusCoalition enforcedPolicy](self->_coalition, "enforcedPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusPolicyEnforcer enforce:](policyEnforcer, "enforce:", v20);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v16;
}

void __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, a1 + 6);
  v4 = a1[4];
  v5 = a1[5];
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  SBLogKeyboardFocus();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[coordinator] deferKeyboardEventsForEnvironment: removing requested deferrals for environments: %{public}@ when target %{public}@ has focus", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(WeakRetained, "focusServiceEventDeferralRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  +[SBKeyboardFocusArbitrationReason deferAdditionalEnvironments](SBKeyboardFocusArbitrationReason, "deferAdditionalEnvironments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setNeedsArbitrationForReason:", v7);

  v8 = WeakRetained[6];
  objc_msgSend(WeakRetained[24], "enforcedPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enforce:", v9);

}

- (void)removeKeyboardFocusFromScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  FBScene *overlayUISceneRequestingFocus;
  void *v9;
  void *v10;
  int v11;
  FBScene *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = v4;
  NSClassFromString(CFSTR("FBScene"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator removeKeyboardFocusFromScene:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A004);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator removeKeyboardFocusFromScene:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A068);
  }

  +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[coordinator] removeKeyboardFocusFromScene: target %{public}@", buf, 0xCu);
  }

  -[SBKeyboardFocusCoordinator _removeSceneFromRecents:reason:](self, "_removeSceneFromRecents:reason:", v5, CFSTR("removeKeyboardFocusFromScene"));
  overlayUISceneRequestingFocus = self->_overlayUISceneRequestingFocus;
  if (overlayUISceneRequestingFocus)
  {
    -[FBScene identityToken](overlayUISceneRequestingFocus, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
    {
      v12 = self->_overlayUISceneRequestingFocus;
      self->_overlayUISceneRequestingFocus = 0;

    }
  }
  v13 = (void *)-[NSMutableSet copy](self->_sceneControllers, "copy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  v16 = v14;
  if (!v15)
    goto LABEL_22;
  v17 = v15;
  LOBYTE(v18) = 0;
  v19 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v25 != v19)
        objc_enumerationMutation(v14);
      if ((v18 & 1) != 0)
        v18 = 1;
      else
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "removeKeyboardFocusFromScene:", v5);
    }
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v17);

  if (v18)
  {
    SBLogKeyboardFocus();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[coordinator] removeKeyboardFocusFromScene: target %{public}@ was focus target, requesting full arbitration", buf, 0xCu);
    }

    +[SBKeyboardFocusArbitrationReason didRemoveKeyboardFocusFromScene](SBKeyboardFocusArbitrationReason, "didRemoveKeyboardFocusFromScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinator _setNeedsArbitrationForReason:](self, "_setNeedsArbitrationForReason:", v16);
LABEL_22:

  }
}

- (void)userFocusRequestForScene:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSMutableArray *userFocusRequestRuleUpdateCompletionHandlers;
  NSMutableArray *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v12 = v9;
  NSClassFromString(CFSTR("FBScene"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A3E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneClass]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A444);
  }

  v13 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A4A8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7A50CLL);
  }

  objc_msgSend(v12, "clientHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "processHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "pid");

  if ((int)v16 <= 0)
  {
    SBLogKeyboardFocus();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:].cold.3();
  }
  else
  {
    objc_msgSend(v12, "identityToken");
    v17 = objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogKeyboardFocus();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      v34 = 2114;
      v35 = v13;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[coordinator] userFocusRequestForScene: requesting target %{public}@ for reason:%{public}@", buf, 0x16u);
    }

    ++self->_userFocusRequestGeneration;
    v20 = -[SBKeyboardFocusSceneProviding isOverlayUIScene:](self->_sceneProvider, "isOverlayUIScene:", v12);
    if (v20)
    {
      SBLogKeyboardFocus();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[coordinator] userFocusRequestForScene: high priority scene!", buf, 2u);
      }

      objc_storeStrong((id *)&self->_overlayUISceneRequestingFocus, a3);
    }
    -[UIKeyboardArbiterManager userSelectedProcessIdentifier:withSceneIdentity:onCompletion:](self->_keyboardArbiterManager, "userSelectedProcessIdentifier:withSceneIdentity:onCompletion:", v16, v17, &__block_literal_global_413);
    if (v11)
    {
      if (((-[SBKeyboardFocusPolicy advicePolicy](self->_enforcedPolicy, "advicePolicy") == 0) & ~v20) != 0
        || (-[SBKeyboardFocusPolicy keyboardFocusTarget](self->_enforcedPolicy, "keyboardFocusTarget"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v18, "isEqual:", v22),
            v22,
            v23))
      {
        v11[2](v11, 1);
      }
      else
      {
        userFocusRequestRuleUpdateCompletionHandlers = self->_userFocusRequestRuleUpdateCompletionHandlers;
        if (!userFocusRequestRuleUpdateCompletionHandlers)
        {
          v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v26 = self->_userFocusRequestRuleUpdateCompletionHandlers;
          self->_userFocusRequestRuleUpdateCompletionHandlers = v25;

          userFocusRequestRuleUpdateCompletionHandlers = self->_userFocusRequestRuleUpdateCompletionHandlers;
        }
        v27 = (void *)MEMORY[0x1D17E5550](v11);
        -[NSMutableArray addObject:](userFocusRequestRuleUpdateCompletionHandlers, "addObject:", v27);

      }
    }

  }
}

- (id)suppressKeyboardFocusEvaluationForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *suppressKeyboardFocusEvaluationAssertion;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *coalition_suppressKeyboardFocusEvaluationAssertion;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  if (!suppressKeyboardFocusEvaluationAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __71__SBKeyboardFocusCoordinator_suppressKeyboardFocusEvaluationForReason___block_invoke;
    v18 = &unk_1E8EA3688;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBKeyboardFocusCoordinator-keyboardFocusEvaluationSuppression"), &v15);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_suppressKeyboardFocusEvaluationAssertion;
    self->_suppressKeyboardFocusEvaluationAssertion = v7;

    v9 = self->_suppressKeyboardFocusEvaluationAssertion;
    SBLogKeyboardFocus();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v15, v16, v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](suppressKeyboardFocusEvaluationAssertion, "acquireForReason:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_coalition_suppressKeyboardFocusEvaluationAssertion)
  {
    -[SBKeyboardFocusCoalition suppressKeyboardFocusEvaluationForReason:](self->_coalition, "suppressKeyboardFocusEvaluationForReason:", CFSTR("SBKeyboardFocusCoordinatorRequested"));
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    coalition_suppressKeyboardFocusEvaluationAssertion = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
    self->_coalition_suppressKeyboardFocusEvaluationAssertion = v12;

  }
  return v11;
}

void __71__SBKeyboardFocusCoordinator_suppressKeyboardFocusEvaluationForReason___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  uint8_t v7[16];

  if ((objc_msgSend(a2, "isActive") & 1) == 0)
  {
    SBLogKeyboardFocus();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "finished suppressing keyboard focus evaluation, time to re-evaluate", v7, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(*((id *)WeakRetained + 18), "invalidate");
      v6 = (void *)v5[18];
      v5[18] = 0;

    }
  }
}

- (id)preventFocusForSceneWithIdentityToken:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  BSCompoundAssertion *preventFocusForSceneAssertion;
  void *v9;
  BSCompoundAssertion *v10;
  BSCompoundAssertion *v11;
  BSCompoundAssertion *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  if (!preventFocusForSceneAssertion)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0D01718];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __75__SBKeyboardFocusCoordinator_preventFocusForSceneWithIdentityToken_reason___block_invoke;
    v20 = &unk_1E8EA3688;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBWorkspaceKeyboardFocusPreventFocusForPID"), &v17);
    v10 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v11 = self->_preventFocusForSceneAssertion;
    self->_preventFocusForSceneAssertion = v10;

    v12 = self->_preventFocusForSceneAssertion;
    SBLogKeyboardFocus();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v12, "setLog:", v13, v17, v18, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  }
  objc_msgSend(v6, "stringRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](preventFocusForSceneAssertion, "acquireForReason:withContext:", v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __75__SBKeyboardFocusCoordinator_preventFocusForSceneWithIdentityToken_reason___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SBKeyboardFocusArbitrationReason preventFocusForPID](SBKeyboardFocusArbitrationReason, "preventFocusForPID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setNeedsArbitrationForReason:", v1);

}

- (id)redirectFocusForReason:(id)a3 fromProcessIdentifier:(int)a4 fromSceneIdentityToken:(id)a5 toProcessidentifier:(int)a6 toSceneIdentityToken:(id)a7
{
  uint64_t v8;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  SBKeyboardFocusRedirection *v16;
  BSCompoundAssertion *appFocusRedirections;
  void *v18;
  BSCompoundAssertion *v19;
  BSCompoundAssertion *v20;
  BSCompoundAssertion *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (!v14)
  {
    SBLogKeyboardFocus();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator redirectFocusForReason:fromProcessIdentifier:fromSceneIdentityToken:toProcessidentifier:toSceneIdentityToken:].cold.1(v8, v15);

  }
  v16 = objc_alloc_init(SBKeyboardFocusRedirection);
  -[SBKeyboardFocusRedirection setReason:](v16, "setReason:", v12);
  -[SBKeyboardFocusRedirection setFromProcessIdentifier:](v16, "setFromProcessIdentifier:", v10);
  -[SBKeyboardFocusRedirection setFromToken:](v16, "setFromToken:", v13);
  -[SBKeyboardFocusRedirection setToProcessIdentifier:](v16, "setToProcessIdentifier:", v8);
  -[SBKeyboardFocusRedirection setToToken:](v16, "setToToken:", v14);
  appFocusRedirections = self->_appFocusRedirections;
  if (!appFocusRedirections)
  {
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x1E0D01718];
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __139__SBKeyboardFocusCoordinator_redirectFocusForReason_fromProcessIdentifier_fromSceneIdentityToken_toProcessidentifier_toSceneIdentityToken___block_invoke;
    v28 = &unk_1E8EA3688;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v18, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("appFocusRedirections"), &v25);
    v19 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v20 = self->_appFocusRedirections;
    self->_appFocusRedirections = v19;

    v21 = self->_appFocusRedirections;
    SBLogKeyboardFocus();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v21, "setLog:", v22, v25, v26, v27, v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    appFocusRedirections = self->_appFocusRedirections;
  }
  -[BSCompoundAssertion acquireForReason:withContext:](appFocusRedirections, "acquireForReason:withContext:", v12, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __139__SBKeyboardFocusCoordinator_redirectFocusForReason_fromProcessIdentifier_fromSceneIdentityToken_toProcessidentifier_toSceneIdentityToken___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SBKeyboardFocusArbitrationReason appFocusRedirections](SBKeyboardFocusArbitrationReason, "appFocusRedirections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setNeedsArbitrationForReason:", v1);

}

- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)-[NSMutableSet copy](self->_sceneControllers, "copy");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "redirectSpringBoardLockFocusForReason:toProcessidentifier:toSceneIdentityToken:", v8, v6, v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v18 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coordinator:redirectSpringBoardLockFocusForReason: %@"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __109__SBKeyboardFocusCoordinator_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke;
    v23[3] = &unk_1E8E9DCD8;
    v24 = v10;
    v20 = v10;
    v21 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:invalidationBlock:", v19, v8, v23);

  }
  else
  {
    SBLogKeyboardFocus();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[coordinator] error: redirectSpringBoardLockFocusForReason for reason %{public}@ with no token. PID-only rules are not valid", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

void __109__SBKeyboardFocusCoordinator_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinator _sceneControllerForScene:](self, "_sceneControllerForScene:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[coordinator] request focus lock for SB window %@ but we don't have a matching sceneController for it's windowScene %@"), v6, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:].cold.1();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0D7AFBCLL);
    }
    v10 = (void *)v9;
    v11 = v7;
    if (!v11)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:].cold.2();
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0D7B044);
    }
    v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_msgSend(v12, "classForCoder");
      if (!v22)
        v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:].cold.2();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0D7B0F0);
    }

    objc_msgSend(v10, "focusLockSpringBoardWindow:forReason:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SBLogKeyboardFocus();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[coordinator] error: focusLockSpringBoardWindow for reason %{public}@ with nil window", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (id)focusLockSpringBoardWindowScene:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[SBKeyboardFocusCoordinator _sceneControllerForScene:](self, "_sceneControllerForScene:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = v7;
      if (!v10)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_opt_class();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:].cold.3();
        objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D0D7B2D0);
      }
      v11 = v10;
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_msgSend(v9, "focusLockSpringBoardForReason:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_msgSend(v11, "classForCoder");
      if (!v21)
        v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v22, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:].cold.3();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[coordinator] request focus lock for SB window scene %@ but we don't have a matching sceneController for its windowScene"), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:].cold.2();
    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7B248);
  }
  SBLogKeyboardFocus();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:].cold.1();

  v12 = 0;
LABEL_9:

  return v12;
}

- (void)requestArbitrationForSBWindowScene:(id)a3 forReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = a4;
  if (a3)
  {
    v10 = v6;
    -[SBKeyboardFocusCoordinator _sceneControllerForScene:](self, "_sceneControllerForScene:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "annotatedWithSourceName:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  v11 = v6;
  -[SBKeyboardFocusCoordinator _setNeedsArbitrationForReason:](self, "_setNeedsArbitrationForReason:", v6);

}

- (int)presentingKeyboardProcessIdentifier
{
  int v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__SBKeyboardFocusCoordinator_presentingKeyboardProcessIdentifier__block_invoke;
  v4[3] = &unk_1E8EC1C00;
  v4[4] = &v5;
  -[SBKeyboardFocusCoordinator _talkToKeyboardArbiterAdvisor:](self, "_talkToKeyboardArbiterAdvisor:", v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __65__SBKeyboardFocusCoordinator_presentingKeyboardProcessIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "presentingKeyboardProcessIdentifier");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator _sceneControllerForScene:](self, "_sceneControllerForScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:", v4);
  else
    v8 = 0;

  return v8;
}

- (id)focusLockSpringBoardWindowScene:(id)a3 forAccessibilityReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[SBKeyboardFocusLockReason accessibility:](SBKeyboardFocusLockReason, "accessibility:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:](self, "focusLockSpringBoardWindowScene:forReason:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(id)a3 forAccessibilityReason:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  BSCompoundAssertion *accessibilityKeyboardFocusTargetOverrides;
  void *v14;
  BSCompoundAssertion *v15;
  BSCompoundAssertion *v16;
  BSCompoundAssertion *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_opt_class();
  v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    NSStringFromClass(v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("tokenString"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:].cold.1(a2);
LABEL_18:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0D7B820);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_msgSend(v9, "classForCoder");
    if (!v25)
      v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("tokenString"), v26, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:].cold.3(a2);
    goto LABEL_18;
  }

  -[SBKeyboardFocusSceneProviding sceneForIdentityTokenStringRepresentation:](self->_sceneProvider, "sceneForIdentityTokenStringRepresentation:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    accessibilityKeyboardFocusTargetOverrides = self->_accessibilityKeyboardFocusTargetOverrides;
    if (!accessibilityKeyboardFocusTargetOverrides)
    {
      objc_initWeak(&location, self);
      v14 = (void *)MEMORY[0x1E0D01718];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __120__SBKeyboardFocusCoordinator_requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation_forAccessibilityReason___block_invoke;
      v29[3] = &unk_1E8EBF0B8;
      objc_copyWeak(&v31, &location);
      v30 = v8;
      objc_msgSend(v14, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("accessibilityKeyboardArbiterOverrides"), v29);
      v15 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
      v16 = self->_accessibilityKeyboardFocusTargetOverrides;
      self->_accessibilityKeyboardFocusTargetOverrides = v15;

      v17 = self->_accessibilityKeyboardFocusTargetOverrides;
      SBLogKeyboardFocus();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSCompoundAssertion setLog:](v17, "setLog:", v18);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      accessibilityKeyboardFocusTargetOverrides = self->_accessibilityKeyboardFocusTargetOverrides;
    }
    +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion acquireForReason:withContext:](accessibilityKeyboardFocusTargetOverrides, "acquireForReason:withContext:", v8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogKeyboardFocus();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:].cold.2();
    v20 = 0;
  }

  return v20;
}

void __120__SBKeyboardFocusCoordinator_requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation_forAccessibilityReason___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SBKeyboardFocusArbitrationReason accessibility:](SBKeyboardFocusArbitrationReason, "accessibility:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setNeedsArbitrationForReason:", v2);

}

- (id)_sceneControllerHostingSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id *v21;
  SBKeyboardFocusCoordinator *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v21 = a4;
    v22 = self;
    v7 = (void *)-[NSMutableSet copy](self->_sceneControllers, "copy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "sbWindowScene");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_FBSScene");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identityToken");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v6);

          if ((v17 & 1) != 0)
          {
            v19 = v13;
            v18 = v8;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[SBKeyboardFocusCoordinator _sbWindowSceneHostingFBSSceneIdentityToken:ultimateHostTarget:](v22, "_sbWindowSceneHostingFBSSceneIdentityToken:ultimateHostTarget:", v6, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:](v22, "_sceneControllerForSBWindowScene:", v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_isAcceptableVisibilityBasedHostScene:(id)a3 forSBWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  BOOL v12;
  NSSet *externalSceneIdentities;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v7);

  if ((v10 & 1) == 0
    && ((-[SBKeyboardFocusSceneProviding anyConnectedSBWindowSceneContainsSceneIdentity:](self->_sceneProvider, "anyConnectedSBWindowSceneContainsSceneIdentity:", v7) & 1) != 0|| (-[SBKeyboardFocusSceneProviding isSystemUISceneIdentityToken:](self->_sceneProvider, "isSystemUISceneIdentityToken:", v7) & 1) != 0|| (externalSceneIdentities = self->_externalSceneIdentities, objc_msgSend(v7, "stringRepresentation"), v14 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(externalSceneIdentities) = -[NSSet containsObject:](externalSceneIdentities, "containsObject:", v14), v14, (externalSceneIdentities & 1) != 0)))
  {
    v12 = 1;
  }
  else
  {
    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "unacceptable host scene: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_sbWindowSceneHostingFBSSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  SBKeyboardFocusVisibilityGraphNavigator *visibilityGraphNavigator;
  SBKeyboardFocusVisibilityGraphNavigator *v13;
  SBKeyboardFocusVisibilityGraphNavigator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator _sbWindowSceneHostingFBSSceneIdentityTokenString:](self, "_sbWindowSceneHostingFBSSceneIdentityTokenString:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SBLogKeyboardFocus();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Searching the visibility graph for hosting information for %{public}@", (uint8_t *)&buf, 0xCu);

    }
    visibilityGraphNavigator = self->_visibilityGraphNavigator;
    if (!visibilityGraphNavigator)
    {
      v13 = objc_alloc_init(SBKeyboardFocusVisibilityGraphNavigator);
      v14 = self->_visibilityGraphNavigator;
      self->_visibilityGraphNavigator = v13;

      visibilityGraphNavigator = self->_visibilityGraphNavigator;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__131;
    v37 = __Block_byref_object_dispose__131;
    v38 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__131;
    v28 = __Block_byref_object_dispose__131;
    v29 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__SBKeyboardFocusCoordinator__sbWindowSceneHostingFBSSceneIdentityToken_ultimateHostTarget___block_invoke;
    v23[3] = &unk_1E8EC1C28;
    v23[4] = self;
    v23[5] = &buf;
    v23[6] = &v24;
    -[SBKeyboardFocusVisibilityGraphNavigator reverseEnumerateChainContainingSceneIdentityToken:block:](visibilityGraphNavigator, "reverseEnumerateChainContainingSceneIdentityToken:block:", v7, v23);
    v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    *a4 = objc_retainAutorelease((id)v25[5]);
    SBLogKeyboardFocus();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "_FBSScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identityToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringRepresentation");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = (const __CFString *)v25[5];
      if (!v20)
        v20 = CFSTR("<none>");
      *(_DWORD *)v30 = 138543618;
      v31 = v18;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Visibility graph search found root scene %{public}@ and ultimate host %{public}@", v30, 0x16u);

    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&buf, 8);
    if (!v9)
    {
      SBLogKeyboardFocus();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusCoordinator _sbWindowSceneHostingFBSSceneIdentityToken:ultimateHostTarget:].cold.1(v7, v21);

      goto LABEL_15;
    }
  }
LABEL_16:

  return v9;
}

void __92__SBKeyboardFocusCoordinator__sbWindowSceneHostingFBSSceneIdentityToken_ultimateHostTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sbWindowSceneHostingFBSSceneIdentityTokenString:", v14);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = v14;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sceneForIdentityTokenStringRepresentation:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && objc_msgSend(*(id *)(a1 + 32), "_isAcceptableVisibilityBasedHostScene:forSBWindowScene:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
    {
      +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    *a4 = 1;

    v9 = v14;
  }

}

- (id)_sbWindowSceneHostingFBSSceneIdentityTokenString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedWindowScenes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v24 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v7, "_FBSScene");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identityToken");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = BSEqualObjects();

          if (v11)
          {
            v21 = v7;
            goto LABEL_24;
          }
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v7, "sceneManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allScenes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
LABEL_10:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "identityToken");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringRepresentation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = BSEqualObjects();

              if ((v20 & 1) != 0)
                break;
              if (v15 == ++v17)
              {
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
                if (v15)
                  goto LABEL_10;
                goto LABEL_16;
              }
            }
            v21 = v7;

            if (v21)
              goto LABEL_24;
          }
          else
          {
LABEL_16:

          }
        }
        v21 = 0;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v25)
          continue;
        break;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_24:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_sceneControllerForSBWindowScene:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "controlsScene:", v4) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      goto LABEL_26;
  }
  else
  {
LABEL_9:

  }
  SBLogKeyboardFocus();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:].cold.2();

  v13 = objc_msgSend(v4, "keyboardFocusCoalitionAffinity");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_sceneControllers;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
LABEL_15:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
      if (v13 == objc_msgSend(v19, "coalitionAffinity", (_QWORD)v22))
        break;
      if (v16 == ++v18)
      {
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v16)
          goto LABEL_15;
        goto LABEL_21;
      }
    }
    v11 = v19;

    if (v11)
      goto LABEL_26;
  }
  else
  {
LABEL_21:

  }
  SBLogKeyboardFocus();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:].cold.1();

  -[NSMutableSet anyObject](self->_sceneControllers, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v11;
}

- (void)_setNeedsArbitrationForKeyWindowNotification
{
  id v3;

  +[SBKeyboardFocusArbitrationReason keyWindowNotification](SBKeyboardFocusArbitrationReason, "keyWindowNotification");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator _setNeedsArbitrationForReason:](self, "_setNeedsArbitrationForReason:", v3);

}

- (void)_setNeedsArbitrationForReason:(id)a3
{
  -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:](self->_coalition, "setNeedsArbitrationForReason:", a3);
}

- (id)_sceneControllerForScene:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sceneControllers;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "controlsScene:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateCoalitionForSceneControllersAddedOrRemoved
{
  void *v3;
  SBKeyboardFocusCoalition *v4;
  BSInvalidatable *v5;
  void *v6;
  SBKeyboardFocusCoalition *v7;
  SBKeyboardFocusCoalition *coalition;
  BSInvalidatable *v9;
  BSInvalidatable *coalition_suppressKeyboardFocusEvaluationAssertion;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[BKSHIDEventDeliveryManager transactionAssertionWithReason:](self->_deliveryManager, "transactionAssertionWithReason:", CFSTR("Updating Coalition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_coalition;
  v5 = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
  v6 = (void *)-[NSMutableSet copy](self->_sceneControllers, "copy");
  v7 = -[_SBKeyboardFocusCoalitionFactory newCoalitionForSceneControllers:](self->_keyboardFocusCoalitionFactory, "newCoalitionForSceneControllers:", v6);
  coalition = self->_coalition;
  self->_coalition = v7;

  if (-[BSCompoundAssertion isActive](self->_suppressKeyboardFocusEvaluationAssertion, "isActive"))
  {
    -[SBKeyboardFocusCoalition suppressKeyboardFocusEvaluationForReason:](self->_coalition, "suppressKeyboardFocusEvaluationForReason:", CFSTR("SBKeyboardFocusCoordinatorRequested"));
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    coalition_suppressKeyboardFocusEvaluationAssertion = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
    self->_coalition_suppressKeyboardFocusEvaluationAssertion = v9;

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setCoalition:", self->_coalition, (_QWORD)v17);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[SBKeyboardFocusCoalition setDelegate:](self->_coalition, "setDelegate:", self);
  -[SBKeyboardFocusCoalition invalidate](v4, "invalidate");
  -[BSInvalidatable invalidate](v5, "invalidate");
  +[SBKeyboardFocusArbitrationReason didResetCoalition](SBKeyboardFocusArbitrationReason, "didResetCoalition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusCoordinator _setNeedsArbitrationForReason:](self, "_setNeedsArbitrationForReason:", v16);

  objc_msgSend(v3, "invalidate");
}

- (BOOL)_setEnforcedKeyboardFocusPolicy:(id)a3
{
  id v5;
  SBKeyboardFocusPolicy **p_enforcedPolicy;
  char v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_enforcedPolicy = &self->_enforcedPolicy;
  v7 = BSEqualObjects();
  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)p_enforcedPolicy, a3);
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[coordinator] new enforced policy: %{public}@ ", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7 ^ 1;
}

- (void)_notifyObserversExternalSceneDidAcquireFocus:(id)a3
{
  id v4;
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[BSCompoundAssertion context](self->_observers, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "keyboardFocusController:externalSceneDidAcquireFocus:", self, v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_notifyObserversFocusedWindowSceneChangedFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BSCompoundAssertion context](self->_observers, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "keyboardFocusController:didUpdateWindowSceneWithFocusFrom:to:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_callUserFocusSceneRequestCompletionBlocksIfNeeded
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_userFocusRequestRuleUpdateCompletionHandlers, "copy", 0);
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

  -[NSMutableArray removeAllObjects](self->_userFocusRequestRuleUpdateCompletionHandlers, "removeAllObjects");
}

- (BOOL)_talkToKeyboardArbiterAdvisor:(id)a3
{
  void (**v4)(id, _UIKeyboardArbiterAdvisor *);
  unsigned __int8 v5;

  v4 = (void (**)(id, _UIKeyboardArbiterAdvisor *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = atomic_load((unsigned __int8 *)&self->_arbiterDidInitialize);
  if ((v5 & 1) != 0)
    v4[2](v4, self->_keyboardArbiterAdvisor);

  return v5 & 1;
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _SBRecentlyUsedSceneIdentityCache *recentlyUsedScenes;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  _SBRecentlyUsedSceneIdentityCache *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pid");

  if ((int)v10 >= 1)
  {
    -[_SBRecentlyUsedSceneIdentityCache addSceneIdentityToken:forPID:](self->_recentlyUsedScenes, "addSceneIdentityToken:forPID:", v7, v10);
    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      recentlyUsedScenes = self->_recentlyUsedScenes;
      v13[0] = 67109634;
      v13[1] = v10;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = recentlyUsedScenes;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[coordinator] didAddExternalForegroundApplicationSceneHandle pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)v13, 0x1Cu);
    }

  }
}

- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!a5)
  {
    objc_msgSend(v8, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinator _removeSceneFromRecents:reason:](self, "_removeSceneFromRecents:reason:", v7, CFSTR("willRemoveExternalForegroundApplicationSceneHandle"));

  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v7, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v7, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinator _removeSceneFromRecents:reason:](self, "_removeSceneFromRecents:reason:", v6, CFSTR("didRemoveExternalForegroundApplicationSceneHandle"));

  }
}

- (void)_removeSceneFromRecents:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _SBRecentlyUsedSceneIdentityCache *recentlyUsedScenes;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _SBRecentlyUsedSceneIdentityCache *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "processHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pid");

  -[_SBRecentlyUsedSceneIdentityCache removeSceneIdentityToken:forPID:](self->_recentlyUsedScenes, "removeSceneIdentityToken:forPID:", v8, v11);
  SBLogKeyboardFocus();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    recentlyUsedScenes = self->_recentlyUsedScenes;
    v14 = 138413058;
    v15 = v6;
    v16 = 1024;
    v17 = v11;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = recentlyUsedScenes;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[coordinator] _removeSceneFromRecents %@ pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)&v14, 0x26u);
  }

}

- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4
{
  id v4;

  -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:](self, "_sceneControllerForSBWindowScene:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayDidBecomeActive");

}

- (id)systemUISceneRequestingFocus
{
  return self->_overlayUISceneRequestingFocus;
}

- (id)accessibilityOverrideTarget
{
  void *v2;
  void *v3;

  -[BSCompoundAssertion orderedContext](self->_accessibilityKeyboardFocusTargetOverrides, "orderedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appFocusRedirectionForProposedTarget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BSCompoundAssertion orderedContext](self->_appFocusRedirections, "orderedContext", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "fromProcessIdentifier");
        if (objc_msgSend(v4, "pid") == v10)
        {
          objc_msgSend(v9, "fromToken");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sceneIdentityToken");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v4, "sceneIdentityToken");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v11);

            if ((v15 & 1) != 0)
            {
              v6 = v9;

              goto LABEL_14;
            }
          }

        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)shouldPreventFocusForSceneWithIdentityTokenStringRepresentation:(id)a3
{
  BSCompoundAssertion *preventFocusForSceneAssertion;
  id v4;
  void *v5;
  char v6;

  preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  v4 = a3;
  -[BSCompoundAssertion context](preventFocusForSceneAssertion, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)keyboardFocusCoalitionDidUpdateEnforcedPolicy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  pid_t v10;
  void *v11;
  id v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  int v21;
  SBKeyboardFocusSceneProviding *sceneProvider;
  void *v23;
  FBScene *v24;
  FBScene *sceneWithFocusIncludingSpringBoard;
  FBScene *v26;
  FBScene *v27;
  _BOOL4 v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "enforcedPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusPolicyEnforcer enforce:](self->_policyEnforcer, "enforce:", v4);
  -[SBKeyboardFocusPolicy sbWindowSceneAncestor](self->_enforcedPolicy, "sbWindowSceneAncestor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sbWindowSceneAncestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBKeyboardFocusCoordinator _setEnforcedKeyboardFocusPolicy:](self, "_setEnforcedKeyboardFocusPolicy:", v4);
  if (!-[SBKeyboardFocusCoordinator isHandlingKeyboardArbiterSuggestion](self, "isHandlingKeyboardArbiterSuggestion"))
  {
    -[SBKeyboardFocusPolicy keyboardFocusTarget](self->_enforcedPolicy, "keyboardFocusTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pid");
    v10 = getpid();

    if (v9 != v10 || objc_msgSend(v4, "advicePolicy"))
    {
      -[SBKeyboardFocusPolicy keyboardFocusTarget](self->_enforcedPolicy, "keyboardFocusTarget");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __76__SBKeyboardFocusCoordinator_keyboardFocusCoalitionDidUpdateEnforcedPolicy___block_invoke;
      v34[3] = &unk_1E8EC1C50;
      v35 = v11;
      v12 = v11;
      -[SBKeyboardFocusCoordinator _talkToKeyboardArbiterAdvisor:](self, "_talkToKeyboardArbiterAdvisor:", v34);

    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = self->_sceneControllers;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v14)
  {
    v15 = v14;
    v28 = v7;
    v29 = v5;
    v16 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "sbWindowSceneFocusTarget");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBKeyboardFocusPolicy keyboardFocusTarget](self->_enforcedPolicy, "keyboardFocusTarget");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
        {
          v21 = 1;
          goto LABEL_15;
        }
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v15)
        continue;
      break;
    }
    v21 = 0;
LABEL_15:
    v5 = v29;
    v7 = v28;
  }
  else
  {
    v21 = 0;
  }

  if (v7)
  {
    sceneProvider = self->_sceneProvider;
    objc_msgSend(v4, "keyboardFocusTarget");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusSceneProviding sceneForFocusTarget:](sceneProvider, "sceneForFocusTarget:", v23);
    v24 = (FBScene *)objc_claimAutoreleasedReturnValue();
    sceneWithFocusIncludingSpringBoard = self->_sceneWithFocusIncludingSpringBoard;
    self->_sceneWithFocusIncludingSpringBoard = v24;

    if (objc_msgSend(v4, "advicePolicy"))
    {
      if (v21)
        v26 = 0;
      else
        v26 = self->_sceneWithFocusIncludingSpringBoard;
      v27 = self->_sceneWithFocusIncludingSpringBoard;
      -[SBKeyboardFocusCoordinator setExternalSceneWithFocus:](self, "setExternalSceneWithFocus:", v26);
      -[SBKeyboardFocusCoordinator _notifyObserversExternalSceneDidAcquireFocus:](self, "_notifyObserversExternalSceneDidAcquireFocus:", v27);

    }
  }
  -[SBKeyboardFocusCoordinator _callUserFocusSceneRequestCompletionBlocksIfNeeded](self, "_callUserFocusSceneRequestCompletionBlocksIfNeeded");
  if (v5 != v6)
    -[SBKeyboardFocusCoordinator _notifyObserversFocusedWindowSceneChangedFrom:to:](self, "_notifyObserversFocusedWindowSceneChangedFrom:to:", v5, v6);

}

void __76__SBKeyboardFocusCoordinator_keyboardFocusCoalitionDidUpdateEnforcedPolicy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "pid");
  objc_msgSend(*(id *)(a1 + 32), "sceneIdentityToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardFocusDidChangeWithoutAdvisorInputToPid:sceneIdentity:", v5, v6);

}

- (BOOL)eventDeferringManagerSystemShellBehaviorWantsLocalCompatibilityRules
{
  return 0;
}

- (BOOL)eventDeferringManagerSystemShellBehavior:(id)a3 shouldSuppressRemoteRuleForOwningElement:(id)a4 inEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  NSObject *v18;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "eventDeferringManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowHostingScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusPolicy sbWindowSceneAncestor](self->_enforcedPolicy, "sbWindowSceneAncestor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v17 = -[SBKeyboardFocusPolicy shouldSuppressRemoteDeferring](self->_enforcedPolicy, "shouldSuppressRemoteDeferring");
      goto LABEL_6;
    }
  }
  else
  {

  }
  v17 = 0;
LABEL_6:
  SBLogKeyboardFocus();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109376;
    v20[1] = v17;
    v21 = 1024;
    v22 = objc_msgSend(v9, "interfaceElementCategory");
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[coordinator] shouldSuppressRemoteRuleForOwningElement: %{BOOL}u element: %d", (uint8_t *)v20, 0xEu);
  }

  return v17;
}

- (id)additionalEnvironmentDeferralsForFocusTarget:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_focusServiceEventDeferralRequests, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  BSDispatchQueueAssertNotMain();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SBKeyboardFocusCoordinator_shouldKeyboardBeWindowSizedForHostWithIdentity___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v8 = v4;
  v9 = &v10;
  block[4] = self;
  v5 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __77__SBKeyboardFocusCoordinator_shouldKeyboardBeWindowSizedForHostWithIdentity___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 192), "enforcedPolicy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sbWindowSceneAncestor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaHostedKeyboardWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "shouldKeyboardBeWindowSizedForHostWithIdentity:", a1[5]);

}

- (void)keyboardArbiterAdvisor:(id)a3 request:(id)a4 sceneFocusChange:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t *p_eventBufferingRequestGeneration;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[SBKeyboardFocusCoordinator _handleFocusSceneChange:fromArbiter:request:](self, "_handleFocusSceneChange:fromArbiter:request:", v10, v8, v9);
  }
  else
  {
    p_eventBufferingRequestGeneration = &self->_eventBufferingRequestGeneration;
    do
      v12 = __ldaxr(p_eventBufferingRequestGeneration);
    while (__stlxr(v12 + 1, p_eventBufferingRequestGeneration));
    v13 = atomic_load(p_eventBufferingRequestGeneration);
    SBLogKeyboardFocus();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = CFSTR("background keyboard arbiter request");
      v28 = 2048;
      v29 = v13;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[coordinator] buffer all events for reason: %{public}@ <%lu>- begin", buf, 0x16u);
    }

    v15 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnvironment:", v16);

    -[BKSHIDEventDeliveryManager bufferEventsMatchingPredicate:withReason:](self->_deliveryManager, "bufferEventsMatchingPredicate:withReason:", v15, CFSTR("background keyboard arbiter request"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__SBKeyboardFocusCoordinator_keyboardArbiterAdvisor_request_sceneFocusChange___block_invoke;
    block[3] = &unk_1E8EC1C78;
    block[4] = self;
    v20 = v10;
    v21 = v8;
    v22 = v9;
    v23 = CFSTR("background keyboard arbiter request");
    v24 = v17;
    v25 = v13;
    v18 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__SBKeyboardFocusCoordinator_keyboardArbiterAdvisor_request_sceneFocusChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_handleFocusSceneChange:fromArbiter:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  SBLogKeyboardFocus();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 80);
    v6 = 138543618;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[coordinator] buffer all events for reason: %{public}@ <%lu> - end", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 72), "invalidate");
}

- (void)_handleFocusSceneChange:(id)a3 fromArbiter:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  FBScene *overlayUISceneRequestingFocus;
  void *v21;
  int v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  _BYTE v47[18];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  SBLogKeyboardFocus();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v8, "pid");
    objc_msgSend(v8, "sceneIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = v12;
    *(_WORD *)&v47[4] = 2114;
    *(_QWORD *)&v47[6] = v13;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[coordinator] handling new keyboard arbiter request pid: %d sceneIdentity: %{public}@", buf, 0x12u);

  }
  -[SBKeyboardFocusCoordinator _fixupFocusSceneRequest:](self, "_fixupFocusSceneRequest:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42700], "focusNothingChange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0D42700], "focusNothingChange");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v14, "isEqual:", v21);

    if (v22)
    {
      -[SBKeyboardFocusPolicy sbWindowSceneAncestor](self->_enforcedPolicy, "sbWindowSceneAncestor");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:](self, "_sceneControllerForSBWindowScene:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      objc_msgSend(v14, "sceneIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      -[SBKeyboardFocusCoordinator _sceneControllerHostingSceneIdentityToken:ultimateHostTarget:](self, "_sceneControllerHostingSceneIdentityToken:ultimateHostTarget:", v24, &v45);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v45;

      if (v23)
      {
        SBLogKeyboardFocus();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v47 = v17;
          *(_WORD *)&v47[8] = 2114;
          *(_QWORD *)&v47[10] = v23;
          _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[coordinator] S33KR3T target %{public}@ has an ultimate host %{public}@", buf, 0x16u);
        }

        v23 = v23;
        v17 = v23;
      }
    }

    if (!v19)
    {
      SBLogKeyboardFocus();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "[coordinator] could not find scene controller, picking one at random", buf, 2u);
      }

      -[NSMutableSet anyObject](self->_sceneControllers, "anyObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = v14;
    v27 = v8;
    SBLogKeyboardFocus();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "debugName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v47 = v29;
      *(_WORD *)&v47[8] = 2114;
      *(_QWORD *)&v47[10] = v17;
      _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "[coordinator] informing scene controller '%{public}@' of focusTarget: %{public}@", buf, 0x16u);

    }
    v30 = v17;
    v31 = v10;
    v32 = v9;

    v43 = v30;
    objc_msgSend(v19, "keyboardArbiterSuggestedFocusTarget:", v30);
    -[SBKeyboardFocusCoordinator setHandlingKeyboardArbiterSuggestion:](self, "setHandlingKeyboardArbiterSuggestion:", 1);
    +[SBKeyboardFocusArbitrationReason keyboardArbiterSuggestion](SBKeyboardFocusArbitrationReason, "keyboardArbiterSuggestion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "requestPolicyReevaluationForReason:", v33);

    -[SBKeyboardFocusCoordinator enforcedPolicy](self, "enforcedPolicy");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogKeyboardFocus();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v34, "keyboardFocusTarget");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v47 = v27;
      *(_WORD *)&v47[8] = 2114;
      *(_QWORD *)&v47[10] = v36;
      _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "[coordinator] keyboard arbiter suggested %{public}@ and we replied %{public}@", buf, 0x16u);

    }
    v37 = objc_alloc(MEMORY[0x1E0D42700]);
    objc_msgSend(v34, "keyboardFocusTarget");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sceneIdentityToken");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "keyboardFocusTarget");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v37, "initWithSceneIdentity:pid:", v39, objc_msgSend(v40, "pid"));

    v9 = v32;
    v10 = v31;
    objc_msgSend(v32, "applySceneFocusChange:forRequest:", v41, v31);
    -[SBKeyboardFocusCoordinator setHandlingKeyboardArbiterSuggestion:](self, "setHandlingKeyboardArbiterSuggestion:", 0);
    -[SBKeyboardFocusCoordinator _callUserFocusSceneRequestCompletionBlocksIfNeeded](self, "_callUserFocusSceneRequestCompletionBlocksIfNeeded");

    v8 = v27;
    v17 = v43;
    v14 = v44;
    goto LABEL_27;
  }
  objc_msgSend(v14, "sceneIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v18, objc_msgSend(v14, "pid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_10;
  -[SBKeyboardFocusSceneProviding sceneForFocusTarget:](self->_sceneProvider, "sceneForFocusTarget:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBKeyboardFocusSceneProviding isOverlayUIScene:](self->_sceneProvider, "isOverlayUIScene:", v19)
    || (overlayUISceneRequestingFocus = self->_overlayUISceneRequestingFocus) != 0
    && (-[FBScene isEqual:](overlayUISceneRequestingFocus, "isEqual:", v19) & 1) != 0)
  {

    goto LABEL_10;
  }
  SBLogKeyboardFocus();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v47 = v17;
    _os_log_impl(&dword_1D0540000, v42, OS_LOG_TYPE_DEFAULT, "[coordinator] denying request to focus OverlayUI target %{public}@ because OverlayUI hasn't requested focus!", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D42700], "focusNothingChange");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySceneFocusChange:forRequest:", v34, v10);
LABEL_27:

}

- (id)_fixupFocusSceneRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v27;
  _DWORD v28[7];

  *(_QWORD *)&v28[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = objc_msgSend(v4, "pid");
  objc_msgSend(MEMORY[0x1E0D42700], "focusNothingChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested nothing", (uint8_t *)&v27, 2u);
    }

    -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogKeyboardFocus();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v27 = 138543362;
        *(_QWORD *)v28 = v9;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[coordinator] using MRU target %{public}@", (uint8_t *)&v27, 0xCu);
      }

LABEL_22:
      v18 = objc_alloc(MEMORY[0x1E0D42700]);
      objc_msgSend(v9, "sceneIdentityToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v18, "initWithSceneIdentity:pid:", v19, objc_msgSend(v9, "pid"));

LABEL_23:
      goto LABEL_34;
    }
    if (v11)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[coordinator] no MRU scenes to fallback", (uint8_t *)&v27, 2u);
    }
    goto LABEL_31;
  }
  objc_msgSend(v4, "sceneIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(_QWORD *)((char *)&v28[1] + 2) = v9;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested pid %d / %{public}@", (uint8_t *)&v27, 0x12u);
    }

    SBLogKeyboardFocus();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(_QWORD *)((char *)&v28[1] + 2) = v9;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[coordinator] using arbiter suggested pid %d + scene: %{public}@", (uint8_t *)&v27, 0x12u);
    }

    v15 = v4;
    goto LABEL_23;
  }
  if (v13)
  {
    v27 = 67109120;
    v28[0] = v5;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested pid %d / nil scene", (uint8_t *)&v27, 8u);
  }

  -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForPID:]((uint64_t)self->_recentlyUsedScenes, v5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v9 = (void *)v16;
    SBLogKeyboardFocus();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138543362;
      *(_QWORD *)v28 = v9;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[coordinator] using arbiter requested MRU target: %{public}@", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_22;
  }
  -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
  v10 = objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v21)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "[coordinator] uh oh... no MRU scenes!", (uint8_t *)&v27, 2u);
    }

LABEL_31:
    SBLogKeyboardFocus();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "sceneIdentity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(_QWORD *)((char *)&v28[1] + 2) = v25;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "[coordinator] failed to fixup arbiter requested pid %d / %{public}@", (uint8_t *)&v27, 0x12u);

    }
    objc_msgSend(MEMORY[0x1E0D42700], "focusNothingChange");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (v21)
  {
    v27 = 138543362;
    *(_QWORD *)v28 = v10;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "[coordinator] using MRU target %{public}@", (uint8_t *)&v27, 0xCu);
  }

  v22 = objc_alloc(MEMORY[0x1E0D42700]);
  -[NSObject sceneIdentityToken](v10, "sceneIdentityToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v22, "initWithSceneIdentity:pid:", v23, -[NSObject pid](v10, "pid"));

LABEL_34:
  return v15;
}

- (NSSet)externalSceneIdentities
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExternalSceneIdentities:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (FBScene)externalSceneWithFocus
{
  return self->_externalSceneWithFocus;
}

- (void)setExternalSceneWithFocus:(id)a3
{
  objc_storeStrong((id *)&self->_externalSceneWithFocus, a3);
}

- (FBScene)sceneWithFocusIncludingSpringBoard
{
  return self->_sceneWithFocusIncludingSpringBoard;
}

- (void)setSceneWithFocusIncludingSpringBoard:(id)a3
{
  objc_storeStrong((id *)&self->_sceneWithFocusIncludingSpringBoard, a3);
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, a3);
}

- (BSInvalidatable)coalition_suppressKeyboardFocusEvaluationAssertion
{
  return self->_coalition_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setCoalition_suppressKeyboardFocusEvaluationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_coalition_suppressKeyboardFocusEvaluationAssertion, a3);
}

- (BSCompoundAssertion)preventFocusForSceneAssertion
{
  return self->_preventFocusForSceneAssertion;
}

- (void)setPreventFocusForSceneAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_preventFocusForSceneAssertion, a3);
}

- (BSCompoundAssertion)appFocusRedirections
{
  return self->_appFocusRedirections;
}

- (void)setAppFocusRedirections:(id)a3
{
  objc_storeStrong((id *)&self->_appFocusRedirections, a3);
}

- (BSCompoundAssertion)accessibilityKeyboardFocusTargetOverrides
{
  return self->_accessibilityKeyboardFocusTargetOverrides;
}

- (void)setAccessibilityKeyboardFocusTargetOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityKeyboardFocusTargetOverrides, a3);
}

- (NSMutableDictionary)focusServiceEventDeferralRequests
{
  return self->_focusServiceEventDeferralRequests;
}

- (void)setFocusServiceEventDeferralRequests:(id)a3
{
  objc_storeStrong((id *)&self->_focusServiceEventDeferralRequests, a3);
}

- (BSCompoundAssertion)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (SBKeyboardFocusCoalition)coalition
{
  return self->_coalition;
}

- (void)setCoalition:(id)a3
{
  objc_storeStrong((id *)&self->_coalition, a3);
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedPolicy, a3);
}

- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes
{
  return self->_recentlyUsedScenes;
}

- (void)setRecentlyUsedScenes:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedScenes, a3);
}

- (BOOL)isHandlingKeyboardArbiterSuggestion
{
  return self->_handlingKeyboardArbiterSuggestion;
}

- (void)setHandlingKeyboardArbiterSuggestion:(BOOL)a3
{
  self->_handlingKeyboardArbiterSuggestion = a3;
}

- (NSMutableArray)userFocusRequestRuleUpdateCompletionHandlers
{
  return self->_userFocusRequestRuleUpdateCompletionHandlers;
}

- (void)setUserFocusRequestRuleUpdateCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_userFocusRequestRuleUpdateCompletionHandlers, a3);
}

- (FBScene)overlayUISceneRequestingFocus
{
  return self->_overlayUISceneRequestingFocus;
}

- (void)setOverlayUISceneRequestingFocus:(id)a3
{
  objc_storeStrong((id *)&self->_overlayUISceneRequestingFocus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayUISceneRequestingFocus, 0);
  objc_storeStrong((id *)&self->_userFocusRequestRuleUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_recentlyUsedScenes, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_coalition, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_focusServiceEventDeferralRequests, 0);
  objc_storeStrong((id *)&self->_accessibilityKeyboardFocusTargetOverrides, 0);
  objc_storeStrong((id *)&self->_appFocusRedirections, 0);
  objc_storeStrong((id *)&self->_preventFocusForSceneAssertion, 0);
  objc_storeStrong((id *)&self->_coalition_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_sceneWithFocusIncludingSpringBoard, 0);
  objc_storeStrong((id *)&self->_externalSceneWithFocus, 0);
  objc_storeStrong((id *)&self->_externalSceneIdentities, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterAdvisor, 0);
  objc_storeStrong((id *)&self->_visibilityGraphNavigator, 0);
  objc_storeStrong((id *)&self->_inputUISceneController, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoalitionFactory, 0);
  objc_storeStrong((id *)&self->_keyboardFocusSceneControllerFactory, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

- (void)windowSceneDidConnect:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)windowSceneDidDisconnect:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[coordinator] error: bufferEventsForSpringBoardScene for reason %{public}@ with nil scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)removeKeyboardFocusFromScene:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)userFocusRequestForScene:reason:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)userFocusRequestForScene:reason:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)userFocusRequestForScene:reason:completion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1D0540000, v1, OS_LOG_TYPE_ERROR, "[coordinator] userFocusRequestForScene(%{public}@): process doesn't exist for scene:%{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)redirectFocusForReason:(int)a1 fromProcessIdentifier:(NSObject *)a2 fromSceneIdentityToken:toProcessidentifier:toSceneIdentityToken:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Focus rule set with pid %d and no token; PID-only rules are not valid",
    (uint8_t *)v2,
    8u);
}

- (void)focusLockSpringBoardWindow:forReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)focusLockSpringBoardWindow:forReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[coordinator] error: focusLockSpringBoardWindowScene for reason %{public}@ with nil scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(const char *)a1 forAccessibilityReason:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "could not find scene for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(const char *)a1 forAccessibilityReason:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_sbWindowSceneHostingFBSSceneIdentityToken:(void *)a1 ultimateHostTarget:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Couldn't find the SB window scene hosting scene identity token: %{public}@", v4, 0xCu);

}

- (void)_sceneControllerForSBWindowScene:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[coordinator] couldn't find scene controller for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_sceneControllerForSBWindowScene:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[coordinator] could not find %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
