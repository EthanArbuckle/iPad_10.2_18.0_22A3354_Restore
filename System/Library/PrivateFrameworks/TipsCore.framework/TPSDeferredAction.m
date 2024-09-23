@implementation TPSDeferredAction

- (TPSDeferredAction)init
{
  return -[TPSDeferredAction initWithQueue:](self, "initWithQueue:", 0);
}

- (TPSDeferredAction)initWithQueue:(id)a3
{
  id v4;
  TPSDeferredAction *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSDeferredAction;
  v5 = -[TPSDeferredAction init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v4 = (id)MEMORY[0x1E0C80D38];
      v6 = MEMORY[0x1E0C80D38];
    }
    objc_storeStrong((id *)&v5->_queue, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)scheduleNextRunLoop
{
  os_unfair_lock_s *p_lock;
  _QWORD v4[4];
  id v5;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[TPSDeferredAction scheduled](self, "scheduled"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[TPSDeferredAction setScheduled:](self, "setScheduled:", 1);
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__TPSDeferredAction_scheduleNextRunLoop__block_invoke;
    v4[3] = &unk_1E395BA00;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __40__TPSDeferredAction_scheduleNextRunLoop__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 3;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 3);
    -[os_unfair_lock_s setScheduled:](v4, "setScheduled:", 0);
    -[os_unfair_lock_s delegate](v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deferredActionPerform:", v4);

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }

}

- (TPSDeferredActionDelegate)delegate
{
  return (TPSDeferredActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
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

@end
