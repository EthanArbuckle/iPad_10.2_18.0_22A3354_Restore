@implementation _UIScenePresenter

- (NSString)description
{
  return (NSString *)-[_UIScenePresenter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (UIScenePresentation)presentationView
{
  void *v3;
  int v4;
  _UIScenePresentationView *v5;
  _UIScenePresentationView *view;

  BSDispatchQueueAssertMain();
  if (!self->_invalidated && !self->_view)
  {
    -[_UIScenePresenter scene](self, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isValid");

    if (v4)
    {
      v5 = -[_UIScenePresentationView initWithPresenter:]([_UIScenePresentationView alloc], "initWithPresenter:", self);
      view = self->_view;
      self->_view = v5;

    }
  }
  return (UIScenePresentation *)self->_view;
}

- (void)modifyPresentationContext:(id)a3
{
  void (**v5)(id, void *);
  UIScenePresentationContext *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  UIScenePresentationContext *v11;
  UIScenePresentationContext *presentationContext;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  UIScenePresentationContext *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenter.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifyBlock"));

  }
  BSDispatchQueueAssertMain();
  v6 = self->_presentationContext;
  v7 = (void *)-[UIScenePresentationContext mutableCopy](self->_presentationContext, "mutableCopy");
  v5[2](v5, v7);
  UIScenePresentationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    UIScenePresentationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
      objc_msgSend(WeakRetained, "scene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v14, self->_identifier);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BSEqualObjects());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScenePresentationContext _defaultPresentationContext](self->_presentationContext, "_defaultPresentationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_defaultPresentationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "Modify presentation context on %@ (equal? %@), prevContext: %@, newContext: %@,  prevDefaultContext: %@, newDefaultContext: %@", buf, 0x3Eu);

    }
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v11 = (UIScenePresentationContext *)objc_msgSend(v7, "copy");
    presentationContext = self->_presentationContext;
    self->_presentationContext = v11;

    -[_UIScenePresentationView setCurrentPresentationContext:](self->_view, "setCurrentPresentationContext:", self->_presentationContext);
  }

}

- (void)updateHostingStateIfNecessary
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[_UIScenePresenter _isHosting](self, "_isHosting");
  if (self->_hosting != v3)
  {
    v4 = v3;
    v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10++), "scenePresenter:hostingWillChange:", self, v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    self->_hosting = v4;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "scenePresenter:hostingDidChange:", self, self->_hosting, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)_isHosting
{
  _UIScenePresenter *v3;
  id WeakRetained;

  if (self->_invalidated)
    return 0;
  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "_isPresenterHosting:", v3);

  return (char)v3;
}

- (BOOL)isHosting
{
  return self->_hosting;
}

- (void)activate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "_activatePresenter:", self);

}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)deactivate
{
  _UIScenePresenterOwner **p_owner;
  int v4;
  id WeakRetained;
  id v6;

  p_owner = &self->_owner;
  v6 = objc_loadWeakRetained((id *)&self->_owner);
  v4 = objc_msgSend(v6, "_isPresenterActive:", self);

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(WeakRetained, "_deactivatePresenter:", self);

  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIScenePresenter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_sortContext, CFSTR("sortContext"));
  if (self->_invalidated)
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("invalidated"));
  return v3;
}

- (void)invalidate
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[_UIScenePresenter updateHostingStateIfNecessary](self, "updateHostingStateIfNecessary");
    -[_UIScenePresentationView invalidate](self->_view, "invalidate");
    -[UIView removeFromSuperview](self->_view, "removeFromSuperview");
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(WeakRetained, "_invalidatePresenter:", self);

  }
}

- (NSString)identifier
{
  return (NSString *)(id)-[NSString copy](self->_identifier, "copy");
}

- (FBScene)scene
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBScene *)v3;
}

