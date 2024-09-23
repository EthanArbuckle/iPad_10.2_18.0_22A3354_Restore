@implementation SLGTimedLogger

- (SLGTimedLogger)initWithLogger:(id)a3 duration:(double)a4
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_duration = a4;
    self->_lock._os_unfair_lock_opaque = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (id)activationHandler
{
  return (id)-[SLGActivatableLogging activationHandler](self->_logger, "activationHandler");
}

- (void)setActivationHandler:(id)a3
{
  -[SLGActivatableLogging setActivationHandler:](self->_logger, "setActivationHandler:", a3);
}

- (id)deactivationHandler
{
  return (id)-[SLGActivatableLogging deactivationHandler](self->_logger, "deactivationHandler");
}

- (void)setDeactivationHandler:(id)a3
{
  -[SLGActivatableLogging setDeactivationHandler:](self->_logger, "setDeactivationHandler:", a3);
}

- (BOOL)isActive
{
  return -[SLGActivatableLogging isActive](self->_logger, "isActive");
}

- (void)setActive:(BOOL)a3
{
  if (a3)
    -[SLGTimedLogger _startTimer](self, "_startTimer");
  else
    -[SLGTimedLogger _stopTimer](self, "_stopTimer");
}

- (void)invalidate
{
  -[SLGActivatableLogging invalidate](self->_logger, "invalidate");
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[SLGTimedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:](self->_logger, "logBlock:domain:", v7, v6);

}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGTimedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:completion:](self->_logger, "logBlock:domain:completion:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGTimedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:tags:](self->_logger, "logBlock:domain:tags:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[SLGTimedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:tags:completion:](self->_logger, "logBlock:domain:tags:completion:", v13, v10, v11, v12);

}

- (void)_startTimer
{
  NSObject *timer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];

  -[SLGActivatableLogging setActive:](self->_logger, "setActive:", 1);
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  v6 = self->_timer;
  self->_timer = v5;

  v7 = self->_timer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__SLGTimedLogger__startTimer__block_invoke;
  handler[3] = &unk_1E81F3270;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  v8 = self->_timer;
  v9 = dispatch_time(0, (uint64_t)(self->_duration * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timer);
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __29__SLGTimedLogger__startTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopTimer");
}

- (void)_stopTimer
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
  -[SLGActivatableLogging setActive:](self->_logger, "setActive:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
