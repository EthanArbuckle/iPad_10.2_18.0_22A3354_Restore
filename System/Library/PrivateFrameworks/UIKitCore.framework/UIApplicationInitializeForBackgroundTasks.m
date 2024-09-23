@implementation UIApplicationInitializeForBackgroundTasks

void ___UIApplicationInitializeForBackgroundTasks_block_invoke()
{
  id v0;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performAsync:", &__block_literal_global_53_1);

}

void ___UIApplicationInitializeForBackgroundTasks_block_invoke_2()
{
  unint64_t v0;
  id v1;
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSMapTable *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMapTable *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *value;
  NSMapEnumerator enumerator;
  uint8_t buf[8];
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  __int128 *v28;
  uint8_t v29[4];
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v0 = qword_1ECD7DEB8;
  if (!qword_1ECD7DEB8)
  {
    v0 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&qword_1ECD7DEB8);
  }
  if ((*(_BYTE *)v0 & 1) != 0)
  {
    v20 = *(NSObject **)(v0 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v31) = 136315138;
      *(_QWORD *)((char *)&v31 + 4) = "void _UIApplicationInitializeForBackgroundTasks(void)_block_invoke_2";
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "%s: Received assertionExpirationImminent notification", (uint8_t *)&v31, 0xCu);
    }
  }
  v1 = (id)UIApp;
  *(_QWORD *)&v31 = 0;
  *((_QWORD *)&v31 + 1) = &v31;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__98;
  v34 = __Block_byref_object_dispose__98;
  v35 = 0;
  v2 = qword_1ECD7DEE8;
  if (!qword_1ECD7DEE8)
  {
    v2 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&qword_1ECD7DEE8);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Firing background task expiration handlers", buf, 2u);
  }
  +[_UIBackgroundTaskInfo backgroundTaskAssertionQueue](_UIBackgroundTaskInfo, "backgroundTaskAssertionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___fireBackgroundExpirationHandlers_block_invoke;
  v26 = &unk_1E16BC3A0;
  v5 = v1;
  v27 = v5;
  v28 = &v31;
  dispatch_sync(v4, buf);

  v6 = *(NSMapTable **)(*((_QWORD *)&v31 + 1) + 40);
  if (v6 && NSCountMapTable(v6))
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(*((_QWORD *)&v31 + 1) + 40));
    for (value = 0; NSNextMapEnumeratorPair(&enumerator, 0, &value); objc_msgSend(value, "fireExpirationHandler"))
    {
      v7 = qword_1ECD7DEF8;
      if (!qword_1ECD7DEF8)
      {
        v7 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD7DEF8);
      }
      v8 = *(id *)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(value, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138477827;
        v30 = v9;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Calling expiration handler for task: %{private}@", v29, 0xCu);

      }
    }
    NSEndMapTableEnumeration(&enumerator);
    v12 = (id)objc_opt_self();
  }
  else
  {
    v10 = qword_1ECD7DF00;
    if (!qword_1ECD7DF00)
    {
      v10 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7DF00);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(enumerator._pi) = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "No background tasks to fire expiration handlers for.", (uint8_t *)&enumerator, 2u);
    }
  }
  os_unfair_lock_lock(&stru_1ECD7DE4C);
  v13 = objc_msgSend((id)qword_1ECD7DE98, "copy");
  v14 = *(void **)(*((_QWORD *)&v31 + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&v31 + 1) + 40) = v13;

  os_unfair_lock_unlock(&stru_1ECD7DE4C);
  v15 = *(NSMapTable **)(*((_QWORD *)&v31 + 1) + 40);
  if (v15)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v15);
    value = 0;
    while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
    {
      v16 = qword_1ECD7DF08;
      if (!qword_1ECD7DF08)
      {
        v16 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7DF08);
      }
      v17 = *(id *)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(value, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138477827;
        v30 = v18;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Background task still not ended after expiration handlers were called: %{private}@. This app will likely be terminated by the system. Call UIApplication.endBackgroundTask(_:) to avoid this.", v29, 0xCu);

      }
    }
    NSEndMapTableEnumeration(&enumerator);
    v19 = (id)objc_opt_self();
  }

  _Block_object_dispose(&v31, 8);
}

@end
