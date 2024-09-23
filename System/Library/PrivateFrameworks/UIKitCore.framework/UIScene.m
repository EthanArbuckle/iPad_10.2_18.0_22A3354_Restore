@implementation UIScene

- (UISceneActivationState)activationState
{
  void *v3;
  UISceneActivationState v4;

  if (!_uiScenes || !objc_msgSend((id)_uiScenes, "containsObject:", self))
    return -1;
  if (!-[UIScene _hasLifecycle](self, "_hasLifecycle"))
    return 0;
  -[UIScene _lifecycleMonitor](self, "_lifecycleMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentActivationState");

  return v4;
}

- (BOOL)_hasLifecycle
{
  return self->_lifecycleMonitor != 0;
}

- (_UISceneLifecycleMonitor)_lifecycleMonitor
{
  return self->_lifecycleMonitor;
}

+ (int64_t)_activationStateFromSceneSettings:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (_UISceneLifecycleStateIsSEO(v3))
      v5 = objc_msgSend(v4, "underLock");
    else
      v5 = 0;
    if ((objc_msgSend(v4, "isForeground") & 1) != 0
      || ((_UISceneLifecycleStateIsSEO(v4) ^ 1 | v5) & 1) == 0)
    {
      v6 = (objc_msgSend(v4, "deactivationReasons") & 0xFFFFFFFFFFFFFEFFLL) != 0;
    }
    else
    {
      v6 = 2;
    }
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

uint64_t __36__UIScene__scenesIncludingInternal___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if ((objc_msgSend(v3, "_isInternal") & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_implicitSceneFilterClass");
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_isInternal
{
  return *((_BYTE *)&self->_sceneFlags + 1) & 1;
}

- (BOOL)_affectsAppLifecycleIfInternal
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 1) & 1;
}

- (BOOL)_canDynamicallySpecifySupportedInterfaceOrientations
{
  void *v2;
  BOOL v3;

  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientationMode") == 1;

  return v3;
}

- (id)_sceneComponentForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_registeredComponents, "objectForKey:", a3);
}

- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent
{
  return (_UIFocusSystemSceneComponent *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIFocusSystemSceneComponentKey);
}

- (_UIPhysicalButtonInteractionArbiter)_existingPhysicalButtonInteractionArbiter
{
  return (_UIPhysicalButtonInteractionArbiter *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIPhysicalButtonInteractionArbiterComponentKey"));
}

- (BOOL)_hasInvalidated
{
  return *((unsigned __int8 *)&self->_sceneFlags + 1) >> 7;
}

- (UISceneSession)session
{
  return self->_session;
}

- (_UIApplicationSceneDisplayClientComponent)_displayClientComponent
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIApplicationSceneDisplayClientComponent *)v4;
}

- (UIApplicationSceneSettings)_effectiveUISettings
{
  id v2;
  void *v3;

  v2 = __UISceneEffectiveSettings((uint64_t)self);
  if (objc_msgSend(v2, "isUISubclass"))
    v3 = v2;
  else
    v3 = 0;
  return (UIApplicationSceneSettings *)v3;
}

+ (void)_enumerateAllWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 withBlock:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)objc_msgSend(a1, "_unsafeScenesIncludingInternal");
  if (v10 && v11)
  {
    if (v6)
      v12 = (id)objc_msgSend(v11, "copy");
    else
      v12 = v11;
    v13 = v12;
    objc_msgSend(a1, "_implicitSceneFilterClass");
    v24 = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
LABEL_8:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", v8, v7, v6, &v24, v10, (_QWORD)v20);
          if (v24)
            break;
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v16)
            goto LABEL_8;
          break;
        }
      }
    }

  }
}

+ (Class)_implicitSceneFilterClass
{
  void *v3;
  int v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isSubclassOfClass:", v3);

  if (v4)
    a1 = (id)objc_opt_self();
  return (Class)a1;
}

+ (void)_unsafeScenesIncludingInternal
{
  return (void *)_uiScenes;
}

void __37__UIScene__initializeSceneComponents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_UISceneComponentClassPredicate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "evaluateWithObject:", v10);

        if (v11)
        {
          v12 = (objc_class *)(id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_UISceneComponentClass"));
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_UISceneComponentKeyname"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 32);
          v15 = (void *)objc_msgSend([v12 alloc], "initWithScene:", v14);
          objc_msgSend(v14, "_registerSceneComponent:forKey:", v15, v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

void __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_3(uint64_t a1, void *a2, objc_class *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v5 = a2;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDE320F0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("UIScene.m"), 1427, CFSTR("class: \"%@\" included in component class dictionary of %@ but does not conform to _UISceneComponentProviding!"), v9, v11);

  }
  v12 = (id)objc_msgSend([a3 alloc], "initWithScene:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_registerSceneComponent:forKey:", v12, v5);

}

- (void)_registerSceneComponent:(id)a3 forKey:(id)a4
{
  NSDictionary *registeredComponents;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *v13;
  id v14;

  registeredComponents = self->_registeredComponents;
  v7 = a4;
  v8 = a3;
  v9 = (void *)-[NSDictionary mutableCopy](registeredComponents, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v14 = v11;

  objc_msgSend(v14, "setObject:forKey:", v8, v7);
  v12 = (NSDictionary *)objc_msgSend(v14, "copy");
  v13 = self->_registeredComponents;
  self->_registeredComponents = v12;

  -[UIScene _calculateFlattenedDiffActions](self, "_calculateFlattenedDiffActions");
  -[UIScene _calculateFlattenedBSActionResponders](self, "_calculateFlattenedBSActionResponders");
  objc_msgSend(v8, "_setScene:", self);

}

- (void)_calculateFlattenedBSActionResponders
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  NSDictionary *additionalBSActionResponders;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSArray *v18;
  NSArray *flattenedBSActionResponders;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSArray mutableCopy](self->_initialSceneBSActionHandlers, "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSDictionary allValues](self->_registeredComponents, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "_actionHandlersForScene:", self);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            continue;
          objc_msgSend(v9, "_actionRespondersForScene:", self);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
        objc_msgSend(v3, "addObjectsFromArray:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  additionalBSActionResponders = self->_additionalBSActionResponders;
  if (additionalBSActionResponders)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSDictionary allValues](additionalBSActionResponders, "allValues", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

  }
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_finalSceneBSActionHandlers);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  flattenedBSActionResponders = self->_flattenedBSActionResponders;
  self->_flattenedBSActionResponders = v18;

  -[UIScene _calculateFlattenedBSActionSubstitutionProviders](self, "_calculateFlattenedBSActionSubstitutionProviders");
}

- (void)_calculateFlattenedDiffActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSDictionary *additionalSettingsDiffActions;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSArray *v17;
  NSArray *flattenedDiffActions;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSArray mutableCopy](self->_initialSettingsDiffActions, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSDictionary allValues](self->_registeredComponents, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "_settingsDiffActionsForScene:", self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  if (additionalSettingsDiffActions)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSDictionary allValues](additionalSettingsDiffActions, "allValues", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

  }
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_finalSettingsDiffActions);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  flattenedDiffActions = self->_flattenedDiffActions;
  self->_flattenedDiffActions = v17;

}

- (void)_calculateFlattenedBSActionSubstitutionProviders
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *flattenedBSActionSubstitutionProvidersByActionType;
  _QWORD v13[4];
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_flattenedBSActionResponders;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "_UIActionTypesForSubstitution");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __59__UIScene__calculateFlattenedBSActionSubstitutionProviders__block_invoke;
          v13[3] = &unk_1E16B2978;
          v14 = v3;
          v15 = v9;
          objc_msgSend(v10, "enumerateIndexesUsingBlock:", v13);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = (NSDictionary *)objc_msgSend(v3, "copy");
  flattenedBSActionSubstitutionProvidersByActionType = self->_flattenedBSActionSubstitutionProvidersByActionType;
  self->_flattenedBSActionSubstitutionProvidersByActionType = v11;

}

- (id)_backlightSceneEnvironment
{
  void *v2;
  void *v3;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backlightSceneEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __78__UIScene__emitSceneSettingsUpdateResponseForCompletion_afterSceneUpdateWork___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 216) |= 0x20000u;
  v2 = *(id *)(a1 + 40);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 216) &= ~0x20000u;
}

uint64_t __36__UIScene__scenesIncludingInternal___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_implicitSceneFilterClass");
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

+ (id)_scenesIncludingInternal:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];

  v3 = a3;
  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)_uiScenes;
  if (!_uiScenes)
    return MEMORY[0x1E0C9AA60];
  if (!v3)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__UIScene__scenesIncludingInternal___block_invoke_2;
    v12[3] = &__block_descriptor_41_e34_B24__0__UIScene_8__NSDictionary_16l;
    v13 = v5 == a1;
    v12[4] = a1;
    v8 = v12;
    goto LABEL_7;
  }
  if (v5 != a1)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__UIScene__scenesIncludingInternal___block_invoke;
    v14[3] = &__block_descriptor_40_e37_B24__0___NSObject__8__NSDictionary_16l;
    v14[4] = a1;
    v8 = v14;
LABEL_7:
    objc_msgSend(v7, "predicateWithBlock:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  return (id)objc_msgSend((id)_uiScenes, "copy");
}

+ (void)_synchronizeDrawing
{
  +[UIWindow _synchronizeDrawingWithPreCommitHandler:](UIWindow, "_synchronizeDrawingWithPreCommitHandler:", 0);
}

uint64_t __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  $9341EDE2B60720950DEE76519EAE5484 sceneFlags;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sceneFlags = self->_sceneFlags;
  if ((*(_WORD *)&sceneFlags & 0x4000) == 0)
  {
    self->_sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&sceneFlags | 0x4000);
    if (!-[UIScene _subclassTracksWindowsNeedingDeferredInitialUpdates](self, "_subclassTracksWindowsNeedingDeferredInitialUpdates"))
    {
      if (-[UIScene _hostsWindows](self, "_hostsWindows"))
      {
        v11 = 0u;
        v12 = 0u;
        v9 = 0u;
        v10 = 0u;
        -[UIScene _allWindows](self, "_allWindows", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v10;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v10 != v7)
                objc_enumerationMutation(v4);
              objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_executeDeferredOrientationUpdate");
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          }
          while (v6);
        }

      }
    }
  }
}

