@implementation SVXMyriadWiFiAssertion

- (SVXMyriadWiFiAssertion)initWithQueue:(id)a3 delegate:(id)a4
{
  id v6;
  SVXMyriadWiFiAssertion *v7;
  SVXMyriadWiFiAssertion *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SVXMyriadWiFiAssertion;
  v7 = -[SVXMyriadWiFiAssertion init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_workQueue = (OS_dispatch_queue *)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)_releaseAssertion
{
  NSObject *v3;
  AFWatchdogTimer *assertionWaitTimer;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_wifiAssertionAcquired)
  {
    v3 = *MEMORY[0x24BE08FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD8], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SVXMyriadWiFiAssertion _releaseAssertion]";
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
    }
    self->_wifiAssertionAcquired = 0;
    -[AFWatchdogTimer cancelIfNotAlreadyCanceled](self->_assertionWaitTimer, "cancelIfNotAlreadyCanceled");
    assertionWaitTimer = self->_assertionWaitTimer;
    self->_assertionWaitTimer = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "myriadWiFiAssertionDidReleaseAssertion:", self);

    }
  }
}

- (void)acquireHomeKitAccessoryWiFiAssertionWithTimeout:(double)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke;
  v4[3] = &unk_24D24EA18;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)releaseHomeKitAccessoryWiFiAssertion
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SVXMyriadWiFiAssertion_releaseHomeKitAccessoryWiFiAssertion__block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (SVXMyriadWiFiAssertionProtocol)delegate
{
  return (SVXMyriadWiFiAssertionProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)wifiAssertionAcquired
{
  return self->_wifiAssertionAcquired;
}

- (AFWatchdogTimer)assertionWaitTimer
{
  return self->_assertionWaitTimer;
}

- (void)setAssertionWaitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assertionWaitTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionWaitTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __62__SVXMyriadWiFiAssertion_releaseHomeKitAccessoryWiFiAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertion");
}

void __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_releaseAssertion");
  v2 = *MEMORY[0x24BE08FD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD8], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SVXMyriadWiFiAssertion acquireHomeKitAccessoryWiFiAssertionWithTimeout:]_block_invoke";
    v16 = 2048;
    v17 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Acquiring assertion with timeout time: %f seconds", buf, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4 = objc_alloc(MEMORY[0x24BE093A8]);
  v5 = *(double *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke_3;
  v12[3] = &unk_24D24F0B8;
  objc_copyWeak(&v13, (id *)buf);
  v7 = objc_msgSend(v4, "initWithTimeoutInterval:onQueue:timeoutHandler:", v6, v12, v5);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "start");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v11, "myriadWiFiAssertionDidAcquireAssertion:", *(_QWORD *)(a1 + 32));

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __74__SVXMyriadWiFiAssertion_acquireHomeKitAccessoryWiFiAssertionWithTimeout___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_releaseAssertion");

}

@end
