@implementation SCRDUSBDeviceCallbackManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_manager;
}

void __45__SCRDUSBDeviceCallbackManager_sharedManager__block_invoke()
{
  SCRDUSBDeviceCallbackManager *v0;
  void *v1;

  v0 = objc_alloc_init(SCRDUSBDeviceCallbackManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (SCRDUSBDeviceCallbackManager)init
{
  SCRDUSBDeviceCallbackManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completions;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCRDUSBDeviceCallbackManager;
  v2 = -[SCRDUSBDeviceCallbackManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    completions = v2->_completions;
    v2->_completions = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.ScreenReaderOutput.usbDeviceCallback.clientQueue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)addCompletion:(_SCRDUSBDeviceCompletion *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SCRDUSBDeviceCallbackManager_addCompletion___block_invoke;
  v4[3] = &unk_24F0F0608;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __46__SCRDUSBDeviceCallbackManager_addCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "pointerValue");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v4);

}

- (void)removeCompletion:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SCRDUSBDeviceCallbackManager_removeCompletion___block_invoke;
  v4[3] = &unk_24F0F0608;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __49__SCRDUSBDeviceCallbackManager_removeCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (_SCRDUSBDeviceCompletion)completionWithReference:(void *)a3
{
  NSObject *queue;
  void *v4;
  _SCRDUSBDeviceCompletion *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCRDUSBDeviceCallbackManager_completionWithReference___block_invoke;
  block[3] = &unk_24F0F0630;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (void *)v9[5];
  if (v4)
    v5 = (_SCRDUSBDeviceCompletion *)objc_msgSend(v4, "pointerValue");
  else
    v5 = 0;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SCRDUSBDeviceCallbackManager_completionWithReference___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