- (_UIEventDeferringManager)_eventDeferringManager
{
  UIScene *v3;
  UIScene *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  _UIEventDeferringManager *v10;
  UIScene *v12;
  UIScene *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  UIScene *v18;
  UIScene *v19;
  UIScene *v20;
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
  objc_class *v33;
  const char *Name;
  unint64_t v35;
  NSObject *v36;
  int v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  UIScene *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!_UIEventDeferringManagerIsAvailableForScene(self))
    return (_UIEventDeferringManager *)0;
  v3 = self;
  v4 = v3;
  if (!+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
    goto LABEL_8;
  v5 = -[UIScene _hasSettingsScene](v3, "_hasSettingsScene");
  v6 = objc_msgSend((id)UIApp, "isFrontBoard");
  -[UIScene _screen](v3, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  v9 = v8 == 3 ? 0 : v6;
  if (!v5)
  {
    v4 = v3;
    if (!v9)
    {
LABEL_8:
      if (v4)
        goto LABEL_9;
LABEL_38:
      v33 = (objc_class *)objc_opt_class();
      Name = class_getName(v33);
      v35 = _eventDeferringManager___s_category;
      if (!_eventDeferringManager___s_category)
      {
        v35 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v35, (unint64_t *)&_eventDeferringManager___s_category);
      }
      v36 = *(NSObject **)(v35 + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = 136315650;
        v38 = "-[UIScene(EventDeferring) _eventDeferringManager]";
        v39 = 2082;
        v40 = Name;
        v41 = 2050;
        v42 = v3;
        _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "%s: No viable event deferring manager found for scene, returning nil: <%{public}s: %{public}p>", (uint8_t *)&v37, 0x20u);
      }
      v10 = 0;
      goto LABEL_43;
    }
  }
  if (-[UIScene _allowsEventUIWindowRouting](v3, "_allowsEventUIWindowRouting"))
    v12 = v3;
  else
    v12 = 0;
  v13 = v12;
  -[UIScene _sceneForKeyboardDisplay](v13, "_sceneForKeyboardDisplay");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v4 = v3;
  if (v13)
  {
    v4 = v3;
    if (v13 == (UIScene *)v14)
    {
      +[UIWindowScene _keyWindowScene]();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v5)
      {
        -[UIScene _settingsScene](v3, "_settingsScene");
        v18 = (UIScene *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 == v13)
        {
          v20 = 0;
        }
        else if (_UIEventDeferringManagerIsAvailableForScene(v18))
        {
          v20 = v19;
        }
        else
        {
          v20 = 0;
        }
        v4 = v20;

      }
      else
      {
        if (v16)
          v21 = v6;
        else
          v21 = 0;
        v4 = v3;
        if (v21 != 1)
          goto LABEL_36;
        -[UIScene _screen](v13, "_screen");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "screen");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 == v23)
          goto LABEL_46;
        -[UIScene _screen](v13, "_screen");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "rootIdentity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "screen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "displayConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "rootIdentity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v28) = objc_msgSend(v27, "isEqual:", v31);
        if ((_DWORD)v28)
        {
LABEL_46:
          if (_UIEventDeferringManagerIsAvailableForScene(v17))
            v32 = v17;
          else
            v32 = 0;
        }
        else
        {
          v32 = 0;
        }
        v4 = v32;
        v19 = v3;
      }

LABEL_36:
    }
  }

  if (!v4)
    goto LABEL_38;
LABEL_9:
  -[UIScene _sceneComponentForKey:](v4, "_sceneComponentForKey:", _UIEventDeferringSceneComponentKey);
  v10 = (_UIEventDeferringManager *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = -[_UIEventDeferringManager initWithScene:]([_UIEventDeferringManager alloc], "initWithScene:", v4);
    -[UIScene _registerSceneComponent:forKey:](v4, "_registerSceneComponent:forKey:", v10, _UIEventDeferringSceneComponentKey);
  }
LABEL_43:

  return v10;
}

- (BOOL)_hasSettingsScene
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsScene);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)_hostsWindows
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 4) & 1;
}

- (FBSScene)_FBSScene
{
  return self->_scene;
}

- (UIScene)_settingsScene
{
  void *WeakRetained;
  void *v4;
  UIScene *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsScene);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (void)_synchronizeDrawingWithFence:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIScene _shouldAllowFencing](self, "_shouldAllowFencing"))
    +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", v4);

}

+ (id)_synchronizeDrawingAndReturnFence
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_synchronizedDrawingFence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CAFenceHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v2, "invalidate");
  return v4;
}

+ (BKSAnimationFenceHandle)_synchronizedDrawingFence
{
  void *v2;

  if ((objc_msgSend((id)UIApp, "_isActivating") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend((id)UIApp, "_systemAnimationFenceCreatingIfNecessary:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      +[UIWindow _synchronizeDrawingWithFence:preCommitHandler:](UIWindow, "_synchronizeDrawingWithFence:preCommitHandler:", v2, 0);
  }
  return (BKSAnimationFenceHandle *)v2;
}

+ (void)_synchronizeDrawingWithFence:(id)a3
{
  +[UIWindow _synchronizeDrawingWithFence:preCommitHandler:](UIWindow, "_synchronizeDrawingWithFence:preCommitHandler:", a3, 0);
}

- (void)_setIsRespondingToLifecycleEvent:(BOOL)a3
{
  self->_respondingToLifecycleEvent = a3;
}

- (BOOL)_isRespondingToLifecycleEvent
{
  return self->_respondingToLifecycleEvent;
}

- (NSString)_persistenceIdentifier
{
  NSString *persistenceIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  persistenceIdentifier = self->_persistenceIdentifier;
  if (!persistenceIdentifier)
  {
    -[UIScene session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_persistenceIdentifier;
    self->_persistenceIdentifier = v5;

    persistenceIdentifier = self->_persistenceIdentifier;
    if (!persistenceIdentifier)
    {
      -[UIScene _FBSScene](self, "_FBSScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uiSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistenceIdentifier");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_persistenceIdentifier;
      self->_persistenceIdentifier = v9;

      persistenceIdentifier = self->_persistenceIdentifier;
    }
  }
  return persistenceIdentifier;
}

- (NSString)_sceneIdentifier
{
  NSString *sceneIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  sceneIdentifier = self->_sceneIdentifier;
  if (!sceneIdentifier)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sceneIdentifier;
    self->_sceneIdentifier = v5;

    sceneIdentifier = self->_sceneIdentifier;
    if (!sceneIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_sceneIdentifier;
      self->_sceneIdentifier = v8;

      sceneIdentifier = self->_sceneIdentifier;
    }
  }
  return sceneIdentifier;
}

- (BOOL)_shouldAllowFencing
{
  void *v4;
  char v5;

  if (!-[UIScene _hostsWindows](self, "_hostsWindows")
    || -[UIScene _isReadyForSuspension](self, "_isReadyForSuspension"))
  {
    return 0;
  }
  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isForeground");

  return v5;
}

- (id)delegate
{
  return self->_delegate;
}

- (UIApplicationSceneClientSettings)_effectiveUIClientSettings
{
  id v2;
  void *v3;

  v2 = __UISceneEffectiveClientSettings((id *)&self->super.super.isa);
  if (objc_msgSend(v2, "isUISubclass"))
    v3 = v2;
  else
    v3 = 0;
  return (UIApplicationSceneClientSettings *)v3;
}

- (void)_systemShellOwnsInterfaceOrientation
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(result, "_effectiveUISettings");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "interfaceOrientationMode");

    return (void *)((unint64_t)(v2 - 1) < 2);
  }
  return result;
}

- (id)_fixupInheritedClientSettings:(id)a3
{
  return a3;
}

+ (id)_sceneForFBSScene:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_sceneForFBSScene:create:withSession:connectionOptions:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_implicitSceneFilterClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)_sceneForFBSScene:(id)a3 create:(BOOL)a4 withSession:(id)a5 connectionOptions:(id)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  BOOL v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  SEL v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD aBlock[4];
  id v73;
  id v74;
  SEL v75;
  id v76;
  _QWORD v77[4];
  id v78;
  BOOL v79;
  _QWORD v80[4];
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v8 = a4;
  v83 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v14 = (void *)_uiScenes;
    v15 = (void *)MEMORY[0x1E0CB3880];
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke;
    v80[3] = &unk_1E16B27E0;
    v16 = v11;
    v81 = v16;
    objc_msgSend(v15, "predicateWithBlock:", v80);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "firstObject");
    v19 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = 1;
    else
      v20 = !v8;
    if (v20)
    {
LABEL_32:

      goto LABEL_33;
    }
    v67 = v18;
    objc_msgSend(v16, "specification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)objc_msgSend(v21, "uiSceneMinimumClass"), "isSubclassOfClass:", a1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass((Class)objc_msgSend(v21, "uiSceneMinimumClass"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass((Class)a1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScene.m"), 1395, CFSTR("Attempting to initialize instance with a scene specification without a valid minimumClass (is %@, should be %@)"), v54, v55);

    }
    objc_msgSend(v12, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_msgSend(v22, "sceneClass");
    if (!v23)
      v23 = (objc_class *)objc_msgSend(v21, "uiSceneMinimumClass");

    if ((-[objc_class isSubclassOfClass:](v23, "isSubclassOfClass:", objc_msgSend(v21, "uiSceneMinimumClass")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(v23);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "role");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass((Class)objc_msgSend(v21, "uiSceneMinimumClass"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScene.m"), 1399, CFSTR("description specified a class of %@, but systemType %@ requires a minimum class of %@"), v64, v56, v57);

    }
    if ((-[objc_class isSubclassOfClass:](v23, "isSubclassOfClass:", a1) & 1) != 0)
    {
      if (v13)
      {
LABEL_14:
        v63 = v13;
        v24 = (void *)objc_msgSend([v23 alloc], "initWithSession:connectionOptions:", v12, v13);
        v25 = v12;
        objc_msgSend(v12, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = a2;
        if (UIApp)
          v28 = objc_msgSend(*(id *)(UIApp + 248), "count") != 0;
        else
          v28 = 0;
        v29 = MEMORY[0x1E0C809B0];
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_2;
        v77[3] = &unk_1E16B2808;
        v65 = v26;
        v78 = v65;
        v79 = v28;
        objc_msgSend(v24, "_updateUIClientSettingsWithBlock:", v77);
        aBlock[0] = v29;
        aBlock[1] = 3221225472;
        aBlock[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_3;
        aBlock[3] = &unk_1E16B2830;
        v75 = v27;
        v76 = a1;
        v30 = v21;
        v73 = v30;
        v19 = v24;
        v74 = v19;
        v31 = _Block_copy(aBlock);
        objc_msgSend(v30, "coreSceneComponentClassDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v31);

        objc_msgSend(v30, "baseSceneComponentClassDictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v31;
        objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v31);

        objc_msgSend(v19, "_initializeSceneComponents");
        objc_msgSend(v30, "connectionHandlers");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        v12 = v25;
        v13 = v63;
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v69 != v37)
                objc_enumerationMutation(v34);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i) + 16))();
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
          }
          while (v36);
        }
        +[_UICanvasUserActivityManager _userActivityManagerForScene:](_UICanvasUserActivityManager, "_userActivityManagerForScene:", v19);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_readySceneForConnection");
        objc_msgSend(v16, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19[216] & 2) != 0)
        {
          kdebug_trace();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v41 = v19;
          else
            v41 = 0;
          v42 = v41;
          if (v41)
          {
            v43 = v42;
            v61 = v39;
            v44 = v40;
            v45 = _UISetCurrentFallbackEnvironment(v42);
            objc_msgSend(v19, "delegate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "scene:willConnectToSession:options:", v19, v12, v63);

            v47 = (void *)v45;
            v40 = v44;
            v39 = v61;
            _UIRestorePreviousFallbackEnvironment(v47);
          }
          else
          {
            objc_msgSend(v19, "delegate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "scene:willConnectToSession:options:", v19, v12, v63);

          }
        }
        kdebug_trace();
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "postNotificationName:object:", CFSTR("UISceneWillConnectNotification"), v19);

        objc_msgSend(v19, "_performDeferredInitialWindowUpdateForConnection");
        objc_msgSend(v19, "session");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_setScene:", v19);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "postNotificationName:object:", CFSTR("UICanvasDidConnectNotification"), v19);

        objc_msgSend(v63, "performPostConnectionCleanup");
        v18 = v67;
        goto LABEL_32;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScene.m"), 1400, CFSTR("Called %@, on class of %@, but attempted to construct a UIScene instance of class %@"), v59, a1, v23);

      if (v13)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScene.m"), 1401, CFSTR("UISceneConnectionOptions cannot be nil when creating a new UIScene!"));

    goto LABEL_14;
  }
  v19 = 0;
LABEL_33:

  return v19;
}

- (void)_initializeSceneComponents
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__UIScene__initializeSceneComponents__block_invoke;
  v2[3] = &unk_1E16B2408;
  v2[4] = self;
  __UISceneAccessClassComponentArray(0, v2);
}

