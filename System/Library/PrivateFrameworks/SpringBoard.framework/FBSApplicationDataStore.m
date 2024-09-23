@implementation FBSApplicationDataStore

void __78__FBSApplicationDataStore_SceneStorage___createSceneStoreWithIdentifier_data___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BSDispatchQueueAssertMain();
  objc_msgSend(WeakRetained, "_cachedSceneDataStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v16)
  {
    if (!WeakRetained)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "_cachedSceneDataStores");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("FBSApplicationDataStore+SceneStorage.m"), 128, CFSTR("Expected store (%p) for identifier: %@, but instead had store: (%p)"), v16, v13, v15);

    if (!WeakRetained)
      goto LABEL_6;
  }
  objc_msgSend(v16, "_data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v16, "_data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_modifyPersistentSceneData:identifier:data:", 1, v8, v9);

  }
  else
  {
    objc_msgSend(WeakRetained, "_modifyPersistentSceneData:identifier:data:", 0, v8, 0);
  }
LABEL_6:

}

@end
