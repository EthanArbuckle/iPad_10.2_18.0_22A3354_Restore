@implementation SBLayoutStateTransitionCoordinator

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)endTransitionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SBLayoutStateTransitionContext *transitionContext;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBLayoutStateTransitionCoordinator isTransitioning](self, "isTransitioning"))
  {
    -[SBLayoutStateTransitionCoordinator transitionContext](self, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionCompletedWithError:", v4);

    v6 = (void *)-[NSPointerArray copy](self->_observerPointerArray, "copy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SBLayoutStateTransitionCoordinator transitionContext](self, "transitionContext", (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", self, v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;

  }
}

- (void)beginTransitionForWorkspaceTransaction:(id)a3
{
  id v4;
  SBLayoutStateTransitionContext *v5;
  SBLayoutStateTransitionContext *transitionContext;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBLayoutStateTransitionCoordinator isTransitioning](self, "isTransitioning"))
  {
    v5 = -[SBLayoutStateTransitionContext initWithWorkspaceTransaction:]([SBLayoutStateTransitionContext alloc], "initWithWorkspaceTransaction:", v4);
    transitionContext = self->_transitionContext;
    self->_transitionContext = v5;

    v7 = (void *)-[NSPointerArray copy](self->_observerPointerArray, "copy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SBLayoutStateTransitionCoordinator transitionContext](self, "transitionContext", (_QWORD)v15);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", self, v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (SBLayoutStateTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBLayoutStateTransitionSceneEntityFrameProvider)sceneEntityFrameProvider
{
  _SBDefaultSceneEntityFrameProvider *WeakRetained;
  _SBDefaultSceneEntityFrameProvider *defaultSceneEntityFrameProvider;
  _SBDefaultSceneEntityFrameProvider *v5;
  id v6;
  _SBDefaultSceneEntityFrameProvider *v7;
  _SBDefaultSceneEntityFrameProvider *v8;

  WeakRetained = (_SBDefaultSceneEntityFrameProvider *)objc_loadWeakRetained((id *)&self->_sceneEntityFrameProvider);
  if (!WeakRetained)
  {
    defaultSceneEntityFrameProvider = self->_defaultSceneEntityFrameProvider;
    if (!defaultSceneEntityFrameProvider)
    {
      v5 = [_SBDefaultSceneEntityFrameProvider alloc];
      v6 = objc_loadWeakRetained((id *)&self->_windowScene);
      v7 = -[_SBDefaultSceneEntityFrameProvider initWithWindowScene:](v5, "initWithWindowScene:", v6);
      v8 = self->_defaultSceneEntityFrameProvider;
      self->_defaultSceneEntityFrameProvider = v7;

      defaultSceneEntityFrameProvider = self->_defaultSceneEntityFrameProvider;
    }
    WeakRetained = defaultSceneEntityFrameProvider;
  }
  return (SBLayoutStateTransitionSceneEntityFrameProvider *)WeakRetained;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  SBWindowScene **p_windowScene;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  p_windowScene = &self->_windowScene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  objc_msgSend(WeakRetained, "layoutStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutStateForApplicationTransitionContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)willEndTransition
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[SBLayoutStateTransitionCoordinator isTransitioning](self, "isTransitioning"))
  {
    v3 = (void *)-[NSPointerArray copy](self->_observerPointerArray, "copy");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
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
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SBLayoutStateTransitionCoordinator transitionContext](self, "transitionContext", (_QWORD)v11);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", self, v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)isTransitioning
{
  void *v2;
  BOOL v3;

  -[SBLayoutStateTransitionCoordinator transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBLayoutStateTransitionCoordinator)initWithWindowScene:(id)a3
{
  id v4;
  SBLayoutStateTransitionCoordinator *v5;
  SBLayoutStateTransitionCoordinator *v6;
  uint64_t v7;
  NSPointerArray *observerPointerArray;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLayoutStateTransitionCoordinator;
  v5 = -[SBLayoutStateTransitionCoordinator init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v7 = objc_claimAutoreleasedReturnValue();
    observerPointerArray = v6->_observerPointerArray;
    v6->_observerPointerArray = (NSPointerArray *)v7;

  }
  return v6;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationTransitionContext:frameForApplicationSceneEntity:", v6, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSPointerArray addPointer:](self->_observerPointerArray, "addPointer:");
}

- (void)removeObserver:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = -[NSPointerArray count](self->_observerPointerArray, "count");
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      while (-[NSPointerArray pointerAtIndex:](self->_observerPointerArray, "pointerAtIndex:", v6) != v7)
      {
        if (v5 == ++v6)
          goto LABEL_8;
      }
      -[NSPointerArray removePointerAtIndex:](self->_observerPointerArray, "removePointerAtIndex:", v6);
    }
  }
LABEL_8:

}

- (void)setSceneEntityFrameProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sceneEntityFrameProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneEntityFrameProvider);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_defaultSceneEntityFrameProvider, 0);
  objc_storeStrong((id *)&self->_observerPointerArray, 0);
}

@end
