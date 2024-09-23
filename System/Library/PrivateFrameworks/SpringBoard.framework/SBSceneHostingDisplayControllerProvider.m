@implementation SBSceneHostingDisplayControllerProvider

- (SBSceneHostingDisplayControllerProvider)initWithTransformerRegistry:(id)a3 displayManager:(id)a4 workspaceEventQueue:(id)a5 displayModeResolverFactory:(id)a6 policyFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SBSceneHostingDisplayControllerProvider *v18;
  SBSceneHostingDisplayControllerProvider *v19;
  uint64_t v20;
  NSMutableDictionary *lock_capableRootDisplaysToResolverMap;
  uint64_t v22;
  NSMutableSet *lock_derivedDisplaysAwaitingConnection;
  uint64_t v24;
  NSMapTable *lock_rootDisplaysToControllerMap;
  SBDisplayTransformerRegistry *transformerRegistry;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  BSInvalidatable *transformerToken;
  uint64_t v31;
  BSInvalidatable *displayManagerObserverToken;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformerRegistry"));

    if (v14)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayManager"));

  if (v16)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspaceEventQueue"));

    if (v17)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayModeResolverFactory"));

  if (!v15)
    goto LABEL_19;
LABEL_5:
  if (v17)
    goto LABEL_6;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policyFactory"));

LABEL_6:
  v53.receiver = self;
  v53.super_class = (Class)SBSceneHostingDisplayControllerProvider;
  v18 = -[SBSceneHostingDisplayControllerProvider init](&v53, sel_init);
  v19 = v18;
  if (v18)
  {
    v41 = v15;
    v48 = v13;
    objc_storeStrong((id *)&v18->_transformerRegistry, a3);
    objc_storeWeak((id *)&v19->_displayManager, v14);
    v19->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    lock_capableRootDisplaysToResolverMap = v19->_lock_capableRootDisplaysToResolverMap;
    v19->_lock_capableRootDisplaysToResolverMap = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    lock_derivedDisplaysAwaitingConnection = v19->_lock_derivedDisplaysAwaitingConnection;
    v19->_lock_derivedDisplaysAwaitingConnection = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    lock_rootDisplaysToControllerMap = v19->_lock_rootDisplaysToControllerMap;
    v19->_lock_rootDisplaysToControllerMap = (NSMapTable *)v24;

    objc_storeStrong((id *)&v19->_workspaceEventQueue, a5);
    objc_storeStrong((id *)&v19->_resolverFactory, a6);
    objc_storeStrong((id *)&v19->_policyFactory, a7);
    transformerRegistry = v19->_transformerRegistry;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDisplayTransformerRegistry addTransformer:withIdentifier:](transformerRegistry, "addTransformer:withIdentifier:", v19, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    transformerToken = v19->_transformerToken;
    v19->_transformerToken = (BSInvalidatable *)v29;

    objc_msgSend(v14, "addObserver:", v19);
    v31 = objc_claimAutoreleasedReturnValue();
    displayManagerObserverToken = v19->_displayManagerObserverToken;
    v19->_displayManagerObserverToken = (BSInvalidatable *)v31;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v14, "connectedIdentities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v50 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v14, "configurationForIdentity:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSceneHostingDisplayControllerProvider displayManager:didConnectIdentity:withConfiguration:](v19, "displayManager:didConnectIdentity:withConfiguration:", v14, v38, v39);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v35);
    }

    v15 = v41;
    v13 = v48;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_transformerToken, "invalidate");
  -[BSInvalidatable invalidate](self->_displayManagerObserverToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneHostingDisplayControllerProvider;
  -[SBSceneHostingDisplayControllerProvider dealloc](&v3, sel_dealloc);
}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v7 = a5;
  if (objc_msgSend(v11, "isRootIdentity"))
  {
    -[SBWindowingModeResolverFactory resolverForPhysicalDisplay:](self->_resolverFactory, "resolverForPhysicalDisplay:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setDelegate:", self);
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary setObject:forKey:](self->_lock_capableRootDisplaysToResolverMap, "setObject:forKey:", v9, v11);
      os_unfair_lock_unlock(&self->_lock);
      WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
      objc_msgSend(WeakRetained, "updateTransformsWithCompletion:", 0);

    }
  }

}

- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_capableRootDisplaysToResolverMap, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_lock_capableRootDisplaysToResolverMap, "removeObjectForKey:", v8);
  -[NSMapTable objectForKey:](self->_lock_rootDisplaysToControllerMap, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[NSMapTable removeObjectForKey:](self->_lock_rootDisplaysToControllerMap, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
    objc_msgSend(WeakRetained, "updateTransformsWithCompletion:", 0);

  }
}

- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  SBSceneHostingDisplayController *v11;
  SBDisplayControllerInfo *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  SBSceneHostingDisplayController *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = -[NSMutableSet containsObject:](self->_lock_derivedDisplaysAwaitingConnection, "containsObject:", v6);
  -[NSMutableSet removeObject:](self->_lock_derivedDisplaysAwaitingConnection, "removeObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    -[SBSceneHostingDisplayControllerPolicyFactory policyForConnectingDisplay:](self->_policyFactory, "policyForConnectingDisplay:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "displayAssertionPriorityLevel:", v6);
    v10 = objc_msgSend(v8, "displayAssertionDeactivationReasons:", v6);
    v11 = -[SBSceneHostingDisplayController initWithWorkspaceEventQueue:policy:]([SBSceneHostingDisplayController alloc], "initWithWorkspaceEventQueue:policy:", self->_workspaceEventQueue, v8);
    v12 = -[SBDisplayControllerInfo initWithController:windowingMode:priorityLevel:deactivationReasons:]([SBDisplayControllerInfo alloc], "initWithController:windowingMode:priorityLevel:deactivationReasons:", v11, -[SBWindowingModeResolverFactory displayWindowingMode](self->_resolverFactory, "displayWindowingMode"), v9, v10);
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v6, "rootIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_lock_rootDisplaysToControllerMap, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 139, CFSTR("we can only track one controller per physical display. already tracking: %@; wanted to add: %@; to display: %@"),
        v14,
        v11,
        v13);

    }
    -[NSMapTable setObject:forKey:](self->_lock_rootDisplaysToControllerMap, "setObject:forKey:", v11, v13);
    SBLogDisplayControlling();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ tracking controller: %{public}@; display: %{public}@",
        buf,
        0x20u);

    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSMutableSet *lock_derivedDisplaysAwaitingConnection;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_lock_capableRootDisplaysToResolverMap, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isWindowingModeAvailable"))
  {
    v26 = v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D230B0]), "initWithConfiguration:", v5);
    -[SBSceneHostingDisplayControllerPolicyFactory transformDisplayConfiguration:forControllersWithBuilder:](self->_policyFactory, "transformDisplayConfiguration:forControllersWithBuilder:", v5, v10);
    -[NSMapTable objectForKey:](self->_lock_rootDisplaysToControllerMap, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transformDisplayConfiguration:withBuilder:", v5, v10);
    }
    else
    {
      SBLogDisplayTransforming();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SBSceneHostingDisplayControllerProvider transformDisplayConfiguration:].cold.2((uint64_t)self, (uint64_t)a2, v12);

    }
    v28 = 0;
    objc_msgSend(v10, "buildConfigurationWithError:", &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;
    if (v13)
    {
      lock_derivedDisplaysAwaitingConnection = self->_lock_derivedDisplaysAwaitingConnection;
      objc_msgSend(v13, "identity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](lock_derivedDisplaysAwaitingConnection, "addObject:", v15);

      objc_msgSend(v6, "addObject:", v13);
    }
    else
    {
      SBLogDisplayTransforming();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SBSceneHostingDisplayControllerProvider transformDisplayConfiguration:].cold.1((uint64_t)v27, (uint64_t)v5, v16);

    }
    SBLogDisplayTransforming();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v18;
      v31 = 2114;
      v32 = v21;
      v33 = 2114;
      v34 = v13;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] transformed display: %{public}@", buf, 0x20u);

      v6 = v20;
    }

    v9 = v26;
  }
  os_unfair_lock_unlock(&self->_lock);
  SBLogDisplayTransforming();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v24;
    v31 = 2114;
    v32 = v6;
    _os_log_debug_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ returning: %{public}@", buf, 0x16u);

  }
  return v6;
}

- (void)resolver:(id)a3 rootDisplay:(id)a4 didUpdateAvailability:(BOOL)a5
{
  void *v7;
  id WeakRetained;

  if ((objc_msgSend(a4, "isRootIdentity", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayControllerProvider.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplay isRootIdentity]"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
  objc_msgSend(WeakRetained, "updateTransformsWithCompletion:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceEventQueue, 0);
  objc_storeStrong((id *)&self->_policyFactory, 0);
  objc_storeStrong((id *)&self->_lock_rootDisplaysToControllerMap, 0);
  objc_storeStrong((id *)&self->_lock_derivedDisplaysAwaitingConnection, 0);
  objc_storeStrong((id *)&self->_lock_capableRootDisplaysToResolverMap, 0);
  objc_storeStrong((id *)&self->_resolverFactory, 0);
  objc_storeStrong((id *)&self->_displayManagerObserverToken, 0);
  objc_destroyWeak((id *)&self->_displayManager);
  objc_storeStrong((id *)&self->_transformerToken, 0);
  objc_storeStrong((id *)&self->_transformerRegistry, 0);
}

- (void)transformDisplayConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unable to create shell ui external display configuration: %@ from configuration:%@", (uint8_t *)&v3, 0x16u);
}

- (void)transformDisplayConfiguration:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ not passing to controller as we don't have one yet", (uint8_t *)&v5, 0xCu);

}

@end
