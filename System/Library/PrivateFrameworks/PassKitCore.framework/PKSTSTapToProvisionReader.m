@implementation PKSTSTapToProvisionReader

- (PKSTSTapToProvisionReader)init
{

  return 0;
}

- (PKSTSTapToProvisionReader)initWithReplyQueue:(id)a3
{
  id v5;
  PKSTSTapToProvisionReader *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  NSObject *v9;
  _QWORD block[4];
  PKSTSTapToProvisionReader *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSTSTapToProvisionReader;
  v6 = -[PKSTSTapToProvisionReader init](&v13, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.taptoprovision.reader.queue", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v9 = v6->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PKSTSTapToProvisionReader_initWithReplyQueue___block_invoke;
    block[3] = &unk_1E2ABE120;
    v12 = v6;
    dispatch_async(v9, block);

  }
  return v6;
}

uint64_t __48__PKSTSTapToProvisionReader_initWithReplyQueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init((Class)getSTSTapToProvisionReaderClass[0]());
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
}

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "stsParameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_60;
    v8[3] = &unk_1E2AD3308;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v2, "provisionCardWithParameters:completion:", v3, v8);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "sid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "[%@] PKSTSTapToProvisionReader: Failed to get reader instance", buf, 0xCu);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_2;
  block[3] = &unk_1E2ABE030;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  BOOL v2;
  PKSTSTapToProvisionResult *v3;

  v1 = a1[6];
  if (a1[4])
    v2 = a1[5] == 0;
  else
    v2 = 0;
  if (v2)
  {
    v3 = -[PKSTSTapToProvisionResult initWithSTSResult:]([PKSTSTapToProvisionResult alloc], "initWithSTSResult:", a1[4]);
    (*(void (**)(uint64_t, PKSTSTapToProvisionResult *, _QWORD))(v1 + 16))(v1, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(a1[6], 0);
  }
}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
{
  NSObject *workQueue;
  char v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__44;
  v12 = __Block_byref_object_dispose__44;
  v13 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKSTSTapToProvisionReader_cancelProvisionAndReturnError___block_invoke;
  block[3] = &unk_1E2AD3330;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(workQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __59__PKSTSTapToProvisionReader_cancelProvisionAndReturnError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "cancelProvisionAndReturnError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (void)tapToProvisionAvailableWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  OS_dispatch_source *timer;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSObject *workQueue;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD handler[5];
  id v21;
  uint8_t buf[16];

  v6 = a4;
  if (self->_timer)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: Clearing existing timer to start new preflight", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0;

  }
  v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_replyQueue);
  v10 = self->_timer;
  self->_timer = v9;

  v11 = self->_timer;
  v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v13 = MEMORY[0x1E0C809B0];
  v14 = self->_timer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke;
  handler[3] = &unk_1E2ABE058;
  handler[4] = self;
  v15 = v6;
  v21 = v15;
  dispatch_source_set_event_handler(v14, handler);
  workQueue = self->_workQueue;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_2;
  v18[3] = &unk_1E2ABE058;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  dispatch_async(workQueue, v18);
  dispatch_resume((dispatch_object_t)self->_timer);

}

uint64_t __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 32) = 0;

    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 40) + 16))();
  }
  return result;
}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_3;
  v4[3] = &unk_1E2AD3358;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "checkStatusWithCompletion:", v4);

}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_4;
  v12[3] = &unk_1E2ABE1E8;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_4(_QWORD *a1)
{
  _BOOL4 v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1[4])
    v2 = 0;
  else
    v2 = a1[5] != 0;
  v3 = *(NSObject **)(a1[6] + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = a1[6];
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    if (!v2)
    {
      PKLogFacilityTypeGetObject(0x23uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (const __CFString *)a1[4];
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: Check status returned not available with error: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("No");
      if (v2)
        v9 = CFSTR("Yes");
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: finished checking status, but timed out. Available: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)onUpdateWithEvent:(int64_t)a3
{
  NSObject *replyQueue;
  _QWORD v4[6];

  replyQueue = self->_replyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PKSTSTapToProvisionReader_onUpdateWithEvent___block_invoke;
  v4[3] = &unk_1E2AC4430;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(replyQueue, v4);
}

void __47__PKSTSTapToProvisionReader_onUpdateWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "tapToProvisionReader:didUpdateWithEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (PKSTSTapToProvisionDelegate)delegate
{
  return (PKSTSTapToProvisionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
