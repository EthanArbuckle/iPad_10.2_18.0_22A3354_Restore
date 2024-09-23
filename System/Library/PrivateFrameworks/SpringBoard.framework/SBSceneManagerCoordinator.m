@implementation SBSceneManagerCoordinator

- (id)_sceneManagerForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  SBSystemShellExternalDisplaySceneManager *v10;
  SBSystemShellExternalDisplaySceneManager *v11;
  void *v12;
  void *v13;
  SBSystemShellExternalDisplaySceneManager *v14;
  id v15;
  __objc2_class *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  SBSceneManagerCoordinator *v22;
  id v23;
  _QWORD block[4];
  id v25;
  SBSceneManagerCoordinator *v26;
  id v27;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator _sceneManagerForDisplayIdentity:creatingIfNecessary:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBSceneManagerCoordinator.m"), 158, CFSTR("this call must be made on the main thread"));

    if (v7)
      goto LABEL_3;
LABEL_27:
    v11 = 0;
    goto LABEL_28;
  }
  if (!v7)
    goto LABEL_27;
LABEL_3:
  -[SBSceneManagerCoordinator _referenceForDisplayIdentity:creatingIfNecessary:](self, "_referenceForDisplayIdentity:creatingIfNecessary:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "manager");
    v10 = (SBSystemShellExternalDisplaySceneManager *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      if (!-[SBSceneManager isValid](v10, "isValid"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 166, CFSTR("attempting to access a manager that has been invalidated : manager=%@"), v11);

      }
    }
    else
    {
      if (objc_msgSend(v7, "isMainRootDisplay"))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke;
        block[3] = &unk_1E8E9E270;
        v25 = v9;
        v26 = self;
        v27 = v7;
        if (_sceneManagerForDisplayIdentity_creatingIfNecessary_____once != -1)
          dispatch_once(&_sceneManagerForDisplayIdentity_creatingIfNecessary_____once, block);
        v11 = (SBSystemShellExternalDisplaySceneManager *)(id)_sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager;

        v13 = v25;
      }
      else if (objc_msgSend(v7, "isMainDisplay")
             && objc_msgSend(v7, "expectsSecureRendering"))
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke_2;
        v20[3] = &unk_1E8E9E270;
        v21 = v9;
        v22 = self;
        v23 = v7;
        if (_sceneManagerForDisplayIdentity_creatingIfNecessary_____once_44 != -1)
          dispatch_once(&_sceneManagerForDisplayIdentity_creatingIfNecessary_____once_44, v20);
        v11 = (SBSystemShellExternalDisplaySceneManager *)(id)_sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager;

        v13 = v21;
      }
      else
      {
        if (objc_msgSend(v7, "sb_displayWindowingMode") == 1)
        {
          v14 = [SBSystemShellExternalDisplaySceneManager alloc];
          v15 = -[SBSceneManagerCoordinator _newLayoutStateSceneIdentityProviderWithDisplayIdentity:](self, "_newLayoutStateSceneIdentityProviderWithDisplayIdentity:", v7);
        }
        else
        {
          if (objc_msgSend(v7, "sb_displayWindowingMode") == 2)
            v16 = SBNonInteractiveDisplaySceneManager;
          else
            v16 = SBSceneManager;
          v14 = (SBSystemShellExternalDisplaySceneManager *)[v16 alloc];
          v15 = -[SBSceneManagerCoordinator _newSceneIdentityProviderWithDisplayIdentity:](self, "_newSceneIdentityProviderWithDisplayIdentity:", v7);
        }
        v13 = v15;
        v11 = -[SBSystemShellExternalDisplaySceneManager initWithReference:sceneIdentityProvider:presentationBinder:](v14, "initWithReference:sceneIdentityProvider:presentationBinder:", v9, v15, 0);
      }

      objc_msgSend(v9, "setManager:", v11);
    }
  }
  else
  {
    v11 = 0;
  }

LABEL_28:
  return v11;
}

- (id)_referenceForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SBSceneManagerReference *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  SBSceneManagerReference *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator _referenceForDisplayIdentity:creatingIfNecessary:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBSceneManagerCoordinator.m"), 134, CFSTR("this call must be made on the main thread"));

    if (v7)
      goto LABEL_3;
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if (!v7)
    goto LABEL_15;
LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_displayIdentityToReferenceMap, "objectForKey:", v7);
  v8 = (SBSceneManagerReference *)objc_claimAutoreleasedReturnValue();
  if (-[SBSceneManagerReference isDefunct](v8, "isDefunct"))
  {
    if (-[SBSceneManagerReference isRetaining](v8, "isRetaining"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 140, CFSTR("the reference is dead but we thought we were retaining it : ref=%@"), v8);

    }
    BKLogDisplay();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "purging a defunct sceneManagerReference=%{public}@", buf, 0xCu);
    }

    -[SBSceneManagerReference setDelegate:](v8, "setDelegate:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_displayIdentityToReferenceMap, "removeObjectForKey:", v7);

    v8 = 0;
  }
  if (!v8 && v4)
  {
    v8 = -[SBSceneManagerReference initWithDisplayIdentity:]([SBSceneManagerReference alloc], "initWithDisplayIdentity:", v7);
    -[SBSceneManagerReference setDelegate:](v8, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_displayIdentityToReferenceMap, "setObject:forKey:", v8, v7);
    BKLogDisplay();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "creating sceneManagerReference=%{public}@", buf, 0xCu);
    }

  }
LABEL_16:

  return v8;
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scene:didApplyUpdateWithContext:", v7, v6);

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scene:didCompleteUpdateWithContext:error:", v10, v9, v8);

}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "workspaceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (-[NSMutableSet containsObject:](self->_workspaceIdentifiersToIgnore, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v8, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sceneManager:interceptUpdateForScene:withNewSettings:", v15, v8, v9);
    if (objc_msgSend(v13, "_shouldTrackScenesForDeactivation"))
    {
      -[SBSceneManagerCoordinator sceneDeactivationManager](self, "sceneDeactivationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "amendSceneSettings:forScene:", v9, v8);

    }
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sb_displayIdentityForSceneManagers");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v13, v12, v11, v10);

}

- (id)sceneManagerForDisplayIdentity:(id)a3
{
  return -[SBSceneManagerCoordinator _sceneManagerForDisplayIdentity:creatingIfNecessary:](self, "_sceneManagerForDisplayIdentity:creatingIfNecessary:", a3, 1);
}

