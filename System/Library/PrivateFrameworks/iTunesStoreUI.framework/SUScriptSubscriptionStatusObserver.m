@implementation SUScriptSubscriptionStatusObserver

+ (id)sharedObserver
{
  if (sharedObserver_sSharedObserverOnceToken != -1)
    dispatch_once(&sharedObserver_sSharedObserverOnceToken, &__block_literal_global_15);
  return (id)sharedObserver_sSharedObserver;
}

void __52__SUScriptSubscriptionStatusObserver_sharedObserver__block_invoke()
{
  SUScriptSubscriptionStatusObserver *v0;
  void *v1;

  v0 = objc_alloc_init(SUScriptSubscriptionStatusObserver);
  v1 = (void *)sharedObserver_sSharedObserver;
  sharedObserver_sSharedObserver = (uint64_t)v0;

}

- (SUScriptSubscriptionStatusObserver)init
{
  SUScriptSubscriptionStatusObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  void *v5;
  uint64_t v6;
  ICMusicSubscriptionStatusMonitor *subscriptionStatusMonitor;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  SUScriptSubscriptionStatusObserver *v11;
  id v12;
  ICMusicSubscriptionStatusMonitor *v13;
  uint64_t v14;
  NSCopying *subscriptionStatusMonitorObservationToken;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD block[4];
  SUScriptSubscriptionStatusObserver *v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SUScriptSubscriptionStatusObserver;
  v2 = -[SUScriptSubscriptionStatusObserver init](&v23, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptSubscriptionStatusObserver", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    -[objc_class autoupdatingActiveAccount](getICUserIdentityClass_1(), "autoupdatingActiveAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class sharedMonitorForIdentity:](getICMusicSubscriptionStatusMonitorClass_1(), "sharedMonitorForIdentity:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusMonitor = v2->_subscriptionStatusMonitor;
    v2->_subscriptionStatusMonitor = (ICMusicSubscriptionStatusMonitor *)v6;

    -[ICMusicSubscriptionStatusMonitor subscriptionStatus](v2->_subscriptionStatusMonitor, "subscriptionStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v2->_accessQueue;
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SUScriptSubscriptionStatusObserver_init__block_invoke;
    block[3] = &unk_24DE7B0F0;
    v11 = v2;
    v21 = v11;
    v12 = v8;
    v22 = v12;
    dispatch_sync(v9, block);
    objc_initWeak(&location, v11);
    v13 = v2->_subscriptionStatusMonitor;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __42__SUScriptSubscriptionStatusObserver_init__block_invoke_2;
    v17[3] = &unk_24DE7E028;
    objc_copyWeak(&v18, &location);
    -[ICMusicSubscriptionStatusMonitor beginObservingSubscriptionStatusWithHandler:](v13, "beginObservingSubscriptionStatusWithHandler:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusMonitorObservationToken = v11->_subscriptionStatusMonitorObservationToken;
    v11->_subscriptionStatusMonitorObservationToken = (NSCopying *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __42__SUScriptSubscriptionStatusObserver_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  SUScriptSubscriptionStatusResponse *v3;
  SUScriptSubscriptionStatusResponse *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = -[SUScriptSubscriptionStatusResponse initWithSubscriptionStatus:isFinal:]([SUScriptSubscriptionStatusResponse alloc], "initWithSubscriptionStatus:isFinal:", *(_QWORD *)(a1 + 40), 1);
  else
    v3 = 0;
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v3);
  if (v2)

}

void __42__SUScriptSubscriptionStatusObserver_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updateWithSubscriptionStatus:", v4);

}

- (void)dealloc
{
  objc_super v3;

  -[ICMusicSubscriptionStatusMonitor endObservingSubscriptionStatusWithToken:](self->_subscriptionStatusMonitor, "endObservingSubscriptionStatusWithToken:", self->_subscriptionStatusMonitorObservationToken);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSubscriptionStatusObserver;
  -[SUScriptSubscriptionStatusObserver dealloc](&v3, sel_dealloc);
}

- (void)_updateWithSubscriptionStatus:(id)a3
{
  SUScriptSubscriptionStatusResponse *v4;
  SUScriptSubscriptionStatusResponse *v5;
  NSObject *accessQueue;
  SUScriptSubscriptionStatusResponse *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SUScriptSubscriptionStatusObserver *v14;
  SUScriptSubscriptionStatusResponse *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = (SUScriptSubscriptionStatusResponse *)a3;
  v5 = v4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (v4)
    v4 = -[SUScriptSubscriptionStatusResponse initWithSubscriptionStatus:isFinal:]([SUScriptSubscriptionStatusResponse alloc], "initWithSubscriptionStatus:isFinal:", v4, 1);
  accessQueue = self->_accessQueue;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __68__SUScriptSubscriptionStatusObserver__updateWithSubscriptionStatus___block_invoke;
  v13 = &unk_24DE7E050;
  v14 = self;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  dispatch_sync(accessQueue, &v10);
  if (*((_BYTE *)v18 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v10, v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("service");
    v22[0] = CFSTR("AppleMusic");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SUScriptSubscriptionStatusDidChangeNotification"), self, v9);

  }
  _Block_object_dispose(&v17, 8);

}

void __68__SUScriptSubscriptionStatusObserver__updateWithSubscriptionStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusMonitorObservationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusMonitor, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionStatusResponse, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
