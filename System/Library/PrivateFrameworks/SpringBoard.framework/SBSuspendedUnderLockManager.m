@implementation SBSuspendedUnderLockManager

- (SBSuspendedUnderLockManager)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  id v6;
  id v7;
  SBSuspendedUnderLockManager *v8;
  SBSuspendedUnderLockManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSuspendedUnderLockManager;
  v8 = -[SBSuspendedUnderLockManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_eventQueue, a4);
  }

  return v9;
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
  -[SBSuspendedUnderLockManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](self, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", a3, 0, 0);
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  void (**v18)(_QWORD);
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(_QWORD))a5;
  if (self->_suspendedUnderLock == v6)
  {
    if (v8)
      v8[2](v8);
    if (v9)
      v9[2](v9);
  }
  else
  {
    self->_suspendedUnderLock = v6;
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Suspended under lock = %{public}@", buf, 0xCu);

    }
    v12 = setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock__monotonicallyIncreasingEventCount++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SuspendedUnderLockUpdate-%ld"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D229B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke;
    v16[3] = &unk_1E8EBBF00;
    v16[4] = self;
    v17 = v8;
    v19 = v6;
    v18 = v9;
    objc_msgSend(v14, "eventWithName:handler:", v13, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceEventQueue executeOrAppendEvent:](self->_eventQueue, "executeOrAppendEvent:", v15);

  }
}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = *(_BYTE *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "suspendedUnderLockManagerVisibleScenes:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Main workspace suspended under lock = %{public}@", buf, 0xCu);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "sceneIfExists");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v30[0] = v11;
          v30[1] = 3221225472;
          v30[2] = __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_2;
          v30[3] = &unk_1E8EB0DF0;
          v30[4] = *(_QWORD *)(a1 + 32);
          v31 = v13;
          objc_msgSend(v31, "updateSettingsWithBlock:", v30);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = WeakRetained;
    objc_msgSend(WeakRetained, "runningApplicationScenes:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "sceneIfExists");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = objc_opt_class();
            objc_msgSend(v20, "settings");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            SBSafeCast(v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v23, "underLock"))
              objc_msgSend(v20, "updateSettingsWithBlock:", &__block_literal_global_330);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v17);
    }

    WeakRetained = v25;
  }
  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
    (*(void (**)(void))(v24 + 16))();

}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_class();
  SBSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_BYTE **)(a1 + 32);
  if (v6[25] && objc_msgSend(v6, "_shouldPutSceneUnderLock:", *(_QWORD *)(a1 + 40)))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "_shouldBeBackgroundUnderLockForScene:withSettings:", v8, v9);

    v10 = v7 ^ 1;
    v11 = 1;
  }
  else
  {
    v11 = 0;
    v10 = 1;
  }
  objc_msgSend(v5, "setForeground:", v10);
  objc_msgSend(v5, "setUnderLock:", v11);
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "isForeground");
    v15 = CFSTR("Background");
    if (v14)
      v15 = CFSTR("Foreground");
    v16 = 138543618;
    v17 = v13;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Mutating foregroundness due to under lock change for %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);

  }
}

void __102__SBSuspendedUnderLockManager_setSuspendedUnderLock_alongsideWillChangeBlock_alongsideDidChangeBlock___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setUnderLock:", 0);
}

- (void)interceptUpdateForScene:(id)a3 withNewSettings:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_class();
  SBSafeCast(v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isUISubclass"))
  {
    objc_msgSend(WeakRetained, "suspendedUnderLockManager:sceneHandleForScene:", self, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (self->_eventQueue_suspendedUnderLock
        && -[SBSuspendedUnderLockManager _shouldPutSceneUnderLock:](self, "_shouldPutSceneUnderLock:", v7))
      {
        if (objc_msgSend(v8, "isForeground")
          && -[SBSuspendedUnderLockManager _shouldBeBackgroundUnderLockForScene:withSettings:](self, "_shouldBeBackgroundUnderLockForScene:withSettings:", v7, v8))
        {
          SBLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = 138412290;
            v17 = v14;
            _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Intercepted scene (%@) attempting to foreground, but it should be background - forcing to background.", (uint8_t *)&v16, 0xCu);

          }
          objc_msgSend(v11, "setForeground:", 0);
        }
        if (objc_msgSend(v11, "isForeground"))
          objc_msgSend(v11, "setUnderLock:", 1);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSuspendedUnderLockManager.m"), 140, CFSTR("Must have a handle for this scene if we're trying to intercept it."));

    }
  }

}

- (BOOL)_shouldPutSceneUnderLock:(id)a3
{
  SBSuspendedUnderLockManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  char v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(WeakRetained, "suspendedUnderLockManager:shouldPreventUnderLockForScene:", self, v5);

  return (v7 & 1) == 0 && self->_eventQueue_suspendedUnderLock;
}

- (BOOL)_shouldBeBackgroundUnderLockForScene:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  int v10;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "suspendedUnderLockManager:shouldPreventSuspendUnderLockForScene:settings:", self, v7, v6);

  if ((v9 & 1) != 0 || !self->_eventQueue_suspendedUnderLock)
    LOBYTE(v10) = 0;
  else
    v10 = objc_msgSend(v6, "isIgnoringOcclusions") ^ 1;

  return v10;
}

- (BOOL)isSuspendedUnderLock
{
  return self->_suspendedUnderLock;
}

- (SBSuspendedUnderLockManagerDelegate)delegate
{
  return (SBSuspendedUnderLockManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
