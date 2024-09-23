@implementation TRIExcessiveStaleFactorsUsageTimer

- (TRIExcessiveStaleFactorsUsageTimer)initWithNamespaceName:(id)a3 delayTimeInSeconds:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  TRIExcessiveStaleFactorsUsageTimer *v10;
  _QWORD *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _PASLock *lock;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  objc_super v27;

  v8 = a3;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TRIExcessiveStaleFactorsUsageTimer;
  v10 = -[TRIExcessiveStaleFactorsUsageTimer init](&v27, sel_init);
  if (v10)
  {
    v11 = (_QWORD *)objc_opt_new();
    dispatch_get_global_queue(9, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);

    v14 = objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", a4);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * (v14 / 0x5A0));
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __85__TRIExcessiveStaleFactorsUsageTimer_initWithNamespaceName_delayTimeInSeconds_block___block_invoke;
    v24 = &unk_1E3BFEFD8;
    v26 = v9;
    v25 = v8;
    dispatch_source_set_event_handler(v13, &v21);
    v15 = (void *)v11[1];
    v11[1] = v13;
    v16 = v13;

    dispatch_resume(v16);
    v17 = objc_alloc(MEMORY[0x1E0D815F0]);
    v18 = objc_msgSend(v17, "initWithGuardedData:", v11, v21, v22, v23, v24);

    lock = v10->_lock;
    v10->_lock = (_PASLock *)v18;

  }
  return v10;
}

uint64_t __85__TRIExcessiveStaleFactorsUsageTimer_initWithNamespaceName_delayTimeInSeconds_block___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TRILogCategory_ClientFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19B89C000, v2, OS_LOG_TYPE_DEFAULT, "Stale factor timer fired", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_5);
}

void __48__TRIExcessiveStaleFactorsUsageTimer_invalidate__block_invoke(uint64_t a1, _QWORD *a2)
{
  NSObject *v2;
  _QWORD *v4;
  id v5;

  v2 = a2[1];
  if (v2)
  {
    v4 = a2;
    dispatch_source_cancel(v2);
    v5 = (id)a2[1];
    a2[1] = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
