@implementation UIScreenBasedWindowScene

void __70___UIScreenBasedWindowScene__unassociatedWindowSceneForScreen_create___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UISceneSession *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 64), "unassociationCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v8 = objc_opt_new();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = [UISceneSession alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[UISceneSession _initWithPersistentIdentifier:sessionRole:configurationName:](v11, "_initWithPersistentIdentifier:sessionRole:configurationName:", v13, CFSTR("_UIScreenBasedSceneSession"), 0);

      objc_msgSend(v16, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSceneClass:", 0);
      objc_msgSend(v14, "setDelegateClass:", 0);
      objc_msgSend(v14, "setStoryboard:", 0);
      objc_msgSend(v16, "_updateConfiguration:", v14);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSession:", v16);
      objc_msgSend(*(id *)(a1 + 64), "unassociationCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
}

void __58___UIScreenBasedWindowScene_unassociationCacheAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("unassociationCacheAccessQueue", 0);
  v1 = (void *)_MergedGlobals_17_0;
  _MergedGlobals_17_0 = (uint64_t)v0;

}

void __62___UIScreenBasedWindowScene_initWithScreen_session_lookupKey___block_invoke(uint64_t a1, void *a2, objc_class *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v5 = a2;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDE320F0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("_UIScreenBasedWindowScene.m"), 242, CFSTR("class: \"%@\" included in baseSceneComponentClassDictionary of %@ but does not confirm to _UISceneComponentProviding!"), v9, v11);

  }
  v12 = (id)objc_msgSend([a3 alloc], "initWithScene:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_registerSceneComponent:forKey:", v12, v5);

}

void __57___UIScreenBasedWindowScene__performInvalidationIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "unassociationCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480));

}

void __63___UIScreenBasedWindowScene__preventAutoInvalidationForReason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_removeAutoInvalidationPreventionAssertion:", v5);

}

void __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  unint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_hasInvalidated") & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke_2;
    v13[3] = &unk_1E16B8020;
    v13[4] = &v14;
    objc_msgSend(v3, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 0, 0, 0, v13);
    if (!*((_BYTE *)v15 + 24))
    {
      *((_BYTE *)v3 + 505) = 1;
      v4 = _UIScreenBasedSceneSession_block_invoke___s_category;
      if (!_UIScreenBasedSceneSession_block_invoke___s_category)
      {
        v4 = __UILogCategoryGetNode("SceneAutoInvalidation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_UIScreenBasedSceneSession_block_invoke___s_category);
      }
      v5 = *(id *)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(id *)(a1 + 32);
        if (v6)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v6);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = CFSTR("(nil)");
        }

        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Marking scene as needing invalidation: %{public}@", buf, 0xCu);

      }
      v11 = v3[65];
      v12 = v11;
      if (!v11 || !objc_msgSend(v11, "count"))
        -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](v3);

    }
    *((_BYTE *)v3 + 504) = 0;
    _Block_object_dispose(&v14, 8);
  }

}

uint64_t __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_extendsScreenSceneLifetime");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __69___UIScreenBasedWindowScene__addSubclassDebugDescriptionWithBuilder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 520);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __64___UIScreenBasedWindowScene__openURL_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
