@implementation WFCaptiveObserver

- (WFCaptiveObserver)init
{
  WFCaptiveObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *captiveNotificationQueue;
  NSObject *v6;
  os_log_type_t v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)WFCaptiveObserver;
  v2 = -[WFCaptiveObserver init](&v8, sel_init);
  v3 = dispatch_queue_create("com.apple.wifikit.captive", 0);
  captiveNotificationQueue = v2->_captiveNotificationQueue;
  v2->_captiveNotificationQueue = (OS_dispatch_queue *)v3;

  if (!v2->_captiveNotificationQueue)
  {
    WFLogForCategory(2uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFCaptiveObserver init]";
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: failed to create queue", buf, 0xCu);
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WFCaptiveObserver stopObservingEvents](self, "stopObservingEvents");
  v3.receiver = self;
  v3.super_class = (Class)WFCaptiveObserver;
  -[WFCaptiveObserver dealloc](&v3, sel_dealloc);
}

- (void)startObservingEvents
{
  _BOOL4 v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  int v7;
  NSObject *captiveNotificationQueue;
  uint64_t v9;
  int *p_endCaptiveNotificationToken;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFCaptiveObserver isObserving](self, "isObserving");
  WFLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v3)
  {
    if (v7)
    {
      if (os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFCaptiveObserver startObservingEvents]";
        _os_log_impl(&dword_219FC8000, v4, v5, "%s: already observing", buf, 0xCu);
      }
    }

  }
  else
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFCaptiveObserver startObservingEvents]";
      _os_log_impl(&dword_219FC8000, v4, v5, "%s", buf, 0xCu);
    }

    -[WFCaptiveObserver setObserving:](self, "setObserving:", 1);
    objc_initWeak((id *)buf, self);
    self->_startCaptiveNotificationToken = 0;
    captiveNotificationQueue = self->_captiveNotificationQueue;
    v9 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke;
    handler[3] = &unk_24DC359E0;
    objc_copyWeak(&v15, (id *)buf);
    notify_register_dispatch("com.apple.networking.nanowebsheet.start", &self->_startCaptiveNotificationToken, captiveNotificationQueue, handler);
    self->_endCaptiveNotificationToken = 0;
    p_endCaptiveNotificationToken = &self->_endCaptiveNotificationToken;
    v11 = *((_QWORD *)p_endCaptiveNotificationToken + 2);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_2;
    v12[3] = &unk_24DC359E0;
    objc_copyWeak(&v13, (id *)buf);
    notify_register_dispatch("com.apple.networking.nanowebsheet.end", p_endCaptiveNotificationToken, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFCaptiveObserver startObservingEvents]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: captive start notification", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_4;
  block[3] = &unk_24DC347A0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "eventHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFCaptiveObserver startObservingEvents]_block_invoke_2";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: captive end notification", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_8;
  block[3] = &unk_24DC347A0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_8(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "eventHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

  }
}

- (void)stopObservingEvents
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315138;
    v6 = "-[WFCaptiveObserver stopObservingEvents]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[WFCaptiveObserver setObserving:](self, "setObserving:", 0);
  notify_cancel(self->_startCaptiveNotificationToken);
  self->_startCaptiveNotificationToken = -1;
  notify_cancel(self->_endCaptiveNotificationToken);
  self->_endCaptiveNotificationToken = -1;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)captiveNotificationQueue
{
  return self->_captiveNotificationQueue;
}

- (void)setCaptiveNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_captiveNotificationQueue, a3);
}

- (int)startCaptiveNotificationToken
{
  return self->_startCaptiveNotificationToken;
}

- (void)setStartCaptiveNotificationToken:(int)a3
{
  self->_startCaptiveNotificationToken = a3;
}

- (int)endCaptiveNotificationToken
{
  return self->_endCaptiveNotificationToken;
}

- (void)setEndCaptiveNotificationToken:(int)a3
{
  self->_endCaptiveNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveNotificationQueue, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