- (BOOL)_isSuspendedUnderLock
{
  void *v2;
  char v3;

  -[UIScene _effectiveSettings](self, "_effectiveSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "underLock");

  return v3;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  UIScene *v7;
  UIScene *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  UIScene *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v4 = a4;
  v5 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
    v7 = self;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isUISubclass");

    if (v11)
    {
      objc_msgSend(v9, "uiSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceStyle");

      if (v5 && -[UIScene _pushesTraitCollectionToScreen](self, "_pushesTraitCollectionToScreen"))
      {
        -[UIScene _screen](v8, "_screen");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setUserInterfaceStyleIfNecessary:firstTimeOnly:", v13, 0);

      }
      v15 = _MergedGlobals_33;
      if (!_MergedGlobals_33)
      {
        v15 = __UILogCategoryGetNode("InterfaceStyle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_MergedGlobals_33);
      }
      v16 = *(id *)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v17 = CFSTR("Push");
        else
          v17 = CFSTR("Not push");
        if (self)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = self;
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v19);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = CFSTR("(nil)");
        }
        v27 = v22;
        -[UIScene _persistenceIdentifier](self, "_persistenceIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = (id)v17;
        v43 = 2050;
        v44 = v13;
        v45 = 2114;
        v46 = v22;
        v47 = 2114;
        v48 = v28;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ traits update to screen for new style %{public}ld, %{public}@ (%{public}@)", buf, 0x2Au);

      }
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[UIScene _allWindows](self, "_allWindows");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (v4)
          {
            -[UIScene _traitCollection](v8, "_traitCollection");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_parentWillTransitionToTraitCollection:", v35);

          }
          objc_msgSend(v34, "_updateWindowTraits");
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v31);
    }

  }
  else
  {
    v23 = qword_1ECD791E8;
    if (!qword_1ECD791E8)
    {
      v23 = __UILogCategoryGetNode("TraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&qword_1ECD791E8);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      *(_DWORD *)buf = 138543362;
      v42 = (id)objc_opt_class();
      v26 = v42;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Can't update scene traits, %{public}@ does not conform to _UISceneUIWindowHosting", buf, 0xCu);

    }
  }

}

- (BOOL)_sceneSessionRoleIsCarPlayOrNonInteractiveExternal
{
  void *v3;
  void *v4;
  BOOL v5;
  UIScene *v6;
  void *v7;

  -[UIScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleCarPlay")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (-[UIScene _hostsWindows](self, "_hostsWindows"))
      v6 = self;
    else
      v6 = 0;
    -[UIScene _traitCollection](v6, "_traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "userInterfaceIdiom") == 3;

  }
  return v5;
}

- (BOOL)_pushesTraitCollectionToScreen
{
  return (*((_BYTE *)&self->_sceneFlags + 1) & 1) == 0;
}

void __59__UIScene__calculateFlattenedBSActionSubstitutionProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (id)nextResponder
{
  return (id)UIApp;
}

- (_UIApplicationSceneKeyboardClientComponent)_keyboardClientComponent
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIApplicationSceneKeyboardClientComponent *)v4;
}

- (void)_emitSceneSettingsUpdateResponseForCompletion:(id)a3 afterSceneUpdateWork:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSMutableDictionary *postSettingsUpdateResponseBlocks;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  postSettingsUpdateResponseBlocks = self->_postSettingsUpdateResponseBlocks;
  if (!postSettingsUpdateResponseBlocks)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_postSettingsUpdateResponseBlocks;
    self->_postSettingsUpdateResponseBlocks = v9;

  }
  if (v7)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v13 = (void *)_UISetCurrentFallbackEnvironment(self);
      v7[2](v7);
      _UIRestorePreviousFallbackEnvironment(v13);
    }
    else
    {
      v7[2](v7);
    }
  }
  v14 = (id)MEMORY[0x1E0C9AA60];
  if (!postSettingsUpdateResponseBlocks)
  {
    v15 = self->_postSettingsUpdateResponseBlocks;
    v16 = self->_postSettingsUpdateResponseBlocks;
    self->_postSettingsUpdateResponseBlocks = 0;

    *(_DWORD *)&self->_sceneFlags |= 0x20000u;
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("_UIScenePostSettingsUpdateResponsePhaseDefault"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v17);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i) + 16))();
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v18);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("_UIScenePostSettingsUpdateResponsePhaseSnapshot"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v21);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j) + 16))();
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v22);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("_UIScenePostSettingsUpdateResponsePhaseContextMutation"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v25);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k) + 16))();
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v26);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("_UIScenePostSettingsUpdateResponsePhaseScreenDisconnect"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v42;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v29);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * m) + 16))();
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v30);
    }

    *(_DWORD *)&self->_sceneFlags &= ~0x20000u;
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("_UIScenePostSettingsUpdateResponsePhaseAfterCommit"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = (void *)v33;
    else
      v35 = v14;
    v14 = v35;

  }
  v36 = (void *)UIApp;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __78__UIScene__emitSceneSettingsUpdateResponseForCompletion_afterSceneUpdateWork___block_invoke;
  v38[3] = &unk_1E16B1B50;
  v38[4] = self;
  v37 = v14;
  v39 = v37;
  objc_msgSend(v36, "_performBlockAfterCATransactionCommits:", v38);

  objc_destroyWeak(&location);
}

- (void)_setCachedInterfaceOrientation:(id)a3
{
  objc_storeStrong((id *)&self->__cachedInterfaceOrientation, a3);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 fromTransitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
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
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    -[UIScene _prepareCommonStateForActionRespondingFromTransitionContext:](self, "_prepareCommonStateForActionRespondingFromTransitionContext:", v10);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIScene _sceneBSActionResponders](self, "_sceneBSActionResponders", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
LABEL_4:
      v15 = 0;
      v16 = v9;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "_respondToActions:forFBSScene:inUIScene:fromTransitionContext:", v16, v8, self, v10);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "count"))
          break;
        ++v15;
        v16 = v9;
        if (v13 == v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (NSArray)_settingsDiffActions
{
  return self->_flattenedDiffActions;
}

- (id)_actionsWithSubstitutionsForTransitionActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  NSDictionary *flattenedBSActionSubstitutionProvidersByActionType;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v11 = 0;
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        flattenedBSActionSubstitutionProvidersByActionType = self->_flattenedBSActionSubstitutionProvidersByActionType;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "UIActionType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](flattenedBSActionSubstitutionProvidersByActionType, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v18)
        {
          v19 = v18;
          v30 = v11;
          v20 = *(_QWORD *)v32;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v32 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "_substituteActionsForAction:forFBSScene:inUIScene:fromTransitionContext:", v13, v9, self, v10);
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = (void *)v22;
                v11 = v30;
                if (!v30)
                  v11 = (void *)objc_msgSend(obj, "mutableCopy");
                objc_msgSend(v11, "removeObject:", v13);
                objc_msgSend(v11, "unionSet:", v23);

                goto LABEL_18;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v19)
              continue;
            break;
          }
          v11 = v30;
        }
LABEL_18:

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }
  if (v11)
    v24 = v11;
  else
    v24 = obj;
  v25 = v24;

  return v25;
}

- (_UIKeyWindowSceneObserver)_keyWindowSceneObserver
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _UIKeyWindowSceneObserverForScene(self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_UIKeyWindowSceneObserver *)v3;
}

- (NSArray)_sceneBSActionResponders
{
  return self->_flattenedBSActionResponders;
}

- (void)_prepareCommonStateForActionRespondingFromTransitionContext:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "isUISubclass");
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "pasteSharingToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      +[UIPasteboard setPasteSharingTokenFromOpenURL:](UIPasteboard, "setPasteSharingTokenFromOpenURL:", v5);

    v4 = v6;
  }

}

- (void)_enqueuePostSettingsUpdateResponseBlock:(id)a3 inPhase:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  int has_internal_diagnostics;
  int v9;
  NSMutableDictionary *postSettingsUpdateResponseBlocks;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if ((*((_BYTE *)&self->_sceneFlags + 2) & 2) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Attempted to enqueue post settings update response block while processing current response blocks", v26, 2u);
      }

    }
    else
    {
      v17 = qword_1ECD791F0;
      if (!qword_1ECD791F0)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD791F0);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Attempted to enqueue post settings update response block while processing current response blocks", buf, 2u);
      }
    }
  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = pthread_main_np();
  if (has_internal_diagnostics)
  {
    if (v9 != 1)
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Attempting to enqueue a post settings update response block from a background thread.", v24, 2u);
      }

    }
  }
  else if (v9 != 1)
  {
    v20 = qword_1ECD791F8;
    if (!qword_1ECD791F8)
    {
      v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1ECD791F8);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Attempting to enqueue a post settings update response block from a background thread.", v23, 2u);
    }
  }
  postSettingsUpdateResponseBlocks = self->_postSettingsUpdateResponseBlocks;
  if (postSettingsUpdateResponseBlocks)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](postSettingsUpdateResponseBlocks, "objectForKeyedSubscript:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;

    v15 = _Block_copy(v6);
    objc_msgSend(v14, "arrayByAddingObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_postSettingsUpdateResponseBlocks, "setObject:forKeyedSubscript:", v16, v7);
  }
  else
  {
    v6[2](v6);
  }

}

- (NSArray)_sceneComponents
{
  return -[NSDictionary allValues](self->_registeredComponents, "allValues");
}

- (void)_updateUIClientSettingsWithBlock:(id)a3
{
  -[FBSScene updateUIClientSettingsWithBlock:](self->_scene, "updateUIClientSettingsWithBlock:", a3);
}

- (BOOL)_isConnecting
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 3) & 1;
}

- (void)_updateUIClientSettingsWithUITransitionBlock:(id)a3
{
  id v5;
  FBSScene *scene;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScene.m"), 808, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updaterBlock"));

  }
  scene = self->_scene;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UIScene__updateUIClientSettingsWithUITransitionBlock___block_invoke;
  v9[3] = &unk_1E16B2738;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v7 = v5;
  -[FBSScene updateUIClientSettingsWithTransitionBlock:](scene, "updateUIClientSettingsWithTransitionBlock:", v9);

}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0D232C0]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __56__UIScene__scheduleSceneEventResponseWithResponseBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[28];
  if (v3)
  {
    v5 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    v4 = (void *)UIApp;
    objc_msgSend(v2, "_FBSScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scheduleSceneEventResponseForScene:withResponseBlock:");
  }

}

