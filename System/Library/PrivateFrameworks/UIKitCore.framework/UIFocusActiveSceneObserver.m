@implementation UIFocusActiveSceneObserver

void __54___UIFocusActiveSceneObserver_Classic__initWithScene___block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_13_1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp"));

}

void __71___UIFocusActiveSceneObserver_Classic_observerDeliveryPolicyDidChange___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notifyObserversIfNecessary");
  v2 = _UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke___s_category;
  if (!_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke___s_category);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected event delivery change: %@\n%@", (uint8_t *)&v8, 0x16u);

    }
  }
}

void __72___UIFocusActiveSceneObserver_Classic__screenUUIDDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "screen", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_msgSend(*(id *)(a1 + 48), "_removeDeliverObserverForWindow:", v7);
          objc_msgSend(*(id *)(a1 + 48), "_addDeliveryObserverForWindow:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v4);
  }

  v10 = _UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_2___s_category;
  if (!_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_2___s_category)
  {
    v10 = __UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_2___s_category);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 56);
      v13 = v11;
      objc_msgSend(v12, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected screen UUID change: %@\n%@", buf, 0x16u);

    }
  }
}

void __71___UIFocusActiveSceneObserver_Classic__keyWindowDidChangeNotification___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notifyObserversIfNecessary");
  v2 = _UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_3___s_category;
  if (!_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_3___s_category)
  {
    v2 = __UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_3___s_category);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected key window change: %@\n%@", (uint8_t *)&v8, 0x16u);

    }
  }
}

@end