- (UIApplicationSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

+ (id)mainDisplaySceneManager
{
  void *v2;
  void *v3;
  void *v4;

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sceneManagerForDisplayIdentity:creatingIfNecessary:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (SBSceneManagerCoordinator)sharedInstance
{
  id v2;
  _QWORD block[5];
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBSceneManagerCoordinator_sharedInstance__block_invoke;
  block[3] = &unk_1E8E9ED40;
  block[4] = v5;
  if (sharedInstance___once_10 != -1)
    dispatch_once(&sharedInstance___once_10, block);
  v2 = (id)sharedInstance___instance_9;
  _Block_object_dispose(v5, 8);
  return (SBSceneManagerCoordinator *)v2;
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scene:didPrepareUpdateWithContext:", v7, v6);

}

- (void)enumerateSceneManagersWithBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[NSMutableDictionary allValues](self->_displayIdentityToReferenceMap, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__SBSceneManagerCoordinator_enumerateSceneManagersWithBlock___block_invoke;
    v6[3] = &unk_1E8EB6A60;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processForPID:", objc_msgSend(v9, "pid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v10;
  objc_msgSend(v10, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "watchdogProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[SBSceneWatchdogProvider defaultSceneWatchdogProvider](SBSceneWatchdogProvider, "defaultSceneWatchdogProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWatchdogProvider:", v13);

  }
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "connectedIdentities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  objc_msgSend(v6, "remnants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v20, "lastSettings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sb_displayIdentityForSceneManagers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_msgSend(v14, "containsObject:", v22) & 1) != 0)
        {
          -[SBSceneManagerCoordinator _sceneManagerForDisplayIdentity:creatingIfNecessary:](self, "_sceneManagerForDisplayIdentity:creatingIfNecessary:", v22, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
            objc_msgSend(v23, "_reconnectSceneRemnant:forProcess:sceneManager:", v20, v28, v27);
          objc_msgSend(v20, "invalidate");

        }
        else
        {
          objc_msgSend(v20, "invalidate");
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "workspaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (-[NSMutableSet containsObject:](self->_workspaceIdentifiersToIgnore, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneManager:didCreateScene:", v12, v6);
    if (objc_msgSend(v10, "_shouldTrackScenesForDeactivation"))
    {
      -[SBSceneManagerCoordinator sceneDeactivationManager](self, "sceneDeactivationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "beginTrackingScene:", v6);

    }
  }

}

void __61__SBSceneManagerCoordinator_enumerateSceneManagersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scene:didReceiveActions:", v7, v6);

}

uint64_t __43__SBSceneManagerCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  SBSceneManagerCoordinator *v2;
  void *v3;
  uint64_t result;

  kdebug_trace();
  v2 = objc_alloc_init(SBSceneManagerCoordinator);
  v3 = (void *)sharedInstance___instance_9;
  sharedInstance___instance_9 = (uint64_t)v2;

  result = kdebug_trace();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (SBSceneManagerCoordinator)init
{
  SBSceneManagerCoordinator *v3;
  uint64_t v4;
  FBSceneManager *sceneManager;
  uint64_t v6;
  NSMutableSet *workspaceIdentifiersToIgnore;
  UIApplicationSceneDeactivationManager *v8;
  UIApplicationSceneDeactivationManager *sceneDeactivationManager;
  NSMutableDictionary *v10;
  NSMutableDictionary *displayIdentityToReferenceMap;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  FBSceneManager *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  SBSceneManagerCoordinator *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator init]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SBSceneManagerCoordinator.m"), 95, CFSTR("this call must be made on the main thread"));

  }
  v30.receiver = self;
  v30.super_class = (Class)SBSceneManagerCoordinator;
  v3 = -[SBSceneManagerCoordinator init](&v30, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    sceneManager = v3->_sceneManager;
    v3->_sceneManager = (FBSceneManager *)v4;

    -[FBSceneManager setDelegate:](v3->_sceneManager, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("com.apple.siri"), *MEMORY[0x1E0D01028], 0);
    v6 = objc_claimAutoreleasedReturnValue();
    workspaceIdentifiersToIgnore = v3->_workspaceIdentifiersToIgnore;
    v3->_workspaceIdentifiersToIgnore = (NSMutableSet *)v6;

    v8 = (UIApplicationSceneDeactivationManager *)objc_alloc_init(MEMORY[0x1E0CEA330]);
    sceneDeactivationManager = v3->_sceneDeactivationManager;
    v3->_sceneDeactivationManager = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayIdentityToReferenceMap = v3->_displayIdentityToReferenceMap;
    v3->_displayIdentityToReferenceMap = v10;

    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v3);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v12, "connectedIdentities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
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
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v12, "configurationForIdentity:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSceneManagerCoordinator displayMonitor:didConnectIdentity:withConfiguration:](v3, "displayMonitor:didConnectIdentity:withConfiguration:", v12, v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v15);
    }

    v20 = v3->_sceneManager;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __33__SBSceneManagerCoordinator_init__block_invoke;
    v24[3] = &unk_1E8EA2978;
    v25 = v3;
    -[FBSceneManager enumerateScenesWithBlock:](v20, "enumerateScenesWithBlock:", v24);

  }
  return v3;
}

uint64_t __33__SBSceneManagerCoordinator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sceneManager:didAddScene:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_displayIdentityToReferenceMap, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "manager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_displayIdentityToReferenceMap, "removeAllObjects");
  -[FBSceneManager setDelegate:](self->_sceneManager, "setDelegate:", 0);
  v10.receiver = self;
  v10.super_class = (Class)SBSceneManagerCoordinator;
  -[SBSceneManagerCoordinator dealloc](&v10, sel_dealloc);
}

void __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke(uint64_t a1)
{
  SBMainDisplaySceneManager *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [SBMainDisplaySceneManager alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "_newLayoutStateSceneIdentityProviderWithDisplayIdentity:", *(_QWORD *)(a1 + 48));
  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBMainDisplaySceneManager initWithReference:sceneIdentityProvider:presentationBinder:](v2, "initWithReference:sceneIdentityProvider:presentationBinder:", v3, v7, v4);
  v6 = (void *)_sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager;
  _sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager = v5;

}

