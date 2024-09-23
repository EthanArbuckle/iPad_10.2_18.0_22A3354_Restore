@implementation _UISceneRelationshipManagementHostComponent

- (void)_scenePresenterIsMovingToWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  _BYTE location[12];
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_remoteContentParent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (v6 != WeakRetained)
  {
    objc_msgSend(v6, "_childRemoteContentRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)&self->_associatedRemoteContentRegistry);
    objc_msgSend(v9, "removeChildScene:", v5);

    objc_msgSend(v8, "addChildScene:", v5);
    objc_storeWeak((id *)&self->_parent, v6);
    objc_storeWeak((id *)&self->_associatedRemoteContentRegistry, v8);
    if (v8 && (objc_msgSend(v8, "parentSettingsAvailable") & 1) == 0)
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v6);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __79___UISceneRelationshipManagementHostComponent__scenePresenterIsMovingToWindow___block_invoke;
      v23[3] = &unk_1E16B2358;
      objc_copyWeak(&v24, (id *)location);
      objc_copyWeak(&v25, &from);
      objc_msgSend(v8, "executeWhenParentSettingsAreAvailable:forChildScene:", v23, v5);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      -[_UISceneRelationshipManagementHostComponent notifyObserversOfParentChange:](self, "notifyObserversOfParentChange:", v6);
    }
    v10 = _scenePresenterIsMovingToWindow____s_category;
    if (!_scenePresenterIsMovingToWindow____s_category)
    {
      v10 = __UILogCategoryGetNode("UISceneRelationshipManagement", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_scenePresenterIsMovingToWindow____s_category);
    }
    v11 = *(id *)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v5;
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = CFSTR("(nil)");
      }

      v17 = v16;
      v18 = v6;
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = CFSTR("(nil)");
      }

      *(_DWORD *)location = 134218498;
      *(_QWORD *)&location[4] = self;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "<_UISceneRelationshipManagementHostComponent:%p> Scene %@ is hosted in %@", location, 0x20u);

    }
  }

}

- (void)sceneDidInvalidate:(id)a3
{
  _UIScenePresenter **p_prioritizedPresenter;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  p_prioritizedPresenter = &self->_prioritizedPresenter;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_prioritizedPresenter);
  objc_msgSend(WeakRetained, "presentationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  objc_msgSend(v5, "uiPresentationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_removePrioritizedPresenterObserver:", self);
  objc_storeWeak((id *)p_prioritizedPresenter, 0);
}

- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4
{
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  obj = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);

  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
    objc_msgSend(v6, "presentationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

    objc_msgSend(obj, "presentationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", self);

    objc_storeWeak((id *)&self->_prioritizedPresenter, obj);
    objc_msgSend(obj, "presentationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneRelationshipManagementHostComponent _scenePresenterIsMovingToWindow:](self, "_scenePresenterIsMovingToWindow:", v10);

  }
}

- (void)presentationView:(id)a3 didMoveToWindow:(id)a4
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
  objc_msgSend(WeakRetained, "presentationView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneRelationshipManagementHostComponent.m"), 91, CFSTR("Presentation view mismatch."));

  }
  -[_UISceneRelationshipManagementHostComponent _scenePresenterIsMovingToWindow:](self, "_scenePresenterIsMovingToWindow:", v11);

}

- (void)windowDidMoveToScene:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
  objc_msgSend(WeakRetained, "presentationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8 && v8 == v6)
  {
    -[_UISceneRelationshipManagementHostComponent _scenePresenterIsMovingToWindow:](self, "_scenePresenterIsMovingToWindow:", v8);
    v7 = v8;
  }

}

- (void)notifyObserversOfParentChange:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[FBSSceneComponent hostScene](self, "hostScene", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_scene:isMovingToParent:", v11, v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedRemoteContentRegistry);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_prioritizedPresenter);
}

@end
