@implementation AXCameraTorchManagerBackgroundAdapter

- (AXCameraTorchManagerBackgroundAdapter)initWithCameraTorchManager:(id)a3
{
  id v5;
  AXCameraTorchManagerBackgroundAdapter *v6;
  AXCameraTorchManagerBackgroundAdapter *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *q;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXCameraTorchManagerBackgroundAdapter;
  v6 = -[AXCameraTorchManagerBackgroundAdapter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_synchronousManager, a3);
    v8 = dispatch_queue_create("com.apple.accessibility.AXCameraTorchManagerBackgroundAdapter", 0);
    q = v7->_q;
    v7->_q = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)openTorchDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__AXCameraTorchManagerBackgroundAdapter_openTorchDeviceWithCompletion___block_invoke;
  v7[3] = &unk_24E593148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(q, v7);

}

uint64_t __71__AXCameraTorchManagerBackgroundAdapter_openTorchDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "openTorchDevice");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)closeTorchDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__AXCameraTorchManagerBackgroundAdapter_closeTorchDeviceWithCompletion___block_invoke;
  v7[3] = &unk_24E593148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(q, v7);

}

uint64_t __72__AXCameraTorchManagerBackgroundAdapter_closeTorchDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "closeTorchDevice");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)turnTorchOnWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  NSObject *q;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  q = self->_q;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__AXCameraTorchManagerBackgroundAdapter_turnTorchOnWithCompletion___block_invoke;
  v14[3] = &unk_24E593148;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async(q, v14);

}

uint64_t __67__AXCameraTorchManagerBackgroundAdapter_turnTorchOnWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "turnTorchOn");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)turnTorchOffWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  NSObject *q;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  q = self->_q;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__AXCameraTorchManagerBackgroundAdapter_turnTorchOffWithCompletion___block_invoke;
  v14[3] = &unk_24E593148;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async(q, v14);

}

uint64_t __68__AXCameraTorchManagerBackgroundAdapter_turnTorchOffWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "turnTorchOff");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (AXCameraTorchManager)synchronousTorchManager
{
  return self->_synchronousManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousManager, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

@end