void __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke_2(uint64_t a1)
{
  SBSecureMainDisplaySceneManager *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [SBSecureMainDisplaySceneManager alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "_newSceneIdentityProviderWithDisplayIdentity:", *(_QWORD *)(a1 + 48));
  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSceneManager initWithReference:sceneIdentityProvider:presentationBinder:](v2, "initWithReference:sceneIdentityProvider:presentationBinder:", v3, v7, v4);
  v6 = (void *)_sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager;
  _sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager = v5;

}

- (id)_newSceneIdentityProviderWithDisplayIdentity:(id)a3
{
  id v3;
  SBSceneIdentityProvider *v4;

  v3 = a3;
  v4 = -[SBSceneIdentityProvider initWithDisplayIdentity:]([SBSceneIdentityProvider alloc], "initWithDisplayIdentity:", v3);

  return v4;
}

- (id)_newLayoutStateSceneIdentityProviderWithDisplayIdentity:(id)a3
{
  id v3;
  SBLayoutStateSceneIdentityProvider *v4;

  v3 = a3;
  v4 = -[SBLayoutStateSceneIdentityProvider initWithDisplayIdentity:]([SBLayoutStateSceneIdentityProvider alloc], "initWithDisplayIdentity:", v3);

  return v4;
}

+ (id)secureMainDisplaySceneManager
{
  void *v2;
  void *v3;
  void *v4;

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "sb_secureMainIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sceneManagerForDisplayIdentity:creatingIfNecessary:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sceneManagerForPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_displayIdentityToReferenceMap, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "manager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "existingSceneHandleForPersistenceIdentifier:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (void)registerSceneWorkspaceIdentifierToIgnore:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspaceID"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_workspaceIdentifiersToIgnore, "addObject:", v5);

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  SBSceneManagerCoordinator *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __40__SBSceneManagerCoordinator_description__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __40__SBSceneManagerCoordinator_description__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v2, 0, 1, &__block_literal_global_257);

}

uint64_t __40__SBSceneManagerCoordinator_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "succinctDescription");
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  SBSceneManagerCoordinator *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__SBSceneManagerCoordinator_debugDescription__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __45__SBSceneManagerCoordinator_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SBSceneManagerCoordinator_debugDescription__block_invoke_2;
  v4[3] = &unk_1E8EB6AC8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v3, 0, 1, v4);

}

id __45__SBSceneManagerCoordinator_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescriptionWithMultilinePrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sceneManager:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(a5, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 310, CFSTR("Can't find process handle"));

  }
  objc_msgSend(v12, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "processForPID:", objc_msgSend(v12, "pid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  SBSafeCast(v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "shouldHandleSceneRequestsForProcess:withOptions:", v12, v17))
  {
    objc_msgSend(v18, "activateSceneForProcessIdentity:withHandle:options:completion:", v13, v12, v17, v11);
    goto LABEL_37;
  }
  if (objc_msgSend(v15, "isApplicationProcess"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationWithPid:", objc_msgSend(v15, "pid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[SBSceneManagerCoordinator _createSceneForApplication:withOptions:completion:](self, "_createSceneForApplication:withOptions:completion:", v20, v10, v11);
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2938];
      v60[0] = CFSTR("Scene creation failed, invalid application");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("SBSceneManagerDomain"), 1, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v27);

    }
LABEL_36:

    goto LABEL_37;
  }
  if (objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.springboard.requestScene-daemon")))
  {
    objc_msgSend(v10, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (uint64_t)v23;
    objc_msgSend(v29, "sceneWithIdentifier:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v30, "clientProcess");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 == v15)
      {
        v20 = v23;
LABEL_33:
        if (v11)
          ((void (**)(id, void *, void *))v11)[2](v11, v30, 0);

        goto LABEL_36;
      }

      SBLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v54;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[SBSceneManagerCoordinator sceneManager:didReceiveSceneRequestWithOptions:fromProcess:completion:].cold.1((uint64_t)v15, v54, v32);
      v30 = 0;
    }
    else
    {
      objc_msgSend(v10, "initialClientSettings");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
        v35 = v33;
      else
        v35 = objc_opt_new();
      v36 = v35;
      v53 = v35;

      v37 = -[NSObject preferredInterfaceOrientation](v36, "preferredInterfaceOrientation");
      if ((unint64_t)(v37 - 1) >= 4)
        v38 = 1;
      else
        v38 = v37;
      -[NSObject preferredLevel](v36, "preferredLevel");
      v40 = v39;
      objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23150], "settings");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDisplayConfiguration:", v41);
      v52 = v41;
      objc_msgSend(v41, "bounds");
      objc_msgSend(v42, "setFrame:");
      objc_msgSend(v42, "setLevel:", v40);
      objc_msgSend(v42, "setInterfaceOrientation:", v38);
      objc_msgSend(v42, "setForeground:", 1);
      v43 = (void *)MEMORY[0x1E0D23148];
      objc_msgSend(MEMORY[0x1E0D23240], "specification");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "parametersForSpecification:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v42;
      objc_msgSend(v45, "setSettings:", v42);
      objc_msgSend(v45, "setClientSettings:", v53);
      objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "workspace");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v45;
      objc_msgSend(v46, "createSceneWithIdentifier:parameters:clientProvider:transitionContext:", v54, v45, v47, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogCommon();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v56 = v15;
        v57 = 2114;
        v58 = v30;
        _os_log_impl(&dword_1D0540000, v48, OS_LOG_TYPE_INFO, "process (%{public}@) requested scene creation -> %{public}@", buf, 0x16u);
      }

      v32 = v53;
      v20 = (void *)v54;
    }

    goto LABEL_33;
  }
  SBLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[SBSceneManagerCoordinator sceneManager:didReceiveSceneRequestWithOptions:fromProcess:completion:].cold.2((uint64_t)v15, v24);

  if (v11)
    v11[2](v11, 0, 0);
