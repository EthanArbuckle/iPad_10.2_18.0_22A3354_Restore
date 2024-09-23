@implementation SBIdleTimerCoordinatorHelper

- (id)proposeIdleTimerBehavior:(id)a3 fromProvider:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIdleTimer();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543874;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v8;
    v17 = v19;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "PROPOSE BEHAVIOR: %{public}@ reason:%{public}@ %{public}@", (uint8_t *)&v18, 0x20u);

  }
  -[SBIdleTimerCoordinatorHelper _updateProvider:behavior:reason:](self, "_updateProvider:behavior:reason:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerCoordinatorHelper targetCoordinator](self, "targetCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerCoordinatorHelper sourceProvider](self, "sourceProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "idleTimerProvider:didProposeBehavior:forReason:", v14, v8, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSourceTimer:", v15);
  return v12;
}

- (id)_updateProvider:(id)a3 behavior:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIdleTimer();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138543874;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v9;
    v15 = v17;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "UPDATE BEHAVIOR: %{public}@ reason:%{public}@ %{public}@", (uint8_t *)&v16, 0x20u);

  }
  -[SBIdleTimerCoordinatorHelper _updateProviderInfo:behavior:reason:](self, "_updateProviderInfo:behavior:reason:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "idleTimerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_updateProviderInfo:(id)a3 behavior:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  NSMapTable *idleTimerCache;
  SBIdleTimerProxy *v11;
  SBIdleTimerInfo *v12;
  SBIdleTimerInfo *v13;
  SBIdleTimerProxy *v14;

  v8 = a3;
  v9 = a4;
  idleTimerCache = self->_idleTimerCache;
  v11 = (SBIdleTimerProxy *)a5;
  -[NSMapTable objectForKey:](idleTimerCache, "objectForKey:", v8);
  v12 = (SBIdleTimerInfo *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    -[SBIdleTimerInfo setBehavior:](v12, "setBehavior:", v9);
    -[SBIdleTimerInfo setReason:](v13, "setReason:", v11);
  }
  else
  {
    v14 = -[SBIdleTimerProxy initWithIdleTimerSource:]([SBIdleTimerProxy alloc], "initWithIdleTimerSource:", 0);
    v13 = -[SBIdleTimerInfo initWithProvider:behavior:reason:idleTimerProxy:]([SBIdleTimerInfo alloc], "initWithProvider:behavior:reason:idleTimerProxy:", v8, v9, v11, v14);

    -[NSMapTable setObject:forKey:](self->_idleTimerCache, "setObject:forKey:", v13, v8);
    v11 = v14;
  }

  return v13;
}

- (SBIdleTimerCoordinating)targetCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_targetCoordinator);
}

- (SBIdleTimerProviding)sourceProvider
{
  return (SBIdleTimerProviding *)objc_loadWeakRetained((id *)&self->_sourceProvider);
}

- (id)idleTimerProxyForProvider:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_idleTimerCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idleTimerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBIdleTimerCoordinatorHelper)init
{
  return -[SBIdleTimerCoordinatorHelper initWithSourceProvider:](self, "initWithSourceProvider:", 0);
}

- (SBIdleTimerCoordinatorHelper)initWithSourceProvider:(id)a3
{
  id v4;
  SBIdleTimerCoordinatorHelper *v5;
  SBIdleTimerCoordinatorHelper *v6;
  uint64_t v7;
  NSMapTable *idleTimerCache;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBIdleTimerCoordinatorHelper;
  v5 = -[SBIdleTimerCoordinatorHelper init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceProvider, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    idleTimerCache = v6->_idleTimerCache;
    v6->_idleTimerCache = (NSMapTable *)v7;

  }
  return v6;
}

- (BOOL)hasProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIdleTimerCoordinatorHelper idleTimerCache](self, "idleTimerCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)proposeProvider:(id)a3 byCoordinator:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIdleTimer();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_opt_class();
    v20 = v19;
    v22 = 138543874;
    v23 = v19;
    v24 = 2114;
    v25 = (id)objc_opt_class();
    v26 = 2114;
    v27 = v10;
    v21 = v25;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "PROPOSE provider:%{public}@ coordinator:%{public}@ reason:%{public}@ ", (uint8_t *)&v22, 0x20u);

  }
  objc_msgSend(v8, "coordinatorRequestedIdleTimerBehavior:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerCoordinatorHelper _updateProviderInfo:behavior:reason:](self, "_updateProviderInfo:behavior:reason:", v8, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerCoordinatorHelper targetCoordinator](self, "targetCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerCoordinatorHelper sourceProvider](self, "sourceProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "idleTimerProvider:didProposeBehavior:forReason:", v15, v12, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "idleTimerProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceTimer:", v16);

  return v17;
}

- (void)bindProvider:(id)a3 toSourceTimer:(id)a4 behavior:(id)a5 forReason:(id)a6
{
  id v10;
  id v11;

  v10 = a4;
  -[SBIdleTimerCoordinatorHelper _updateProvider:behavior:reason:](self, "_updateProvider:behavior:reason:", a3, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceTimer:", v10);

}

- (void)removeProvider:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  SBLogIdleTimer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBIdleTimerCoordinatorHelper removeProvider:].cold.1((uint64_t)v4, v5);

  -[NSMapTable removeObjectForKey:](self->_idleTimerCache, "removeObjectForKey:", v4);
}

- (void)setSourceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sourceProvider, a3);
}

- (void)setTargetCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_targetCoordinator, a3);
}

- (NSMapTable)idleTimerCache
{
  return self->_idleTimerCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerCache, 0);
  objc_destroyWeak((id *)&self->_targetCoordinator);
  objc_destroyWeak((id *)&self->_sourceProvider);
}

- (void)removeProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "REMOVE provider: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
