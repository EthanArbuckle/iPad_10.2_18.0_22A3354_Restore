@implementation SUClientInterface

- (void)setViewControllerFactory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUClientInterfaceDelegatePrivate *)a3;
}

- (void)setClientIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientInterface_setClientIdentifier___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SUClientInterface_setClientIdentifier___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 48);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 48) = result;
  }
  return result;
}

- (SUQueueSessionManager)queueSessionManager
{
  NSObject *dispatchQueue;
  SUQueueSessionManager *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUClientInterface_queueSessionManager__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUQueueSessionManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUClientInterface_setURLBagKey_forIdentifier___block_invoke;
  block[3] = &unk_24DE7B6E8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SUClientInterface_appearance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = +[SUUIAppearance defaultAppearance](SUUIAppearance, "defaultAppearance");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SUClientInterface;
  -[SUClientInterface dealloc](&v3, sel_dealloc);
}

- (SUUIAppearance)appearance
{
  NSObject *dispatchQueue;
  SUUIAppearance *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SUClientInterface_appearance__block_invoke;
  v5[3] = &unk_24DE7BE08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUUIAppearance *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (SUClientInterface)init
{
  SUClientInterface *v2;
  void *v3;
  SUPurchaseManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUClientInterface;
  v2 = -[SUClientInterface init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    v2->_applicationIdentifier = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultApplicationIdentifier"), "copy");
    v2->_applicationVersion = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultApplicationVersion"), "copy");
    v2->_queueSessionManager = objc_alloc_init(SUQueueSessionManager);
    v2->_viewControllerFactory = objc_alloc_init(SUViewControllerFactory);
    v4 = objc_alloc_init(SUPurchaseManager);
    v2->_purchaseManager = v4;
    -[SUPurchaseManager setQueueSessionManager:](v4, "setQueueSessionManager:", v2->_queueSessionManager);

  }
  return v2;
}

- (UIColor)lightKeyColor
{
  return self->_lightKeyColor;
}

- (UIColor)darkKeyColor
{
  return self->_darkKeyColor;
}

+ (id)_defaultApplicationIdentifier
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleIdentifier"));
}

+ (id)_defaultApplicationVersion
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleVersion"));
}

- (void)setLightKeyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDarkKeyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SUViewControllerFactory)viewControllerFactory
{
  return (SUViewControllerFactory *)objc_getProperty(self, a2, 144, 1);
}

uint64_t __48__SUClientInterface_setURLBagKey_forIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 128);
  if (!v2)
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  if (!v3)
  {
    *(_QWORD *)(a1[5] + 128) = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2 = a1[4];
    v3 = *(void **)(a1[5] + 128);
  }
  return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
}

id __40__SUClientInterface_queueSessionManager__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)applicationIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUClientInterface_applicationIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__SUClientInterface_applicationIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)applicationVersion
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SUClientInterface_applicationVersion__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SUClientInterface_applicationVersion__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)clientIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientInterface_clientIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientInterface_clientIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)ignoreDefaultKeyboardNotifications
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SUClientInterface_ignoreDefaultKeyboardNotifications__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUClientInterface_ignoreDefaultKeyboardNotifications__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 153);
  return result;
}

- (NSString)localStoragePath
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientInterface_localStoragePath__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientInterface_localStoragePath__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUPreviewOverlayViewController)previewOverlay
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (SUPreviewOverlayViewController *)-[SUClientInterfaceDelegatePrivate previewOverlayForClientInterface:](self->_delegate, "previewOverlayForClientInterface:", self);
  else
    return 0;
}

- (SUPurchaseManager)purchaseManager
{
  NSObject *dispatchQueue;
  SUPurchaseManager *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SUClientInterface_purchaseManager__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUPurchaseManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUClientInterface_purchaseManager__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setApplicationIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SUClientInterface_setApplicationIdentifier___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SUClientInterface_setApplicationIdentifier___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 8);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) = result;
  }
  return result;
}

- (void)setApplicationVersion:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SUClientInterface_setApplicationVersion___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SUClientInterface_setApplicationVersion___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 16);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 16) = result;
  }
  return result;
}

- (void)setAppearance:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SUClientInterface_setAppearance___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __35__SUClientInterface_setAppearance___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 32);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 32) = result;
  }
  return result;
}

- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SUClientInterface_setIgnoreDefaultKeyboardNotifications___block_invoke;
  v4[3] = &unk_24DE7C2C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __59__SUClientInterface_setIgnoreDefaultKeyboardNotifications___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 153) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setLocalStoragePath:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientInterface_setLocalStoragePath___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SUClientInterface_setLocalStoragePath___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 96);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 96) = result;
  }
  return result;
}

- (void)setPurchaseManager:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SUClientInterface_setPurchaseManager___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__SUClientInterface_setPurchaseManager___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 104);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 104) = *(id *)(v2 + 40);
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 104), "queueSessionManager");
    if (!result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 104), "setQueueSessionManager:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 112));
  }
  return result;
}

- (void)setQueueSessionManager:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUClientInterface_setQueueSessionManager___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__44__SUClientInterface_setQueueSessionManager___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v1 = result[4];
  if (*(_QWORD *)(v1 + 112) != result[5])
  {
    v2 = result;
    v3 = objc_msgSend(*(id *)(v1 + 104), "queueSessionManager");
    v4 = *(void **)(v2[4] + 112);

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 112) = result;
    if ((void *)v3 == v4)
      return (_QWORD *)objc_msgSend(*(id *)(v2[4] + 104), "setQueueSessionManager:", *(_QWORD *)(v2[4] + 112));
  }
  return result;
}