LABEL_37:

}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "workspaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (-[NSMutableSet containsObject:](self->_workspaceIdentifiersToIgnore, "containsObject:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "clientProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isApplicationProcess") && (objc_msgSend(v8, "isCurrentProcess") & 1) == 0)
    {
      objc_msgSend(v5, "definition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "specification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init((Class)objc_msgSend(v11, "transitionContextClass"));

      if (!v7)
        v7 = objc_alloc_init(MEMORY[0x1E0CEA350]);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)SBApp;
  v5 = a4;
  objc_msgSend(v4, "hearingTestModeCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSceneExtensionIfNeeded:", v5);

}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "workspaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (-[NSMutableSet containsObject:](self->_workspaceIdentifiersToIgnore, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneManager:willDestroyScene:", v12, v6);

    -[SBSceneManagerCoordinator sceneDeactivationManager](self, "sceneDeactivationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endTrackingScene:", v6);

  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "workspaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (-[NSMutableSet containsObject:](self->_workspaceIdentifiersToIgnore, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneManager:didDestroyScene:", v11, v6);

  }
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "addActionHandler:forScene:", v10, v6);

}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self, "sceneManagerForDisplayIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "removeActionHandler:forScene:", v10, v6);

}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator displayMonitor:didConnectIdentity:withConfiguration:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBSceneManagerCoordinator.m"), 512, CFSTR("this call must be made on the main thread"));

  }
  -[SBSceneManagerCoordinator _referenceForDisplayIdentity:creatingIfNecessary:](self, "_referenceForDisplayIdentity:creatingIfNecessary:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayIsConnected:", 1);
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator displayMonitor:willDisconnectIdentity:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSceneManagerCoordinator.m"), 521, CFSTR("this call must be made on the main thread"));

  }
  -[SBSceneManagerCoordinator _referenceForDisplayIdentity:creatingIfNecessary:](self, "_referenceForDisplayIdentity:creatingIfNecessary:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setDisplayIsConnected:", 0);
    objc_msgSend(v7, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);
    if (!v8 && (objc_msgSend(v7, "isRetaining") & 1) == 0)
    {
      BKLogDisplay();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "purging disconnected sceneManagerReference=%{public}@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v7, "setDelegate:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_displayIdentityToReferenceMap, "removeObjectForKey:", v5);
    }

  }
}

- (void)sceneManagerDidInvalidateForReference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerCoordinator sceneManagerDidInvalidateForReference:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBSceneManagerCoordinator.m"), 541, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_displayIdentityToReferenceMap, "objectForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      BKLogDisplay();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138543362;
        v11 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "purging invalidated sceneManagerReference=%{public}@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(v4, "setDelegate:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_displayIdentityToReferenceMap, "removeObjectForKey:", v5);
    }
  }

}

