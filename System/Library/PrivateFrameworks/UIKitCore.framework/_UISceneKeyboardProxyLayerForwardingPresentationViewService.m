@implementation _UISceneKeyboardProxyLayerForwardingPresentationViewService

- (id)initWithRemoteViewController:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationViewService;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 2, v3);
  }

  return a1;
}

- (void)invalidate
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = invalidate___s_category[0];
    if (!invalidate___s_category[0])
    {
      v2 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, invalidate___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      *(_DWORD *)buf = 134218242;
      v18 = a1;
      v19 = 2112;
      v20 = WeakRetained;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Remote view controller invalidated: %@.", buf, 0x16u);

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "presentationEnvironmentDidInvalidate:", a1);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)sizeTrackingViewDidMoveToWindow:(uint64_t)a1
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = sizeTrackingViewDidMoveToWindow____s_category;
    if (!sizeTrackingViewDidMoveToWindow____s_category)
    {
      v4 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&sizeTrackingViewDidMoveToWindow____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = a1;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Size tracking view moved to window: %@.", buf, 0x16u);
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "presentationEnvironment:didMoveToWindow:", a1, v3);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)keyboardLayersDidChange
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = keyboardLayersDidChange___s_category;
    if (!keyboardLayersDidChange___s_category)
    {
      v2 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&keyboardLayersDidChange___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      *(_DWORD *)buf = 134218242;
      v18 = a1;
      v19 = 2112;
      v20 = WeakRetained;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Remote view controller keyboard layers changed: %@.", buf, 0x16u);

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "presentationEnvironmentDidUpdateKeyboardLayers:", a1);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (FBSSceneIdentityToken)keyboardOwnerIdentityToken
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingPresentationViewService.m"), 57, CFSTR("View services should never create keyboard proxy layers - they should only forward them"));

  return 0;
}

- (id)keyboardLayers
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_keyboardSceneLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)forwardsLayersToRootSystemShell
{
  return 1;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingPresentationViewService.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

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

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Tracking remote view controller: %@"), v4, self, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
