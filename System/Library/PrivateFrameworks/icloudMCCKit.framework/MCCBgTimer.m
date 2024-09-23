@implementation MCCBgTimer

- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 block:(id)a4
{
  return -[MCCBgTimer initWithTimeIntervalSinceNow:queue:block:](self, "initWithTimeIntervalSinceNow:queue:block:", 0, a4, a3);
}

- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  MCCBgTimer *v10;
  MCCBgTimer *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  dispatch_source_t v14;
  OS_dispatch_source *timer;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  id v20;
  id location;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MCCBgTimer;
  v10 = -[MCCBgTimer init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_interval = (unint64_t)(a3 * 1000000000.0);
    if (v8)
      v12 = (dispatch_queue_t)v8;
    else
      v12 = dispatch_queue_create("com.apple.mcckit.bgtimer", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v11->_queue);
    timer = v11->_timer;
    v11->_timer = (OS_dispatch_source *)v14;

    objc_initWeak(&location, v11);
    v16 = v11->_timer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55__MCCBgTimer_initWithTimeIntervalSinceNow_queue_block___block_invoke;
    handler[3] = &unk_251C899B0;
    objc_copyWeak(&v20, &location);
    v19 = v9;
    dispatch_source_set_event_handler(v16, handler);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __55__MCCBgTimer_initWithTimeIntervalSinceNow_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = WeakRetained;
    (*(void (**)(void))(v3 + 16))();
    WeakRetained = v5;
  }

}

- (void)start
{
  __assert_rtn("-[MCCBgTimer start]", "MCCBgTimer.m", 44, "_timer");
}

- (void)cancel
{
  OS_dispatch_source *timer;
  OS_dispatch_queue *queue;

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  timer = self->_timer;
  self->_timer = 0;

  queue = self->_queue;
  self->_queue = 0;

}

- (BOOL)isValid
{
  NSObject *timer;

  timer = self->_timer;
  if (timer)
    LOBYTE(timer) = dispatch_source_testcancel(timer) == 0;
  return (char)timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
