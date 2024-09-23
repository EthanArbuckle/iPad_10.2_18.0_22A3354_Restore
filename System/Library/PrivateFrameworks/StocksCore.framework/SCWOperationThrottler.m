@implementation SCWOperationThrottler

- (SCWOperationThrottler)initWithDelegate:(id)a3 updateQueue:(id)a4
{
  id v6;
  NSObject *v7;
  SCWOperationThrottler *v8;
  SCWOperationThrottler *v9;
  dispatch_group_t v10;
  dispatch_source_t v11;
  OS_dispatch_source *dispatchSource;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *v20;
  NSObject *v21;
  _QWORD handler[4];
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id from;
  id location;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SCWOperationThrottler;
  v8 = -[SCWOperationThrottler init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_initWeak(&location, v8);
      objc_initWeak(&from, v6);
      v10 = dispatch_group_create();
      objc_storeStrong((id *)&v9->_handlerSynchronizationGroup, v10);
      objc_storeStrong((id *)&v9->_serialQueue, a4);
      v11 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v7);
      dispatchSource = v9->_dispatchSource;
      v9->_dispatchSource = (OS_dispatch_source *)v11;
      v13 = v11;

      objc_initWeak(&v28, v13);
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke;
      handler[3] = &unk_1E5AF2A50;
      v15 = v10;
      v23 = v15;
      objc_copyWeak(&v25, &from);
      objc_copyWeak(&v26, &location);
      objc_copyWeak(&v27, &v28);
      v16 = v7;
      v24 = v16;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_group_enter(v15);
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_5;
      v19[3] = &unk_1E5AF1C90;
      v20 = v16;
      v21 = v15;
      v17 = v15;
      dispatch_source_set_cancel_handler(v13, v19);
      dispatch_resume(v13);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

- (SCWOperationThrottler)initWithDelegate:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  SCWOperationThrottler *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  v8 = dispatch_queue_create(0, v6);
  v9 = -[SCWOperationThrottler initWithDelegate:updateQueue:](self, "initWithDelegate:updateQueue:", v7, v8);

  return v9;
}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_2;
    v4[3] = &unk_1E5AF2A28;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    objc_copyWeak(&v7, (id *)(a1 + 64));
    v5 = *(id *)(a1 + 40);
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_2((id *)v4, v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v6);
  }
}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);

  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_3;
    v6[3] = &unk_1E5AF2A00;
    v7 = v3;
    objc_copyWeak(&v9, a1 + 6);
    v8 = a1[4];
    v5 = objc_loadWeakRetained(a1 + 5);
    __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_3((uint64_t)v6, v5);

    objc_destroyWeak(&v9);
  }

}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationThrottlerPerformOperation:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    dispatch_suspend(WeakRetained);
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_4;
    v7[3] = &unk_1E5AF1C90;
    v8 = WeakRetained;
    v5 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(v5, "operationThrottler:performAsyncOperationWithCompletion:", v3, v7);

  }
}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_4(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  dispatch_resume(*(dispatch_object_t *)(a1 + 40));
}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_5(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_6;
  block[3] = &unk_1E5AF1E88;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __54__SCWOperationThrottler_initWithDelegate_updateQueue___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
  v3.receiver = self;
  v3.super_class = (Class)SCWOperationThrottler;
  -[SCWOperationThrottler dealloc](&v3, sel_dealloc);
}

- (void)tickleWithCompletion:(id)a3
{
  if (a3)
    dispatch_group_notify((dispatch_group_t)self->_handlerSynchronizationGroup, (dispatch_queue_t)self->_serialQueue, a3);
  dispatch_source_merge_data((dispatch_source_t)self->_dispatchSource, 1uLL);
}

- (void)addCompletionForCurrentOperation:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (void)tickle
{
  -[SCWOperationThrottler tickleWithCompletion:](self, "tickleWithCompletion:", 0);
}

- (BOOL)suspended
{
  SCWOperationThrottler *v2;
  BOOL suspended;

  v2 = self;
  objc_sync_enter(v2);
  suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  SCWOperationThrottler *v4;
  NSObject *dispatchSource;
  SCWOperationThrottler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    dispatchSource = obj->_dispatchSource;
    if (v3)
      dispatch_suspend(dispatchSource);
    else
      dispatch_resume(dispatchSource);
    v4 = obj;
  }
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerSynchronizationGroup, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

@end
