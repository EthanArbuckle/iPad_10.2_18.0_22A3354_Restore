@implementation _UIScenePresenterOwner

- (void)_setActivePrioritizedPresenter:(id)a3
{
  _UIScenePresenter *v5;
  _UIScenePresenter *prioritizedPresenter;
  _UIScenePresenter **p_prioritizedPresenter;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  void *v15;
  _UIScenePresenter *v16;
  _UIScenePresenter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  _UIScenePresenter *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (_UIScenePresenter *)a3;
  p_prioritizedPresenter = &self->_prioritizedPresenter;
  prioritizedPresenter = self->_prioritizedPresenter;
  if (prioritizedPresenter != v5)
  {
    -[_UIScenePresenter presentationView](prioritizedPresenter, "presentationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIScenePresenter presentationView](v5, "presentationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "owner:willPrioritizePresenter:deactivatePresenter:", self, v5, self->_prioritizedPresenter);

    if (v8)
    {
      UIScenePresentationLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[_UIScenePresenterOwner scene](self, "scene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v21 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self->_prioritizedPresenter;
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Deactivating scene presenter: %{public}@", buf, 0x16u);

        v10 = v21;
      }

      objc_msgSend(v8, "setHostContainerView:", 0);
      v17 = *p_prioritizedPresenter;
      *p_prioritizedPresenter = 0;

    }
    if (v9)
    {
      UIScenePresentationLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[_UIScenePresenterOwner scene](self, "scene");
        v22 = v10;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2114;
        v26 = v5;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Activating scene presenter: %{public}@", buf, 0x16u);

        v10 = v22;
      }

      objc_storeStrong((id *)&self->_prioritizedPresenter, a3);
    }
    -[_UIScenePresenterOwner _updateHostingStateForScenePresentersIfNecessary](self, "_updateHostingStateForScenePresentersIfNecessary");
    if (v8)
      -[UIView removeFromSuperview](self->_realSceneHostViewsContainer, "removeFromSuperview");
    if (v9)
      objc_msgSend(v9, "setHostContainerView:", self->_realSceneHostViewsContainer);
    else
      -[UIView removeFromSuperview](self->_realSceneHostViewsContainer, "removeFromSuperview");
    if (v10 != v11)
      +[UIWindow _synchronizeDrawing](UIWindow, "_synchronizeDrawing");

  }
}

- (void)_updateHostingStateForScenePresentersIfNecessary
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74___UIScenePresenterOwner__updateHostingStateForScenePresentersIfNecessary__block_invoke;
  v3[3] = &unk_1E16C7CE8;
  v3[4] = self;
  -[_UIScenePresenterOwner enumeratePresentersUsingBlock:](self, "enumeratePresentersUsingBlock:", v3);
  -[_UIScenePresenter updateHostingStateIfNecessary](self->_prioritizedPresenter, "updateHostingStateIfNecessary");
}

- (void)enumeratePresentersUsingBlock:(id)a3
{
  id v4;
  NSMutableSet *inactivePresentersByPriority;
  uint64_t v6;
  id v7;
  NSMutableOrderedSet *activePresentersByPriority;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  inactivePresentersByPriority = self->_inactivePresentersByPriority;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke;
  v11[3] = &unk_1E16C7C38;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  -[NSMutableSet enumerateObjectsUsingBlock:](inactivePresentersByPriority, "enumerateObjectsUsingBlock:", v11);
  if (!*((_BYTE *)v15 + 24))
  {
    activePresentersByPriority = self->_activePresentersByPriority;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke_2;
    v9[3] = &unk_1E16C7C60;
    v10 = v7;
    -[NSMutableOrderedSet enumerateObjectsUsingBlock:](activePresentersByPriority, "enumerateObjectsUsingBlock:", v9);

  }
  _Block_object_dispose(&v14, 8);

}

- (BOOL)_isPresenterHosting:(id)a3
{
  _UIScenePresenter *v5;
  BOOL v6;
  void *v8;

  v5 = (_UIScenePresenter *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

  }
  v6 = self->_prioritizedPresenter == v5;

  return v6;
}

- (void)_invalidatePresenter:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->_inactivePresentersByPriority, "removeObject:", v5);
  if (-[_UIScenePresenterOwner _isPresenterActive:](self, "_isPresenterActive:", v8))
  {
    -[NSMutableOrderedSet removeObject:](self->_activePresentersByPriority, "removeObject:", v8);
    -[_UIScenePresenterOwner _updateActivePrioritizedPresenterIfNecessary](self, "_updateActivePrioritizedPresenterIfNecessary");
  }
  if (!-[NSMutableSet count](self->_inactivePresentersByPriority, "count")
    && !-[NSMutableOrderedSet count](self->_activePresentersByPriority, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "ownerDidInvalidateLastPresenter:", self);

  }
}

- (void)_activatePresenter:(id)a3
{
  id v5;
  NSMutableOrderedSet *activePresentersByPriority;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 120, CFSTR("Attempted to activate presenter %@ which was already invalidated."), v11);

  }
  -[NSMutableSet removeObject:](self->_inactivePresentersByPriority, "removeObject:", v11);
  activePresentersByPriority = self->_activePresentersByPriority;
  if (!activePresentersByPriority)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v8 = self->_activePresentersByPriority;
    self->_activePresentersByPriority = v7;

    activePresentersByPriority = self->_activePresentersByPriority;
  }
  -[NSMutableOrderedSet addObject:](activePresentersByPriority, "addObject:", v11);
  -[NSMutableOrderedSet sortUsingComparator:](self->_activePresentersByPriority, "sortUsingComparator:", &__block_literal_global_236);
  -[_UIScenePresenterOwner _updateActivePrioritizedPresenterIfNecessary](self, "_updateActivePrioritizedPresenterIfNecessary");

}

