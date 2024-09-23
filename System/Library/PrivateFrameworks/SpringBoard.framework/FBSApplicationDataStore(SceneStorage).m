@implementation FBSApplicationDataStore(SceneStorage)

- (id)sceneStoreForIdentifier:()SceneStorage creatingIfNecessary:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "_cachedSceneDataStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(a1, "_fetchPersistedSceneDataStores");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    }
    else
    {
      if (!a4)
      {
        v8 = 0;
LABEL_9:

        goto LABEL_10;
      }
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    v12 = v11;
    objc_msgSend(a1, "_createSceneStoreWithIdentifier:data:", v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v7, "setObject:forKey:", v8, v6);
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (id)_cachedSceneDataStores
{
  void *v4;
  void *v6;

  objc_getAssociatedObject(a1, "__sceneDataStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FBSApplicationDataStore+SceneStorage.m"), 108, CFSTR("Must have a data stores dictionary to end here."));

    }
    objc_msgSend(a1, "_setCachedSceneDataStores:", v4);
  }
  return v4;
}

- (uint64_t)_fetchPersistedSceneDataStores
{
  return objc_msgSend(a1, "safeObjectForKey:ofType:", CFSTR("_SBScenes"), objc_opt_class());
}

- (id)_createSceneStoreWithIdentifier:()SceneStorage data:
{
  id v7;
  id v8;
  void *v9;
  SBSceneDataStore *v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19[2];
  id location;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FBSApplicationDataStore+SceneStorage.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FBSApplicationDataStore+SceneStorage.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_initWeak(&location, a1);
  v10 = [SBSceneDataStore alloc];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__FBSApplicationDataStore_SceneStorage___createSceneStoreWithIdentifier_data___block_invoke;
  v16[3] = &unk_1E8E9FAE0;
  objc_copyWeak(v19, &location);
  v11 = v7;
  v19[1] = a2;
  v17 = v11;
  v18 = a1;
  v12 = -[SBSceneDataStore _initWithIdentifier:data:changeHandler:](v10, "_initWithIdentifier:data:changeHandler:", v11, v9, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_modifyPersistentSceneData:()SceneStorage identifier:data:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_fetchPersistedSceneDataStores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithDictionary:", v10);

  if (a3 == 1)
  {
    objc_msgSend(v11, "setObject:forKey:", v8, v12);
  }
  else if (!a3)
  {
    objc_msgSend(v11, "removeObjectForKey:", v12);
  }
  objc_msgSend(a1, "setObject:forKey:", v11, CFSTR("_SBScenes"));

}

- (void)removeSceneStoreForIdentifier:()SceneStorage
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "_cachedSceneDataStores");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidate");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  objc_msgSend(a1, "_modifyPersistentSceneData:identifier:data:", 0, v4, 0);

}

- (uint64_t)removeAllSceneDataStores
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "_cachedSceneDataStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "_invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(a1, "_setCachedSceneDataStores:", 0);
  return objc_msgSend(a1, "_removeAllPersistentSceneData");
}

- (void)enumerateSceneStoresUsingBlock:()SceneStorage
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v29 = 0;
  objc_msgSend(a1, "_cachedSceneDataStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a1;
  objc_msgSend(a1, "_fetchPersistedSceneDataStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
LABEL_3:
    v11 = 0;
    v24 = v9;
    while (1)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11);
      objc_msgSend(v5, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_7;
      objc_msgSend(v6, "objectForKey:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = v4;
        v17 = v10;
        v18 = v5;
        v19 = v7;
        v20 = v6;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v14);
        objc_msgSend(v23, "_createSceneStoreWithIdentifier:data:", v12, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v20;
        v7 = v19;
        v5 = v18;
        v10 = v17;
        v4 = v16;
        v9 = v24;

        if (v13)
        {
LABEL_7:
          (*((void (**)(id, uint64_t, void *, char *))v4 + 2))(v4, v12, v13, &v29);

        }
      }
      if (v29)
        break;
      if (v9 == ++v11)
      {
        v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v9 = v22;
        if (v22)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_setCachedSceneDataStores:()SceneStorage
{
  objc_setAssociatedObject(a1, "__sceneDataStores", a3, (void *)0x301);
}

- (uint64_t)_removeAllPersistentSceneData
{
  return objc_msgSend(a1, "removeObjectForKey:", CFSTR("_SBScenes"));
}

@end
