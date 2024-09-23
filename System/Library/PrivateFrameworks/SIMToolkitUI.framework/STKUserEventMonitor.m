@implementation STKUserEventMonitor

- (id)_initWithAttentionAwarenessClient:(id)a3
{
  id v6;
  STKUserEventMonitor *v7;
  STKUserEventMonitor *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  id v11;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  OS_dispatch_queue *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKUserEventMonitor.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("awClient"));

  }
  v19.receiver = self;
  v19.super_class = (Class)STKUserEventMonitor;
  v7 = -[STKUserEventMonitor init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_attentionAwarenessClient, a3);
    v9 = dispatch_queue_create("com.apple.stk.AttentionAwareQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc_init(MEMORY[0x24BE09598]);
    objc_msgSend(v11, "setEventMask:", 14);
    objc_msgSend(v11, "setIdentifier:", CFSTR("SIMToolkit"));
    objc_msgSend(v11, "setAttentionLostTimeout:", 0.01);
    -[AWAttentionAwarenessClient setConfiguration:shouldReset:](v8->_attentionAwarenessClient, "setConfiguration:shouldReset:", v11, 1);
    objc_initWeak(&location, v8);
    attentionAwarenessClient = v8->_attentionAwarenessClient;
    v13 = v8->_queue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __57__STKUserEventMonitor__initWithAttentionAwarenessClient___block_invoke;
    v16[3] = &unk_24D563570;
    objc_copyWeak(&v17, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](attentionAwarenessClient, "setEventHandlerWithQueue:block:", v13, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __57__STKUserEventMonitor__initWithAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleAttentionAwarenessEvent:", v3);

}

- (STKUserEventMonitor)init
{
  id v3;
  STKUserEventMonitor *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE09590]);
  v4 = -[STKUserEventMonitor _initWithAttentionAwarenessClient:](self, "_initWithAttentionAwarenessClient:", v3);

  return v4;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKUserEventMonitor.m"), 52, CFSTR("Monitor must be invalidated before it can deallocate."));

  }
  v5.receiver = self;
  v5.super_class = (Class)STKUserEventMonitor;
  -[STKUserEventMonitor dealloc](&v5, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (!self->_invalidated && self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
      -[STKUserEventMonitor _resume](self, "_resume");
    else
      -[STKUserEventMonitor _suspend](self, "_suspend");
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (!self->_invalidated)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216439000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalidating attention monitor.", buf, 2u);
    }
    -[STKUserEventMonitor setEnabled:](self, "setEnabled:", 0);
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__STKUserEventMonitor_invalidate__block_invoke;
    block[3] = &unk_24D563080;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __33__STKUserEventMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidateWithError:", 0);
}

- (id)_queue
{
  return self->_queue;
}

- (void)_queue_handleAttentionAwarenessEvent:(id)a3
{
  id v4;
  char v5;
  id WeakRetained;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssert();
  v5 = objc_msgSend(v4, "eventMask");

  if ((v5 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "userEventDidOccur:", self);

    attentionAwarenessClient = self->_attentionAwarenessClient;
    v9 = 0;
    LOBYTE(WeakRetained) = -[AWAttentionAwarenessClient resetAttentionLostTimeoutWithError:](attentionAwarenessClient, "resetAttentionLostTimeoutWithError:", &v9);
    v8 = v9;
    if ((WeakRetained & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_216439000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to reset attention lost timeout due to error: %{public}@", buf, 0xCu);
    }

  }
}

- (void)_resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__STKUserEventMonitor__resume__block_invoke;
  block[3] = &unk_24D563080;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__STKUserEventMonitor__resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216439000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Resuming attention monitor.", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 32;
  v4 = *(void **)(v3 + 40);
  v7 = 0;
  v5 = objc_msgSend(v4, "resumeWithError:", &v7);
  v6 = v7;
  if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __30__STKUserEventMonitor__resume__block_invoke_cold_1(v2);

}

- (void)_suspend
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__STKUserEventMonitor__suspend__block_invoke;
  block[3] = &unk_24D563080;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__STKUserEventMonitor__suspend__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216439000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Suspending attention monitor.", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 32;
  v4 = *(void **)(v3 + 40);
  v7 = 0;
  v5 = objc_msgSend(v4, "suspendWithError:", &v7);
  v6 = v7;
  if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __31__STKUserEventMonitor__suspend__block_invoke_cold_1(v2);

}

- (STKUserEventMonitorDelegate)delegate
{
  return (STKUserEventMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

void __30__STKUserEventMonitor__resume__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 8), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_216439000, MEMORY[0x24BDACB70], v2, "attention client %{public}@ cannot resume; error: %{public}@",
    v3,
    v4,
    v5,
    v6,
    v7);

  OUTLINED_FUNCTION_2_0();
}

void __31__STKUserEventMonitor__suspend__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 8), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_216439000, MEMORY[0x24BDACB70], v2, "attention client %{public}@ cannot suspend; error: %{public}@",
    v3,
    v4,
    v5,
    v6,
    v7);

  OUTLINED_FUNCTION_2_0();
}

@end
