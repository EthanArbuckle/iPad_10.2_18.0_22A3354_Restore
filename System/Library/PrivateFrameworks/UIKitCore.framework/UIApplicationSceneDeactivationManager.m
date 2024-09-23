@implementation UIApplicationSceneDeactivationManager

id __83__UIApplicationSceneDeactivationManager__updateScenesWithTransitionContext_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("updateAllScenesForBand - %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDeactivationReasons:onScene:withSettings:reason:", v3, v5, v8, v9);

  return *(id *)(a1 + 56);
}

- (void)beginTrackingScene:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIApplicationSceneDeactivationManager _isEligibleScene:withSettings:](self, "_isEligibleScene:withSettings:", v6, v4);

  if (v5)
    -[UIApplicationSceneDeactivationManager _trackScene:](self, "_trackScene:", v6);

}

- (BOOL)_isEligibleScene:(id)a3 withSettings:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (-[UIApplicationSceneDeactivationManager _isEligibleScene:](self, "_isEligibleScene:", a3))
    v7 = -[UIApplicationSceneDeactivationManager _areEligibleSettings:](self, "_areEligibleSettings:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)removeAssertion:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = removeAssertion____s_category;
    if (!removeAssertion____s_category)
    {
      v5 = __UILogCategoryGetNode("SceneDeactivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&removeAssertion____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Removed: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    -[NSHashTable removeObject:](self->_assertions, "removeObject:", v4);
  }
  -[UIApplicationSceneDeactivationManager _updateScenesWithTransitionContext:reason:](self, "_updateScenesWithTransitionContext:reason:", 0, CFSTR("Assertion removed"));

}

- (void)addAssertion:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = addAssertion_withTransitionContext____s_category;
  if (!addAssertion_withTransitionContext____s_category)
  {
    v8 = __UILogCategoryGetNode("SceneDeactivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&addAssertion_withTransitionContext____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Added: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (v6)
    -[NSHashTable addObject:](self->_assertions, "addObject:", v6);
  -[UIApplicationSceneDeactivationManager _updateScenesWithTransitionContext:reason:](self, "_updateScenesWithTransitionContext:reason:", v7, CFSTR("Assertion added"));

}

- (void)_updateScenesWithTransitionContext:(id)a3 reason:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  FBScene *updatingScene;
  id v16;
  _QWORD v17[6];
  id v18;
  id v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_eligibleScenes;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "isValid", v16))
        {
          objc_msgSend(v12, "uiSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[UIApplicationSceneDeactivationManager _deactivationReasonsForScene:withSettings:](self, "_deactivationReasonsForScene:withSettings:", v12, v13);
          if (v14 != objc_msgSend(v13, "deactivationReasons"))
          {
            objc_storeStrong((id *)&self->_updatingScene, v12);
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __83__UIApplicationSceneDeactivationManager__updateScenesWithTransitionContext_reason___block_invoke;
            v17[3] = &unk_1E16C7B78;
            v20 = v14;
            v17[4] = self;
            v17[5] = v12;
            v18 = v6;
            v19 = v16;
            objc_msgSend(v12, "updateUISettingsWithTransitionBlock:", v17);
            updatingScene = self->_updatingScene;
            self->_updatingScene = 0;

          }
        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

- (void)amendSceneSettings:(id)a3 forScene:(id)a4
{
  FBScene *v6;
  id v7;

  v7 = a3;
  v6 = (FBScene *)a4;
  if (self->_updatingScene != v6
    && -[UIApplicationSceneDeactivationManager _isEligibleScene:](self, "_isEligibleScene:", v6))
  {
    if (-[UIApplicationSceneDeactivationManager _areEligibleSettings:](self, "_areEligibleSettings:", v7))
    {
      -[UIApplicationSceneDeactivationManager _trackScene:](self, "_trackScene:", v6);
      -[UIApplicationSceneDeactivationManager _setDeactivationReasons:onScene:withSettings:reason:](self, "_setDeactivationReasons:onScene:withSettings:reason:", -[UIApplicationSceneDeactivationManager _deactivationReasonsForScene:withSettings:](self, "_deactivationReasonsForScene:withSettings:", v6, v7), v6, v7, CFSTR("scene settings update - settings are eligible for deactivation reasons"));
    }
    else
    {
      -[UIApplicationSceneDeactivationManager _deactivationReasonsForScene:withSettings:](self, "_deactivationReasonsForScene:withSettings:", v6, v7);
      -[UIApplicationSceneDeactivationManager _setDeactivationReasons:onScene:withSettings:reason:](self, "_setDeactivationReasons:onScene:withSettings:reason:", 0, v6, v7, CFSTR("scene settings update - settings are NOT eligible for deactivation reasons"));
      -[UIApplicationSceneDeactivationManager _untrackScene:](self, "_untrackScene:", v6);
    }
  }

}

- (unint64_t)_deactivationReasonsForScene:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_assertions;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 1 << objc_msgSend(v14, "reason", (_QWORD)v19);
        if ((v11 & v15) == 0)
        {
          objc_msgSend(v14, "predicate");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (!v16 || (*(unsigned int (**)(uint64_t, id, id))(v16 + 16))(v16, v6, v7))
            v11 |= v15;

        }
      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isEligibleScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isUISubclass"))
  {
    objc_msgSend(v3, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLocal") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_areEligibleSettings:(id)a3
{
  return objc_msgSend(a3, "isForeground");
}

- (void)_setDeactivationReasons:(unint64_t)a3 onScene:(id)a4 withSettings:(id)a5 reason:(id)a6
{
  void *v6;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "deactivationReasons") != a3)
  {
    objc_msgSend(v11, "setDeactivationReasons:", a3);
    v13 = _setDeactivationReasons_onScene_withSettings_reason____s_category;
    if (!_setDeactivationReasons_onScene_withSettings_reason____s_category)
    {
      v13 = __UILogCategoryGetNode("SceneDeactivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_setDeactivationReasons_onScene_withSettings_reason____s_category);
    }
    v14 = *(id *)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "identifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        UIApplicationSceneDeactivationReasonMaskDescriptionComponents(a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = CFSTR("(none)");
      }
      v17 = 138543874;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting deactivation reasons to: '%{public}@' for reason: %{public}@.", (uint8_t *)&v17, 0x20u);
      if (a3)
      {

      }
    }

  }
}

- (void)_trackScene:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_eligibleScenes, "containsObject:", v4) & 1) == 0)
  {
    v5 = _trackScene____s_category;
    if (!_trackScene____s_category)
    {
      v5 = __UILogCategoryGetNode("SceneDeactivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_trackScene____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Now tracking: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    -[NSMutableSet addObject:](self->_eligibleScenes, "addObject:", v4);
  }

}

- (void)_untrackScene:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_eligibleScenes, "containsObject:", v4))
  {
    v5 = _untrackScene____s_category;
    if (!_untrackScene____s_category)
    {
      v5 = __UILogCategoryGetNode("SceneDeactivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_untrackScene____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "No longer tracking: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    -[NSMutableSet removeObject:](self->_eligibleScenes, "removeObject:", v4);
  }

}

- (id)newAssertionWithReason:(int64_t)a3
{
  return -[UIApplicationSceneDeactivationAssertion initWithReason:manager:]([UIApplicationSceneDeactivationAssertion alloc], "initWithReason:manager:", a3, self);
}

- (UIApplicationSceneDeactivationManager)init
{
  UIApplicationSceneDeactivationManager *v3;
  uint64_t v4;
  NSHashTable *assertions;
  NSMutableSet *v6;
  NSMutableSet *eligibleScenes;
  void *v9;
  void *v10;
  objc_super v11;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIApplicationSceneDeactivationManager init]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("UIApplicationSceneDeactivationManager.m"), 39, CFSTR("this call must be made on the main thread"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIApplicationSceneDeactivationManager;
  v3 = -[UIApplicationSceneDeactivationManager init](&v11, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    assertions = v3->_assertions;
    v3->_assertions = (NSHashTable *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    eligibleScenes = v3->_eligibleScenes;
    v3->_eligibleScenes = v6;

  }
  return v3;
}

- (NSString)description
{
  return (NSString *)-[UIApplicationSceneDeactivationManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)eligibleScenes
{
  return (id)-[NSMutableSet allObjects](self->_eligibleScenes, "allObjects");
}

- (id)assertions
{
  return -[NSHashTable allObjects](self->_assertions, "allObjects");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIApplicationSceneDeactivationManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIApplicationSceneDeactivationManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIApplicationSceneDeactivationManager *v11;

  v4 = a3;
  -[UIApplicationSceneDeactivationManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UIApplicationSceneDeactivationManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __79__UIApplicationSceneDeactivationManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v3, CFSTR("assertions"), 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("eligibleScenes"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatingScene, 0);
  objc_storeStrong((id *)&self->_eligibleScenes, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
