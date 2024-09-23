@implementation PKSharingChannelHandleMessageWaiter

- (PKSharingChannelHandleMessageWaiter)initWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5 replyQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKSharingChannelHandleMessageWaiter *v13;
  PKSharingChannelHandleMessageWaiter *v14;
  void *v15;
  id messageHandler;
  void *v17;
  id invalidationHandler;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSharingChannelHandleMessageWaiter;
  v13 = -[PKSharingChannelHandleMessageWaiter init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_timeout = a3;
    v15 = _Block_copy(v10);
    messageHandler = v14->_messageHandler;
    v14->_messageHandler = v15;

    v17 = _Block_copy(v11);
    invalidationHandler = v14->_invalidationHandler;
    v14->_invalidationHandler = v17;

    objc_storeStrong((id *)&v14->_replyQueue, a6);
    v14->_lock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

- (void)startForHandle:(id)a3
{
  PKSharingChannelHandle **p_handle;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  p_handle = &self->_handle;
  v5 = a3;
  objc_storeWeak((id *)p_handle, v5);
  -[PKSharingChannelHandleMessageWaiter _startTimeoutTimer](self, "_startTimeoutTimer");
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke;
  v8[3] = &unk_1E2ABE120;
  v8[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke_2;
  v7[3] = &unk_1E2ABE120;
  v7[4] = self;
  objc_msgSend(v5, "setMessageReceivedHandler:", v7);

}

uint64_t __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithShouldNotify:fromTimeout:", 1, 0);
}

uint64_t __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_messageReceived");
}

- (void)_messageReceived
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *(*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_messageHandler);
  v5 = v4;
  if (self->_isHandlingMessage || (!self->_isPendingInvalidation ? (v6 = v4 == 0) : (v6 = 1), v6))
  {
    v11 = 0;
  }
  else
  {
    v11 = 1;
    self->_isHandlingMessage = 1;
  }
  os_unfair_lock_unlock(p_lock);
  objc_initWeak(&location, self);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__72;
  v23 = __Block_byref_object_dispose__72;
  v12 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v14 = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke;
  v15 = &unk_1E2AD91D0;
  v13 = 3221225472;
  objc_copyWeak(&v18, &location);
  v7 = v5;
  v16 = v7;
  v17 = &v19;
  v8 = (void (**)(_QWORD))_Block_copy(&v12);
  v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  v10 = (void *)v20[5];
  v20[5] = v9;

  if (v11)
    v8[2](v8);

  objc_destroyWeak(&v18);
  _Block_object_dispose(&v19, 8);

  objc_destroyWeak(&location);
}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_2;
    v8[3] = &unk_1E2AD91A8;
    objc_copyWeak(&v11, v2);
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "handleOutstandingMessage:", v8);

    objc_destroyWeak(&v11);
  }

}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[3];
  _BYTE v16[8];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_endTimeoutTimer");

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16[0] = 0;
    v9 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_3;
    v10[3] = &unk_1E2AD9180;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v11 = v7;
    v12 = v15;
    v13 = *(_QWORD *)(a1 + 40);
    (*(void (**)(uint64_t, id, _BYTE *, _QWORD *))(v9 + 16))(v9, v5, v16, v10);

    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_3(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  int v3;
  id v4;
  int v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    os_unfair_lock_lock((os_unfair_lock_t)v10 + 16);
    v3 = v10[49];
    v4 = objc_loadWeakRetained((id *)v10 + 5);
    v5 = objc_msgSend(v4, "hasOutstandingMessage");

    if (v3)
      v6 = 1;
    else
      v6 = v5 == 0;
    v7 = !v6 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
    v10[48] = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)v10 + 16);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v8 = v10;
      v9 = 0;
    }
    else
    {
      if (!v3)
      {
        if (v5)
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
        else
          objc_msgSend(v10, "_startTimeoutTimer");
        goto LABEL_13;
      }
      v8 = v10;
      v9 = 1;
    }
    objc_msgSend(v8, "_invalidateWithShouldNotify:fromTimeout:", v9, 0);
LABEL_13:
    WeakRetained = v10;
  }

}

- (void)_invalidateWithShouldNotify:(BOOL)a3 fromTimeout:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  id invalidationHandler;
  id messageHandler;
  PKSharingChannelHandle **p_handle;
  id WeakRetained;
  id v12;
  void (**v13)(id, _BOOL8);

  v4 = a4;
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isHandlingMessage)
  {
    self->_isPendingInvalidation = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (v5)
      v13 = (void (**)(id, _BOOL8))_Block_copy(self->_invalidationHandler);
    else
      v13 = 0;
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    messageHandler = self->_messageHandler;
    self->_messageHandler = 0;

    os_unfair_lock_unlock(p_lock);
    p_handle = &self->_handle;
    WeakRetained = objc_loadWeakRetained((id *)p_handle);
    objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

    v12 = objc_loadWeakRetained((id *)p_handle);
    objc_msgSend(v12, "setMessageReceivedHandler:", 0);

    if (v13)
    {
      v13[2](v13, v4);

    }
  }
}

- (void)_startTimeoutTimer
{
  os_unfair_lock_s *p_lock;
  NSObject *timer;
  dispatch_source_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  dispatch_source_t v9;
  id v10;
  id location;

  if (self->_timeout > 0.0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    timer = self->_timer;
    if (timer)
      dispatch_source_cancel(timer);
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_replyQueue);
    objc_storeStrong((id *)&self->_timer, v5);
    os_unfair_lock_unlock(p_lock);
    v6 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__PKSharingChannelHandleMessageWaiter__startTimeoutTimer__block_invoke;
    handler[3] = &unk_1E2ABE7B0;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    v7 = v5;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__PKSharingChannelHandleMessageWaiter__startTimeoutTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[7];
    if (v3 == *(void **)(a1 + 32))
    {
      WeakRetained[7] = 0;
      v4 = WeakRetained;

      objc_msgSend(v4, "_invalidateWithShouldNotify:fromTimeout:", 1, 1);
      WeakRetained = v4;
    }
  }

}

- (void)_endTimeoutTimer
{
  os_unfair_lock_s *p_lock;
  NSObject *timer;
  OS_dispatch_source *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_handle);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
}

@end
