@implementation SBKeyboardFocusService

- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 systemUIScenesCoordinator:(id)a4
{
  id v6;
  id v7;
  _SBKeyboardServiceSceneResolver *v8;
  SBKeyboardServiceConnectionListenerFactory *v9;
  SBKeyboardFocusService *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_SBKeyboardServiceSceneResolver);
  -[_SBKeyboardServiceSceneResolver setSystemUIScenesCoordinator:](v8, "setSystemUIScenesCoordinator:", v6);

  v9 = objc_alloc_init(SBKeyboardServiceConnectionListenerFactory);
  v10 = -[SBKeyboardFocusService initWithKeyboardFocusController:sceneResolver:serviceListenerFactory:](self, "initWithKeyboardFocusController:sceneResolver:serviceListenerFactory:", v7, v8, v9);

  return v10;
}

- (SBKeyboardFocusService)initWithKeyboardFocusController:(id)a3 sceneResolver:(id)a4 serviceListenerFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBKeyboardFocusService *v12;
  SBKeyboardFocusService *v13;
  uint64_t v14;
  OS_dispatch_queue *serviceQueue;
  uint64_t v16;
  _SBKeyboardServiceConnectionListening *serviceConnectionListener;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBKeyboardFocusService;
  v12 = -[SBKeyboardFocusService init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyboardFocusController, a3);
    objc_storeStrong((id *)&v13->_sceneResolver, a4);
    v13->_lock._os_unfair_lock_opaque = 0;
    v14 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v13->_serviceQueue;
    v13->_serviceQueue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(v11, "newKeyboardServiceListenerForDelegate:serviceQueue:", v13, v13->_serviceQueue);
    serviceConnectionListener = v13->_serviceConnectionListener;
    v13->_serviceConnectionListener = (_SBKeyboardServiceConnectionListening *)v16;

    -[_SBKeyboardServiceConnectionListening activate](v13->_serviceConnectionListener, "activate");
  }

  return v13;
}

- (void)client:(id)a3 requestKeyboardFocusForSceneIdentity:(id)a4 pid:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a4;
  v12 = a5;
  v13 = a6;
  v9 = v13;
  v10 = v12;
  v11 = v8;
  BSDispatchMain();

}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = objc_msgSend(*(id *)(a1 + 48), "intValue");
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 1024;
      v20 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: requestKeyboardFocusForSceneIdentity %{public}@ pid: %i", buf, 0x12u);
    }

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 32);
      *(_QWORD *)(v9 + 32) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_msgSend(v7, "addObject:", v2);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_4;
    v13[3] = &unk_1E8E9E220;
    v13[4] = v11;
    v14 = v2;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v12, "userFocusRequestForScene:reason:completion:", v14, CFSTR("SBKeyboardFocusService"), v13);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 32), "containsObject:", a1[5]) & 1) == 0)
  {
    SBLogKeyboardFocus();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[6];
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: finally got a callback for userFocusRequestedForScene %{public}@, but we are no longer tracking this scene, so updating keyboard focus controller once more", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1[4] + 8), "removeKeyboardFocusFromScene:", a1[5]);
  }
  v6 = a1[7];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

}

- (void)client:(id)a3 removeKeyboardFocusFromSceneIdentity:(id)a4 pid:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  BSDispatchMain();

}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", v2);
    SBLogKeyboardFocus();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((v3 & 1) != 0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = objc_msgSend(*(id *)(a1 + 48), "intValue");
        v9 = 138543618;
        v10 = v6;
        v11 = 1024;
        v12 = v7;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity %{public}@ pid: %i", (uint8_t *)&v9, 0x12u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeKeyboardFocusFromScene:", v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v2);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_2();

    }
  }
  else
  {
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_1();

  }
}

- (void)client:(id)a3 deferAdditionalEnvironments:(id)a4 whenSceneHasKeyboardFocus:(id)a5 pid:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v10;
  v11 = v9;
  v12 = v10;
  v13 = v16;
  v14 = v15;
  BSDispatchMain();

}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sceneForSceneIdentityToken:inProcess:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = *(_QWORD *)(a1 + 56);
    v24 = 0;
    objc_msgSend(v3, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v4, v5, v6, &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    if (v8)
    {
      SBLogKeyboardFocus();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deferAdditionalEnvironments:whenTargetHasKeyboardFocus:", v7, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      }
      objc_msgSend(v17, "objectForKey:", *(_QWORD *)(a1 + 64));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v21, *(_QWORD *)(a1 + 64));
      }
      objc_msgSend(v21, "objectForKey:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        objc_msgSend(v22, "invalidate");
      objc_msgSend(v21, "setObject:forKey:", v16, v9);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));

    }
  }
  else
  {
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_1();
  }

}

- (void)client:(id)a3 setExternalSceneIdentities:(id)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *lock_externalSceneIdentitiesByClient;
  uint64_t v9;
  NSMapTable *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_externalSceneIdentitiesByClient)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    lock_externalSceneIdentitiesByClient = self->_lock_externalSceneIdentitiesByClient;
    self->_lock_externalSceneIdentitiesByClient = v7;

  }
  v9 = objc_msgSend(v6, "count");
  v10 = self->_lock_externalSceneIdentitiesByClient;
  if (v9)
    -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v6, v11);
  else
    -[NSMapTable removeObjectForKey:](v10, "removeObjectForKey:", v11);
  -[SBKeyboardFocusService _lock_updateExternalSceneIdentities](self, "_lock_updateExternalSceneIdentities");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)client:(id)a3 stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a4 pid:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a3;
  +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v8, objc_msgSend(a5, "intValue"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_additionalDeferringRulesByClient, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "removeObjectForKey:", v13);
    objc_msgSend(v12, "invalidate");
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)clientDidDisconnect:(id)a3
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
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectForKey:](self->_lock_additionalDeferringRulesByClient, "objectForKey:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMapTable removeObjectForKey:](self->_lock_additionalDeferringRulesByClient, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_lock_externalSceneIdentitiesByClient, "removeObjectForKey:", v4);
  -[SBKeyboardFocusService _lock_updateExternalSceneIdentities](self, "_lock_updateExternalSceneIdentities");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_updateExternalSceneIdentities
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_lock_externalSceneIdentitiesByClient, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
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
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v6);
  }

  SBLogKeyboardFocus();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBKeyboardFocusService: external scene identities are now: %{public}@", buf, 0xCu);
  }

  -[SBKeyboardFocusControlling setExternalSceneIdentities:](self->_keyboardFocusController, "setExternalSceneIdentities:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_lock_externalSceneIdentitiesByClient, 0);
  objc_storeStrong((id *)&self->_lock_additionalDeferringRulesByClient, 0);
  objc_storeStrong((id *)&self->_focusRequestedScenes, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
  objc_storeStrong((id *)&self->_sceneResolver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
}

void __85__SBKeyboardFocusService_client_requestKeyboardFocusForSceneIdentity_pid_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "SBKeyboardFocusService: requestKeyboardFocusForSceneIdentity failed to find scene %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity failed to find scene %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __74__SBKeyboardFocusService_client_removeKeyboardFocusFromSceneIdentity_pid___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "SBKeyboardFocusService: removeKeyboardFocusFromSceneIdentity called for non-focus-requested scene %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "SBKeyboardFocusService: deferAdditionalEnvironments: failed to find scene %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __91__SBKeyboardFocusService_client_deferAdditionalEnvironments_whenSceneHasKeyboardFocus_pid___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBKeyboardFocusService: failed to unarchive deferral environment data, error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
