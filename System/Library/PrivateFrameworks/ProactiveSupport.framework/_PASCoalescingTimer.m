@implementation _PASCoalescingTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_operation, 0);
  objc_storeStrong(&self->_coalesceData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (_PASCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 coalesceData:(id)a5 operation:(id)a6
{
  id v11;
  id v12;
  id v13;
  _PASCoalescingTimer *v14;
  _PASCoalescingTimer *v15;
  double v16;
  uint64_t v17;
  id coalesceData;
  uint64_t v19;
  id operation;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  _PASLock *v24;
  _PASLock *lock;
  objc_super v27;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_PASCoalescingTimer;
  v14 = -[_PASCoalescingTimer init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a3);
    v16 = 0.0;
    if (a4 >= 0.0)
      v16 = a4;
    v15->_leewaySeconds = v16;
    v17 = MEMORY[0x1A1AFDE78](v12);
    coalesceData = v15->_coalesceData;
    v15->_coalesceData = (id)v17;

    v19 = MEMORY[0x1A1AFDE78](v13);
    operation = v15->_operation;
    v15->_operation = (id)v19;

    v21 = (_QWORD *)objc_opt_new();
    v22 = objc_opt_new();
    v23 = (void *)v21[4];
    v21[4] = v22;

    v24 = -[_PASLock initWithGuardedData:]([_PASLock alloc], "initWithGuardedData:", v21);
    lock = v15->_lock;
    v15->_lock = v24;

  }
  return v15;
}

- (void)processData:(id)a3 afterDelaySeconds:(double)a4 coalescingBehavior:(unsigned __int8)a5
{
  id v8;
  void *v9;
  _PASLock *lock;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  if (a4 < 0.0)
    a4 = 0.0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", a4);
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___PASCoalescingTimer_processData_afterDelaySeconds_coalescingBehavior___block_invoke;
  v13[3] = &unk_1E442FFD0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);

}

- (void)_replaceCoalescingTimerUsingLockWitness:(id)a3
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  dispatch_source_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD handler[4];
  id v16[2];
  id location;

  v5 = a3;
  objc_msgSend(*((id *)v5 + 3), "timeIntervalSinceNow");
  v7 = v6;
  v8 = *((_QWORD *)v5 + 1);
  if (v8)
    dispatch_source_cancel(v8);
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v10 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v9;

  v11 = (void *)(*((_QWORD *)v5 + 2) + 1);
  *((_QWORD *)v5 + 2) = v11;
  objc_initWeak(&location, self);
  v12 = *((_QWORD *)v5 + 1);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke;
  handler[3] = &unk_1E4430098;
  objc_copyWeak(v16, &location);
  v16[1] = v11;
  dispatch_source_set_event_handler(v12, handler);
  v13 = +[_PASDispatch dispatchTimeWithSecondsFromNow:](_PASDispatch, "dispatchTimeWithSecondsFromNow:", v7);
  if (v13 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASCoalescingTimer.m"), 194, CFSTR("scheduledDelay is too large!"));

  }
  dispatch_source_set_timer(*((dispatch_source_t *)v5 + 1), v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leewaySeconds * 1000000000.0));
  dispatch_resume(*((dispatch_object_t *)v5 + 1));
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (_PASCoalescingTimer)initWithQueue:(id)a3 coalesceData:(id)a4 operation:(id)a5
{
  return -[_PASCoalescingTimer initWithQueue:leewaySeconds:coalesceData:operation:](self, "initWithQueue:leewaySeconds:coalesceData:operation:", a3, a4, a5, 0.02);
}

- (void)immediatelyProcessData:(id)a3
{
  -[_PASCoalescingTimer processData:afterDelaySeconds:coalescingBehavior:](self, "processData:afterDelaySeconds:coalescingBehavior:", a3, 0, 0.0);
}

- (void)processData:(id)a3 afterStrictDelaySeconds:(double)a4
{
  id v7;
  double v8;
  _PASLock *lock;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  SEL v14;

  v7 = a3;
  v8 = 0.0;
  if (a4 >= 0.0)
    v8 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke;
  v11[3] = &unk_1E4430048;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

- (void)cancelPendingOperations
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_2254);
}

@end