- (void)_createSceneForApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

  }
  v12 = objc_opt_class();
  v13 = v10;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerCoordinator.m"), 569, CFSTR("Invalid scene request options class"));

  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowSceneForPersistentIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(v16, "activeDisplayWindowScene");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_fbsDisplayConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke;
  v30[3] = &unk_1E8E9F770;
  v31 = v15;
  v32 = v21;
  v33 = v9;
  v34 = v11;
  v24 = v11;
  v25 = v9;
  v26 = v21;
  v27 = v15;
  objc_msgSend(v22, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v23, v30, 0);

}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  SBDeviceApplicationSceneEntity *v30;
  void *v31;
  SBDeviceApplicationSceneEntity *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  SBDeviceApplicationSceneEntity *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t *v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "requestCenterSlot")
    && (objc_msgSend(a1[4], "interactionIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "setSource:", 55);
    if (objc_msgSend(a1[4], "requestFullscreen"))
    {
      objc_msgSend(v3, "setCenterConfiguration:", 2);
      objc_msgSend(a1[4], "sourceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCenterWindowSourceSceneID:", v5);

    }
  }
  else
  {
    objc_msgSend(v3, "setSource:", 35);
  }
  objc_msgSend(v3, "setEventLabel:", CFSTR("SceneCreationRequest"));
  objc_msgSend(a1[4], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "sourceIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v62 = objc_msgSend(a1[4], "requestBackground");
  objc_msgSend(a1[5], "sceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom") == 1;

    if (v15)
      goto LABEL_8;
LABEL_13:
    objc_msgSend(v7, "existingSceneHandleForPersistenceIdentifier:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v16 = a1[6];
      objc_msgSend(v7, "sceneIdentityForApplication:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "fetchOrCreateApplicationSceneHandleForRequest:", v19);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    *((_BYTE *)v60 + 24) = 1;
    goto LABEL_19;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_13;
LABEL_8:
  if (v6)
  {
    objc_msgSend(v7, "existingSceneHandleForPersistenceIdentifier:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(a1[6], "_sceneIdentifierForStoredPersistenceIdentifier:", v6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D68];
        v64[0] = CFSTR("Invalid persistenceIdentifier specified");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
        v32 = (SBDeviceApplicationSceneEntity *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("SBSceneManagerDomain"), 1, v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        goto LABEL_23;
      }
      v35 = a1[6];
      objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayIdentity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "fetchOrCreateApplicationSceneHandleForRequest:", v38);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        goto LABEL_24;
      }
    }
    if (objc_msgSend(a1[4], "preserveLayout"))
    {
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_recentAppLayoutsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_2;
      v57[3] = &unk_1E8E9DF78;
      v8 = v8;
      v58 = v8;
      objc_msgSend(v12, "bs_firstObjectPassingTest:", v57);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
LABEL_22:
    v30 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", v8);
    objc_msgSend(a1[4], "actions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v30, "addActions:", v31);

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_3;
    v45[3] = &unk_1E8EB6AF0;
    v32 = v30;
    v46 = v32;
    v56 = &v59;
    v47 = a1[6];
    v29 = v13;
    v48 = v29;
    v49 = v7;
    v50 = a1[4];
    v51 = v40;
    v52 = v6;
    v53 = a1[5];
    v54 = v3;
    v28 = v8;
    v55 = v28;
    objc_msgSend(v54, "modifyApplicationContext:", v45);

    v27 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v20 = a1[6];
  v21 = (void *)objc_msgSend(v7, "newSceneIdentityForApplication:", v20);
  objc_msgSend(v7, "displayIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[4], "requestQuickLookScene"))
  {
    objc_msgSend(v23, "sceneDefinition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CEA8F0], "specification");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSpecification:", v26);

    objc_msgSend(v23, "setSceneDefinition:", v25);
  }
  objc_msgSend(v7, "fetchOrCreateApplicationSceneHandleForRequest:", v23);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  v13 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  if (v8)
    goto LABEL_22;
LABEL_24:
  if (a1[7])
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_5;
    v41[3] = &unk_1E8EA0D60;
    v42 = v28;
    v44 = a1[7];
    v43 = v27;
    v33 = (id)objc_msgSend(v3, "addCompletionHandler:", v41);

  }
  _Block_object_dispose(&v59, 8);

}

uint64_t __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsItemWithUniqueIdentifier:", v4);

  return v5;
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 1;
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 1);
  objc_msgSend(v3, "setAlwaysRunsWatchdog:", 1);
  objc_msgSend(v3, "_setRequestedFrontmostEntity:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 55);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "previousApplicationSceneEntityForBundleID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;

    v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  }
  objc_msgSend(v3, "setBackground:", v4 != 0);
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_4;
    v39[3] = &unk_1E8E9E3B0;
    v40 = *(id *)(a1 + 56);
    v41 = v3;
    objc_msgSend(v7, "enumerate:", v39);

    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 64), "requestFullscreen")
    && !objc_msgSend(*(id *)(a1 + 64), "requestCenterSlot")
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 72), "isEqualToString:", *(_QWORD *)(a1 + 80)))
  {
    objc_msgSend(v3, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 88), "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "windowManagementStyle");

  objc_msgSend(v3, "previousLayoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == 1 && (objc_msgSend(v10, "layoutContainsRole:", 2) & 1) == 0)
    objc_msgSend(v3, "setRequestedSpaceConfiguration:", 3);
  if (objc_msgSend(*(id *)(a1 + 64), "requestCenterSlot"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_dataStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sceneStoreForIdentifier:creatingIfNecessary:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_QWORD *)(a1 + 80) == 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("originatedInCenterWindow"));

      objc_msgSend(*(id *)(a1 + 96), "centerWindowSourceSceneID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("sourceSceneIdentifier"));

      }
    }
    v18 = 4;
    objc_msgSend(v11, "elementWithRole:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (*(_QWORD *)(a1 + 72) && objc_msgSend(v21, "containsString:"))
        v18 = 3;

    }
    objc_msgSend(v3, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 32), v18);
    objc_msgSend(v3, "_setRequestedFrontmostEntity:", *(_QWORD *)(a1 + 32));

    goto LABEL_29;
  }
  if (v9 == 2)
  {
    v43[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", v12, 1, v13, v14);
LABEL_29:

    goto LABEL_30;
  }
  if (v9 == 1)
  {
    objc_msgSend(v11, "elementWithRole:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "workspaceEntity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_opt_class();
    __BSSafeCast(v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sceneHandle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "persistenceIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", *(_QWORD *)(a1 + 72));

    v36 = *(void **)(a1 + 32);
    if (v35)
    {
      objc_msgSend(v3, "setEntity:forLayoutRole:", v36, 1);
      v36 = v30;
    }
    objc_msgSend(v3, "setEntity:forLayoutRole:", v36, 2);

    goto LABEL_31;
  }
  v42 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:", v12, 1, 0, v37, v38);

LABEL_30:
LABEL_31:
  objc_msgSend(*(id *)(a1 + 64), "interactionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 88), "switcherController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(*(id *)(a1 + 104), "sceneIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "associateCenterWindowInteractionIdentifier:withSceneIdentifier:", v23, v28);

    }
  }

LABEL_12:
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  SBDeviceApplicationSceneEntity *v8;
  void *v9;
  void *v10;
  void *v11;
  SBDeviceApplicationSceneEntity *v12;
  id v13;

  v13 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [SBDeviceApplicationSceneEntity alloc];
    objc_msgSend(v13, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "displayIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v8, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v7, v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setEntity:forLayoutRole:", v12, a2);

}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_5(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "sceneIfExists"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "scene");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 40))
    {
      (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D68];
      v11[0] = CFSTR("Scene creation failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SBSceneManagerCoordinatorDomain"), 1, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifiersToIgnore, 0);
  objc_storeStrong((id *)&self->_displayIdentityToReferenceMap, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)sceneManager:(os_log_t)log didReceiveSceneRequestWithOptions:fromProcess:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "process (%{public}@) requested scene creation with identifier \"%@\" but a scene with that identifier already exists", (uint8_t *)&v3, 0x16u);
}

- (void)sceneManager:(uint64_t)a1 didReceiveSceneRequestWithOptions:(NSObject *)a2 fromProcess:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "process (%{public}@) requested scene creation but is not a daemon or lacks the entitlement", (uint8_t *)&v2, 0xCu);
}

@end
