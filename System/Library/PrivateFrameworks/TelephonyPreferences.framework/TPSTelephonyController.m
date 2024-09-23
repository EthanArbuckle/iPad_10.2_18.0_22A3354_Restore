@implementation TPSTelephonyController

- (TPSTelephonyController)init
{
  TPSTelephonyController *v2;
  TPSTelephonyController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialDispatchQueue;
  uint64_t v12;
  CoreTelephonyClient *telephonyClient;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TPSTelephonyController;
  v2 = -[TPSController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "tps_classIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_serialDispatchQueue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v7);
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), v8);
    serialDispatchQueue = v3->_serialDispatchQueue;
    v3->_serialDispatchQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v3->_serialDispatchQueue);
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v12;

    -[CoreTelephonyClient setDelegate:](v3->_telephonyClient, "setDelegate:", v3);
  }
  return v3;
}

- (BOOL)isSubscriptionOrderedSet:(id)a3 equivalentToSubscriptionOrderedSet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 == objc_msgSend(v6, "count"))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 1;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__TPSTelephonyController_isSubscriptionOrderedSet_equivalentToSubscriptionOrderedSet___block_invoke;
      v10[3] = &unk_1EA2CDCD0;
      v11 = v6;
      v12 = &v13;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
      v8 = *((_BYTE *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __86__TPSTelephonyController_isSubscriptionOrderedSet_equivalentToSubscriptionOrderedSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v8, "tps_isEquivalentToSubscriptionContext:", v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (NSOrderedSet)activeSubscriptions
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__TPSTelephonyController_activeSubscriptions__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOrderedSet *)v2;
}

void __45__TPSTelephonyController_activeSubscriptions__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "fetchSubscriptionsInUse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setActiveSubscriptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void __49__TPSTelephonyController_setActiveSubscriptions___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1 != *(void **)(a1 + 40))
  {
    v3 = v1;
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    if ((objc_msgSend(*(id *)(a1 + 32), "isSubscriptionOrderedSet:equivalentToSubscriptionOrderedSet:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_2;
      v8[3] = &unk_1EA2CD7B8;
      v8[4] = v7;
      objc_msgSend(v7, "performAtomicDelegateBlock:", v8);
    }

  }
}

void __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_3;
          v11[3] = &unk_1EA2CD690;
          v10 = *(_QWORD *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "telephonyController:didChangeActiveSubscriptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
}

- (NSOrderedSet)subscriptions
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__TPSTelephonyController_subscriptions__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOrderedSet *)v2;
}

void __39__TPSTelephonyController_subscriptions__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    objc_msgSend(v2, "fetchSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setSubscriptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void __43__TPSTelephonyController_setSubscriptions___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v1 != *(void **)(a1 + 40))
  {
    v3 = v1;
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if ((objc_msgSend(*(id *)(a1 + 32), "isSubscriptionOrderedSet:equivalentToSubscriptionOrderedSet:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)) & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke_2;
      v8[3] = &unk_1EA2CD7B8;
      v8[4] = v7;
      objc_msgSend(v7, "performAtomicDelegateBlock:", v8);
    }

  }
}

void __43__TPSTelephonyController_setSubscriptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke_3;
          v11[3] = &unk_1EA2CD690;
          v10 = *(_QWORD *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __43__TPSTelephonyController_setSubscriptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "telephonyController:didChangeSubscriptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
}

- (NSDictionary)systemCapabilities
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__TPSTelephonyController_systemCapabilities__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __44__TPSTelephonyController_systemCapabilities__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[6];
  if (!v3)
  {
    objc_msgSend(v2, "fetchSystemCapabilitiesForSubscriptions:", v2[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v5;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setSystemCapabilities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__TPSTelephonyController_setSystemCapabilities___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void __48__TPSTelephonyController_setSystemCapabilities___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 48) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

  }
}

- (void)performAtomicAccessorBlock:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_accessorLock = &self->_accessorLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_accessorLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_accessorLock);
  }
}

- (BOOL)supportsCellularNetworkSelectionForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  id v12;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "isNetworkSelectionMenuAvailable:error:", v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (!v6)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      TPSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TPSTelephonyController supportsCellularNetworkSelectionForSubscriptionContext:].cold.1();

    }
  }
  v10 = objc_msgSend(v6, "BOOLValue");

  return v10;
}

- (id)fetchNonHiddenSubscriptions
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[128];
  __int128 buf;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  TPSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1DB4B7000, v2, OS_LOG_TYPE_DEFAULT, "%@ fetching current CTXPCServiceSubscriptions in use", (uint8_t *)&buf, 0xCu);

  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)getPSSimStatusCacheClass_softClass;
  v26 = getPSSimStatusCacheClass_softClass;
  if (!getPSSimStatusCacheClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = __getPSSimStatusCacheClass_block_invoke;
    v30 = &unk_1EA2CDA28;
    v31 = &v23;
    __getPSSimStatusCacheClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscriptionsInUse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v10 = 138412290;
    v18 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSimHidden", v18, (_QWORD)v19))
        {
          TPSLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = v18;
            *(_QWORD *)((char *)&buf + 4) = v15;
            _os_log_impl(&dword_1DB4B7000, v14, OS_LOG_TYPE_DEFAULT, "Subscription: %@ is hidden", (uint8_t *)&buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (id)fetchSubscriptions
{
  void *v2;
  void *v3;

  -[TPSTelephonyController fetchNonHiddenSubscriptions](self, "fetchNonHiddenSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)fetchSubscriptionsInUse
{
  void *v2;
  void *v3;

  -[TPSTelephonyController fetchNonHiddenSubscriptions](self, "fetchNonHiddenSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)fetchSystemCapabilitiesForSubscriptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[TPSTelephonyController systemCapabilitiesForSubscriptionContext:](self, "systemCapabilitiesForSubscriptionContext:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[TPSTelephonyController systemCapabilities](self, "systemCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (-[TPSTelephonyController systemCapabilitiesForSubscriptionContext:](self, "systemCapabilitiesForSubscriptionContext:", v7), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = objc_msgSend(v11, "BOOLValue");
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)supportsSystemCapabilityCallerIDForSubscriptionContext:(id)a3
{
  return -[TPSTelephonyController supportsSystemCapabilityWithName:subscriptionContext:](self, "supportsSystemCapabilityWithName:subscriptionContext:", *MEMORY[0x1E0CA78C0], a3);
}

- (BOOL)supportsSystemCapabilityCallForwardingForSubscriptionContext:(id)a3
{
  return -[TPSTelephonyController supportsSystemCapabilityWithName:subscriptionContext:](self, "supportsSystemCapabilityWithName:subscriptionContext:", *MEMORY[0x1E0CA78B0], a3);
}

- (BOOL)supportsSystemCapabilityCallWaitingForSubscriptionContext:(id)a3
{
  return -[TPSTelephonyController supportsSystemCapabilityWithName:subscriptionContext:](self, "supportsSystemCapabilityWithName:subscriptionContext:", *MEMORY[0x1E0CA78B8], a3);
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  v11 = 0;
  -[TPSTelephonyController systemCapabilitiesForSubscriptionContext:error:](self, "systemCapabilitiesForSubscriptionContext:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      TPSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TPSTelephonyController systemCapabilitiesForSubscriptionContext:].cold.1();

    }
  }

  return v5;
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context:getSystemCapabilities:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "System capabilities have changed; updating the cached system capabilities.",
      v8,
      2u);
  }

  -[TPSTelephonyController subscriptions](self, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTelephonyController fetchSystemCapabilitiesForSubscriptions:](self, "fetchSystemCapabilitiesForSubscriptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTelephonyController setSystemCapabilities:](self, "setSystemCapabilities:", v7);

}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void)setAccessorLock:(os_unfair_lock_s)a3
{
  self->_accessorLock = a3;
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_systemCapabilities, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
}

- (void)supportsCellularNetworkSelectionForSubscriptionContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Retrieving cellular network selection information failed with error %@ for %@.");
}

- (void)systemCapabilitiesForSubscriptionContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB4B7000, v0, v1, "Retrieving system capability information failed with error %@ for %@.");
}

@end
