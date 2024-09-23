@implementation SBSecureAppManager

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBSecureAppManager secureAppAction](self, "secureAppAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isComplete")
    && objc_msgSend(v6, "automaticallyInvalidatesOnSecureAppUserDismissal"))
  {
    v18 = v6;
    SBSecureAppBundleIdentifierForSecureAppType(objc_msgSend(v6, "secureAppType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5;
    objc_msgSend(v5, "toLayoutState");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "elements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "workspaceEntity");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v13, "applicationSceneEntity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sceneHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "application");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v13) = objc_msgSend(v17, "isEqualToString:", v7);
          if ((v13 & 1) != 0)
          {

            v6 = v18;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

    v6 = v18;
    objc_msgSend(v18, "invalidate");
LABEL_13:

    v5 = v20;
  }

}

- (id)secureAppAction
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__80;
  v9 = __Block_byref_object_dispose__80;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SBSecureAppManager_secureAppAction__block_invoke;
  v4[3] = &unk_1E8EB5178;
  v4[4] = &v5;
  -[SBSecureAppManager _enumerateSecureAppActionsByPriorityUsingBlock:](self, "_enumerateSecureAppActionsByPriorityUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_enumerateSecureAppActionsByPriorityUsingBlock:(id)a3
{
  uint64_t i;

  for (i = 1; i != 14; ++i)
    -[SBSecureAppManager _enumerateSecureAppActionsOfType:usingBlock:](self, "_enumerateSecureAppActionsOfType:usingBlock:", i, a3);
}

- (void)_enumerateSecureAppActionsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, uint64_t, char *);
  NSMutableDictionary *secureAppActions;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, char *))a4;
  secureAppActions = self->_secureAppActions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](secureAppActions, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = 0;
        v6[2](v6, v15, &v16);
        if (v16)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

+ (SBSecureAppManager)sharedInstance
{
  if (sharedInstance_onceToken_33 != -1)
    dispatch_once(&sharedInstance_onceToken_33, &__block_literal_global_232);
  return (SBSecureAppManager *)(id)sharedInstance_sharedInstance_6;
}

void __36__SBSecureAppManager_sharedInstance__block_invoke()
{
  SBSecureAppManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBSecureAppManager);
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;

}

- (SBSecureAppManager)init
{
  SBSecureAppManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *secureAppActions;
  uint64_t v5;
  NSHashTable *observers;
  NSMutableArray *v7;
  NSMutableArray *remoteAlertActions;
  uint64_t v9;
  NSHashTable *wakeDestinationProviders;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSecureAppManager;
  v2 = -[SBSecureAppManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    secureAppActions = v2->_secureAppActions;
    v2->_secureAppActions = v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    remoteAlertActions = v2->_remoteAlertActions;
    v2->_remoteAlertActions = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    wakeDestinationProviders = v2->_wakeDestinationProviders;
    v2->_wakeDestinationProviders = (NSHashTable *)v9;

  }
  return v2;
}

- (BOOL)hasWakeDestination
{
  void *v2;
  BOOL v3;

  -[SBSecureAppManager wakeDestination](self, "wakeDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBWakeDestination)wakeDestination
{
  SBWakeDestination *v3;
  NSHashTable *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  SBWakeDestination *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SBSecureAppManager hasSecureApp](self, "hasSecureApp"))
  {
    v3 = objc_alloc_init(SBWakeDestination);
    -[SBWakeDestination setType:](v3, "setType:", 1);
    -[SBSecureAppManager secureAppAction](self, "secureAppAction");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    SBSecureAppBundleIdentifierForSecureAppType(-[NSHashTable secureAppType](v4, "secureAppType"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBWakeDestination setIdentifier:](v3, "setIdentifier:", v5);
LABEL_23:

LABEL_24:
    return v3;
  }
  if (-[NSMutableArray count](self->_remoteAlertActions, "count"))
  {
    -[NSMutableArray lastObject](self->_remoteAlertActions, "lastObject");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    -[NSHashTable configurationObject](v4, "configurationObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v5 = v9;

    if (v5)
    {
      v3 = objc_alloc_init(SBWakeDestination);
      -[SBWakeDestination setType:](v3, "setType:", 2);
      -[SBWakeDestination setRemoteAlertDefinition:](v3, "setRemoteAlertDefinition:", v5);
    }
    else
    {
      v3 = 0;
    }
    goto LABEL_23;
  }
  if (-[NSHashTable count](self->_wakeDestinationProviders, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_wakeDestinationProviders;
    v3 = (SBWakeDestination *)-[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v3)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v3; i = (SBWakeDestination *)((char *)i + 1))
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "wakeDestinationHandler", (_QWORD)v14);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v5 = (id)v12;
            v3 = objc_alloc_init(SBWakeDestination);
            -[SBWakeDestination setType:](v3, "setType:", 3);
            -[SBWakeDestination setWakeHandler:](v3, "setWakeHandler:", v5);
            goto LABEL_23;
          }
        }
        v3 = (SBWakeDestination *)-[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v3)
          continue;
        break;
      }
    }
    goto LABEL_24;
  }
  return (SBWakeDestination *)0;
}

