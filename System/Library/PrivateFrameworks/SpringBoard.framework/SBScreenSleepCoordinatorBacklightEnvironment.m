@implementation SBScreenSleepCoordinatorBacklightEnvironment

- (SBScreenSleepCoordinatorBacklightEnvironment)initWithCoordinator:(id)a3
{
  id v4;
  SBScreenSleepCoordinatorBacklightEnvironment *v5;
  SBScreenSleepCoordinatorBacklightEnvironment *v6;
  uint64_t v7;
  NSUUID *uuid;
  uint64_t v9;
  NSHashTable *lock_observers;
  uint64_t v11;
  BLSBacklightSceneVisualState *lock_visualState;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBScreenSleepCoordinatorBacklightEnvironment;
  v5 = -[SBScreenSleepCoordinatorBacklightEnvironment init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_screenSleepCoordinator, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D00F88]), "initWithActiveAppearance:updateFidelity:adjustedLuminance:", 1, 3, 2);
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v11;

  }
  return v6;
}

- (NSString)identifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return 0;
}

- (BOOL)clientHasDelegate
{
  return 1;
}

- (BOOL)isClientActive
{
  return 1;
}

- (BLSBacklightSceneVisualState)visualState
{
  os_unfair_lock_s *p_lock;
  BLSBacklightSceneVisualState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)presentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  return 1;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  SBScreenSleepCoordinatorBacklightEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledForEnvironment;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_alwaysOnEnabledForEnvironment != v3)
    self->_lock_alwaysOnEnabledForEnvironment = v3;
  v6 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "hostEnvironment:hostDidSetAlwaysOnEnabledForEnvironment:", self, v3, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isLiveUpdating
{
  SBScreenSleepCoordinatorBacklightEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_liveUpdating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLiveUpdating:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_liveUpdating != v3)
    self->_lock_liveUpdating = v3;
  v6 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "hostEnvironment:hostDidSetLiveUpdating:", self, v3, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  SBScreenSleepCoordinatorBacklightEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_unrestrictedFramerateUpdates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_unrestrictedFramerateUpdates != v3)
    self->_lock_unrestrictedFramerateUpdates = v3;
  v6 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "hostEnvironment:hostDidSetUnrestrictedFramerateUpdates:", self, v3, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isDisplayBlanked
{
  return 0;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  _BOOL4 v12;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD, __n128);
  void (**v20)(_QWORD);
  __n128 v21;
  BLSBacklightSceneVisualState *v22;
  NSDate *v23;
  NSDate *lock_presentationDate;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  BLSBacklightSceneVisualState *v30;
  void (**v31)(_QWORD);

  v12 = a5;
  v28 = a3;
  v16 = a4;
  v17 = a6;
  v18 = (void (**)(_QWORD))a8;
  v19 = (void (**)(_QWORD, __n128))a9;
  v20 = (void (**)(_QWORD))a10;
  if (v19)
  {
    v21.n128_u64[0] = 0x3FE999999999999ALL;
    if (!v12)
      v21.n128_f64[0] = 0.0;
    v19[2](v19, v21);
  }
  os_unfair_lock_lock(&self->_lock);
  v22 = self->_lock_visualState;
  objc_storeStrong((id *)&self->_lock_visualState, a3);
  objc_msgSend(v16, "date");
  v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v23;

  os_unfair_lock_unlock(&self->_lock);
  v18[2](v18);
  objc_msgSend(v17, "changeRequest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "sourceEvent");

  if (v26 == 15)
  {
    v27 = v28;
    if (v20)
      v20[2](v20);
  }
  else
  {
    v27 = v28;
    v29 = v28;
    v30 = v22;
    v31 = v20;
    BSDispatchMain();

  }
}

void __192__SBScreenSleepCoordinatorBacklightEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "transitionToVisualState:fromVisualState:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0D00F28];
  v9 = a6;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDate:fidelity:", v12, 0);
  v15[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a6 + 2))(v9, v10, v14);

}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *lock_presentationDate;
  BLSBacklightSceneVisualState *lock_visualState;
  uint64_t v10;
  BLSBacklightSceneVisualState *v11;
  BLSBacklightSceneVisualState *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v6, "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v7;

  lock_visualState = self->_lock_visualState;
  v10 = objc_msgSend(v6, "fidelity");

  v11 = (BLSBacklightSceneVisualState *)-[BLSBacklightSceneVisualState newVisualStateWithUpdateFidelity:](lock_visualState, "newVisualStateWithUpdateFidelity:", v10);
  v12 = self->_lock_visualState;
  self->_lock_visualState = v11;

  os_unfair_lock_unlock(&self->_lock);
  v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    v13 = v14;
  }

}

- (void)clearPresentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *lock_presentationDate;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateContentForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "hostEnvironment:invalidateContentForReason:", self, v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_screenSleepCoordinator);
}

@end
