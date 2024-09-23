@implementation SBSUICameraOverlaySceneClientComponent

- (SBSUICameraOverlaySceneClientComponent)init
{
  SBSUICameraOverlaySceneClientComponent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSUICameraOverlaySceneClientComponent;
  result = -[SBSUICameraOverlaySceneClientComponent init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)addObserver:(id)a3
{
  NSHashTable *lock_observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_observers = self->_lock_observers;
  if (!lock_observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  -[NSHashTable addObject:](lock_observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSHashTable *lock_observers;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_lock_observers, "count"))
  {
    lock_observers = self->_lock_observers;
    self->_lock_observers = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (BSAuditToken)overlayRequestingProcessAuditToken
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayRequestingProcessAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAuditToken *)v4;
}

- (FBSSceneIdentityToken)overlayRequestingSceneIdentityToken
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayRequestingSceneIdentityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSSceneIdentityToken *)v4;
}

- (NSString)overlayRequestingBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayRequestingBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int)overlayRequestingPID
{
  void *v2;
  void *v3;
  int v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayRequestingPID");

  return v4;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke;
  v4[3] = &unk_1E4C400F8;
  v4[4] = self;
  objc_msgSend(a4, "inspect:", v4);
}

void __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  if ((objc_msgSend(v5, "containsProperty:", sel_overlayRequestingBundleIdentifier) & 1) != 0
    || (objc_msgSend(v5, "containsProperty:", sel_overlayRequestingSceneIdentityToken) & 1) != 0
    || (objc_msgSend(v5, "containsProperty:", sel_overlayRequestingPID) & 1) != 0
    || objc_msgSend(v5, "containsProperty:", sel_overlayRequestingProcessAuditToken))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    BSDispatchMain();

  }
}

void __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke_2(uint64_t a1)
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "clientMonitor:requestingSceneUpdatedWithInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end
