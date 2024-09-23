@implementation _UISceneOpenItemProvidersBSActionsHandler

- (id)_UIActionTypesForSubstitution
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 59);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UISceneOpenItemProvidersDataTransferSession *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_12_5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v35 = v9;
    v36 = v8;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = v10;
    obj = v10;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "continuationEndpoint");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler dragContinuationFromEndpoint:](self, "dragContinuationFromEndpoint:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UISceneOpenItemProvidersBSActionsHandler itemCollectionFromDragContinuation:](self, "itemCollectionFromDragContinuation:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "userInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler itemProvidersFromPBItemCollection:userInfo:](self, "itemProvidersFromPBItemCollection:userInfo:", v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = -[_UISceneOpenItemProvidersDataTransferSession initWithItemProviders:itemCollection:continuation:]([_UISceneOpenItemProvidersDataTransferSession alloc], "initWithItemProviders:itemCollection:continuation:", v23, v21, v20);
          +[_UISceneOpenItemProvidersDataTransferSessionManager sharedInstance](_UISceneOpenItemProvidersDataTransferSessionManager, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addSession:", v24);

          objc_msgSend(v38, "addObject:", v24);
          objc_msgSend(v11, "addObject:", v23);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v15);
    }

    v9 = v35;
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v35, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_scene:openItemProviders:", v35, v11);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = v38;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "didFinishSendingRequests");
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v29);
    }

    v8 = v36;
    v10 = v34;
  }
  v32 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v32, "minusSet:", v10);

  return v32;
}

- (id)_substituteActionsForAction:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  UIOpenURLAction *v21;
  void *v22;
  void *v23;
  UIOpenURLAction *v24;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  if ((objc_msgSend((id)UIApp, "_appSupportsSceneItemProviders") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v28 = v8;
    if (objc_msgSend(v9, "isUISubclass"))
    {
      objc_msgSend(v9, "payload");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v12;
    -[_UISceneOpenItemProvidersBSActionsHandler URLContextsFromOpenItemProvidersActions:payload:](self, "URLContextsFromOpenItemProvidersActions:payload:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
          v21 = [UIOpenURLAction alloc];
          objc_msgSend(v20, "URL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "options");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[UIOpenURLAction initWithURL:openURLOptions:workspaceOriginatingProcess:responder:](v21, "initWithURL:openURLOptions:workspaceOriginatingProcess:responder:", v22, v23, 0, 0);
          objc_msgSend(v10, "addObject:", v24);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
    }

    v8 = v28;
  }

  return v10;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UISceneOpenItemProvidersDataTransferSession *v22;
  void *v23;
  _UISceneOpenItemProvidersDataTransferSession *v24;
  void *v25;
  _UISceneConnectionOptionsContext *v26;
  void *v27;
  const char *v28;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void (**v34)(void *, void *, const __CFString *);
  id v35;
  void *v36;
  id obj;
  id newValue;
  _QWORD v39[4];
  _UISceneOpenItemProvidersDataTransferSession *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v30 = a4;
  v31 = a5;
  v35 = a6;
  v11 = objc_msgSend((id)UIApp, "_appSupportsSceneItemProviders");
  v33 = v10;
  objc_msgSend(v10, "objectsPassingTest:", &__block_literal_global_374);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "isUISubclass"))
  {
    objc_msgSend(v35, "payload", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__138;
  v50 = __Block_byref_object_dispose__138;
  v51 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_5;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v46;
  v34 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    newValue = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v36;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v16, "continuationEndpoint", v30);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler dragContinuationFromEndpoint:](self, "dragContinuationFromEndpoint:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UISceneOpenItemProvidersBSActionsHandler itemCollectionFromDragContinuation:](self, "itemCollectionFromDragContinuation:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "userInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler itemProvidersFromPBItemCollection:userInfo:](self, "itemProvidersFromPBItemCollection:userInfo:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = -[_UISceneOpenItemProvidersDataTransferSession initWithItemProviders:itemCollection:continuation:]([_UISceneOpenItemProvidersDataTransferSession alloc], "initWithItemProviders:itemCollection:continuation:", v21, v19, v18);
          +[_UISceneOpenItemProvidersDataTransferSessionManager sharedInstance](_UISceneOpenItemProvidersDataTransferSessionManager, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addSession:", v22);

          objc_msgSend(v12, "addObject:", v21);
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_2;
          v39[3] = &unk_1E16B1B28;
          v24 = v22;
          v40 = v24;
          v25 = _Block_copy(v39);
          objc_msgSend(newValue, "addObject:", v25);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v13);
    }

    v34[2](v34, v12, CFSTR("_UISceneConnectionOptionsItemProvidersKey"));
  }
  else
  {
    -[_UISceneOpenItemProvidersBSActionsHandler URLContextsFromOpenItemProvidersActions:payload:](self, "URLContextsFromOpenItemProvidersActions:payload:", v36, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2](v34, v12, CFSTR("_UISceneConnectionOptionsURLContextKey"));
    newValue = 0;
  }

  v26 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v26, "setLaunchOptionsDictionary:", v47[5]);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minusSet:", v36);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v26, "setUnprocessedActions:", v27);
  if (v26)
    objc_setProperty_nonatomic_copy(v26, v28, newValue, 24);

  _Block_object_dispose(&v46, 8);
  return v26;
}

