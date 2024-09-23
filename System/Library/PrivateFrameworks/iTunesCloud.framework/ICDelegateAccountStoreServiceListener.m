@implementation ICDelegateAccountStoreServiceListener

- (id)_initWithXPCListener:(id)a3 testingIdentityStore:(id)a4
{
  id v7;
  id v8;
  ICDelegateAccountStoreServiceListener *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICDelegateAccountStoreServiceListener;
  v9 = -[ICDelegateAccountStoreServiceListener init](&v17, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreServiceListener.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreServiceListener.callbackQueue", 0);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_listener, a3);
    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    if (v8)
    {
      v9->_ignoresEntitlements = 1;
      objc_storeStrong((id *)&v9->_testingIdentityStore, a4);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDelegateAccountStoreServiceListener _identityStore](v9, "_identityStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel__userIdentityStoreDelegateAccountStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDelegateAccountStoreDidChangeNotification"), v15);

  }
  return v9;
}

- (void)invalidate
{
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)suspend
{
  -[NSXPCListener suspend](self->_listener, "suspend");
}

- (NSXPCListenerEndpoint)XPCEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDelegationUUIDs:forUserIdentity:completionHandler:", v10, v9, v8);

}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_prepareDelegateAccountStoreWithCompletionHandler:", v4);

}

- (void)recreateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_resetDelegateAccountStoreWithCompletionHandler:", v4);

}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllDelegateTokensWithCompletionHandler:", v4);

}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeDelegationUUIDs:forUserIdentity:completionHandler:", v10, v9, v8);

}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePropertiesForUserIdentity:completionHandler:", v7, v6);

}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDelegateTokenForUserIdentity:completionHandler:", v7, v6);

}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDelegateTokensExpiringBeforeDate:completionHandler:", v7, v6);

}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__ICDelegateAccountStoreServiceListener_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v13[3] = &unk_1E438B6B8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "insertPropertiesForUserIdentity:usingBlock:completionHandler:", v10, v13, v9);

}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ICDelegateAccountStoreServiceListener _identityStore](self, "_identityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__ICDelegateAccountStoreServiceListener_setToken_forUserIdentity_completionHandler___block_invoke;
  v13[3] = &unk_1E438B6E0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "updatePropertiesForUserIdentity:usingBlock:completionHandler:", v10, v13, v9);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *accessQueue;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id from;
  id location;
  _QWORD block[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_ignoresEntitlements)
    goto LABEL_2;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.itunescloud.delegate-account-store"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v17 = objc_msgSend(v16, "BOOLValue");

  if (!v17)
    goto LABEL_7;
LABEL_2:
  v9 = MEMORY[0x1E0C809B0];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v11 = v8;
  v28 = v11;
  dispatch_barrier_async(accessQueue, block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v19 = v9;
  v20 = 3221225472;
  v21 = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v22 = &unk_1E438D8F8;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  v12 = (void *)MEMORY[0x1A1AFA8D0](&v19);
  objc_msgSend(v11, "setInvalidationHandler:", v12, v19, v20, v21, v22);
  objc_msgSend(v11, "setInterruptionHandler:", v12);
  ICDelegateAccountStoreServiceGetInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExportedInterface:", v13);

  objc_msgSend(v11, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5BD0C0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v14);

  objc_msgSend(v11, "resume");
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  v15 = 1;
LABEL_8:

  return v15;
}

- (void)_userIdentityStoreDelegateAccountStoreDidChangeNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)_identityStore
{
  ICUserIdentityStore *testingIdentityStore;

  testingIdentityStore = self->_testingIdentityStore;
  if (testingIdentityStore)
    return testingIdentityStore;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingIdentityStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke_2;
  block[3] = &unk_1E43913D8;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "remoteObjectProxy", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "delegateAccountStoreDidChange");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

uint64_t __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v6[3] = &unk_1E4391110;
    v7 = WeakRetained;
    v8 = v4;
    dispatch_barrier_async(v5, v6);

  }
}

uint64_t __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__ICDelegateAccountStoreServiceListener_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegateToken:", *(_QWORD *)(a1 + 32));
}

void __97__ICDelegateAccountStoreServiceListener_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "replaceValuesWithValuesFromProperties:", v2);
  objc_msgSend(v3, "setDelegated:", 1);

}

+ (id)machServiceListener
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.itunescloud.delegate-account-store"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithXPCListener:testingIdentityStore:", v3, 0);

  return v4;
}

+ (id)testingListenerWithIdentityStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithXPCListener:testingIdentityStore:", v6, v4);

  return v7;
}

@end