- (void)setUserAgent:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SUClientInterface_setUserAgent___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SUClientInterface_setUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  if (v2 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(*(id *)(a1 + 40), "copy");
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
  }
  return objc_msgSend(*(id *)(v1 + 104), "setUserAgent:", v2);
}

- (void)setWasLaunchedFromLibrary:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SUClientInterface_setWasLaunchedFromLibrary___block_invoke;
  v4[3] = &unk_24DE7C2C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SUClientInterface_setWasLaunchedFromLibrary___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 152) = *(_BYTE *)(result + 40);
  return result;
}

- (SUTabBarController)tabBarController
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (SUTabBarController *)-[SUClientInterfaceDelegatePrivate tabBarControllerForClientInterface:](self->_delegate, "tabBarControllerForClientInterface:", self);
  else
    return 0;
}

- (id)URLBagKeyForIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__49;
  v11 = __Block_byref_object_dispose__49;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUClientInterface_URLBagKeyForIdentifier___block_invoke;
  block[3] = &unk_24DE7C5A8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __44__SUClientInterface_URLBagKeyForIdentifier___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 128), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (NSString)userAgent
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__SUClientInterface_userAgent__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SUClientInterface_userAgent__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)wasLaunchedFromLibrary
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUClientInterface_wasLaunchedFromLibrary__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SUClientInterface_wasLaunchedFromLibrary__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

- (void)_dismissModalViewControllerFromViewController:(id)a3 withTransition:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:willDismissViewController:](self->_delegate, "clientInterface:willDismissViewController:", self, a3);
  objc_msgSend(a3, "dismissModalViewControllerWithTransition:", v4);
}

- (void)_dismissViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:willDismissViewController:](self->_delegate, "clientInterface:willDismissViewController:", self, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:dismissViewController:animated:completion:](self->_delegate, "clientInterface:dismissViewController:animated:completion:", self, a3, v6, a5);
  else
    objc_msgSend(a3, "dismissViewControllerAnimated:completion:", v6, a5);
}

- (void)_dispatchOnPageResponseWithData:(id)a3 response:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:dispatchOnPageResponseWithData:response:](self->_delegate, "clientInterface:dispatchOnPageResponseWithData:response:", self, a3, a4);
}

- (void)_dispatchXEvent:(id)a3 withCompletionBlock:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:dispatchXEvent:completionBlock:](self->_delegate, "clientInterface:dispatchXEvent:completionBlock:", self, a3, a4);
  else
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)_exitStoreWithReason:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:exitStoreWithReason:](self->_delegate, "clientInterface:exitStoreWithReason:", self, a3);
}

- (void)_hidePreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:hidePreviewOverlayAnimated:](self->_delegate, "clientInterface:hidePreviewOverlayAnimated:", self, v3);
}

- (BOOL)_ignoresExpectedClientsProtocol
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SUClientInterface__ignoresExpectedClientsProtocol__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SUClientInterface__ignoresExpectedClientsProtocol__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)_mediaPlayerViewControllerWillDismiss:(id)a3 animated:(BOOL)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:willDismissViewController:](self->_delegate, "clientInterface:willDismissViewController:", self, a3);
}

- (void)_presentDialog:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:presentDialog:](self->_delegate, "clientInterface:presentDialog:", self, a3);
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 withTransition:(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:willPresentViewController:](self->_delegate, "clientInterface:willPresentViewController:", self, a3);
  objc_msgSend(a4, "presentViewController:withTransition:completion:", a3, v5, 0);
}

- (id)_newScriptInterface
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[SUClientInterfaceDelegatePrivate scriptInterfaceForClientInterface:](self->_delegate, "scriptInterfaceForClientInterface:", self);
  else
    return 0;
}

- (void)_returnToLibrary
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate returnToLibraryForClientInterface:](self->_delegate, "returnToLibraryForClientInterface:", self);
}

- (void)_setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4
{
  _BOOL8 v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:setStatusBarHidden:withAnimation:](self->_delegate, "clientInterface:setStatusBarHidden:withAnimation:", self, v5, a4);
}

- (void)_setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:setStatusBarStyle:animated:](self->_delegate, "clientInterface:setStatusBarStyle:animated:", self, a3, v4);
}

- (void)_setIgnoresExpectedClientsProtocol:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SUClientInterface__setIgnoresExpectedClientsProtocol___block_invoke;
  v4[3] = &unk_24DE7C2C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SUClientInterface__setIgnoresExpectedClientsProtocol___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUClientInterfaceDelegatePrivate clientInterface:showPreviewOverlayAnimated:](self->_delegate, "clientInterface:showPreviewOverlayAnimated:", self, v3);
}

- (NSString)askToBuyApprovalPrompt
{
  return self->_askToBuyApprovalPrompt;
}

- (void)setAskToBuyApprovalPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)inAskToBuyApprovalFlow
{
  return self->inAskToBuyApprovalFlow;
}

- (void)setInAskToBuyApprovalFlow:(BOOL)a3
{
  self->inAskToBuyApprovalFlow = a3;
}

- (SUClientInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)isFinanceInterruption
{
  return self->_financeInterruption;
}

- (void)setFinanceInterruption:(BOOL)a3
{
  self->_financeInterruption = a3;
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (BOOL)showDialogOnError
{
  return self->_showDialogOnError;
}

- (void)setShowDialogOnError:(BOOL)a3
{
  self->_showDialogOnError = a3;
}

@end