- (void)addLockScreenContentAction:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "slot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAB7B0]);

  if (v5)
    -[SBSecureAppManager _addSecureAppAction:](self, "_addSecureAppAction:", v6);
  else
    -[SBSecureAppManager _addRemoteAlertLockScreenContentAction:](self, "_addRemoteAlertLockScreenContentAction:", v6);

}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
      v4 = v6;
    }
  }

}

- (void)addWakeDestinationProvider:(id)a3
{
  -[NSHashTable addObject:](self->_wakeDestinationProviders, "addObject:", a3);
}

- (void)removeWakeDestinationProvider:(id)a3
{
  -[NSHashTable removeObject:](self->_wakeDestinationProviders, "removeObject:", a3);
}

- (BOOL)hasSecureApp
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SBSecureAppManager_hasSecureApp__block_invoke;
  v4[3] = &unk_1E8EB5178;
  v4[4] = &v5;
  -[SBSecureAppManager _enumerateSecureAppActionsByPriorityUsingBlock:](self, "_enumerateSecureAppActionsByPriorityUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__SBSecureAppManager_hasSecureApp__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isValid");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasSecureAppOfType:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBSecureAppManager_hasSecureAppOfType___block_invoke;
  v5[3] = &unk_1E8EB5178;
  v5[4] = &v6;
  -[SBSecureAppManager _enumerateSecureAppActionsOfType:usingBlock:](self, "_enumerateSecureAppActionsOfType:usingBlock:", a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SBSecureAppManager_hasSecureAppOfType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isValid");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)newApplicationSceneEntityForCurrentSecureApp
{
  void *v3;
  void *v4;

  -[SBSecureAppManager secureAppAction](self, "secureAppAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSecureAppManager _applicationSceneEntityForAction:](self, "_applicationSceneEntityForAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newHostableEntityForCurrentSecureApp
{
  void *v2;
  void *v3;

  -[SBSecureAppManager secureAppAction](self, "secureAppAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInProcessAction"))
  {
    objc_msgSend(v2, "hostableEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __37__SBSecureAppManager_secureAppAction__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isValid"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)setSecureAppTransitionCoordinator:(id)a3
{
  SBLayoutStateTransitionCoordinator *v5;
  SBLayoutStateTransitionCoordinator *secureAppTransitionCoordinator;
  SBLayoutStateTransitionCoordinator *v7;

  v5 = (SBLayoutStateTransitionCoordinator *)a3;
  secureAppTransitionCoordinator = self->_secureAppTransitionCoordinator;
  if (secureAppTransitionCoordinator != v5)
  {
    v7 = v5;
    -[SBLayoutStateTransitionCoordinator removeObserver:](secureAppTransitionCoordinator, "removeObserver:", self);
    objc_storeStrong((id *)&self->_secureAppTransitionCoordinator, a3);
    -[SBLayoutStateTransitionCoordinator addObserver:](self->_secureAppTransitionCoordinator, "addObserver:", self);
    v5 = v7;
  }

}

- (void)_addSecureAppAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSMutableDictionary *secureAppActions;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51[2];
  id from;
  id location;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "secureAppType");
  secureAppTypeName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke;
  v54[3] = &unk_1E8EB51A0;
  v8 = v4;
  v55 = v8;
  v56 = &v57;
  -[SBSecureAppManager _enumerateSecureAppActionsOfType:usingBlock:](self, "_enumerateSecureAppActionsOfType:usingBlock:", v5, v54);
  if (!*((_BYTE *)v58 + 24))
  {
    objc_initWeak(&location, v8);
    objc_initWeak(&from, self);
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke_12;
    v47[3] = &unk_1E8EB51C8;
    objc_copyWeak(&v50, &location);
    v47[4] = self;
    v51[1] = v5;
    objc_copyWeak(v51, &from);
    v15 = v6;
    v48 = v15;
    v16 = v38;
    v49 = v16;
    objc_msgSend(v8, "setInvalidationHandler:", v47);
    if (!objc_msgSend(v8, "isValid"))
    {
LABEL_32:

      objc_destroyWeak(v51);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_33;
    }
    secureAppActions = self->_secureAppActions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](secureAppActions, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      SBLogCoverSheet();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 134218498;
        v63 = (id)(v21 + 1);
        v64 = 2112;
        v65 = v15;
        v66 = 2112;
        v67 = v16;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "add content action (app) #%lu with type: %@ and identifier: %@", buf, 0x20u);
      }

      objc_msgSend(v19, "addObject:", v8);
      v22 = self->_secureAppActions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v19, v23);

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v61, 16);
      if (!v25)
        goto LABEL_31;
      v37 = v19;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v28, "secureAppOfTypeDidTakeNewAssertion:", v5);
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v61, 16);
      }
      while (v25);
    }
    else
    {
      SBLogCoverSheet();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v63 = v15;
        v64 = 2112;
        v65 = v16;
        _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "add content action (app) new with type: %@ and identifier: %@", buf, 0x16u);
      }

      v30 = self->_secureAppActions;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, v32);

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v24 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
      if (!v33)
        goto LABEL_31;
      v37 = 0;
      v34 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(v24);
          v36 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v36, "secureAppOfTypeDidBegin:", v5);
        }
        v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
      }
      while (v33);
    }
    v19 = v37;
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSecureAppManager cannot accept action %@ with type %@ because it already has one "), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCoverSheet();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBSceneManager _handleAction:forScene:].cold.1((uint64_t)v9, v10);

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v69 = *MEMORY[0x1E0CB2D50];
  v70[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB960], 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendResponse:", v14);

