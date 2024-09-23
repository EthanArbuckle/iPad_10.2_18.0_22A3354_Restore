@implementation WFUserInfoManager

- (WFUserInfoManager)init
{
  WFUserInfoManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *ubiquitousKVSCommunicationsQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  uint64_t v9;
  NSUbiquitousKeyValueStore *encryptedStore;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFUserInfoManager;
  v2 = -[WFUserInfoManager init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.WeatherFoundation.ubiquitousKVSCommunicationsQueue", v3);
    ubiquitousKVSCommunicationsQueue = v2->_ubiquitousKVSCommunicationsQueue;
    v2->_ubiquitousKVSCommunicationsQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.WeatherFoundation.callbackQueue", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1888]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.weather"), 1);
    encryptedStore = v2->_encryptedStore;
    v2->_encryptedStore = (NSUbiquitousKeyValueStore *)v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD1378];
    -[WFUserInfoManager encryptedStore](v2, "encryptedStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_encryptedStoreChanged_, v12, v13);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFUserInfoManager;
  -[WFUserInfoManager dealloc](&v4, sel_dealloc);
}

- (void)readUserIdentifierAndNotify
{
  NSObject *v3;
  _QWORD block[5];

  -[WFUserInfoManager ubiquitousKVSCommunicationsQueue](self, "ubiquitousKVSCommunicationsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke(uint64_t a1)
{
  unsigned int (*v2)(void);
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _Unwind_Exception *v8;
  _QWORD block[5];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v2 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v15 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v3 = MEMORY[0x24BDAC760];
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v11[3] = &unk_24CCA17D8;
    v11[4] = &v12;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v11);
    v2 = (unsigned int (*)(void))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v2)
  {
    v8 = (_Unwind_Exception *)__48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v8);
  }
  if (v2() == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("userIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.foundation.userInfoManager.errorDomain"), 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_2;
  block[3] = &unk_24CCA17B0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfoManager:didSynchronizeUserIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSUbiquitousKeyValueStore)encryptedStore
{
  return self->_encryptedStore;
}

- (WFUserInfoManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)ubiquitousKVSCommunicationsQueue
{
  return self->_ubiquitousKVSCommunicationsQueue;
}

- (void)setUbiquitousKVSCommunicationsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquitousKVSCommunicationsQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ubiquitousKVSCommunicationsQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_encryptedStore, 0);
}

uint64_t __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.1(v0);
}

@end