- (id)URLContextsFromOpenItemProvidersActions:(id)a3 payload:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  uint64_t v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      v21 = v8;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        if (objc_msgSend(v11, "providerSource") == 1)
        {
          objc_msgSend(v11, "continuationEndpoint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler dragContinuationFromEndpoint:](self, "dragContinuationFromEndpoint:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UISceneOpenItemProvidersBSActionsHandler itemCollectionFromDragContinuation:](self, "itemCollectionFromDragContinuation:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "setLoadsDataSynchronously:", 1);
          -[_UISceneOpenItemProvidersBSActionsHandler itemProvidersFromPBItemCollection:userInfo:](self, "itemProvidersFromPBItemCollection:userInfo:", v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISceneOpenItemProvidersBSActionsHandler URLContextsFetchedFromItemProviders:collectionIdentifier:contentOwner:payload:](self, "URLContextsFetchedFromItemProviders:collectionIdentifier:contentOwner:payload:", v15, v17, objc_msgSend(v14, "originatorDataOwner"), v20);
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "dragContinuationDidFinishRequestingData");
          v6 = (void *)v18;
          v8 = v21;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)bestUTIForAppFromProviderRegisteredTypeIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v4;
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v5;
  objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "arrayByExcludingObjectsInArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__138;
  v38 = __Block_byref_object_dispose__138;
  v39 = 0;
  if (v9)
  {
    objc_msgSend(v9, "claimRecords");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke;
  v30[3] = &unk_1E16D84E8;
  v13 = v11;
  v31 = v13;
  v14 = v7;
  v32 = v14;
  v33 = &v34;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v30);
  v15 = (void *)v35[5];
  if (!v15)
  {
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_4;
    v26[3] = &unk_1E16D84E8;
    v16 = v13;
    v27 = v16;
    v17 = v14;
    v28 = v17;
    v29 = &v34;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v26);

    v15 = (void *)v35[5];
    if (!v15)
    {
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_7;
      v22[3] = &unk_1E16D84E8;
      v23 = v16;
      v24 = v17;
      v25 = &v34;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);

      v15 = (void *)v35[5];
      if (!v15)
      {
        objc_msgSend(v3, "firstObject");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v35[5];
        v35[5] = v18;

        v15 = (void *)v35[5];
      }
    }
  }
  v20 = v15;

  _Block_object_dispose(&v34, 8);
  return v20;
}

- (BOOL)currentAppSupportsReceivingMultipleItems
{
  return objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
}

- (BOOL)currentAppSupportsOpenInPlace
{
  void *v2;
  void *v3;
  char isKindOfClass;
  char v5;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v2, "supportsOpenInPlace");
  else
    v5 = 0;

  return v5;
}

