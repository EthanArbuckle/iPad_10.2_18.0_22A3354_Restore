@implementation SBFSceneWorkspaceDefaultDelegate

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  id v24;
  SBFSceneWorkspaceDefaultDelegate *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  SBFSceneWorkspaceDefaultDelegate *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v27 = a4;
  BSDispatchQueueAssertMain();
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v24, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v34 = self;
    v35 = 2114;
    v36 = v7;
    v37 = 2114;
    v38 = v27;
    _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] client did connect with handshake: %{public}@", buf, 0x20u);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = self;
  -[NSMutableSet allObjects](self->_scenesActivatedUponClientConnection, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v29;
    *(_QWORD *)&v9 = 134218498;
    v23 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "definition", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clientIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "processIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "isEqual:", v18);

        if (v19 && (objc_msgSend(v13, "isActive") & 1) == 0)
        {
          -[SBFSceneWorkspaceDefaultDelegate _activateScene:](v25, "_activateScene:", v13);
          SBLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v34 = v25;
            v35 = 2114;
            v36 = v21;
            v37 = 2114;
            v38 = v22;
            _os_log_impl(&dword_18AB69000, v20, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] scene was activated for client process is running: %{public}@", buf, 0x20u);

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  SBFSceneWorkspaceDefaultDelegate *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "contentState");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218498;
    v9 = self;
    v10 = 2048;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] content state did change: %ld for scene: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (SBFSceneWorkspaceDefaultDelegate)init
{
  SBFSceneWorkspaceDefaultDelegate *v2;
  uint64_t v3;
  NSMutableSet *scenesKeptActiveWhileForeground;
  uint64_t v5;
  NSMutableSet *scenesActivatedUponClientConnection;
  uint64_t v7;
  NSMutableDictionary *scenesWithActivationContextGeneratorBlock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFSceneWorkspaceDefaultDelegate;
  v2 = -[SBFSceneWorkspaceDefaultDelegate init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    scenesKeptActiveWhileForeground = v2->_scenesKeptActiveWhileForeground;
    v2->_scenesKeptActiveWhileForeground = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    scenesActivatedUponClientConnection = v2->_scenesActivatedUponClientConnection;
    v2->_scenesActivatedUponClientConnection = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    scenesWithActivationContextGeneratorBlock = v2->_scenesWithActivationContextGeneratorBlock;
    v2->_scenesWithActivationContextGeneratorBlock = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)setScene:(id)a3 shouldActivateUponClientConnection:(BOOL)a4 withContextGenerator:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v10 = 0;
  }
  -[SBFSceneWorkspaceDefaultDelegate _setScene:cached:inContainer:withContextGenerator:](self, "_setScene:cached:inContainer:withContextGenerator:", v10, v6, self->_scenesActivatedUponClientConnection, v11);

}

- (void)setScene:(id)a3 shouldBeKeptActiveWhileForeground:(BOOL)a4 withContextGenerator:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v10 = 0;
  }
  -[SBFSceneWorkspaceDefaultDelegate _setScene:cached:inContainer:withContextGenerator:](self, "_setScene:cached:inContainer:withContextGenerator:", v10, v6, self->_scenesKeptActiveWhileForeground, v11);

}

- (void)_setScene:(id)a3 cached:(BOOL)a4 inContainer:(id)a5 withContextGenerator:(id)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a4;
  v17 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v17;
  v14 = v12;
  if (v17)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v13 = 0;
    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

  v13 = v17;
LABEL_3:
  if (v8)
  {
    if ((objc_msgSend(v11, "containsObject:", v13) & 1) == 0)
    {
      objc_msgSend(v11, "addObject:", v17);
      if (v14)
        -[SBFSceneWorkspaceDefaultDelegate _setScene:activatesWithTransitionContextGeneratorBlock:](self, "_setScene:activatesWithTransitionContextGeneratorBlock:", v17, v14);
    }
  }
  else
  {
    objc_msgSend(v11, "removeObject:", v13);
    -[SBFSceneWorkspaceDefaultDelegate _cleanupTransitionContextGeneratorBlockForSceneIfNeeded:](self, "_cleanupTransitionContextGeneratorBlockForSceneIfNeeded:", v17);
  }

}

- (void)_setScene:(id)a3 activatesWithTransitionContextGeneratorBlock:(id)a4
{
  id v7;
  void *v8;
  NSMutableDictionary *scenesWithActivationContextGeneratorBlock;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = v18;
  if (v18)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v8 = 0;
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionContextGeneratorBlock"));

  v8 = v18;
LABEL_3:
  scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](scenesWithActivationContextGeneratorBlock, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = self->_scenesWithActivationContextGeneratorBlock;
    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = (void *)MEMORY[0x18D774178]();
    objc_msgSend(v18, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v14, v15);

  }
}

- (void)_cleanupTransitionContextGeneratorBlockForSceneIfNeeded:(id)a3
{
  NSMutableDictionary *scenesWithActivationContextGeneratorBlock;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSMutableSet containsObject:](self->_scenesActivatedUponClientConnection, "containsObject:") & 1) == 0
    && (-[NSMutableSet containsObject:](self->_scenesKeptActiveWhileForeground, "containsObject:", v6) & 1) == 0)
  {
    scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](scenesWithActivationContextGeneratorBlock, "removeObjectForKey:", v5);

  }
}

- (void)_activateScene:(id)a3
{
  id v5;
  NSMutableDictionary *scenesWithActivationContextGeneratorBlock;
  void *v7;
  void (**v8)(void);
  void *v9;
  id v10;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFSceneWorkspaceDefaultDelegate.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](scenesWithActivationContextGeneratorBlock, "objectForKey:", v7);
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activateWithTransitionContext:", v10);
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  SBFSceneWorkspaceDefaultDelegate *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = self;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18AB69000, v8, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] did add scene: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  SBFSceneWorkspaceDefaultDelegate *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = self;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18AB69000, v8, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] will remove scene: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v7, "setDelegate:", 0);

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SBFSceneWorkspaceDefaultDelegate *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did activate: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  SBFSceneWorkspaceDefaultDelegate *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218498;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_18AB69000, v9, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did deactivate: %{public}@ error: %{public}@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v6, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isForeground");

  if (v12)
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218242;
      v16 = self;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_18AB69000, v13, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did deactivate while foreground: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    if (-[NSMutableSet containsObject:](self->_scenesKeptActiveWhileForeground, "containsObject:", v6))
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134218242;
        v16 = self;
        v17 = 2114;
        v18 = v8;
        _os_log_impl(&dword_18AB69000, v14, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] automatically re-activating scene: %{public}@", (uint8_t *)&v15, 0x16u);
      }

      -[SBFSceneWorkspaceDefaultDelegate _activateScene:](self, "_activateScene:", v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenesWithActivationContextGeneratorBlock, 0);
  objc_storeStrong((id *)&self->_scenesKeptActiveWhileForeground, 0);
  objc_storeStrong((id *)&self->_scenesActivatedUponClientConnection, 0);
}

@end
