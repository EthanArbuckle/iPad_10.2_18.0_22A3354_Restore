@implementation ICDelegationConsumerService

- (ICDelegationConsumerService)init
{
  ICDelegationConsumerService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDelegationConsumerService;
  v2 = -[ICDelegationConsumerService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ICDelegationConsumerService.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)performRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ICDelegationConsumerServiceSession *v9;
  uint64_t v10;
  id v11;
  ICDelegationConsumerServiceSession *v12;
  NSObject *accessQueue;
  ICDelegationConsumerServiceSession *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  ICDelegationConsumerService *v19;
  ICDelegationConsumerServiceSession *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  ICDelegationConsumerService *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v9 = [ICDelegationConsumerServiceSession alloc];
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke;
  v21[3] = &unk_1E438C4B0;
  objc_copyWeak(&v23, (id *)buf);
  v11 = v7;
  v22 = v11;
  v12 = -[ICDelegationConsumerServiceSession initWithRequest:responseHandler:](v9, "initWithRequest:responseHandler:", v6, v21);
  accessQueue = self->_accessQueue;
  v15 = v10;
  v16 = 3221225472;
  v17 = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_3;
  v18 = &unk_1E4391110;
  v19 = self;
  v14 = v12;
  v20 = v14;
  dispatch_barrier_async(accessQueue, &v15);
  -[ICDelegationConsumerServiceSession start](v14, "start", v15, v16, v17, v18, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *WeakRetained;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD *v23;
  id v24;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((_DWORD)a7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v19 = WeakRetained;
    if (WeakRetained)
    {
      v20 = WeakRetained[1];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_2;
      v22[3] = &unk_1E4391110;
      v23 = WeakRetained;
      v24 = v13;
      dispatch_barrier_async(v20, v22);

    }
  }
  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    (*(void (**)(uint64_t, id, id, id, id, uint64_t))(v21 + 16))(v21, v14, v15, v16, v17, a7);

}

uint64_t __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

  }
}

@end