- (BOOL)_isActive
{
  void *v2;
  char IsForegroundActive;

  -[UIScene _effectiveSettings](self, "_effectiveSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v2);

  return IsForegroundActive;
}

- (BOOL)_isSuspendedEventsOnly
{
  void *v2;
  char IsSEO;

  -[UIScene _effectiveSettings](self, "_effectiveSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSEO = _UISceneLifecycleStateIsSEO(v2);

  return IsSEO;
}

- (void)_setSettingsScene:(id)a3
{
  UIScene *WeakRetained;
  void *v5;
  id v6;
  UIScene *v7;
  id v8;
  UIScene *v9;

  v9 = (UIScene *)a3;
  WeakRetained = (UIScene *)objc_loadWeakRetained((id *)&self->_settingsScene);

  if (WeakRetained != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("_UISceneWillChangeSettingsSceneNotification"), self);
    v6 = objc_loadWeakRetained((id *)&self->_settingsScene);
    objc_msgSend(v6, "_removeInheritingScene:", self);

    if (v9 == self)
      v7 = 0;
    else
      v7 = v9;
    v8 = objc_storeWeak((id *)&self->_settingsScene, v7);
    -[UIScene _addInheritingScene:](v7, "_addInheritingScene:", self);

    objc_msgSend(v5, "postNotificationName:object:", CFSTR("_UISceneDidChangeSettingsSceneNotification"), self);
  }

}

- (void)_addInheritingScene:(id)a3
{
  -[NSPointerArray addPointer:](self->_inheritingScenes, "addPointer:", a3);
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  SEL v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene") & 1) == 0
    && scene_didUpdateWithDiff_transitionContext_completion__once != -1)
  {
    dispatch_once(&scene_didUpdateWithDiff_transitionContext_completion__once, &__block_literal_global_197);
  }
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_199;
  v21[3] = &unk_1E16B2900;
  v21[4] = self;
  v16 = v11;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v18 = v13;
  v24 = v18;
  v25 = a2;
  -[UIScene _emitSceneSettingsUpdateResponseForCompletion:afterSceneUpdateWork:](self, "_emitSceneSettingsUpdateResponseForCompletion:afterSceneUpdateWork:", v14, v21);
  if (v14)
  {
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_2;
    v19[3] = &unk_1E16B1BF8;
    v20 = v14;
    -[UIScene _scheduleSceneEventResponseWithResponseBlock:](self, "_scheduleSceneEventResponseWithResponseBlock:", v19);

  }
}

- (void)_scheduleSceneEventResponseWithResponseBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  _holdSceneEventResponsesQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__UIScene__scheduleSceneEventResponseWithResponseBlock___block_invoke;
  block[3] = &unk_1E16B1D18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

id __56__UIScene__updateUIClientSettingsWithUITransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  void *v11;

  v3 = a2;
  if ((objc_msgSend(v3, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("UIScene.m"), 812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mutableClientSettings isUISubclass]"));

  }
  v4 = v3;
  +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_effectiveUISettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isForeground")
    && (objc_msgSend(*(id *)(a1 + 32), "_isReadyForSuspension") & 1) == 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_isConnected") ^ 1;
  }
  else
  {
    v7 = 1;
  }

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((v7 & 1) == 0 && v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_synchronizedDrawingFence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationFence:", v9);

  }
  return v5;
}

- (BOOL)_isReadyForSuspension
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 3) & 1;
}

- (BOOL)_isConnected
{
  return -[UIScene activationState](self, "activationState") != UISceneActivationStateUnattached;
}

uint64_t __20__UIScene_setTitle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCanvasTitle:", *(_QWORD *)(a1 + 32));
}

void __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  if (objc_msgSend(v3, "_fromPlist"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isDefault"))
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v5, "setSceneActivationBias:", v4);
  objc_msgSend(v5, "setIdleTimerDisabled:", *(unsigned __int8 *)(a1 + 40));

}

- (BKSAnimationFenceHandle)_synchronizedDrawingFence
{
  void *v2;

  if (-[UIScene _shouldAllowFencing](self, "_shouldAllowFencing"))
  {
    +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (BKSAnimationFenceHandle *)v2;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UISceneActivationState v7;
  const __CFString *v8;

  -[UIScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("role"));

  objc_msgSend(v3, "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("persistentIdentifier"));

  v7 = -[UIScene activationState](self, "activationState");
  if ((unint64_t)v7 > UISceneActivationStateBackground)
    v8 = CFSTR("UISceneActivationStateUnattached");
  else
    v8 = off_1E16B2A80[v7];
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("activationState"));

  return v4;
}

- (BOOL)_affectsScreenOrientation
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 2) & 1;
}

- (void)__captureWindow:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
    -[UIWindow __setWindowHostingScene:]((uint64_t)v4, self);

}

void __58__UIScene__registerSceneComponentClass_withKey_predicate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9[0] = a1[6];
  v8[0] = CFSTR("_UISceneComponentClass");
  v8[1] = CFSTR("_UISceneComponentClassPredicate");
  v4 = (void *)a1[4];
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2] = CFSTR("_UISceneComponentKeyname");
  v6 = a1[5];
  v9[1] = v5;
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  if (!v4)
}

- (BOOL)_isTargetOfKeyboardEventDeferringEnvironment
{
  int IsPossibleForScene;

  IsPossibleForScene = _UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(self);
  if (IsPossibleForScene)
  {
    IsPossibleForScene = -[UIScene _allowsEventUIWindowRouting](self, "_allowsEventUIWindowRouting");
    if (IsPossibleForScene)
      return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 6) & 1;
  }
  return IsPossibleForScene;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScene descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  char has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  UISceneActivationState v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  UIScene *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = -[UIScene _hostsWindows](self, "_hostsWindows");
  -[UIScene session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveMultilinePrefix:", v4);

  objc_msgSend(v7, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("role"));

  v10 = -[UIScene activationState](self, "activationState");
  if ((unint64_t)v10 > UISceneActivationStateBackground)
    v11 = CFSTR("UISceneActivationStateUnattached");
  else
    v11 = off_1E16B2A80[v10];
  objc_msgSend(v8, "appendString:withName:", v11, CFSTR("activationState"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v18[3] = &unk_1E16B2950;
  v12 = v8;
  v22 = has_internal_diagnostics;
  v19 = v12;
  v20 = self;
  v21 = v7;
  v23 = v6;
  v13 = v7;
  v14 = (id)objc_msgSend(v12, "modifyBody:", v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

void __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  __CFString *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;

  v2 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "activeMultilinePrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v2;
    v47[1] = 3221225472;
    v47[2] = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v47[3] = &unk_1E16B1B50;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v48 = v5;
    v49 = v6;
    objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("flags"), v4, v47);

    objc_msgSend(*(id *)(a1 + 40), "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v9);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = CFSTR("(nil)");
    }
    v14 = (id)objc_msgSend(v8, "appendObject:withName:", v13, CFSTR("fbsScene"));

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v7, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:withName:", v16, CFSTR("fbsScene.identifier"));

    if (objc_msgSend(*(id *)(a1 + 40), "_hasSettingsScene"))
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "_settingsScene");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = CFSTR("(nil)");
      }
      v23 = (id)objc_msgSend(v17, "appendObject:withName:", v22, CFSTR("settingsScene"));

    }
    v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240), CFSTR("remoteContentRegistry"), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v25 = *(id *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActiveMultilinePrefix:", v46);
  objc_msgSend(v25, "persistentIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendString:withName:", v27, CFSTR("persistentIdentifier"));

  v50[0] = v2;
  v50[1] = 3221225472;
  v50[2] = ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke;
  v50[3] = &unk_1E16B1B50;
  v51 = v26;
  v52 = v25;
  v28 = v26;
  v29 = v25;
  v30 = (id)objc_msgSend(v28, "modifyBody:", v50);
  objc_msgSend(v28, "build");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v31, CFSTR("session"));
  v33 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p>"), v37, v34);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = CFSTR("(nil)");
  }
  v39 = (id)objc_msgSend(v33, "appendObject:withName:", v38, CFSTR("delegate"));

  objc_msgSend(*(id *)(a1 + 40), "_addSubclassDebugDescriptionWithBuilder:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 57))
  {
    v40 = *(id *)(a1 + 40);
    v41 = *(void **)(a1 + 32);
    objc_msgSend(v40, "_screen");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend(v41, "appendObject:withName:", v42, CFSTR("screen"));

    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v40, "_allWindows");
    else
      objc_msgSend(v40, "_windows");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sortedArrayUsingFunction:context:", _UIWindowCompareWindowsUsingLevel, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", v45, CFSTR("windows"), 1);
  }

}

- (NSArray)_windows
{
  void *v3;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSString)debugDescription
{
  return (NSString *)-[UIScene debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

void __39__UIScene__refreshActivationConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  UISceneActivationConditions *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = objc_alloc_init(UISceneActivationConditions);
  LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "-[UIScene _refreshActivationConditions]_block_invoke";
      v13 = 2112;
      v14 = v9;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Unable to encode activation conditions %@", buf, 0x16u);

    }
  }
  objc_msgSend(v3, "setActivationConditionsData:", v6);

}

- (void)setActivationConditions:(UISceneActivationConditions *)activationConditions
{
  UISceneActivationConditions *v5;
  UISceneActivationConditions *v6;
  BOOL v7;
  UISceneActivationConditions *v8;

  v5 = activationConditions;
  v6 = self->_activationConditions;
  if (v6 != v5)
  {
    v8 = v5;
    v7 = -[UISceneActivationConditions isEqual:](v6, "isEqual:", v5);
    -[UISceneActivationConditions _setUIScene:](self->_activationConditions, "_setUIScene:", 0);
    -[UISceneActivationConditions _setUIScene:](v8, "_setUIScene:", self);
    objc_storeStrong((id *)&self->_activationConditions, activationConditions);
    v5 = v8;
    if (!v7)
    {
      -[UIScene _refreshActivationConditions](self, "_refreshActivationConditions");
      v5 = v8;
    }
  }

}

+ (id)_connectionOptionsForScene:(id)a3 withSpecification:(id)a4 transitionContext:(id)a5 actions:(id)a6 sceneSession:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(void *, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _UISceneConnectionOptionsContext *v34;
  void *v35;
  const char *v36;
  id v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__9;
  v67 = __Block_byref_object_dispose__9;
  v40 = v14;
  v68 = v40;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__9;
  v61 = __Block_byref_object_dispose__9;
  v62 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__UIScene__connectionOptionsForScene_withSpecification_transitionContext_actions_sceneSession___block_invoke;
  aBlock[3] = &unk_1E16B28A0;
  v55 = &v63;
  v38 = v11;
  v50 = v38;
  v18 = v15;
  v51 = v18;
  v19 = v13;
  v52 = v19;
  v20 = v16;
  v53 = v20;
  v21 = v17;
  v54 = v21;
  v56 = &v57;
  v22 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (objc_msgSend((id)v64[5], "count"))
  {
    objc_msgSend(v12, "initialActionHandlers", v38, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finalActionHandlers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v46;
LABEL_4:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v26);
        v22[2](v22, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v29));
        if (!objc_msgSend((id)v64[5], "count"))
          break;
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
          if (v27)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  objc_msgSend(v12, "_transitionContextHandlers", v38);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v30);
        v22[2](v22, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v33++));
      }
      while (v31 != v33);
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
    }
    while (v31);
  }

  v34 = objc_alloc_init(_UISceneConnectionOptionsContext);
  v35 = (void *)objc_msgSend(v20, "copy");
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v34, "setLaunchOptionsDictionary:", v35);

  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v34, "setUnprocessedActions:", v64[5]);
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v34, (void *)v58[5]);
  if (v34)
    objc_setProperty_nonatomic_copy(v34, v36, v21, 24);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v34;
}