LABEL_33:
  _Block_object_dispose(&v57, 8);

}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v5 = a2;
  v6 = objc_msgSend(v5, "supportedInterfaceOrientations");
  v7 = objc_msgSend(*(id *)(a1 + 32), "supportedInterfaceOrientations");
  v8 = objc_msgSend(v5, "type");
  v9 = objc_msgSend(*(id *)(a1 + 32), "type");
  v10 = objc_msgSend(v5, "isValid");

  if (v10 && v6 == v7 && v8 == v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke_12(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke_2;
  v3[3] = &unk_1E8EB51C8;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v2 = *(void **)(a1 + 72);
  v3[4] = *(_QWORD *)(a1 + 32);
  v7[1] = v2;
  objc_copyWeak(v7, (id *)(a1 + 64));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "containsObject:", WeakRetained))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v6, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 1)
    {
      SBLogCoverSheet();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v30 = v10;
        v31 = 2112;
        v32 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "removed last content action (app) with type: %@, last had identifier: %@", buf, 0x16u);
      }

      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);
    }
    else
    {
      objc_msgSend(v5, "removeObject:", WeakRetained);
      SBLogCoverSheet();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v30 = v15;
        v31 = 2112;
        v32 = v16;
        v33 = 2048;
        v34 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "removed a content action (app) with type: %@ and identifier: %@. %lu remain.", buf, 0x20u);
      }

      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v5, v13);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "secureAppOfTypeDidEnd:", *(_QWORD *)(a1 + 72), (_QWORD)v24);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }

  }
}

- (void)_addRemoteAlertLockScreenContentAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SBSecureAppManager *v13;
  id v14;
  id location;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "secureAppType");
  secureAppTypeName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  SBLogCoverSheet();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "add content action (alert) with type: %@ and identifier: %@", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke;
  v10[3] = &unk_1E8EB51F0;
  objc_copyWeak(&v14, &location);
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v13 = self;
  objc_msgSend(v4, "setInvalidationHandler:", v10);
  -[NSMutableArray addObject:](self->_remoteAlertActions, "addObject:", v4);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke_2;
  v4[3] = &unk_1E8EB51F0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v8);
}

void __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "removing content action (alert) with type: %@ and identifier: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeObject:", WeakRetained);
}

- (id)_applicationSceneEntityForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  SBDeviceApplicationSceneEntity *v8;
  uint64_t v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isInProcessAction")
    || (objc_msgSend(v4, "applicationSceneEntity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "setApplicationSceneEntity:", 0),
        !v5))
  {
    -[SBSecureAppManager _applicationForAction:](self, "_applicationForAction:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SBSecureAppPolicy shouldAlwaysShowSecureSceneForApp:](SBSecureAppPolicy, "shouldAlwaysShowSecureSceneForApp:", v6);
    v8 = [SBDeviceApplicationSceneEntity alloc];
    if (v7)
      v9 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainSecureDisplay:](v8, "initWithApplicationForMainSecureDisplay:", v6);
    else
      v9 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v8, "initWithApplicationForMainDisplay:", v6);
    v5 = (void *)v9;

  }
  return v5;
}

- (id)_applicationForAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  SBSecureAppBundleIdentifierForSecureAppType(objc_msgSend(a3, "secureAppType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBLayoutStateTransitionCoordinator)secureAppTransitionCoordinator
{
  return self->_secureAppTransitionCoordinator;
}

- (NSMutableDictionary)secureAppActions
{
  return self->_secureAppActions;
}

- (void)setSecureAppActions:(id)a3
{
  objc_storeStrong((id *)&self->_secureAppActions, a3);
}

- (NSMutableArray)remoteAlertActions
{
  return self->_remoteAlertActions;
}

- (void)setRemoteAlertActions:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertActions, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSHashTable)wakeDestinationProviders
{
  return self->_wakeDestinationProviders;
}

- (void)setWakeDestinationProviders:(id)a3
{
  objc_storeStrong((id *)&self->_wakeDestinationProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeDestinationProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_remoteAlertActions, 0);
  objc_storeStrong((id *)&self->_secureAppActions, 0);
  objc_storeStrong((id *)&self->_secureAppTransitionCoordinator, 0);
}

@end