- (UIScenePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (_UIScenePresenter)initWithOwner:(id)a3 identifier:(id)a4 sortContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIScenePresenter *v11;
  _UIScenePresenter *v12;
  uint64_t v13;
  NSCopying *sortContext;
  double v15;
  UIScenePresentationContext *v16;
  void *v17;
  uint64_t v18;
  UIScenePresentationContext *presentationContext;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UIScenePresenter;
  v11 = -[_UIScenePresenter init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_owner, v8);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v13 = objc_msgSend(v10, "copy");
    sortContext = v12->_sortContext;
    v12->_sortContext = (NSCopying *)v13;

    BSAbsoluteMachTimeNow();
    v12->_initializeTime = v15;
    v16 = [UIScenePresentationContext alloc];
    objc_msgSend(v8, "defaultPresentationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIScenePresentationContext _initWithDefaultPresentationContext:](v16, "_initWithDefaultPresentationContext:", v17);
    presentationContext = v12->_presentationContext;
    v12->_presentationContext = (UIScenePresentationContext *)v18;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sortContext, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenter.m"), 61, CFSTR("_UIScenePresenter %@ must be invalidated before it can be deallocated."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresenter;
  -[_UIScenePresenter dealloc](&v5, sel_dealloc);
}

- (int64_t)compare:(id)a3
{
  id v4;
  NSCopying *sortContext;
  void *v6;
  int64_t v7;
  double v8;
  double initializeTime;
  uint64_t v10;

  v4 = a3;
  sortContext = self->_sortContext;
  objc_msgSend(v4, "sortContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSCopying compare:](sortContext, "compare:", v6);

  if (!v7)
  {
    objc_msgSend(v4, "_initializeTime");
    initializeTime = self->_initializeTime;
    v10 = -1;
    if (initializeTime >= v8)
      v10 = 1;
    if (initializeTime == v8)
      v7 = 0;
    else
      v7 = v10;
  }

  return v7;
}

- (NSCopying)sortContext
{
  return self->_sortContext;
}

- (double)_initializeTime
{
  return self->_initializeTime;
}

- (BOOL)isActive
{
  _UIScenePresenter *v3;
  id WeakRetained;

  if (self->_invalidated)
    return 0;
  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "_isPresenterActive:", v3);

  return (char)v3;
}

- (_UIScenePresenter)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenter.m"), 45, CFSTR("[_UIScenePresenter init] is unavailable for use."));

  v6.receiver = self;
  v6.super_class = (Class)_UIScenePresenter;
  return -[_UIScenePresenter init](&v6, sel_init);
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenter.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v9);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v4 = v7;
  if (v7)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v7);
    v5 = -[NSHashTable count](self->_observers, "count");
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }

}

- (id)newSnapshot
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIScenePresenter newSnapshotContext](self, "newSnapshotContext");
  objc_msgSend(v4, "createSnapshotWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newSnapshotContext
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIScenePresentationView hostContainerView](self->_view, "hostContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonHostedLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayersToExclude:", v7);

  -[UIScenePresentationContext backgroundColorWhileHosting](self->_presentationContext, "backgroundColorWhileHosting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alphaComponent");
  objc_msgSend(v5, "setOpaque:", BSFloatIsOne());

  return v5;
}

- (id)newSnapshotPresentationView
{
  _UISceneSnapshotPresentationView *v3;
  id v4;
  _UISceneSnapshotPresentationView *v5;

  v3 = [_UISceneSnapshotPresentationView alloc];
  v4 = -[_UIScenePresenter newSnapshot](self, "newSnapshot");
  v5 = -[_UISceneSnapshotPresentationView initWithSnapshot:](v3, "initWithSnapshot:", v4);

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIScenePresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)set_initializeTime:(double)a3
{
  self->_initializeTime = a3;
}

- (BOOL)isVisibilityPropagationEnabled
{
  return self->_visibilityPropagationEnabled;
}

- (void)setVisibilityPropagationEnabled:(BOOL)a3
{
  self->_visibilityPropagationEnabled = a3;
}

@end