- (UIScene)initWithSession:(UISceneSession *)session connectionOptions:(UISceneConnectionOptions *)connectionOptions
{
  UISceneSession *v8;
  UISceneConnectionOptions *v9;
  char *v10;
  char *v11;
  unsigned int *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  char *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v63;
  void *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  void *v68;
  SEL v69;
  void *v70;
  id v71;
  objc_super v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = session;
  v9 = connectionOptions;
  v72.receiver = self;
  v72.super_class = (Class)UIScene;
  v10 = -[UIScene init](&v72, sel_init);
  v11 = v10;
  if (v10)
  {
    v69 = a2;
    v12 = (unsigned int *)(v10 + 216);
    *((_DWORD *)v10 + 54) |= 0x800u;
    v13 = objc_msgSend((id)objc_opt_class(), "_hostsWindows");
    if (v13)
      v14 = 4096;
    else
      v14 = 0;
    *v12 = *v12 & 0xFFFFEFFF | v14;
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = 0x2000;
      else
        v15 = 0;
      *v12 = *v12 & 0xFFFFDFFF | v15;
    }
    if (objc_msgSend((id)objc_opt_class(), "_supportsEventUIWindowRouting"))
      v16 = 0x200000;
    else
      v16 = 0;
    *v12 = *v12 & 0xFFCF7FFF | v16;
    -[UISceneConnectionOptions _fbsScene](v9, "_fbsScene");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v17;

    -[UISceneConnectionOptions _specification](v9, "_specification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v11 + 3, session);
    objc_msgSend(v11, "_effectiveUIClientSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activationConditionsData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_19;
    v71 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v21, &v71);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v71;
    if (v23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "localizedDescription");
      v63 = v22;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v74 = "-[UIScene initWithSession:connectionOptions:]";
      v75 = 2112;
      v76 = v64;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Unable to decode activation conditions %@", buf, 0x16u);

      v22 = v63;
    }

    if (v22)
    {
      v24 = 0;
      v70 = (void *)v22;
      v25 = (void *)v22;
    }
    else
    {
LABEL_19:
      v25 = (void *)objc_opt_new();
      v70 = 0;
      v24 = 1;
    }
    objc_storeStrong((id *)v11 + 7, v25);
    if (v24)

    objc_msgSend(*((id *)v11 + 7), "_setUIScene:", v11);
    -[UISceneSession configuration](v8, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "delegateClass");

    if (v27)
    {
      if ((objc_msgSend(v27, "conformsToProtocol:", &unk_1EE09E738) & 1) == 0
        && (objc_msgSend(v27, "conformsToProtocol:", &unk_1EE0CDDF8) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v69, v11, CFSTR("UIScene.m"), 391, CFSTR("representation's delegateClass must conform to UISceneDelegate protocol"));

      }
      v28 = objc_alloc_init((Class)v27);
    }
    else
    {
      v28 = 0;
    }
    objc_storeStrong((id *)v11 + 4, v28);
    if (v27)

    v29 = (void *)*((_QWORD *)v11 + 26);
    *((_QWORD *)v11 + 26) = 0;

    _UISceneInspectDelegateSuport((unsigned int *)v11 + 54, *((void **)v11 + 4));
    objc_msgSend(v19, "initialSettingsDiffActions");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v30;

    objc_msgSend(v19, "finalSettingsDiffActions");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v11 + 10) = v32;

    v34 = (void *)*((_QWORD *)v11 + 13);
    v35 = MEMORY[0x1E0C9AA70];
    *((_QWORD *)v11 + 13) = MEMORY[0x1E0C9AA70];

    objc_msgSend(*((id *)v11 + 9), "arrayByAddingObjectsFromArray:", *((_QWORD *)v11 + 10));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v11 + 14);
    *((_QWORD *)v11 + 14) = v36;

    objc_msgSend(v19, "initialActionHandlers");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v11 + 11) = v38;

    objc_msgSend(v19, "finalActionHandlers");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v11 + 12);
    *((_QWORD *)v11 + 12) = v40;

    v42 = (void *)*((_QWORD *)v11 + 15);
    *((_QWORD *)v11 + 15) = v35;

    objc_msgSend(*((id *)v11 + 11), "arrayByAddingObjectsFromArray:", *((_QWORD *)v11 + 12));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v11 + 16);
    *((_QWORD *)v11 + 16) = v43;

    v45 = objc_msgSend(v19, "lifecycleMonitorClass");
    if (v45)
    {
      v46 = (void *)v45;
      objc_opt_self();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isSubclassOfClass:", v47);

      if ((v48 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v65 = (objc_class *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", v69, v11, CFSTR("UIScene.m"), 411, CFSTR("Lifecycle monitor must at least be a %@"), v66);

      }
      v49 = objc_msgSend(objc_alloc((Class)v46), "initWithScene:", v11);
      v50 = (void *)*((_QWORD *)v11 + 19);
      *((_QWORD *)v11 + 19) = v49;

    }
    objc_msgSend(v11, "setTitle:", &stru_1E16EDF20);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v11 + 23);
    *((_QWORD *)v11 + 23) = v51;

    v53 = objc_msgSend(v19, "isUIKitManaged");
    if (v53)
      v54 = 128;
    else
      v54 = 0;
    *v12 = *v12 & 0xFFFFFF7F | v54;
    if (v53)
      objc_msgSend(*((id *)v11 + 8), "setDelegate:", v11);
    if (objc_msgSend(v19, "isInternal"))
      v55 = 256;
    else
      v55 = 0;
    *v12 = *v12 & 0xFFFFFEFF | v55;
    if (objc_msgSend(v19, "affectsAppLifecycleIfInternal"))
      v56 = 512;
    else
      v56 = 0;
    *v12 = *v12 & 0xFFFFFDFF | v56;
    if (objc_msgSend(v19, "affectsScreenOrientation"))
      v57 = 1024;
    else
      v57 = 0;
    *v12 = *v12 & 0xFFFFFBFF | v57;
    v58 = v11;
    v59 = (void *)_uiScenes;
    if (!_uiScenes)
    {
      v60 = objc_opt_new();
      v61 = (void *)_uiScenes;
      _uiScenes = v60;

      v59 = (void *)_uiScenes;
    }
    objc_msgSend(v59, "insertObject:atIndex:", v58, 0);

    _UISceneUpdateSystemShellManagesKeyboardFocusIfNeededFromScene(v58);
  }

  return (UIScene *)v11;
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  __CFString *v5;
  _QWORD v6[4];
  __CFString *v7;

  v4 = title;
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_1E16EDF20;
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", self->_title) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__UIScene_setTitle___block_invoke;
    v6[3] = &unk_1E16B2A58;
    v7 = v5;
    -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v6);

  }
}

- (FBSSceneSettings)_oldSettings
{
  return self->_oldSettings;
}

- (void)_prepareForResume
{
  *(_DWORD *)&self->_sceneFlags &= ~0x80000u;
}

+ (id)_persistenceIdentifierForScene:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUISubclass");

  if (!v5
    || (objc_msgSend(v3, "uiSettings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "persistenceIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)setDelegate:(id)delegate
{
  UISceneDelegate *v5;
  UISceneDelegate *v6;

  v5 = (UISceneDelegate *)delegate;
  if (self->_delegate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_delegate, delegate);
    _UISceneInspectDelegateSuport((unsigned int *)&self->_sceneFlags, self->_delegate);
    v5 = v6;
  }

}

- (void)_refreshActivationConditions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__UIScene__refreshActivationConditions__block_invoke;
  v2[3] = &unk_1E16B2A58;
  v2[4] = self;
  -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v2);
}

- (NSArray)_interitingScenes
{
  return -[NSPointerArray allObjects](self->_inheritingScenes, "allObjects");
}

+ (void)_registerSceneComponentClass:(Class)a3 withKey:(id)a4 predicate:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  Class v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDE320F0) & 1) != 0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58__UIScene__registerSceneComponentClass_withKey_predicate___block_invoke;
    v30[3] = &unk_1E16B2710;
    v33 = a3;
    v24 = v10;
    v11 = v10;
    v31 = v11;
    v25 = v9;
    v12 = v9;
    v32 = v12;
    __UISceneAccessClassComponentArray(1, v30);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(a1, "_scenesIncludingInternal:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "session");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "evaluateWithObject:", v19);

          if (v20)
          {
            v21 = (void *)objc_msgSend([a3 alloc], "initWithScene:", v18);
            objc_msgSend(v18, "_registerSceneComponent:forKey:", v21, v12);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v15);
    }

    v10 = v24;
    v9 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScene.m"), 731, CFSTR("Attempted to register UIScene component class \"%@\", which does not conform to _UISceneComponentProviding"), v23);

  }
}

- (void)_finishSceneConnection
{
  *(_DWORD *)&self->_sceneFlags &= ~0x800u;
}

- (NSNumber)_cachedInterfaceOrientation
{
  return self->__cachedInterfaceOrientation;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UISceneActivationConditions)activationConditions
{
  return self->_activationConditions;
}

void __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E16B2950;
  v11 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v12 = *(_BYTE *)(a1 + 57);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v7);

}

- (void)_synchronizeDrawing
{
  if (-[UIScene _shouldAllowFencing](self, "_shouldAllowFencing"))
    +[UIScene _synchronizeDrawing](UIScene, "_synchronizeDrawing");
}

- (void)_registerSettingsDiffActionArray:(id)a3 forKey:(id)a4
{
  NSDictionary *additionalSettingsDiffActions;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *v13;
  id v14;

  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  v7 = a4;
  v8 = a3;
  v9 = (void *)-[NSDictionary mutableCopy](additionalSettingsDiffActions, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v14 = v11;

  objc_msgSend(v14, "setObject:forKey:", v8, v7);
  v12 = (NSDictionary *)objc_msgSend(v14, "copy");
  v13 = self->_additionalSettingsDiffActions;
  self->_additionalSettingsDiffActions = v12;

  -[UIScene _calculateFlattenedDiffActions](self, "_calculateFlattenedDiffActions");
}

- (_UIPhysicalButtonInteractionArbiter)_physicalButtonInteractionArbiter
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  char v7;
  _UIPhysicalButtonInteractionArbiter *v8;

  v3 = -[UIScene _hasInvalidated](self, "_hasInvalidated");
  v4 = -[UIScene _allowsEventUIWindowRouting](self, "_allowsEventUIWindowRouting");
  -[UIScene session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

  v8 = 0;
  if (!v3 && v4 && (v7 & 1) == 0)
  {
    -[UIScene _existingPhysicalButtonInteractionArbiter](self, "_existingPhysicalButtonInteractionArbiter");
    v8 = (_UIPhysicalButtonInteractionArbiter *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = -[_UIPhysicalButtonInteractionArbiter initWithScene:]([_UIPhysicalButtonInteractionArbiter alloc], "initWithScene:", self);
      -[UIScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v8, CFSTR("_UIPhysicalButtonInteractionArbiterComponentKey"));
    }
  }
  return v8;
}

- (void)__releaseWindow:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  UIScene *v7;
  id v8;

  v8 = a3;
  v4 = -[UIScene _hostsWindows](self, "_hostsWindows");
  v5 = v8;
  if (v4)
  {
    if (v8)
      v6 = (void *)*((_QWORD *)v8 + 101);
    else
      v6 = 0;
    v7 = v6;

    v5 = v8;
    if (v7 == self)
    {
      -[UIWindow __setWindowHostingScene:]((uint64_t)v8, 0);
      v5 = v8;
    }
  }

}

