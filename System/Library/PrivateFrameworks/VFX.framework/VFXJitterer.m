@implementation VFXJitterer

+ (void)initialize
{
  NSObject *v2;

  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  qword_1ED4CF758 = (uint64_t)dispatch_queue_create("com.apple.vfx.jitteringUpdateQueue", v2);
}

- (VFXJitterer)initWithDelegate:(id)a3
{
  VFXJitterer *v4;
  VFXJitterer *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD handler[5];
  _QWORD v10[6];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXJitterer;
  v4 = -[VFXJitterer init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, a3);
    v5->_restartSourceIsSuspended = 1;
    v5->_state = 3;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = sub_1B182C3D8;
    v10[4] = sub_1B182C3E8;
    v10[5] = v5;
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)qword_1ED4CF758);
    v7 = MEMORY[0x1E0C809B0];
    v5->_restartSource = (OS_dispatch_source *)v6;
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = sub_1B182C3F4;
    handler[3] = &unk_1E63D6DD0;
    handler[4] = v10;
    dispatch_source_set_event_handler(v6, handler);
    _Block_object_dispose(v10, 8);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *restartSource;
  objc_super v6;
  _QWORD handler[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B182C508;
  block[3] = &unk_1E63D6D80;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1ED4CF758, block);
  v4 = dispatch_semaphore_create(0);
  restartSource = self->_restartSource;
  handler[0] = v3;
  handler[1] = 3221225472;
  handler[2] = sub_1B182C520;
  handler[3] = &unk_1E63D6D80;
  handler[4] = v4;
  dispatch_source_set_cancel_handler(restartSource, handler);
  dispatch_source_cancel((dispatch_source_t)self->_restartSource);
  dispatch_release((dispatch_object_t)self->_restartSource);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)VFXJitterer;
  -[VFXJitterer dealloc](&v6, sel_dealloc);
}

- (void)delegateWillDie
{
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_state <= 1)
    self->_state = 2;
  dispatch_sync((dispatch_queue_t)qword_1ED4CF758, &unk_1E63D0C30);
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v3;

  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      objc_msgSend_restart(self, a2, a3, v3);
    }
    else
    {
      objc_msgSend_stopIfNeeded(self, a2, a3, v3);
      self->_enabled = 0;
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isAborting
{
  return self->_state == 2;
}

- (void)update
{
  id Weak;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t state;

  Weak = objc_loadWeak((id *)&self->_delegate);
  state = self->_state;
  if (!state)
    goto LABEL_5;
  if (state == 1)
  {
    self->_iteration = 0;
    if (objc_msgSend__canJitter(Weak, v4, v5, v6))
    {
      self->_state = 0;
LABEL_5:
      MEMORY[0x1E0DE7D20](self, sel_jitter, v5, v6);
    }
  }
}

- (void)jitter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id Weak;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t iteration;
  _BOOL8 v18;
  void *v19;
  const char *v20;
  unint64_t state;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD block[5];

  if (self->_iteration >= 0x52)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. invalid iteration count"), v2, v3, v4, v5, v6, v7, (uint64_t)"_iteration <= CFXJitteringIterationCount");
  Weak = objc_loadWeak((id *)&self->_delegate);
  if (Weak)
  {
    v10 = Weak;
    v11 = (void *)MEMORY[0x1B5E23520]();
    v12 = v10;
    iteration = self->_iteration;
    v18 = (iteration & 1) == 0 && iteration > 8;
    v19 = (void *)objc_msgSend_renderer(v10, v13, v14, v15);
    objc_msgSend__jitterAtStep_updateMainFramebuffer_redisplay_jitterer_(v19, v20, self->_iteration, v18, v18, self);
    state = self->_state;
    v22 = self->_iteration + 1;
    self->_iteration = v22;
    v23 = MEMORY[0x1E0C809B0];
    if (v22 == 81)
    {
      if (!state)
        self->_state = 3;
    }
    else if (state != 2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B182C778;
      block[3] = &unk_1E63D6D80;
      block[4] = self;
      dispatch_async((dispatch_queue_t)qword_1ED4CF758, block);
    }
    objc_autoreleasePoolPop(v11);
    v24[0] = v23;
    v24[1] = 3221225472;
    v24[2] = sub_1B182C780;
    v24[3] = &unk_1E63D6D80;
    v24[4] = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v24);
  }
}

- (void)stopIfNeeded
{
  _QWORD block[5];

  if (self->_enabled)
  {
    if (self->_state <= 1)
      self->_state = 2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B182C800;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1ED4CF758, block);
  }
}

- (void)restart
{
  _QWORD block[5];

  if (self->_enabled)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B182C8A0;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1ED4CF758, block);
  }
}

@end
