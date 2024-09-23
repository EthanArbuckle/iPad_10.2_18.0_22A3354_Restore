@implementation PKPushTokenFetcher

- (PKPushTokenFetcher)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPushTokenFetcher;
  v2 = -[PKPushTokenFetcher init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PKPushTokenFetcher", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_alloc(MEMORY[0x1E0CFE148]);
    v6 = objc_msgSend(v5, "initWithEnvironmentName:namedDelegatePort:queue:", *MEMORY[0x1E0CFE130], *MEMORY[0x1E0CFE118], *((_QWORD *)v2 + 1));
    v7 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v6;

    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    v12 = *((_QWORD *)v2 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__PKPushTokenFetcher_init__block_invoke;
    handler[3] = &unk_1E2ABE120;
    v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));

  }
  return (PKPushTokenFetcher *)v2;
}

void __26__PKPushTokenFetcher_init__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(*(id *)(a1 + 32), "_handleTimeout");
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  APSConnection *pushConnection;
  void *v4;
  objc_super v5;

  dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
  pushConnection = self->_pushConnection;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection _setEnabledTopics:](pushConnection, "_setEnabledTopics:", v4);

  -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PKPushTokenFetcher;
  -[PKPushTokenFetcher dealloc](&v5, sel_dealloc);
}

- (void)fetchPushTokenWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKPushTokenFetcher_fetchPushTokenWithTimeout_completion___block_invoke;
  block[3] = &unk_1E2ABDBD0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __59__PKPushTokenFetcher_fetchPushTokenWithTimeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint8_t v9[16];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = _Block_copy(v2);
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "publicToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionWithPushToken:", v5);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "No push token; registering fake push topic", v9, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setEnabledTopics:", &unk_1E2C3E200);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Push token fetcher received public token %@", (uint8_t *)&v7, 0xCu);
  }

  -[PKPushTokenFetcher _invokeCompletionWithPushToken:](self, "_invokeCompletionWithPushToken:", v5);
}

- (void)_handleTimeout
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Push token fetcher timed out", v5, 2u);
  }

  -[APSConnection publicToken](self->_pushConnection, "publicToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushTokenFetcher _invokeCompletionWithPushToken:](self, "_invokeCompletionWithPushToken:", v4);

}

- (void)_invokeCompletionWithPushToken:(id)a3
{
  id v4;
  NSObject *v5;
  APSConnection *pushConnection;
  void *v7;
  NSMutableArray *completionHandlers;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Push token fetcher completed with push token %@", buf, 0xCu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", 0);
  pushConnection = self->_pushConnection;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection _setEnabledTopics:](pushConnection, "_setEnabledTopics:", v7);

  if (-[NSMutableArray count](self->_completionHandlers, "count"))
  {
    completionHandlers = self->_completionHandlers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke;
    v9[3] = &unk_1E2ACDFC8;
    v10 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](completionHandlers, "enumerateObjectsUsingBlock:", v9);
    -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");

  }
}

void __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke_2;
  v8[3] = &unk_1E2ABDA18;
  v10 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_10;
  block[3] = &unk_1E2ABD9A0;
  v12 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