- (id)_currentOpenApplicationEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FBSScene identityToken](self->_scene, "identityToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)UIApp;
    objc_msgSend(v2, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UISVisibilityEnvironmentForSceneIdentityTokenString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_currentOpenApplicationEndpointForEnvironment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)openURL:(NSURL *)url options:(UISceneOpenExternalURLOptions *)options completionHandler:(void *)completion
{
  void *v8;
  void *v9;
  UISceneOpenExternalURLOptions *v10;
  NSURL *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = completion;
  v10 = options;
  v11 = url;
  objc_msgSend(v8, "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISceneOpenExternalURLOptions universalLinksOnly](v10, "universalLinksOnly"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v12, CFSTR("UIApplicationOpenURLOptionUniversalLinksOnly"));

  -[UISceneOpenExternalURLOptions eventAttribution](v10, "eventAttribution");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setValue:forKey:", v13, CFSTR("UIApplicationOpenExternalURLOptionsEventAttributionKey"));
  v14 = (void *)UIApp;
  -[UIScene _currentOpenApplicationEndpoint](self, "_currentOpenApplicationEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_openURL:options:openApplicationEndpoint:completionHandler:", v11, v16, v15, v9);

}

- (void)setSubtitle:(NSString *)subtitle
{
  __CFString *v4;
  NSString **p_subtitle;
  __CFString *obj;

  v4 = subtitle;
  if (!v4)
    v4 = &stru_1E16EDF20;
  p_subtitle = &self->_subtitle;
  obj = v4;
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", *p_subtitle) & 1) == 0)
    objc_storeStrong((id *)p_subtitle, obj);

}

+ (id)_sceneForFBSScene:(id)a3 usingPredicate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a1, "_sceneForFBSScene:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v6, "evaluateWithObject:", v7);

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (NSString)_identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIScene _persistenceIdentifier](self, "_persistenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIScene _sceneIdentifier](self, "_sceneIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)_setDiscardSessionOnUserDisconnect:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__UIScene__setDiscardSessionOnUserDisconnect___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v4 = a3;
  -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
}

uint64_t __46__UIScene__setDiscardSessionOnUserDisconnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiscardSessionOnUserDisconnect:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_discardSessionOnUserDisconnect
{
  void *v2;
  char v3;

  -[UIScene _effectiveUIClientSettings](self, "_effectiveUIClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "discardSessionOnUserDisconnect");

  return v3;
}

- (void)_unregisterSettingsDiffActionArrayForKey:(id)a3
{
  NSDictionary *additionalSettingsDiffActions;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  id v11;

  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](additionalSettingsDiffActions, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v11 = v8;

  objc_msgSend(v11, "removeObjectForKey:", v5);
  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  v10 = self->_additionalSettingsDiffActions;
  self->_additionalSettingsDiffActions = v9;

  -[UIScene _calculateFlattenedDiffActions](self, "_calculateFlattenedDiffActions");
}

- (void)_registerBSActionResponderArray:(id)a3 forKey:(id)a4
{
  NSDictionary *additionalBSActionResponders;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *v13;
  id v14;

  additionalBSActionResponders = self->_additionalBSActionResponders;
  v7 = a4;
  v8 = a3;
  v9 = (void *)-[NSDictionary mutableCopy](additionalBSActionResponders, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v14 = v11;

  objc_msgSend(v14, "setObject:forKey:", v8, v7);
  v12 = (NSDictionary *)objc_msgSend(v14, "copy");
  v13 = self->_additionalBSActionResponders;
  self->_additionalBSActionResponders = v12;

  -[UIScene _calculateFlattenedBSActionResponders](self, "_calculateFlattenedBSActionResponders");
}

- (void)_unregisterBSActionResponderArray:(id)a3
{
  NSDictionary *additionalBSActionResponders;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  id v11;

  additionalBSActionResponders = self->_additionalBSActionResponders;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](additionalBSActionResponders, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v11 = v8;

  objc_msgSend(v11, "removeObjectForKey:", v5);
  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  v10 = self->_additionalBSActionResponders;
  self->_additionalBSActionResponders = v9;

  -[UIScene _calculateFlattenedBSActionResponders](self, "_calculateFlattenedBSActionResponders");
}

- (void)_unregisterSceneComponentForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *registeredComponents;
  id v9;

  v9 = a3;
  -[NSDictionary objectForKey:](self->_registeredComponents, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_setScene:", 0);
    v6 = (void *)-[NSDictionary mutableCopy](self->_registeredComponents, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", v9);
    v7 = (NSDictionary *)objc_msgSend(v6, "copy");
    registeredComponents = self->_registeredComponents;
    self->_registeredComponents = v7;

    -[UIScene _calculateFlattenedDiffActions](self, "_calculateFlattenedDiffActions");
    -[UIScene _calculateFlattenedBSActionResponders](self, "_calculateFlattenedBSActionResponders");

  }
}

- (void)_updateUIClientSettingsWithTransitionBlock:(id)a3
{
  -[FBSScene updateUIClientSettingsWithTransitionBlock:](self->_scene, "updateUIClientSettingsWithTransitionBlock:", a3);
}

- (void)_compatibilityModeZoomDidChange
{
  -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", &__block_literal_global_13);
}

uint64_t __42__UIScene__compatibilityModeZoomDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)UIApp, "_setCompatibilityModeOnSettings:", a2);
}

- (id)_synchronizeDrawingAndReturnFence
{
  void *v2;
  void *v3;
  void *v4;

  -[UIScene _synchronizedDrawingFence](self, "_synchronizedDrawingFence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CAFenceHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v2, "invalidate");
  return v4;
}

- (void)_synchronizeDrawingUsingFence:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIScene _shouldAllowFencing](self, "_shouldAllowFencing"))
    +[UIScene _synchronizeDrawingUsingFence:](UIScene, "_synchronizeDrawingUsingFence:", v4);

}

+ (void)_synchronizeDrawingUsingFence:(id)a3
{
  +[UIWindow _synchronizeDrawingWithCAFence:preCommitHandler:](UIWindow, "_synchronizeDrawingWithCAFence:preCommitHandler:", a3, 0);
}

- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3
{
  id v4;
  UIScene *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    v5 = self;
    -[UIScene _oldSettings](v5, "_oldSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScene _FBSScene](v5, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v4, objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene"));
    +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      v13 = v12;
      if (v8)
        objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("_UIWindowHostingSceneOldScreenUserInfoKey"));
      v29 = v9;
      if (v10)
        objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("_UIWindowHostingSceneNewScreenUserInfoKey"));
      v30 = v4;
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("_UIWindowHostingSceneWillMoveToScreenNotification"), v5, v13, v13, v11);
      -[NSDictionary allValues](v5->_registeredComponents, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v38 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v19, "_windowHostingScene:willMoveFromScreen:toScreen:", v5, v8, v10);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v16);
      }
      if ((*((_BYTE *)&v5->_sceneFlags + 1) & 0x20) != 0)
        -[UIScene _screenDidChangeFromScreen:toScreen:](v5, "_screenDidChangeFromScreen:toScreen:", v8, v10);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = v14;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v25, "_windowHostingScene:didMoveFromScreen:toScreen:", v5, v8, v10);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v22);
      }

      objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("_UIWindowHostingSceneDidMoveToScreenNotification"), v5, v27);
      v9 = v29;
      v4 = v30;
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__UIScene__noteDisplayIdentityDidChangeWithConfiguration___block_invoke;
    v31[3] = &unk_1E16B1B28;
    v32 = v7;
    v26 = v7;
    -[UIScene _enqueuePostSettingsUpdateResponseBlock:inPhase:](v5, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v31, CFSTR("_UIScenePostSettingsUpdateResponsePhaseScreenDisconnect"));

  }
}

uint64_t __58__UIScene__noteDisplayIdentityDidChangeWithConfiguration___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:");
  return result;
}

- (void)_invalidate
{
  $9341EDE2B60720950DEE76519EAE5484 sceneFlags;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSDictionary *registeredComponents;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  FBSScene *scene;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  UIScene *v32;
  uint64_t v33;
  FBSScene *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  sceneFlags = self->_sceneFlags;
  if ((*(_WORD *)&sceneFlags & 0x8000) == 0)
  {
    self->_sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&sceneFlags | 0x8000);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[NSDictionary allValues](self->_registeredComponents, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "_sceneWillInvalidate:", self);
          objc_msgSend(v9, "_setScene:", 0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v6);
    }

    registeredComponents = self->_registeredComponents;
    self->_registeredComponents = 0;

    -[UIScene _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:](self, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 0, 1, 0, &__block_literal_global_157);
    if (-[UIScene _allowsEventUIWindowRouting](self, "_allowsEventUIWindowRouting"))
      objc_msgSend((id)UIApp, "_cancelAllInputsOnEventRoutingScene:", self);
    -[UIScene _prepareForSuspend](self, "_prepareForSuspend");
    if (_uiScenes)
      objc_msgSend((id)_uiScenes, "removeObject:", self);
    -[UISceneSession _setScene:](self->_session, "_setScene:", 0);
    kdebug_trace();
    if ((*(_BYTE *)&self->_sceneFlags & 4) != 0)
    {
      -[UIScene delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneDidDisconnect:", self);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("UISceneDidDisconnectNotification"), self);

    if (-[UIScene _hasLifecycle](self, "_hasLifecycle"))
    {
      +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isTrackingScene:", self);

      if (v14)
      {
        -[UIScene _setIsRespondingToLifecycleEvent:](self, "_setIsRespondingToLifecycleEvent:", 1);
        +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uiScene:transitionedFromState:withTransitionContext:", self, v16, 0);

        -[UIScene _setIsRespondingToLifecycleEvent:](self, "_setIsRespondingToLifecycleEvent:", 0);
      }
    }
    scene = self->_scene;
    if (scene)
    {
      -[FBSScene specification](scene, "specification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "disconnectionHandlers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v40 != v23)
              objc_enumerationMutation(v20);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j) + 16))();
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v22);
      }

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[UIScene _allWindowsForInvalidation](self, "_allWindowsForInvalidation", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v29);
          if (v30)
            v31 = *(void **)(v30 + 808);
          else
            v31 = 0;
          v32 = v31;

          if (v32 == self)
          {
            -[UIScene _detachWindow:](self, "_detachWindow:", v30);
            -[UIWindow __setWindowHostingScene:](v30, 0);
          }
          ++v29;
        }
        while (v27 != v29);
        v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        v27 = v33;
      }
      while (v33);
    }

    v34 = self->_scene;
    self->_scene = 0;

    kdebug_trace();
  }
}

uint64_t __22__UIScene__invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_prepareHierarchyForWindowHostingSceneRemoval");
}

- (id)_allWindowsForInvalidation
{
  void *v3;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)_hostsWindows
{
  return 0;
}

