@implementation MTSubscriptionEntitlementsObserver

- (MTSubscriptionEntitlementsObserver)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6;
  NSObject *v7;
  MTSubscriptionEntitlementsObserver *v8;
  MTSubscriptionEntitlementsObserver *v9;
  _QWORD block[4];
  MTSubscriptionEntitlementsObserver *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTSubscriptionEntitlementsObserver;
  v8 = -[MTSubscriptionEntitlementsObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_subscriptionsEntitlementsLock._os_unfair_lock_opaque = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MTSubscriptionEntitlementsObserver_initWithDelegate_onQueue___block_invoke;
    block[3] = &unk_1E54D0DE0;
    v12 = v9;
    dispatch_async(v7, block);

  }
  return v9;
}

void __63__MTSubscriptionEntitlementsObserver_initWithDelegate_onQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v2 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  v22 = getASDSubscriptionEntitlementsClass_softClass;
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = (uint64_t)__getASDSubscriptionEntitlementsClass_block_invoke;
    v17 = &unk_1E54D2070;
    v18 = &v19;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v19, 8);
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setEntitlements:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  v15 = (uint64_t)&v14;
  v16 = 0x2020000000;
  v7 = (void **)getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr;
  v17 = (void *)getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr)
  {
    v8 = (void *)AppStoreDaemonLibrary();
    v7 = (void **)dlsym(v8, "ASDSubscriptionEntitlementsPodcastDidChangeNotification");
    *(_QWORD *)(v15 + 24) = v7;
    getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v14, 8);
  if (!v7)
  {
    v13 = (_Unwind_Exception *)getkSymptomDiagnosticReplySuccess_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  v9 = *v7;
  v10 = *(void **)(a1 + 32);
  v11 = v9;
  objc_msgSend(v10, "entitlements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_entitlementsDidChange_, v11, v12);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)entitlementsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MTSubscriptionEntitlementsObserver_entitlementsDidChange___block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__MTSubscriptionEntitlementsObserver_entitlementsDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entitlementsDidChange");

}

- (MTSubscriptionEntitlementsObserverDelegate)delegate
{
  return (MTSubscriptionEntitlementsObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASDSubscriptionEntitlements)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
