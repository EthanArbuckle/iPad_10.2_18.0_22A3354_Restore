@implementation SBRemoteTransientOverlaySessionManager

- (SBRemoteTransientOverlaySessionManager)init
{
  SBRemoteTransientOverlaySessionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessSerialQueue;
  uint64_t v6;
  SBFSceneWorkspaceController *sceneWorkspaceController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlaySessionManager;
  v2 = -[SBRemoteTransientOverlaySessionManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SpringBoard.SBRemoteTransientOverlaySessionManager.accessSerialQueue", v3);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9EC8]), "initWithIdentifier:delegate:", CFSTR("com.apple.SpringBoard.SceneWorkspace.RemoteAlert"), v2);
    sceneWorkspaceController = v2->_sceneWorkspaceController;
    v2->_sceneWorkspaceController = (SBFSceneWorkspaceController *)v6;

  }
  return v2;
}

- (id)embeddedDisplayWindowSceneForRemoteTransientOverlaySession:(id)a3
{
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:embeddedDisplayWindowSceneForRemoteTransientOverlaySession:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)activeWallpaperVariantForRemoteTransientOverlaySession:(id)a3
{
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  int64_t v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:activeWallpaperVariantForSession:", self, v5);

  return v7;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 shouldActivateWithContext:(id)a4
{
  SBRemoteTransientOverlaySessionManager *v5;
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:shouldActivateOverlayWithContext:forSession:", v5, v7, v8);

  return (char)v5;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 performDismissalRequest:(id)a4
{
  SBRemoteTransientOverlaySessionManager *v5;
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:performDismissalRequest:forSession:", v5, v7, v8);

  return (char)v5;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 performPresentationRequest:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:performPresentationRequest:forSession:", self, v7, v6);

  if (v9)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "remoteTransientOverlaySessionManager:didActivateSession:", self, v6);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4
{
  SBRemoteTransientOverlaySessionManager *v5;
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:forSession:", v5, v7, v8);

  return (char)v5;
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  void *v6;
  NSObject *accessSerialQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__SBRemoteTransientOverlaySessionManager_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(accessSerialQueue, v9);

}

uint64_t __102__SBRemoteTransientOverlaySessionManager_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)remoteTransientOverlaySession:(id)a3 requestsHandlingForButtonEvents:(unint64_t)a4 viewController:(id)a5
{
  SBRemoteTransientOverlaySessionManagerDelegate **p_delegate;
  id v9;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v9 = a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlaySessionManager:requestsHandlingForButtonEvents:forSession:viewController:", self, a4, v10, v9);

}

- (id)createSessionWithDefinition:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SBRemoteTransientOverlaySessionManager_createSessionWithDefinition___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__SBRemoteTransientOverlaySessionManager_createSessionWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_createSessionWithDefinition:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingSessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SBRemoteTransientOverlaySessionManager_existingSessionsWithDefinition_options___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __81__SBRemoteTransientOverlaySessionManager_existingSessionsWithDefinition_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_existingSessionsWithDefinition:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingSessionWithSessionID:(id)a3 options:(int64_t)a4
{
  char v4;
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  v19 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBRemoteTransientOverlaySessionManager_existingSessionWithSessionID_options___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v13 = &v14;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  dispatch_sync(accessSerialQueue, block);
  if (_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions((void *)v15[5], v4))
    v9 = (id)v15[5];
  else
    v9 = 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __79__SBRemoteTransientOverlaySessionManager_existingSessionWithSessionID_options___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasSessionWithPendingButtonEvents:(unint64_t)a3 options:(int64_t)a4
{
  char v4;
  NSObject *accessSerialQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBRemoteTransientOverlaySessionManager_hasSessionWithPendingButtonEvents_options___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(accessSerialQueue, block);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v11, v4) & 1) != 0
          && (objc_msgSend(v11, "hasPendingButtonEvents:", a3, (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __84__SBRemoteTransientOverlaySessionManager_hasSessionWithPendingButtonEvents_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasSessionWithServiceProcessIdentifier:(int)a3 options:(int64_t)a4
{
  char v4;
  uint64_t v5;
  NSObject *accessSerialQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SBRemoteTransientOverlaySessionManager_hasSessionWithServiceProcessIdentifier_options___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(accessSerialQueue, block);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v11, v4) & 1) != 0
          && (objc_msgSend(v11, "hasServiceProcessIdentifier:", v5, (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __89__SBRemoteTransientOverlaySessionManager_hasSessionWithServiceProcessIdentifier_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActiveSessionWithSceneIdentityTokenString:(id)a3 options:(int64_t)a4
{
  char v4;
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBRemoteTransientOverlaySessionManager_hasActiveSessionWithSceneIdentityTokenString_options___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(accessSerialQueue, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)v21[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v12, v4) & 1) != 0
          && objc_msgSend(v12, "isActivated", (_QWORD)v15)
          && (objc_msgSend(v12, "isPresentedFromSceneWithIdentityTokenString:", v6) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __95__SBRemoteTransientOverlaySessionManager_hasActiveSessionWithSceneIdentityTokenString_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActiveSessionMatchingPredicate:(id)a3 options:(int64_t)a4
{
  char v4;
  uint64_t (**v6)(id, void *);
  NSObject *accessSerialQueue;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBRemoteTransientOverlaySessionManager_hasActiveSessionMatchingPredicate_options___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(accessSerialQueue, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)v21[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v12, v4) & 1) != 0
          && objc_msgSend(v12, "isActivated", (_QWORD)v15)
          && (v6[2](v6, v12) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __84__SBRemoteTransientOverlaySessionManager_hasActiveSessionMatchingPredicate_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sessionWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SBRemoteTransientOverlaySessionManager_sessionWithDefinition_options___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __72__SBRemoteTransientOverlaySessionManager_sessionWithDefinition_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_existingSessionsWithDefinition:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSessionWithDefinition:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)sessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SBRemoteTransientOverlaySessionManager_sessionsWithDefinition_options___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __73__SBRemoteTransientOverlaySessionManager_sessionsWithDefinition_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_existingSessionsWithDefinition:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSessionWithDefinition:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

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

- (id)_createSessionWithDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *sessionIDToSession;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBRemoteTransientOverlaySession _initWithSessionID:definition:sceneWorkspaceController:]([SBRemoteTransientOverlaySession alloc], "_initWithSessionID:definition:sceneWorkspaceController:", v6, v4, self->_sceneWorkspaceController);
  objc_msgSend(v7, "setHostDelegate:", self);
  sessionIDToSession = self->_sessionIDToSession;
  if (!sessionIDToSession)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_sessionIDToSession;
    self->_sessionIDToSession = v9;

    sessionIDToSession = self->_sessionIDToSession;
  }
  -[NSMutableDictionary setObject:forKey:](sessionIDToSession, "setObject:forKey:", v7, v6);
  SBLogTransientOverlay();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Created %{public}@ for definition: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  return v7;
}

- (id)_existingSessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  int v32;
  int v33;
  int IsValidSessionForLookupOptions;
  void *v35;
  char v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v37 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionIDToSession, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v38 = 0;
    v8 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v10, "definition");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v5;
        objc_msgSend(v11, "sceneProvidingProcess");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "sceneProvidingProcess");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if ((v13 != 0) == v15)
        {
LABEL_20:

LABEL_21:
          continue;
        }
        if (v13)
        {
          objc_msgSend(v11, "sceneProvidingProcess");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sceneProvidingProcess");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (!v18)
            goto LABEL_20;
          objc_msgSend(v11, "configurationIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "configurationIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = BSEqualStrings();

          if (!v21)
            goto LABEL_20;
          objc_msgSend(v11, "secondaryConfigurationIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "secondaryConfigurationIdentifier");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v11, "serviceName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serviceName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (!v26)
            goto LABEL_20;
          objc_msgSend(v11, "viewControllerClassName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "viewControllerClassName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          if (!v29)
            goto LABEL_20;
          objc_msgSend(v11, "secondaryViewControllerClassName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "secondaryViewControllerClassName");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        v30 = (void *)v23;
        v31 = BSEqualStrings();

        if ((v31 & 1) == 0)
          goto LABEL_20;
        v32 = objc_msgSend(v11, "isForCarPlay");
        v33 = objc_msgSend(v12, "isForCarPlay");

        if (v32 != v33)
          goto LABEL_21;
        IsValidSessionForLookupOptions = _SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v10, v37);

        if (IsValidSessionForLookupOptions)
        {
          v35 = v38;
          if (!v38)
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v38 = v35;
          objc_msgSend(v35, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v7)
        goto LABEL_26;
    }
  }
  v38 = 0;
LABEL_26:

  return v38;
}

- (SBRemoteTransientOverlaySessionManagerDelegate)delegate
{
  return (SBRemoteTransientOverlaySessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end