- (NSArray)_visibleWindows
{
  void *v3;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)_allWindows
{
  void *v3;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  void (**v11)(id, _QWORD, char *);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v8 = a4;
  v9 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, _QWORD, char *))a7;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    v21 = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", v9, v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          v11[2](v11, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), &v21);
          if (v21)
          {
            if (a6)
              *a6 = 1;
            goto LABEL_13;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (BOOL)_windowIsFront:(id)a3
{
  return 0;
}

- (id)_topVisibleWindowPassingTest:(id)a3
{
  return -[UIScene _topVisibleWindowEnumeratingAsCopy:passingTest:](self, "_topVisibleWindowEnumeratingAsCopy:passingTest:", 0, a3);
}

- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__UIScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke;
    v9[3] = &unk_1E16B27A8;
    v11 = &v12;
    v10 = v6;
    -[UIScene _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:](self, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 1, v4, 0, v9);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__UIScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  int v10;
  id v11;

  v4 = a2;
  v11 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || (objc_msgSend(v4, "windowLevel"),
        v6 = v5,
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "windowLevel"),
        v7 = v11,
        v6 > v8))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (!v9 || (v10 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v11), v7 = v11, v10))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v7 = v11;
    }
  }

}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  return 0;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  return 0;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
    v5 = -[UIScene _shouldDeferInitialWindowUpdateBeforeConnection:](self, "_shouldDeferInitialWindowUpdateBeforeConnection:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates
{
  return 0;
}

- (CGRect)_referenceBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _screen](self, "_screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3
{
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat Height;
  CGFloat v12;
  CGFloat Width;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    -[UIScene _referenceBounds](self, "_referenceBounds");
    v9 = v5;
    v10 = v6;
    Height = v7;
    v12 = v8;
    if ((unint64_t)(a3 - 3) <= 1)
    {
      Width = CGRectGetWidth(*(CGRect *)&v5);
      v18.origin.x = v9;
      v18.origin.y = v10;
      v18.size.width = Height;
      v18.size.height = v12;
      Height = CGRectGetHeight(v18);
      v12 = Width;
    }
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    Height = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14 = v9;
  v15 = v10;
  v16 = Height;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_computeMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UIScene _allWindows](self, "_allWindows");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScene _computeMetricsForWindows:animated:](self, "_computeMetricsForWindows:animated:", v5, v3);

}

- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
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
  v5 = a3;
  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_sceneBoundsDidChange", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (double)_systemMinimumMargin
{
  return 0.0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation
{
  return 0;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
  -[UIScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](self, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", a3, 1);
}

+ (BOOL)_supportsEventUIWindowRouting
{
  return 0;
}

- (BOOL)_allowsEventUIWindowRouting
{
  return 0;
}

- (void)_targetOfKeyboardEventDeferringEnvironmentDidUpdate:(_DWORD *)a1
{
  int v4;
  int v5;
  char v6;
  int v7;
  objc_class *v8;
  const char *Name;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  const char *v20;
  __int16 v21;
  _DWORD *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1
    && _UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(a1)
    && objc_msgSend(a1, "_allowsEventUIWindowRouting"))
  {
    v4 = a1[54];
    v5 = a2 ? 0x400000 : 0;
    a1[54] = v4 & 0xFFBFFFFF | v5;
    _UISceneUpdateSystemShellManagesKeyboardFocusIfNeededFromScene(a1);
    v6 = (v4 & 0x400000) != 0 ? a2 : 1;
    v7 = (v4 & 0x400000) != 0 ? 0 : a2;
    if (a2 != (v4 & 0x400000u) >> 22)
    {
      v8 = (objc_class *)objc_opt_class();
      Name = class_getName(v8);
      objc_msgSend(a1, "_FBSScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identityToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringRepresentation");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "UTF8String");

      v14 = _targetOfKeyboardEventDeferringEnvironmentDidUpdate____s_category;
      if (!_targetOfKeyboardEventDeferringEnvironmentDidUpdate____s_category)
      {
        v14 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_targetOfKeyboardEventDeferringEnvironmentDidUpdate____s_category);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67240962;
        v18[1] = a2;
        v19 = 2082;
        v20 = Name;
        v21 = 2050;
        v22 = a1;
        v23 = 2080;
        v24 = v13;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Scene target of keyboard event deferring environment did change: %{public}d; scene: %{public}s: %{public}p; sc"
          "ene identity: %s",
          (uint8_t *)v18,
          0x26u);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v6 & 1) == 0)
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification"), a1);
      if (v7)
        objc_msgSend(v17, "postNotificationName:object:", CFSTR("_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification"), a1);

    }
  }
}

+ (UIScene)_mostActiveScene
{
  return +[_UISceneLifecycleMultiplexer mostActiveScene](_UISceneLifecycleMultiplexer, "mostActiveScene");
}

void __95__UIScene__connectionOptionsForScene_withSpecification_transitionContext_actions_sceneSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v34 = v3;
    objc_msgSend(v3, "_launchOptionsFromActions:forFBSScene:uiSceneSession:transitionContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v33 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "launchOptionsDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10);
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

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setByAddingObjectsFromSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v16, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v7);
    }

    if (v33)
      v17 = (void *)v33[3];
    else
      v17 = 0;
    v3 = v34;
    v18 = v17;

    if (v18)
    {
      v19 = *(void **)(a1 + 64);
      if (v33)
        v20 = (void *)v33[3];
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend(v19, "unionSet:", v21);

    }
    if (v33)
      v22 = (void *)v33[4];
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      if (v33)
        v24 = (void *)v33[4];
      else
        v24 = 0;
      v25 = v24;
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v29 = *(void **)(v26 + 40);
      v27 = (id *)(v26 + 40);
      v28 = v29;
      if (v29)
        objc_msgSend(v28, "applyValuesFromOtherStorage:", v25);
      else
        objc_storeStrong(v27, v24);

    }
    objc_msgSend(v33, "unprocessedActions");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
}

- (BOOL)_involvedInMediaPlayback
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 4) & 1;
}

- (void)_setInvolvedInMediaPlayback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&self->_sceneFlags & 0xFFEFFFFF | v3);
}

- (void)_prepareForSuspend
{
  *(_DWORD *)&self->_sceneFlags |= 0x80000u;
}

- (BOOL)_isEligibleForSuspension
{
  void *v2;
  char v3;

  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForeground") ^ 1;

  return v3;
}

- (id)_fixupInheritedSettings:(id)a3
{
  return a3;
}

- (FBSSceneSettings)_synthesizedSettings
{
  return 0;
}

- (void)_guardedSetOverrideSettings:(id)a3
{
  FBSSceneSettings *v5;
  FBSSceneSettings *overrideSettings;
  UIScene *v7;
  void *v8;
  id v9;

  v5 = (FBSSceneSettings *)a3;
  if ((*((_BYTE *)&self->_sceneFlags + 2) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScene.m"), 1875, CFSTR("Attempted to set an override settings outside _enableOverrideSettingsForActions:"));

  }
  overrideSettings = self->_overrideSettings;
  self->_overrideSettings = v5;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
  {
    v7 = self;
    -[UIScene _effectiveSettings](v7, "_effectiveSettings");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    _UIWindowHostingScenePerformUpdateWithEffectiveSettings(v7, v9);

  }
}

- (void)_enableOverrideSettingsForActions:(id)a3
{
  FBSSceneSettings *overrideSettings;
  _BOOL4 v5;
  UIScene *v6;
  id v7;

  *(_DWORD *)&self->_sceneFlags |= 0x10000u;
  (*((void (**)(id, UIScene *))a3 + 2))(a3, self);
  *(_DWORD *)&self->_sceneFlags &= ~0x10000u;
  overrideSettings = self->_overrideSettings;
  self->_overrideSettings = 0;

  v5 = -[UIScene _hostsWindows](self, "_hostsWindows");
  if (self)
  {
    if (v5)
    {
      v6 = self;
      -[UIScene _effectiveSettings](v6, "_effectiveSettings");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      _UIWindowHostingScenePerformUpdateWithEffectiveSettings(v6, v7);

    }
  }
}

- (void)_applyOverrideSettings:(id)a3 forActions:(id)a4
{
  id v6;
  void (**v7)(id, UIScene *);
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, UIScene *))a4;
  if (v6)
  {
    -[UIScene _guardedSetOverrideSettings:](self, "_guardedSetOverrideSettings:", v6);
  }
  else if ((*((_BYTE *)&self->_sceneFlags + 2) & 1) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Attempted to perform actions without override settings within _enableOverrideSettingsForActions! This is probably a visiual glitch, please explicitly specify settings for these actions!", buf, 2u);
      }

    }
    else
    {
      v8 = _applyOverrideSettings_forActions____s_category;
      if (!_applyOverrideSettings_forActions____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_applyOverrideSettings_forActions____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Attempted to perform actions without override settings within _enableOverrideSettingsForActions! This is probably a visiual glitch, please explicitly specify settings for these actions!", v11, 2u);
      }
    }
  }
  v7[2](v7, self);

}

- (void)_performSystemSnapshotWithActions:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("UISceneWillBeginSystemSnapshotSequence"), self);
  -[UIScene _enableOverrideSettingsForActions:](self, "_enableOverrideSettingsForActions:", v5);

  objc_msgSend(v6, "postNotificationName:object:", CFSTR("UISceneDidCompleteSystemSnapshotSequence"), self);
}

- (BOOL)_isRunningInTaskSwitcher
{
  void *v2;
  unint64_t v3;

  -[UIScene _effectiveSettings](self, "_effectiveSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "deactivationReasons") >> 3) & 1;

  return v3;
}

- (BOOL)_isUIKitManaged
{
  return *(_BYTE *)&self->_sceneFlags >> 7;
}

- (BOOL)_isProcessingDiffActionHandlers
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 2) & 1;
}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UISceneComponentKeynameKey_block_invoke___s_category;
  if (!_UISceneComponentKeynameKey_block_invoke___s_category)
  {
    v0 = __UILogCategoryGetNode("ApplicationLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UISceneComponentKeynameKey_block_invoke___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_FAULT, "Invalid system behavior. A scene update was received prior to finishing initial application activation.", v2, 2u);
  }
}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_199(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 216) |= 0x40000u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 208);
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqual:", v8);

    if ((v9 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_noteDisplayIdentityDidChangeWithConfiguration:", v7);
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_actionsWithSubstitutionsForTransitionActions:forFBSScene:fromTransitionContext:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v12 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v12;
  objc_msgSend(*(id *)(a1 + 32), "scene:didReceiveActions:fromTransitionContext:", *(_QWORD *)(a1 + 40), v12, *(_QWORD *)(a1 + 56));
  v29 = v7;
  if (v2)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "interfaceOrientation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setCachedInterfaceOrientation:", v14);

  }
  if (objc_msgSend(v3, "isUISubclass"))
  {
    v15 = objc_msgSend((id)objc_opt_class(), "_activationStateFromSceneSettings:", v2);
    v16 = objc_msgSend((id)objc_opt_class(), "_activationStateFromSceneSettings:", v3);
    v17 = _UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(_UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v15 + 5 + v16]);
  }
  else
  {
    v17 = 0;
  }
  v30 = v5;
  v18 = *(void **)(a1 + 56);
  if (v18 && (objc_msgSend(v18, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UIScene.m"), 2092, CFSTR("transitionContext is of an unexpected class : %@"), *(_QWORD *)(a1 + 56));

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_settingsDiffActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v23++), "_performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56), v17);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v21);
  }

  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 208);
  *(_QWORD *)(v24 + 208) = v3;
  v26 = v3;

  objc_msgSend(*(id *)(a1 + 32), "_setCachedInterfaceOrientation:", 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 216) &= ~0x40000u;

  kdebug_trace();
}

- (void)_setShouldHoldSceneEventResponses:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  _holdSceneEventResponsesQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__UIScene__setShouldHoldSceneEventResponses___block_invoke;
  v6[3] = &unk_1E16B1B78;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

void __45__UIScene__setShouldHoldSceneEventResponses___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 224);
  if (v2)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 224);
      *(_QWORD *)(v6 + 224) = v5;

    }
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__UIScene__setShouldHoldSceneEventResponses___block_invoke_2;
    v10[3] = &unk_1E16B2928;
    v10[4] = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 224);
    *(_QWORD *)(v8 + 224) = 0;

  }
}

