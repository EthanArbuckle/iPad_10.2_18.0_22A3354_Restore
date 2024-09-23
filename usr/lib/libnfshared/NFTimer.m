@implementation NFTimer

- (void)startTimer:(double)a3
{
  -[NFTimer startTimer:leeway:](self, "startTimer:leeway:");
}

- (void)stopTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_src, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  self->_popTimeInSeconds = 0;
}

- (void)startTimer:(double)a3 leeway:(double)a4
{
  dispatch_time_t v6;

  v6 = dispatch_time((unint64_t)self->_monotonic << 63, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_time_to_nsec())
    self->_popTimeInSeconds = 0;
  dispatch_source_set_timer((dispatch_source_t)self->_src, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
}

- (NFTimer)initWithCallback:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  dispatch_source_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFTimer;
  v8 = -[NFTimer init](&v12, sel_init);
  if (v8)
  {
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 1uLL, 0, v7);
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v6);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    *((_BYTE *)v8 + 24) = 0;
  }

  return (NFTimer *)v8;
}

- (id)initSleepTimerWithCallback:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  dispatch_source_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFTimer;
  v8 = -[NFTimer init](&v12, sel_init);
  if (v8)
  {
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 2uLL, 0, v7);
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v6);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    *((_BYTE *)v8 + 24) = 1;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_src);
  v3.receiver = self;
  v3.super_class = (Class)NFTimer;
  -[NFTimer dealloc](&v3, sel_dealloc);
}

- (id)description
{
  __CFString *v2;

  if (self->_popTimeInSeconds)
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NFTimer: popTimeInSeconds: %llu"), self->_popTimeInSeconds);
  else
    v2 = CFSTR("NFTimer: nil");
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_src, 0);
}

@end
