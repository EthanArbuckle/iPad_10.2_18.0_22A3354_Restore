@implementation BRCAutoCancelOperation

- (BRCAutoCancelOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  BRCAutoCancelOperation *v6;
  dispatch_group_t v7;
  OS_dispatch_group *observersGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCAutoCancelOperation;
  v6 = -[_BRCOperation initWithName:syncContext:sessionContext:group:](&v10, sel_initWithName_syncContext_sessionContext_group_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = dispatch_group_create();
    observersGroup = v6->_observersGroup;
    v6->_observersGroup = (OS_dispatch_group *)v7;

  }
  return v6;
}

- (void)beginObservingChanges
{
  NSObject *cancelTimer;

  dispatch_group_enter((dispatch_group_t)self->_observersGroup);
  cancelTimer = self->_cancelTimer;
  if (cancelTimer)
    dispatch_source_cancel(cancelTimer);
}

- (void)endObservingChanges
{
  dispatch_group_leave((dispatch_group_t)self->_observersGroup);
}

- (void)_initializeCancelTimer
{
  void *v3;
  NSObject *observersGroup;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  observersGroup = self->_observersGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke;
  block[3] = &unk_24FE40760;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_group_notify(observersGroup, v5, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  dispatch_block_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = dispatch_time(0, objc_msgSend(v5, "listDirChangesCancelDelay"));

    dispatch_source_set_timer(v4, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v7 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2;
    v19[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v20, v2);
    v8 = v4;
    v9 = v19;
    v10 = v8;
    v11 = v9;
    v12 = v11;
    v13 = v11;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
    dispatch_source_set_event_handler(v10, v14);

    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2;
    v17[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v18, v2);
    dispatch_source_set_cancel_handler(v10, v17);
    v15 = (void *)WeakRetained[64];
    WeakRetained[64] = v10;
    v16 = v10;

    dispatch_resume(v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
  }

}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  dispatch_group_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[64];
    WeakRetained[64] = 0;

    if ((-[dispatch_group_t isFinished](v2, "isFinished") & 1) == 0
      && (-[dispatch_group_t isCancelled](v2, "isCancelled") & 1) == 0)
    {
      if (dispatch_group_wait(v2[63], 0))
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_2();

        -[dispatch_group_t _initializeCancelTimer](v2, "_initializeCancelTimer");
      }
      else
      {
        brc_bread_crumbs();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_1();

        -[dispatch_group_t cancel](v2, "cancel");
      }
    }
  }

}

{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[64];
    WeakRetained[64] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "BRCAutoCancelOperation/? (subclass activity missing)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)hasObservers
{
  return dispatch_group_wait((dispatch_group_t)self->_observersGroup, 0) != 0;
}

- (void)dealloc
{
  NSObject *i;
  objc_super v4;

  for (i = self->_observersGroup; dispatch_group_wait(i, 0); i = self->_observersGroup)
    dispatch_group_leave((dispatch_group_t)self->_observersGroup);
  v4.receiver = self;
  v4.super_class = (Class)BRCAutoCancelOperation;
  -[_BRCOperation dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTimer, 0);
  objc_storeStrong((id *)&self->_observersGroup, 0);
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] No one is waiting on %@ anymore so cancelling%@");
  OUTLINED_FUNCTION_0();
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We have observers again for %@ so not cancelling yet%@");
  OUTLINED_FUNCTION_0();
}

@end
