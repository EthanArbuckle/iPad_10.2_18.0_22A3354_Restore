@implementation VKTimer

- (VKTimer)initWithTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  id v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *source;
  VKTimer *v12;
  NSObject *v13;
  VKTimer *v14;
  VKTimer *v15;
  _QWORD v17[4];
  VKTimer *v18;
  id v19;
  VKTimer *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  if (!v9)
    goto LABEL_6;
  v22.receiver = self;
  v22.super_class = (Class)VKTimer;
  self = -[VKTimer init](&v22, sel_init);
  if (self)
  {
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    source = self->_source;
    self->_source = v10;

    if (self->_source)
    {
      v12 = self;
      v13 = self->_source;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __41__VKTimer_initWithTarget_selector_queue___block_invoke;
      v17[3] = &unk_1E42F4120;
      v14 = v12;
      v18 = v14;
      v20 = v14;
      v21 = a4;
      v19 = v8;
      dispatch_source_set_event_handler(v13, v17);
      v14->_nextFireDate = 3153600000.0;
      dispatch_resume((dispatch_object_t)self->_source);

      goto LABEL_5;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  self = self;
  v15 = self;
LABEL_7:

  return v15;
}

- (void)dealloc
{
  OS_dispatch_source *source;
  objc_super v4;

  -[VKTimer invalidate](self, "invalidate");
  source = self->_source;
  self->_source = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKTimer;
  -[VKTimer dealloc](&v4, sel_dealloc);
}

- (void)fireAfter:(double)a3
{
  NSObject *source;
  dispatch_time_t v6;

  self->_nextFireDate = CFAbsoluteTimeGetCurrent() + a3;
  source = self->_source;
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)disable
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  self->_nextFireDate = v4;

  dispatch_source_set_timer((dispatch_source_t)self->_source, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
}

- (double)nextFireDate
{
  return self->_nextFireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

uint64_t __41__VKTimer_initWithTarget_selector_queue___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0x41E77F03C0000000;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(*(id *)(a1 + 40), "methodForSelector:", *(_QWORD *)(a1 + 56)))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

@end
