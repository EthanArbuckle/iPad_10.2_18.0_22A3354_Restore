@implementation SDDirtyIdleTimer

- (SDDirtyIdleTimer)initWithQueue:(id)a3 timeoutBlock:(id)a4
{
  id v7;
  id v8;
  SDDirtyIdleTimer *v9;
  SDDirtyIdleTimer *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SDDirtyIdleTimer;
  v9 = -[SDDirtyIdleTimer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = MEMORY[0x2199C2F34](v8);
    block = v10->_block;
    v10->_block = (id)v11;

    *(_OWORD *)&v10->_idleTimeout = xmmword_213D7E3F0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<%@:%p dc:%u rc:%d st:%llu ito:%llu dto:%lld"), objc_opt_class(), self, self->_dirtyCount, self->_resetCount, self->_idleStartTime, self->_idleTimeout, self->_dirtyTimeout);
}

- (void)_stop
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "%@ stopped", a5, a6, a7, a8, 2u);
}

- (void)dirty
{
  OS_dispatch_queue *queue;
  NSObject *v3;
  qos_class_t v4;
  dispatch_block_t v5;
  void *v6;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__SDDirtyIdleTimer_dirty__block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  v3 = queue;
  v4 = qos_class_self();
  if (v4 < 0x1A)
    v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  v6 = v5;
  dispatch_async(v3, v5);

}

void __25__SDDirtyIdleTimer_dirty__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    if (dispatch_time(0, 0) - *((_QWORD *)*v1 + 7) >= *((_QWORD *)*v1 + 3))
    {
      logForCSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __25__SDDirtyIdleTimer_dirty__block_invoke_cold_1((uint64_t)v1, v14, v15, v16, v17, v18, v19, v20);

    }
    else
    {
      ++*((_DWORD *)*v1 + 2);
      logForCSLogCategoryIndex();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = *v1;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v3;
        _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "%@ reset", buf, 0xCu);
      }

      v4 = *((_QWORD *)*v1 + 6);
      v5 = dispatch_time(0, *((_QWORD *)*v1 + 2));
      dispatch_source_set_timer(v4, v5, *((_QWORD *)*v1 + 2), *((_QWORD *)*v1 + 2));
    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *v1;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, "%@ start", buf, 0xCu);
    }

    v8 = os_transaction_create();
    v9 = (void *)*((_QWORD *)*v1 + 8);
    *((_QWORD *)*v1 + 8) = v8;

    v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)*v1 + 4));
    v11 = (void *)*((_QWORD *)*v1 + 6);
    *((_QWORD *)*v1 + 6) = v10;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *v1);
    v12 = *v1;
    v13 = *((_QWORD *)*v1 + 6);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __25__SDDirtyIdleTimer_dirty__block_invoke_2;
    v21[3] = &unk_24D0EDB30;
    v21[4] = v12;
    objc_copyWeak(&v22, (id *)buf);
    dispatch_source_set_event_handler(v13, v21);
    *((_QWORD *)*v1 + 7) = dispatch_time(0, *((_QWORD *)*v1 + 2));
    dispatch_source_set_timer(*((dispatch_source_t *)*v1 + 6), *((_QWORD *)*v1 + 7), *((_QWORD *)*v1 + 2), *((_QWORD *)*v1 + 2));
    dispatch_resume(*((dispatch_object_t *)*v1 + 6));
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __25__SDDirtyIdleTimer_dirty__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void (**v6)(void);
  int v7;
  uint64_t v8;
  __int16 v9;
  dispatch_time_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v3;
    v9 = 2048;
    v10 = dispatch_time(0, 0);
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "%@ %llu complete", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "block");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    objc_msgSend(v5, "_stop");
  }

}

- (void)cancel
{
  OS_dispatch_queue *queue;
  NSObject *v3;
  qos_class_t v4;
  dispatch_block_t v5;
  void *v6;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SDDirtyIdleTimer_cancel__block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  v3 = queue;
  v4 = qos_class_self();
  if (v4 < 0x1A)
    v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  v6 = v5;
  dispatch_async(v3, v5);

}

uint64_t __26__SDDirtyIdleTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (unint64_t)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(unint64_t)a3
{
  self->_idleTimeout = a3;
}

- (unint64_t)dirtyTimeout
{
  return self->_dirtyTimeout;
}

- (void)setDirtyTimeout:(unint64_t)a3
{
  self->_dirtyTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_source)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (unint64_t)idleStartTime
{
  return self->_idleStartTime;
}

- (void)setIdleStartTime:(unint64_t)a3
{
  self->_idleStartTime = a3;
}

- (unsigned)resetCount
{
  return self->_resetCount;
}

- (void)setResetCount:(unsigned int)a3
{
  self->_resetCount = a3;
}

- (unsigned)dirtyCount
{
  return self->_dirtyCount;
}

- (void)setDirtyCount:(unsigned int)a3
{
  self->_dirtyCount = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __25__SDDirtyIdleTimer_dirty__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "%@ dirty", a5, a6, a7, a8, 2u);
}

@end
