@implementation SBRemoteAlertHandleLocalClient

- (SBRemoteAlertHandleLocalClient)initWithSessionManager:(id)a3
{
  id v5;
  SBRemoteAlertHandleLocalClient *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessSerialQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBRemoteAlertHandleLocalClient;
  v6 = -[SBRemoteAlertHandleLocalClient init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SpringBoard.SBRemoteAlertHandleLocalClient.accessSerialQueue", v7);
    accessSerialQueue = v6->_accessSerialQueue;
    v6->_accessSerialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_sessionManager, a3);
  }

  return v6;
}

- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5
{
  id v8;
  id v9;
  NSObject *accessSerialQueue;
  id v11;
  id v12;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__79;
  v26 = __Block_byref_object_dispose__79;
  v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__79;
  v20[4] = __Block_byref_object_dispose__79;
  v21 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke;
  block[3] = &unk_1E8EB5108;
  v19 = a4;
  v17 = v20;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = &v22;
  dispatch_sync(accessSerialQueue, block);
  v14 = v9;
  BSDispatchMain();
  v12 = (id)v23[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
    objc_msgSend(v4, "sessionsWithDefinition:options:", v3, 0);
  else
    objc_msgSend(v4, "existingSessionsWithDefinition:options:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "sessionID", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF88]), "_initWithHandleID:handleClient:", v12, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 32), "_registerHandle:forSession:", v13, v11);
        }
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        if (!v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        }
        objc_msgSend(v14, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

void __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
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
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPrepared", (_QWORD)v8) & 1) == 0)
          objc_msgSend(v7, "prepareWithConfigurationContext:", *(_QWORD *)(a1 + 32));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6;
  id v7;
  NSObject *accessSerialQueue;
  id v9;
  id v10;
  id v12;
  _QWORD block[5];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__79;
  v23 = __Block_byref_object_dispose__79;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__79;
  v17[4] = __Block_byref_object_dispose__79;
  v18 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke;
  block[3] = &unk_1E8EB5130;
  v15 = v17;
  block[4] = self;
  v9 = v6;
  v14 = v9;
  v16 = &v19;
  dispatch_sync(accessSerialQueue, block);
  v12 = v7;
  BSDispatchMain();
  v10 = (id)v20[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "createSessionWithDefinition:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sessionID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF88]), "_initWithHandleID:handleClient:", v8, *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_registerHandle:forSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "prepareWithConfigurationContext:", *(_QWORD *)(a1 + 32));
}

- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  NSObject *accessSerialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "handleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(accessSerialQueue, block);

}

void __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "existingSessionWithSessionID:options:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 48);
  v3 = v2;
  BSDispatchMain();

}

uint64_t __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateRemoteAlertHandle:(id)a3
{
  void *v4;
  NSObject *accessSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "handleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessSerialQueue, v7);

}

void __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "existingSessionWithSessionID:options:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  BSDispatchMain();

}

uint64_t __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)remoteTransientOverlaySessionDidActivate:(id)a3
{
  void *v4;
  NSObject *accessSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidActivate___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessSerialQueue, v7);

}

void __75__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidActivate___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didActivate");

}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  void *v4;
  NSObject *accessSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidDeactivate___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessSerialQueue, v7);

}

void __77__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidDeactivate___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didDeactivate");

}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  id v8;
  void *v9;
  NSObject *accessSerialQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a5;
  objc_msgSend(a3, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessSerialQueue = self->_accessSerialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  v13[3] = &unk_1E8EA0AC8;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(accessSerialQueue, v13);

}

void __94__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SBSRemoteAlertHandleInvalidationErrorDescription();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0CB2D50]);

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB940], v2, v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_receivedInvalidationWithError:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_unregisterHandle:", v6);

}

- (void)_registerHandle:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *sessionIDToRemoteAlertHandle;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sessionIDToRemoteAlertHandle, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
    if (!sessionIDToRemoteAlertHandle)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_sessionIDToRemoteAlertHandle;
      self->_sessionIDToRemoteAlertHandle = v11;

      sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
    }
    -[NSMutableDictionary setObject:forKey:](sessionIDToRemoteAlertHandle, "setObject:forKey:", v6, v8);
    v13 = v7;
    BSDispatchMain();

  }
}

uint64_t __61__SBRemoteAlertHandleLocalClient__registerHandle_forSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSessionObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_unregisterHandle:(id)a3
{
  NSObject *accessSerialQueue;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *sessionIDToRemoteAlertHandle;
  uint64_t v10;
  void *v11;

  accessSerialQueue = self->_accessSerialQueue;
  v5 = a3;
  dispatch_assert_queue_V2(accessSerialQueue);
  objc_msgSend(v5, "handleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRemoteTransientOverlaySessionManager existingSessionWithSessionID:options:](self->_sessionManager, "existingSessionWithSessionID:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v8 = v7;
  v11 = v8;
  BSDispatchMain();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_sessionIDToRemoteAlertHandle, "removeObjectForKey:", v6, v10, 3221225472, __52__SBRemoteAlertHandleLocalClient__unregisterHandle___block_invoke, &unk_1E8E9E820, v8, self);
    if (!-[NSMutableDictionary count](self->_sessionIDToRemoteAlertHandle, "count"))
    {
      sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
      self->_sessionIDToRemoteAlertHandle = 0;

    }
  }

}

uint64_t __52__SBRemoteAlertHandleLocalClient__unregisterHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSessionObserver:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDToRemoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end
