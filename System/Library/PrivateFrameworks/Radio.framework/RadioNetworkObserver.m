@implementation RadioNetworkObserver

- (RadioNetworkObserver)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("RadioNetworkObserverInitException"), CFSTR("-init is not supported, use +sharedNetworkObserver"));

  return 0;
}

- (id)_init
{
  RadioNetworkObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *networkUsageQueue;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RadioNetworkObserver;
  v2 = -[RadioNetworkObserver init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Radio.RadioNetworkObserver", 0);
    networkUsageQueue = v2->_networkUsageQueue;
    v2->_networkUsageQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BEB21E0];
    objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__cellularNetworkAllowedDidChangeNotification_, v6, v7);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEB21E0];
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)RadioNetworkObserver;
  -[RadioNetworkObserver dealloc](&v6, sel_dealloc);
}

- (void)_cellularNetworkAllowedDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__RadioNetworkObserver__cellularNetworkAllowedDidChangeNotification___block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)beginUsingNetwork
{
  NSObject *networkUsageQueue;
  _QWORD block[5];

  networkUsageQueue = self->_networkUsageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__RadioNetworkObserver_beginUsingNetwork__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(networkUsageQueue, block);
}

- (void)endUsingNetwork
{
  NSObject *networkUsageQueue;
  _QWORD block[5];

  networkUsageQueue = self->_networkUsageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__RadioNetworkObserver_endUsingNetwork__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(networkUsageQueue, block);
}

- (BOOL)isCellularNetworkingAllowed
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (BOOL)isUsingNetwork
{
  NSObject *networkUsageQueue;
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
  networkUsageQueue = self->_networkUsageQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__RadioNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(networkUsageQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkUsageQueue, 0);
}

uint64_t __38__RadioNetworkObserver_isUsingNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) > 0;
  return result;
}

void __39__RadioNetworkObserver_endUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 8) = v4;
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v5 + 8))
    {
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__RadioNetworkObserver_endUsingNetwork__block_invoke_2;
      block[3] = &unk_24CA2EB28;
      block[4] = v5;
      dispatch_async(v6, block);

    }
  }
}

void __39__RadioNetworkObserver_endUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RadioNetworkObserverIsUsingNetworkDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __41__RadioNetworkObserver_beginUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8) == 1)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__RadioNetworkObserver_beginUsingNetwork__block_invoke_2;
    block[3] = &unk_24CA2EB28;
    block[4] = v1;
    dispatch_async(v2, block);

  }
}

void __41__RadioNetworkObserver_beginUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RadioNetworkObserverIsUsingNetworkDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __69__RadioNetworkObserver__cellularNetworkAllowedDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RadioNetworkObserverIsCellularNetworkingAllowedDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver___once != -1)
    dispatch_once(&sharedNetworkObserver___once, &__block_literal_global_1254);
  return (id)sharedNetworkObserver___sharedNetworkObserver;
}

void __45__RadioNetworkObserver_sharedNetworkObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RadioNetworkObserver _init]([RadioNetworkObserver alloc], "_init");
  v1 = (void *)sharedNetworkObserver___sharedNetworkObserver;
  sharedNetworkObserver___sharedNetworkObserver = (uint64_t)v0;

}

@end
