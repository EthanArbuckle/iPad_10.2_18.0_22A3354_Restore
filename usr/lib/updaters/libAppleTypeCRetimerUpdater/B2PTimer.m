@implementation B2PTimer

- (B2PTimer)initWithDeadlineMS:(unsigned int)a3 type:(int)a4 queue:(id)a5 block:(id)a6
{
  NSObject *v10;
  id v11;
  B2PTimer *v12;
  B2PTimer *v13;
  uint64_t v14;
  id block;
  dispatch_source_t v16;
  OS_dispatch_source *timerSource;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)B2PTimer;
  v12 = -[B2PTimer init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a4;
    v14 = MEMORY[0x24BD2FE18](v11);
    block = v13->_block;
    v13->_block = (id)v14;

    v13->_ms = a3;
    v16 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v10);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v16;

  }
  return v13;
}

- (void)start
{
  NSObject *timerSource;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  timerSource = self->_timerSource;
  v4 = dispatch_time(0, 1000000 * self->_ms);
  dispatch_source_set_timer(timerSource, v4, 1000000 * self->_ms, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v5 = self->_timerSource;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __17__B2PTimer_start__block_invoke;
  v6[3] = &unk_251CE3B68;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __17__B2PTimer_start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 2) + 16))();
    v2 = v3;
  }

}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %s (%u ms)>"), v5, stringForB2PTimerType(self->_type), self->_ms);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)type
{
  return self->_type;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end