void __45__UIScene__setShouldHoldSceneEventResponses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)UIApp;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_FBSScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scheduleSceneEventResponseForScene:withResponseBlock:", v5, v4);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)UIApp;
  v7 = a4;
  v8 = a3;
  if ((objc_msgSend(v6, "_hasCalledRunWithMainScene") & 1) == 0 && scene_didReceiveActions__once != -1)
    dispatch_once(&scene_didReceiveActions__once, &__block_literal_global_206);
  kdebug_trace();
  -[UIScene scene:didReceiveActions:fromTransitionContext:](self, "scene:didReceiveActions:fromTransitionContext:", v8, v7, 0);

  kdebug_trace();
}

void __35__UIScene_scene_didReceiveActions___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UISceneComponentKeynameKey_block_invoke_2___s_category;
  if (!_UISceneComponentKeynameKey_block_invoke_2___s_category)
  {
    v0 = __UILogCategoryGetNode("ApplicationLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UISceneComponentKeynameKey_block_invoke_2___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_FAULT, "Invalid system behavior. Scene actions were received prior to finishing initial application activation.", v2, 2u);
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScene descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 216) >> 8) & 1, CFSTR("isInternal"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 216) >> 15) & 1, CFSTR("hasInvalidated"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 216) >> 22) & 1, CFSTR("isSystemKeyboardFocused"));
  return objc_msgSend(*(id *)(a1 + 40), "_addSubclassFlagsToDebugDescriptionWithBuilder:", *(_QWORD *)(a1 + 32));
}

- (void)_removeInheritingScene:(id)a3
{
  NSPointerArray *inheritingScenes;
  uint64_t v5;
  id v6;

  v6 = a3;
  inheritingScenes = self->_inheritingScenes;
  if (-[NSPointerArray count](inheritingScenes, "count"))
  {
    v5 = 0;
    while (-[NSPointerArray pointerAtIndex:](inheritingScenes, "pointerAtIndex:", v5) != v6)
    {
      if (++v5 >= -[NSPointerArray count](inheritingScenes, "count"))
        goto LABEL_8;
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSPointerArray removePointerAtIndex:](inheritingScenes, "removePointerAtIndex:", v5);
  }
LABEL_8:

}

- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry
{
  void *v3;
  _UIChildRemoteContentRegistry *v4;
  void *v5;
  _UIChildRemoteContentRegistry *v6;
  _UIChildRemoteContentRegistry *childRemoteContentRegistry;

  if (!self->_childRemoteContentRegistry)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [_UIChildRemoteContentRegistry alloc];
      -[UIScene _FBSScene](self, "_FBSScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[_UIChildRemoteContentRegistry initWithParentScene:](v4, "initWithParentScene:", v5);
      childRemoteContentRegistry = self->_childRemoteContentRegistry;
      self->_childRemoteContentRegistry = v6;

    }
  }
  return self->_childRemoteContentRegistry;
}

- (id)_windowHostingScene
{
  UIScene *v3;

  if (-[UIScene _hostsWindows](self, "_hostsWindows"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedInterfaceOrientation, 0);
  objc_storeStrong((id *)&self->_childRemoteContentRegistry, 0);
  objc_storeStrong((id *)&self->_heldSceneEventResponseBlocks, 0);
  objc_storeStrong((id *)&self->_oldSettings, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_inheritingScenes, 0);
  objc_destroyWeak((id *)&self->_settingsScene);
  objc_storeStrong((id *)&self->_postSettingsUpdateResponseBlocks, 0);
  objc_storeStrong((id *)&self->_overrideSettings, 0);
  objc_storeStrong((id *)&self->_lifecycleMonitor, 0);
  objc_storeStrong((id *)&self->_registeredComponents, 0);
  objc_storeStrong((id *)&self->_flattenedBSActionSubstitutionProvidersByActionType, 0);
  objc_storeStrong((id *)&self->_flattenedBSActionResponders, 0);
  objc_storeStrong((id *)&self->_additionalBSActionResponders, 0);
  objc_storeStrong((id *)&self->_flattenedDiffActions, 0);
  objc_storeStrong((id *)&self->_additionalSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_finalSceneBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_initialSceneBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_finalSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_initialSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_activationConditions, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (_UIHDRUsageCoordinatorSceneComponent)_hdrUsageCoordinatorSceneComponent
{
  _UIHDRUsageCoordinatorSceneComponent *v3;

  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIHDRUsageCoordinatorSceneComponentKey);
  v3 = (_UIHDRUsageCoordinatorSceneComponent *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_UIHDRUsageCoordinatorSceneComponent initWithScene:]([_UIHDRUsageCoordinatorSceneComponent alloc], "initWithScene:", self);
    -[UIScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v3, _UIHDRUsageCoordinatorSceneComponentKey);
  }
  return v3;
}

- (_UIHomeAffordanceNotifying)_existingHomeAffordanceSceneNotifier
{
  int v3;
  void *v4;

  if (!_os_feature_enabled_impl())
  {
LABEL_6:
    v4 = 0;
    return (_UIHomeAffordanceNotifying *)v4;
  }
  v3 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  v4 = 0;
  if (self && v3)
  {
    if (-[UIScene _hostsWindows](self, "_hostsWindows") && !-[UIScene _hasInvalidated](self, "_hasInvalidated"))
    {
      -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (_UIHomeAffordanceNotifying *)v4;
    }
    goto LABEL_6;
  }
  return (_UIHomeAffordanceNotifying *)v4;
}

- (_UIHomeAffordanceNotifying)_homeAffordanceSceneNotifier
{
  int v3;
  _UIHomeAffordanceSceneNotifier *v4;

  if (!_os_feature_enabled_impl())
    goto LABEL_6;
  v3 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  v4 = 0;
  if (self && v3)
  {
    if (!-[UIScene _hostsWindows](self, "_hostsWindows") || -[UIScene _hasInvalidated](self, "_hasInvalidated"))
    {
LABEL_6:
      v4 = 0;
      return (_UIHomeAffordanceNotifying *)v4;
    }
    -[UIScene _existingHomeAffordanceSceneNotifier](self, "_existingHomeAffordanceSceneNotifier");
    v4 = (_UIHomeAffordanceSceneNotifier *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[_UIHomeAffordanceSceneNotifier initWithScene:]([_UIHomeAffordanceSceneNotifier alloc], "initWithScene:", self);
      -[UIScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v4, CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
    }
  }
  return (_UIHomeAffordanceNotifying *)v4;
}

- (UISceneSystemProtectionManager)systemProtectionManager
{
  id *v2;
  void *v3;

  -[UIScene _interfaceProtectionSceneComponent](self, "_interfaceProtectionSceneComponent");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _customizationIdentifier](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISceneSystemProtectionManager *)v3;
}

- (id)_eventDeferringComponent
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_getDefaultAudioSessionFromMainThreadWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_MRUIAudioSessionSceneComponentKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__UIScene_AVAudioSession___getDefaultAudioSessionFromMainThreadWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E16B2F48;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v9);

}

void __86__UIScene_AVAudioSession___getDefaultAudioSessionFromMainThreadWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  SEL v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  if (v2 && (v3 = NSSelectorFromString(CFSTR("defaultAudioSession")), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(v2, "performSelector:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
}

- (void)getDefaultAudioSessionWithCompletionHandler:(void *)handler
{
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v4 = handler;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[UIScene _getDefaultAudioSessionFromMainThreadWithCompletionHandler:](self, "_getDefaultAudioSessionFromMainThreadWithCompletionHandler:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__UIScene_AVAudioSession__getDefaultAudioSessionWithCompletionHandler___block_invoke;
    block[3] = &unk_1E16C14D0;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __71__UIScene_AVAudioSession__getDefaultAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_getDefaultAudioSessionFromMainThreadWithCompletionHandler:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (UIPointerLockState)pointerLockState
{
  UIPointerLockState *v3;

  if (_UIPointerLockStateIsAvailableForScene(self))
  {
    -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIPointerLockStateSceneComponentKey"));
    v3 = (UIPointerLockState *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = -[UIPointerLockState initWithScene:]([UIPointerLockState alloc], "initWithScene:", self);
      -[UIScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v3, CFSTR("_UIPointerLockStateSceneComponentKey"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_UIInterfaceProtectionSceneComponent)_interfaceProtectionSceneComponent
{
  return (_UIInterfaceProtectionSceneComponent *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIInterfaceProtectionSceneComponentKey);
}

- (_UIRenderingEnvironmentSceneComponent)_renderingEnvironmentSceneComponentRegisteringIfNecessary:(void *)a1
{
  _UIRenderingEnvironmentSceneComponent *v4;
  BOOL v5;

  if (a1)
  {
    objc_msgSend(a1, "_sceneComponentForKey:", _UIRenderingEnvironmentSceneComponentKey);
    v4 = (_UIRenderingEnvironmentSceneComponent *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = a2 == 0;
    if (!v5)
    {
      v4 = -[_UIRenderingEnvironmentSceneComponent initWithScene:]([_UIRenderingEnvironmentSceneComponent alloc], "initWithScene:", a1);
      objc_msgSend(a1, "_registerSceneComponent:forKey:", v4, _UIRenderingEnvironmentSceneComponentKey);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UISceneHostingIntelligenceSupportClient)_intelligenceClientSceneComponent
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return (_UISceneHostingIntelligenceSupportClient *)v8;
}

+ (int64_t)_UIO_sceneType
{
  return 0;
}

- (id)_carPlaySceneComponent
{
  return -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UICarPlaySceneComponentKey);
}

- (id)systemShellHostingEnvironment
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)renderingEnvironment
{
  void *v2;
  void *v3;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderingEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_extendStateRestoration
{
  NSObject *v4;
  _QWORD v5[6];

  _extendStateRestorationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__UIScene__UISceneEnhancedStateRestoration_Private___extendStateRestoration__block_invoke;
  v5[3] = &unk_1E16B1888;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);

}

void __76__UIScene__UISceneEnhancedStateRestoration_Private___extendStateRestoration__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)_sceneToCount;
  if (!_sceneToCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_sceneToCount;
    _sceneToCount = v3;

    v2 = (void *)_sceneToCount;
  }
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)_sceneToCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, *(_QWORD *)(a1 + 32));

  if (!v6)
  {
    kdebug_trace();
    +[_UICanvasUserActivityManager _userActivityManagerForScene:](_UICanvasUserActivityManager, "_userActivityManagerForScene:", *(_QWORD *)(a1 + 32));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "_initialRestorationIsFinished") & 1) != 0)
    {
      if (objc_msgSend(v10, "_initialRestorationIsFinished"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UISceneEnhancedStateRestoration.m"), 50, CFSTR("Attempt to extend state restoration made after restoration is finalized."));

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setShouldHoldSceneEventResponses:", 1);
    }

  }
}

- (void)_completeStateRestoration
{
  NSObject *v4;
  _QWORD v5[6];

  _extendStateRestorationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__UIScene__UISceneEnhancedStateRestoration_Private___completeStateRestoration__block_invoke;
  v5[3] = &unk_1E16B1888;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);

}

void __78__UIScene__UISceneEnhancedStateRestoration_Private___completeStateRestoration__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)_sceneToCount, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UISceneEnhancedStateRestoration.m"), 61, CFSTR("UIScene._completeStateRestoration called without corresponding call toUIScene._extendStateRestoration"));

    goto LABEL_3;
  }
  if (v3 != 1)
  {
LABEL_3:
    v4 = (void *)_sceneToCount;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));

    return;
  }
  objc_msgSend((id)_sceneToCount, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend((id)_sceneToCount, "count"))
  {
    v5 = (void *)_sceneToCount;
    _sceneToCount = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "_setShouldHoldSceneEventResponses:", 0);
  kdebug_trace();
}

@end
