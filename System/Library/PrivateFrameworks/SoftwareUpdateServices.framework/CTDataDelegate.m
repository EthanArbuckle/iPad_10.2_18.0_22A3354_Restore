@implementation CTDataDelegate

- (CTDataDelegate)init
{
  CTDataDelegate *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *initiationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTDataDelegate;
  v2 = -[CTDataDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.SoftwareUpdateServices.CTDataDelegate", 0);
    initiationQueue = v2->_initiationQueue;
    v2->_initiationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_2 != -1)
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_18);
  return (id)sharedInstance___instance_8;
}

void __32__CTDataDelegate_sharedInstance__block_invoke()
{
  CTDataDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(CTDataDelegate);
  v1 = (void *)sharedInstance___instance_8;
  sharedInstance___instance_8 = (uint64_t)v0;

}

- (void)_initCTClient
{
  CoreTelephonyClient *v3;
  CoreTelephonyClient *client;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_initiationQueue);
  if (!self->_client)
  {
    v3 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
    client = self->_client;
    self->_client = v3;

  }
}

- (id)getCTClient
{
  NSObject *initiationQueue;
  _QWORD block[5];

  initiationQueue = self->_initiationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__CTDataDelegate_getCTClient__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(initiationQueue, block);
  return self->_client;
}

uint64_t __29__CTDataDelegate_getCTClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initCTClient");
}

- (id)getPreferredDataSubscriptionContext
{
  NSObject *initiationQueue;
  _QWORD block[5];

  initiationQueue = self->_initiationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CTDataDelegate_getPreferredDataSubscriptionContext__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(initiationQueue, block);
  return self->_subscriptionContext;
}

void __53__CTDataDelegate_getPreferredDataSubscriptionContext__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    objc_msgSend(v2, "_initCTClient");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v19 = 0;
    objc_msgSend(v3, "getPreferredDataSubscriptionContextSync:", &v19);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v19;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v4;

    v8 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v9 = *(void **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0;

      SULogDebug(CFSTR("%s: %@\n"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[CTDataDelegate getPreferredDataSubscriptionContext]_block_invoke");
    }
    else
    {
      v17 = *(void **)(v8 + 24);
      +[CTDataDelegate sharedInstance](CTDataDelegate, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegate:", v18);

    }
  }
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  NSObject *initiationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  initiationQueue = self->_initiationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CTDataDelegate_preferredDataSimChanged___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(initiationQueue, block);

}

void __42__CTDataDelegate_preferredDataSimChanged___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_initiationQueue, 0);
}

@end
