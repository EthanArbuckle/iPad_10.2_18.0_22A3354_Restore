@implementation _UISceneKeyboardProxyLayerForwardingPresentationScene

- (void)presentationView:(id)a3 didMoveToWindow:(id)a4
{
  _UIScenePresenter *prioritizedPresenter;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  prioritizedPresenter = self->_prioritizedPresenter;
  v8 = a3;
  -[_UIScenePresenter presentationView](prioritizedPresenter, "presentationView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingPresentationScene.m"), 123, CFSTR("Presentation view mismatch."));

  }
  -[_UISceneKeyboardProxyLayerForwardingPresentationScene _sendDelegateDidMoveToWindow:](self, "_sendDelegateDidMoveToWindow:", v11);

}

- (void)_sendDelegateDidMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "presentationEnvironment:didMoveToWindow:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateKeyboardLayersForScene:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "presentationEnvironmentDidUpdateKeyboardLayers:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBSSceneClientSettingsDiffInspector *layersChangedClientSettingsDiffInspector;
  FBSSceneClientSettingsDiffInspector *v15;
  FBSSceneClientSettingsDiffInspector *v16;
  FBSSceneClientSettingsDiffInspector *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  layersChangedClientSettingsDiffInspector = self->_layersChangedClientSettingsDiffInspector;
  if (!layersChangedClientSettingsDiffInspector)
  {
    v15 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D231D0]);
    v16 = self->_layersChangedClientSettingsDiffInspector;
    self->_layersChangedClientSettingsDiffInspector = v15;

    objc_initWeak(&location, self);
    v17 = self->_layersChangedClientSettingsDiffInspector;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __131___UISceneKeyboardProxyLayerForwardingPresentationScene_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v21 = &unk_1E16B81E0;
    objc_copyWeak(&v22, &location);
    -[FBSSceneClientSettingsDiffInspector observeLayersWithBlock:](v17, "observeLayersWithBlock:", &v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    layersChangedClientSettingsDiffInspector = self->_layersChangedClientSettingsDiffInspector;
  }
  -[FBSSceneClientSettingsDiffInspector inspectDiff:withContext:](layersChangedClientSettingsDiffInspector, "inspectDiff:withContext:", v11, v10, v18, v19, v20, v21);

}

- (_QWORD)initWithScene:(_QWORD *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationScene;
    v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 5, v3);
      objc_msgSend(v3, "identityToken");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[4];
      a1[4] = v5;

      objc_msgSend(v3, "addObserver:", a1);
    }
  }

  return a1;
}

+ (BOOL)forwardsLayersToRootSystemShell
{
  return 0;
}

- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4
{
  _UIScenePresenter *v6;
  _UIScenePresenter *prioritizedPresenter;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  _UISceneKeyboardProxyLayerForwardingPresentationScene *v14;
  __int16 v15;
  _UIScenePresenter *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (_UIScenePresenter *)a4;
  prioritizedPresenter = self->_prioritizedPresenter;
  if (prioritizedPresenter != v6)
  {
    -[_UIScenePresenter presentationView](prioritizedPresenter, "presentationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    objc_storeStrong((id *)&self->_prioritizedPresenter, a4);
    v9 = _presentationManager_willPrioritizePresenter____s_category;
    if (!_presentationManager_willPrioritizePresenter____s_category)
    {
      v9 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_presentationManager_willPrioritizePresenter____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationScene:%p> Prioritized presenter: %@.", (uint8_t *)&v13, 0x16u);
    }
    -[_UIScenePresenter presentationView](self->_prioritizedPresenter, "presentationView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:", self);
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneKeyboardProxyLayerForwardingPresentationScene _sendDelegateDidMoveToWindow:](self, "_sendDelegateDidMoveToWindow:", v12);

  }
}

- (id)keyboardLayers
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "clientSettings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isKeyboardLayer") & 1) != 0 || objc_msgSend(v10, "isKeyboardProxyLayer"))
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v11 = (void *)objc_msgSend(v7, "copy");
  return v11;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingPresentationScene.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

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

- (void)sceneDidInvalidate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "removeObserver:", self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "presentationEnvironmentDidInvalidate:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Tracking scene: %@"), v4, self, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[_UIScenePresenter presentationView](self->_prioritizedPresenter, "presentationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationScene;
  -[_UISceneKeyboardProxyLayerForwardingPresentationScene dealloc](&v5, sel_dealloc);
}

- (FBSSceneIdentityToken)keyboardOwnerIdentityToken
{
  return self->_keyboardOwnerIdentityToken;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_keyboardOwnerIdentityToken, 0);
  objc_storeStrong((id *)&self->_prioritizedPresenter, 0);
  objc_storeStrong((id *)&self->_layersChangedClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