- (id)openURLOptionsFromBasePayload:(id)a3 sourceProcessHandle:(id)a4 dragContentOwner:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("_UIApplicationOpenURLOptionsManagedContentKey"));

  v13 = *MEMORY[0x1E0CA5818];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5818]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UISceneOpenItemProvidersBSActionsHandler currentAppSupportsOpenInPlace](self, "currentAppSupportsOpenInPlace"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v13);

  }
  +[UISceneOpenURLOptions _optionsFromPayload:sourceProcessHandle:](UISceneOpenURLOptions, "_optionsFromPayload:sourceProcessHandle:", v11, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)URLContextsFetchedFromItemProviders:(id)a3 collectionIdentifier:(id)a4 contentOwner:(int64_t)a5 payload:(id)a6
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  void *v28;
  id *v30;
  id obj;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  void *v38;
  _QWORD v39[4];
  void *v40;
  _QWORD aBlock[6];
  id v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  int64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v36 = a4;
  v35 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  if (objc_msgSend(v9, "count")
    && !-[_UISceneOpenItemProvidersBSActionsHandler currentAppSupportsReceivingMultipleItems](self, "currentAppSupportsReceivingMultipleItems"))
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    v30 = &v40;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v17, "registeredTypeIdentifiers", v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UISceneOpenItemProvidersBSActionsHandler bestUTIForAppFromProviderRegisteredTypeIdentifiers:](self, "bestUTIForAppFromProviderRegisteredTypeIdentifiers:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          dispatch_group_enter(v10);
          v20 = -[_UISceneOpenItemProvidersBSActionsHandler currentAppSupportsOpenInPlace](self, "currentAppSupportsOpenInPlace");
          aBlock[0] = v15;
          aBlock[1] = 3221225472;
          aBlock[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke;
          aBlock[3] = &unk_1E16D8538;
          aBlock[4] = v17;
          aBlock[5] = self;
          v42 = v33;
          v43 = v36;
          v44 = v35;
          v47 = a5;
          v45 = v34;
          v46 = v10;
          v21 = _Block_copy(aBlock);
          v22 = v21;
          if (v20)
          {
            v39[0] = v15;
            v39[1] = 3221225472;
            v39[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_3;
            v39[3] = &unk_1E16D8560;
            v40 = v21;
            v23 = v21;
            v24 = (id)objc_msgSend(v17, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v19, v39);
            v25 = v30;
          }
          else
          {
            v37[0] = v15;
            v37[1] = 3221225472;
            v37[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_4;
            v37[3] = &unk_1E16D8588;
            v38 = v21;
            v26 = v21;
            v27 = (id)objc_msgSend(v17, "loadFileRepresentationForTypeIdentifier:completionHandler:", v19, v37);
            v25 = &v38;
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v13);
  }

  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v28 = (void *)objc_msgSend(v34, "copy");

  return v28;
}

- (id)uniqueFileNameWithStakedClaims:(id)a3 hint:(id)a4 extension:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8;
    }
    v13 = v10;
    if (objc_msgSend(v7, "containsObject:", v10))
    {
      LODWORD(v19) = 0;
      do
      {
        if ((_DWORD)v19)
        {
          v19 = (v19 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %d"), v8, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "length"))
          {
            objc_msgSend(v20, "stringByAppendingPathExtension:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v13 = v20;
          }
        }
        else
        {
          LODWORD(v19) = 1;
        }
      }
      while ((objc_msgSend(v7, "containsObject:", v13) & 1) != 0);
    }
  }
  else
  {
    _UIKitBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DROPPED_DOCUMENT"), CFSTR("Dropped Document"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v12;
    objc_msgSend(v12, "stringByAppendingPathExtension:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v13))
    {
      LODWORD(v14) = 0;
      do
      {
        if ((_DWORD)v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          _UIKitBundle();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DROPPED_DOCUMENT_N"), CFSTR("Dropped Document %d"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (v14 + 1);
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "length"))
          {
            objc_msgSend(v18, "stringByAppendingPathExtension:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v13 = v18;
          }
        }
        else
        {
          LODWORD(v14) = 1;
        }
      }
      while ((objc_msgSend(v7, "containsObject:", v13) & 1) != 0);
    }

  }
  return v13;
}

- (id)itemProvidersFromPBItemCollection:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  UIItemProvider *v15;
  UIItemProvider *v16;
  id obj;
  _QWORD v19[4];
  UIItemProvider *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v15 = -[UIItemProvider initWithPBItem:]([UIItemProvider alloc], "initWithPBItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __88___UISceneOpenItemProvidersBSActionsHandler_itemProvidersFromPBItemCollection_userInfo___block_invoke;
        v19[3] = &unk_1E16B5BD8;
        v20 = v15;
        v16 = v15;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v19);
        objc_msgSend(v9, "addObject:", v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v9;
}

- (id)dragContinuationFromEndpoint:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithListenerEndpoint:", v4);

  _DUINewDragContinuationInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_49_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemCollectionFromDragContinuation:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__138;
  v11 = __Block_byref_object_dispose__138;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80___UISceneOpenItemProvidersBSActionsHandler_itemCollectionFromDragContinuation___block_invoke;
  v6[3] = &unk_1E16D85B0;
  v6[4] = &v7;
  objc_msgSend(v3, "requestItemCollectionWithReply:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end
