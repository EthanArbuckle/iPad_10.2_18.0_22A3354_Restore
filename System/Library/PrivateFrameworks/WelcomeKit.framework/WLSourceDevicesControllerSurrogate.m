@implementation WLSourceDevicesControllerSurrogate

- (WLSourceDevicesControllerSurrogate)initWithDelegate:(id)a3
{
  WLSourceDevicesControllerSurrogate *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLSourceDevicesControllerSurrogate;
  v3 = -[WLSourceDevicesController initWithDelegate:](&v7, sel_initWithDelegate_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.welcomekit.sourceDeviceControllerSurrogate", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)startWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *serialQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 500000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__WLSourceDevicesControllerSurrogate_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_24EFCA9D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, serialQueue, v8);

}

void __80__WLSourceDevicesControllerSurrogate_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), obj);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), arc4random_uniform(0xF423Fu));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, const __CFString *, const __CFString *, void *, uint64_t, _QWORD))(v4 + 16))(v4, 1, CFSTR("fake ssid"), CFSTR("fake psk"), v3, -1, 0);

}

- (void)scheduleSurrogateDeviceDiscovery
{
  dispatch_time_t v3;
  NSObject *serialQueue;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WLSourceDevicesControllerSurrogate_scheduleSurrogateDeviceDiscovery__block_invoke;
  block[3] = &unk_24EFCA9F8;
  block[4] = self;
  dispatch_after(v3, serialQueue, block);
}

void __70__WLSourceDevicesControllerSurrogate_scheduleSurrogateDeviceDiscovery__block_invoke(uint64_t a1)
{
  void *v2;
  WLSourceDevice *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v3 = objc_alloc_init(WLSourceDevice);
    -[WLSourceDevice setName:](v3, "setName:", CFSTR("UI Test Mode"));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sourceDeviceController:didDiscoverDevice:", *(_QWORD *)(a1 + 32), v3);

  }
}

- (void)stopDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *serialQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 100000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__WLSourceDevicesControllerSurrogate_stopDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_24EFCA9D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, serialQueue, v8);

}

uint64_t __72__WLSourceDevicesControllerSurrogate_stopDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = *(void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *serialQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 100000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WLSourceDevicesControllerSurrogate_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_24EFCA9D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, serialQueue, v8);

}

uint64_t __79__WLSourceDevicesControllerSurrogate_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDiscoverySession, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
