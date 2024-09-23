@implementation WFScreenOnObserver

- (WFScreenOnObserver)init
{
  WFScreenOnObserver *v2;
  WFScreenOnObserver *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  WFScreenOnObserver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFScreenOnObserver;
  v2 = -[WFScreenOnObserver init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_token = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.shortcuts.WFScreenOnObserver", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

- (void)start
{
  uint64_t v3;
  NSObject *queue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD handler[5];

  if (self->_token == -1)
  {
    v3 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__WFScreenOnObserver_start__block_invoke;
    handler[3] = &unk_1E7AED190;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_token, queue, handler);
    v5 = self->_queue;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __27__WFScreenOnObserver_start__block_invoke_2;
    v6[3] = &unk_1E7AF94B0;
    v6[4] = self;
    dispatch_async(v5, v6);
  }
}

- (void)stop
{
  notify_cancel(self->_token);
}

- (void)stateChanged:(BOOL)a3
{
  int v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[WFScreenOnObserver screenOn](self, "screenOn");
  getWFWFScreenOnObserverLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[WFScreenOnObserver stateChanged:]";
      v10 = 1024;
      v11 = v5;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s previous state (%i) and new state (%i) match, not notifying", (uint8_t *)&v8, 0x18u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 136315650;
      v9 = "-[WFScreenOnObserver stateChanged:]";
      v10 = 1024;
      v11 = v5;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s screen on state transitioned from %i to %i", (uint8_t *)&v8, 0x18u);
    }

    self->_screenOn = v3;
    -[WFScreenOnObserver delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject screenOnStateDidChange:](v7, "screenOnStateDidChange:", self);
  }

}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (WFScreenOnObserverDelegate)delegate
{
  return (WFScreenOnObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __27__WFScreenOnObserver_start__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "stateChanged:", state64 == 0);
}

uint64_t __27__WFScreenOnObserver_start__block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t state64;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
  state64 = 0;
  notify_get_state(v2, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "stateChanged:", state64 == 0);
}

@end
