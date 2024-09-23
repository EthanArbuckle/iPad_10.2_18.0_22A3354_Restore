@implementation QLGracePeriodTimer

- (QLGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5
{
  id v8;
  id v9;
  QLGracePeriodTimer *v10;
  uint64_t v11;
  id action;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)QLGracePeriodTimer;
  v10 = -[QLGracePeriodTimer init](&v14, sel_init);
  if (v10)
  {
    v11 = MEMORY[0x212BA28B4](v8);
    action = v10->_action;
    v10->_action = (id)v11;

    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    v10->_delay = a5;
  }

  return v10;
}

- (void)_createTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  double delay;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  timer = self->_timer;
  self->_timer = v3;

  delay = self->_delay;
  v6 = (uint64_t)(delay / 10.0 * 1000000000.0);
  v7 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6);
  objc_initWeak(&location, self);
  v8 = self->_timer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__QLGracePeriodTimer__createTimer__block_invoke;
  v9[3] = &unk_24C71B2C8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__QLGracePeriodTimer__createTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "action");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    objc_msgSend(v4, "_suppress");

    WeakRetained = v4;
  }

}

- (void)_suppress
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)arm
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[QLGracePeriodTimer _suppress](self, "_suppress");
  -[QLGracePeriodTimer _createTimer](self, "_createTimer");
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)suppress
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[QLGracePeriodTimer _suppress](self, "_suppress");
}

- (id)action
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_action, 0);
}

@end