- (void)_updateActivePrioritizedPresenterIfNecessary
{
  _UIScenePresenter *v3;
  _UIScenePresenter *v4;

  -[NSMutableOrderedSet lastObject](self->_activePresentersByPriority, "lastObject");
  v3 = (_UIScenePresenter *)objc_claimAutoreleasedReturnValue();
  if (self->_prioritizedPresenter != v3)
  {
    v4 = v3;
    -[_UIScenePresenterOwner _setActivePrioritizedPresenter:](self, "_setActivePrioritizedPresenter:", v3);
    v3 = v4;
  }

}

- (BOOL)_isPresenterActive:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

  }
  v6 = -[NSMutableOrderedSet containsObject:](self->_activePresentersByPriority, "containsObject:", v5);

  return v6;
}

- (FBScene)scene
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresentationManager);
  objc_msgSend(WeakRetained, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBScene *)v3;
}

- (void)addPresenter:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_inactivePresentersByPriority, "addObject:", v5);

}

- (id)presenterWithIdentifier:(id)a3
{
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_inactivePresentersByPriority;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        goto LABEL_20;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_activePresentersByPriority;
  v14 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
LABEL_13:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v15)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
      objc_msgSend(v11, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v5);

      if ((v18 & 1) != 0)
        break;
      if (v14 == (id)++v16)
      {
        v14 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
LABEL_20:
    v14 = v11;
  }
LABEL_21:

  return v14;
}

- (UIScenePresentationContext)defaultPresentationContext
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresentationManager);
  objc_msgSend(WeakRetained, "defaultPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScenePresentationContext *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIScenePresenterOwner)initWithScenePresentationManager:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _UIScenePresenterOwner *v8;
  _UIScenePresenterOwner *v9;
  _UISceneLayerHostContainerView *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  _UISceneLayerHostContainerView *realSceneHostViewsContainer;
  NSMutableSet *v16;
  NSMutableSet *inactivePresentersByPriority;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIScenePresenterOwner;
  v8 = -[_UIScenePresenterOwner init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_context, a4);
    objc_storeWeak((id *)&v9->_scenePresentationManager, v6);
    v10 = [_UISceneLayerHostContainerView alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_scenePresentationManager);
    objc_msgSend(WeakRetained, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_UIScenePresenterOwner-%p>"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UISceneLayerHostContainerView initWithScene:debugDescription:](v10, "initWithScene:debugDescription:", v12, v13);
    realSceneHostViewsContainer = v9->_realSceneHostViewsContainer;
    v9->_realSceneHostViewsContainer = (_UISceneLayerHostContainerView *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inactivePresentersByPriority = v9->_inactivePresentersByPriority;
    v9->_inactivePresentersByPriority = v16;

  }
  return v9;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 51, CFSTR("_UIScenePresenterOwner %@ must be invalidated before it can be deallocated."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresenterOwner;
  -[_UIScenePresenterOwner dealloc](&v5, sel_dealloc);
}

- (id)activePrioritizedPresenter
{
  return self->_prioritizedPresenter;
}

- (void)_deactivatePresenter:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresenterOwner.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

    v5 = 0;
  }
  if (-[_UIScenePresenterOwner _isPresenterActive:](self, "_isPresenterActive:", v5))
  {
    -[NSMutableOrderedSet removeObject:](self->_activePresentersByPriority, "removeObject:", v7);
    -[NSMutableSet addObject:](self->_inactivePresentersByPriority, "addObject:", v7);
    -[_UIScenePresenterOwner _updateActivePrioritizedPresenterIfNecessary](self, "_updateActivePrioritizedPresenterIfNecessary");
  }

}

- (void)invalidate
{
  void *v3;
  void *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = (void *)-[NSMutableSet copy](self->_inactivePresentersByPriority, "copy");
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_22_4);

    v4 = (void *)-[NSMutableOrderedSet copy](self->_activePresentersByPriority, "copy");
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_23_4);

    -[_UISceneLayerHostContainerView invalidate](self->_realSceneHostViewsContainer, "invalidate");
    -[NSMutableSet removeAllObjects](self->_inactivePresentersByPriority, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_activePresentersByPriority, "removeAllObjects");
  }
}

- (NSString)description
{
  return (NSString *)-[_UIScenePresenterOwner descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIScenePresenterOwner succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIScenePresenterOwner descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _UIScenePresenterOwner *v16;

  v4 = a3;
  -[_UIScenePresenterOwner succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p>"), v8, self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "appendObject:withName:", v9, CFSTR("context"));

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64___UIScenePresenterOwner_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v11 = v5;
  v15 = v11;
  v16 = self;
  objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v14);

  v12 = v11;
  return v12;
}

- (id)context
{
  return self->_context;
}

- (_UIScenePresenterOwnerDelegate)delegate
{
  return (_UIScenePresenterOwnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prioritizedPresenter, 0);
  objc_storeStrong((id *)&self->_inactivePresentersByPriority, 0);
  objc_storeStrong((id *)&self->_activePresentersByPriority, 0);
  objc_storeStrong((id *)&self->_realSceneHostViewsContainer, 0);
  objc_destroyWeak((id *)&self->_scenePresentationManager);
  objc_storeStrong(&self->_context, 0);
}

@end
