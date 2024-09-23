@implementation SSVPlaybackLease

- (id)_initSSVPlaybackLease
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  SSVFairPlaySubscriptionController *v8;
  void *v9;
  SSVBarrierOperationQueue *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SSVPlaybackLease;
  v2 = -[SSVPlaybackLease init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVPlaybackLease.delegate", 0);
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;

    v5 = dispatch_queue_create("com.apple.StoreServices.SSVPlaybackLease", 0);
    v6 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v5;

    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 6), v7);
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 17), v7);
    v8 = objc_alloc_init(SSVFairPlaySubscriptionController);
    v9 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v8;

    *((_QWORD *)v2 + 8) = 0;
    *((_BYTE *)v2 + 120) = 1;
    v10 = objc_alloc_init(SSVBarrierOperationQueue);
    v11 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v10;

    objc_msgSend(*((id *)v2 + 14), "setMaxConcurrentOperationCount:", 5);
    objc_msgSend(*((id *)v2 + 14), "setName:", CFSTR("com.apple.StoreServices.SSVPlaybackLease"));
    objc_initWeak(&location, v2);
    v12 = *((_QWORD *)v2 + 17);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__SSVPlaybackLease__initSSVPlaybackLease__block_invoke;
    v14[3] = &unk_1E47B9768;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.itunesstored.PlaybackLeaseDidEnd", (int *)v2 + 20, v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __41__SSVPlaybackLease__initSSVPlaybackLease__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id WeakRetained;
  SSVPlaybackLeaseRequest *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "BOOLForKey:", CFSTR("SSVPlaybackLeaseIgnorePushNotifications")))
  {

    goto LABEL_5;
  }
  v3 = MGGetBoolAnswer();

  if ((v3 & 1) == 0)
  {
LABEL_5:
    v5 = objc_alloc_init(SSVPlaybackLeaseRequest);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "refreshLeaseWithRequest:completionBlock:", v5, 0);

  }
}

- (SSVPlaybackLease)init
{
  void *v3;
  void *v4;
  SSURLBag *v5;
  SSVPlaybackLease *v6;

  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSVDefaultUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("User-Agent"));

  v5 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v3);
  v6 = -[SSVPlaybackLease initWithURLBag:](self, "initWithURLBag:", v5);

  return v6;
}

- (SSVPlaybackLease)initWithLeaseConfiguration:(id)a3
{
  id v4;
  SSVPlaybackLease *v5;
  uint64_t v6;
  SSVPlaybackLeaseConfiguration *configuration;

  v4 = a3;
  v5 = -[SSVPlaybackLease _initSSVPlaybackLease](self, "_initSSVPlaybackLease");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SSVPlaybackLeaseConfiguration *)v6;

    v5->_leaseType = -[SSVPlaybackLeaseConfiguration leaseType](v5->_configuration, "leaseType");
  }

  return v5;
}

- (SSVPlaybackLease)initWithURLBag:(id)a3
{
  return -[SSVPlaybackLease initWithURLBag:leaseType:](self, "initWithURLBag:leaseType:", a3, 0);
}

- (SSVPlaybackLease)initWithURLBag:(id)a3 leaseType:(int64_t)a4
{
  id v7;
  SSVPlaybackLease *v8;
  SSVPlaybackLease *v9;

  v7 = a3;
  v8 = -[SSVPlaybackLease _initSSVPlaybackLease](self, "_initSSVPlaybackLease");
  v9 = v8;
  if (v8)
  {
    v8->_leaseType = a4;
    objc_storeStrong((id *)&v8->_urlBag, a3);
  }

  return v9;
}

- (void)dealloc
{
  NSObject *refreshTimer;
  objc_super v4;

  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
    dispatch_source_cancel(refreshTimer);
  notify_cancel(self->_leaseDidEndNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SSVPlaybackLease;
  -[SSVPlaybackLease dealloc](&v4, sel_dealloc);
}

- (void)beginLeaseWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSVPlaybackLease *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyWithLeaseType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(v2, "_setActionType:", 0);
  objc_msgSend(v2, "setStartsLeaseSession:", 1);
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v4 = *(id **)(a1 + 40);
  objc_msgSend(v4[4], "beginLeaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_2;
  v9[3] = &unk_1E47BE380;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  v8 = (id)objc_msgSend(v4, "_addOperationWithRequest:configurationURL:completionBlock:", v2, v5, v9);

}

void __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E47B8608;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)cancelAllAssetRequests
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSVPlaybackLease_cancelAllAssetRequests__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __42__SSVPlaybackLease_cancelAllAssetRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cancel", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSData)certificateData
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSVPlaybackLease_certificateData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __35__SSVPlaybackLease_certificateData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)certificateURLBagKey
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSVPlaybackLease_certificateURLBagKey__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __40__SSVPlaybackLease_certificateURLBagKey__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (SSVPlaybackLeaseDelegate)delegate
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SSVPlaybackLease_delegate__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVPlaybackLeaseDelegate *)v3;
}

void __28__SSVPlaybackLease_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)endLease
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSVPlaybackLease_endLease__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __28__SSVPlaybackLease_endLease__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endLease");
}

- (void)getAssetWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSVPlaybackLease *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyWithLeaseType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(v2, "_setActionType:", 1);
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v4 = *(id **)(a1 + 40);
  objc_msgSend(v4[4], "getAssetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_2;
  v15 = &unk_1E47BE380;
  v17 = *(id *)(a1 + 48);
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "_addOperationWithRequest:configurationURL:completionBlock:", v2, v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v9;

    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_msgSend(v8, "addObject:", v7, v12, v13, v14, v15);

}

void __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E47B8608;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCertificateDataWithCompletionBlock:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  NSData *v6;
  SSVLeaseCertificateRequestOperation *v7;
  SSVPlaybackLeaseConfiguration *configuration;
  SSVLeaseCertificateRequestOperation *v9;
  SSVLeaseCertificateRequestOperation *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  OS_dispatch_queue *v15;
  id v16;
  _QWORD block[4];
  NSData *v18;
  SSVLeaseCertificateRequestOperation *v19;

  v4 = a3;
  v5 = self->_delegateQueue;
  v6 = self->_certificateData;
  if (!v6)
  {
    configuration = self->_configuration;
    v9 = [SSVLeaseCertificateRequestOperation alloc];
    if (configuration)
      v10 = -[SSVLeaseCertificateRequestOperation initWithConfiguration:](v9, "initWithConfiguration:", self->_configuration);
    else
      v10 = -[SSVLeaseCertificateRequestOperation initWithURLBag:](v9, "initWithURLBag:", self->_urlBag);
    v7 = v10;
    -[SSVLeaseCertificateRequestOperation setCertificateURLBagKey:](v10, "setCertificateURLBagKey:", self->_certificateURLBagKey);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_2;
    v14 = &unk_1E47BE3A8;
    v16 = v4;
    v15 = v5;
    -[SSVLeaseCertificateRequestOperation setOutputBlock:](v7, "setOutputBlock:", &v11);
    -[SSVBarrierOperationQueue addOperation:](self->_operationQueue, "addOperation:", v7, v11, v12, v13, v14);

    goto LABEL_8;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke;
    block[3] = &unk_1E47B8A98;
    v19 = (SSVLeaseCertificateRequestOperation *)v4;
    v18 = v6;
    dispatch_async((dispatch_queue_t)v5, block);

    v7 = v19;
LABEL_8:

  }
}

uint64_t __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_3;
    block[3] = &unk_1E47B8608;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)preheatLeaseRequestsWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SSVPlaybackLease_preheatLeaseRequestsWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BE3D0;
  v7 = v4;
  v5 = v4;
  -[SSVPlaybackLease getCertificateDataWithCompletionBlock:](self, "getCertificateDataWithCompletionBlock:", v6);

}

uint64_t __60__SSVPlaybackLease_preheatLeaseRequestsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

- (BOOL)refreshesAutomatically
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSVPlaybackLease_refreshesAutomatically__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSVPlaybackLease_refreshesAutomatically__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (void)refreshLeaseWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSVPlaybackLease *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyWithLeaseType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(v2, "_setActionType:", 2);
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v4 = *(id **)(a1 + 40);
  objc_msgSend(v4[4], "refreshLeaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_2;
  v9[3] = &unk_1E47BE380;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  v8 = (id)objc_msgSend(v4, "_addOperationWithRequest:configurationURL:completionBlock:", v2, v5, v9);

}

void __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E47B8608;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setCertificateData:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SSVPlaybackLease_setCertificateData___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __39__SSVPlaybackLease_setCertificateData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
}

- (void)setCertificateURLBagKey:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SSVPlaybackLease_setCertificateURLBagKey___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __44__SSVPlaybackLease_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__SSVPlaybackLease_setDelegate___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

id __32__SSVPlaybackLease_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)setRefreshesAutomatically:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSVPlaybackLease_setRefreshesAutomatically___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __46__SSVPlaybackLease_setRefreshesAutomatically___block_invoke(uint64_t a1)
{
  _BYTE *v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = *(_BYTE *)(a1 + 40);
  v1 = *(_BYTE **)(a1 + 32);
  if (v1[120])
    return objc_msgSend(v1, "_startRefreshTimerIfNecessary");
  else
    return objc_msgSend(v1, "_cancelRefreshTimer");
}

- (void)updateWithExternalLeaseResponseError:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSVPlaybackLease_updateWithExternalLeaseResponseError___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

uint64_t __57__SSVPlaybackLease_updateWithExternalLeaseResponseError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithLeaseResponseError:", *(_QWORD *)(a1 + 40));
}

- (id)_addOperationWithRequest:(id)a3 configurationURL:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  int64_t leaseType;
  SSVLeaseRequestOperation *v13;
  SSVLeaseRequestOperation *v14;
  SSVLeaseRequestOperation *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *v17;
  id v18;
  _QWORD v20[4];
  OS_dispatch_queue *v21;
  SSVPlaybackLease *v22;
  id v23;
  id v24;
  id v25;
  id from;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  leaseType = self->_leaseType;
  objc_msgSend(v9, "_setCertificateData:", self->_certificateData);
  objc_msgSend(v9, "_setKDMovieIdentifier:", self->_kdMovieIdentifier);
  objc_msgSend(v9, "_setURL:", v10);
  v13 = [SSVLeaseRequestOperation alloc];
  if (v10)
    v14 = -[SSVLeaseRequestOperation initWithLeaseRequest:configuration:](v13, "initWithLeaseRequest:configuration:", v9, self->_configuration);
  else
    v14 = -[SSVLeaseRequestOperation initWithLeaseRequest:URLBag:](v13, "initWithLeaseRequest:URLBag:", v9, self->_urlBag);
  v15 = v14;
  -[SSVLeaseRequestOperation setCertificateURLBagKey:](v14, "setCertificateURLBagKey:", self->_certificateURLBagKey);
  if (leaseType == 1)
    objc_storeStrong((id *)&self->_lastKDLeaseRequest, a3);
  v16 = self->_serialQueue;
  objc_initWeak(&location, v15);
  objc_initWeak(&from, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke;
  v20[3] = &unk_1E47BE420;
  v17 = v16;
  v21 = v17;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  v22 = self;
  v18 = v11;
  v23 = v18;
  -[SSVLeaseRequestOperation setOutputBlock:](v15, "setOutputBlock:", v20);
  -[SSVBarrierOperationQueue addBarrierOperation:](self->_operationQueue, "addBarrierOperation:", v15);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v15;
}

void __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke_2;
  v11[3] = &unk_1E47BE3F8;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v8 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 72));
    if (v2)
      objc_msgSend(WeakRetained[1], "removeObjectIdenticalTo:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_updateForLeaseResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v2);
LABEL_8:

  }
}

- (void)_cancelRefreshTimer
{
  NSObject *refreshTimer;
  OS_dispatch_source *v4;

  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
  {
    dispatch_source_cancel(refreshTimer);
    v4 = self->_refreshTimer;
    self->_refreshTimer = 0;

  }
}

- (void)_endLease
{
  NSMutableArray *assetOperations;
  NSDate *leaseExpirationDate;

  -[SSVPlaybackLease _cancelRefreshTimer](self, "_cancelRefreshTimer");
  assetOperations = self->_assetOperations;
  self->_assetOperations = 0;

  self->_kdMovieIdentifier = 0;
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = 0;

  -[SSVFairPlaySubscriptionController stopSubscriptionLease:](self->_fairPlaySubscriptionController, "stopSubscriptionLease:", 0);
  -[SSVBarrierOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

- (void)_fireRefreshTimer
{
  NSDate *leaseExpirationDate;
  SSVPlaybackLeaseRequest *lastKDLeaseRequest;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[SSVPlaybackLease _cancelRefreshTimer](self, "_cancelRefreshTimer");
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = 0;

  objc_initWeak(&location, self);
  lastKDLeaseRequest = self->_lastKDLeaseRequest;
  if (lastKDLeaseRequest)
  {
    v5 = -[SSVPlaybackLeaseRequest _copyWithLeaseType:](lastKDLeaseRequest, "_copyWithLeaseType:", self->_leaseType);
  }
  else
  {
    +[SSVPlaybackLeaseRequest _requestWithType:](SSVPlaybackLeaseRequest, "_requestWithType:", self->_leaseType);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "_setActionType:", 2);
  -[SSVPlaybackLeaseConfiguration refreshLeaseURL](self->_configuration, "refreshLeaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke;
  v9[3] = &unk_1E47BE470;
  objc_copyWeak(&v10, &location);
  v8 = -[SSVPlaybackLease _addOperationWithRequest:configurationURL:completionBlock:](self, "_addOperationWithRequest:configurationURL:completionBlock:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__SSVPlaybackLease__fireRefreshTimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD *v8;
  id v9;
  NSObject *v10;
  id *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD block[4];
  id v24;
  _QWORD *v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)WeakRetained + 5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = v8[6];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_2;
      block[3] = &unk_1E47BE448;
      v11 = &v24;
      v24 = v9;
      v12 = (id *)&v25;
      v25 = v8;
      v26 = v5;
      v27 = v6;
      dispatch_async(v10, block);

      v13 = v26;
    }
    else
    {
      if (v5)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_9:

          goto LABEL_10;
        }
        v14 = v8[6];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_3;
        v20[3] = &unk_1E47B8768;
        v11 = &v21;
        v21 = v9;
        v12 = (id *)&v22;
        v22 = v8;
        dispatch_async(v14, v20);
LABEL_8:

        goto LABEL_9;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_9;
      v15 = v8[6];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_4;
      v16[3] = &unk_1E47B87B8;
      v11 = &v17;
      v17 = v9;
      v12 = (id *)&v18;
      v18 = v8;
      v19 = v6;
      dispatch_async(v15, v16);
      v13 = v19;
    }

    goto LABEL_8;
  }
LABEL_10:

}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playbackLease:automaticRefreshDidFinishWithResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playbackLeaseAutomaticRefreshDidFinish:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playbackLease:automaticRefreshDidFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendLeaseDidEndWithEndReasonType:(unint64_t)a3
{
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  id *v7;
  _QWORD *v8;
  NSObject *v9;
  OS_dispatch_queue *v10;
  _QWORD block[4];
  _QWORD v12[3];
  _QWORD v13[4];
  _QWORD v14[2];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke;
    v13[3] = &unk_1E47B8768;
    v7 = (id *)v14;
    v14[0] = WeakRetained;
    v14[1] = self;
    v8 = v13;
    v9 = delegateQueue;
LABEL_5:
    dispatch_async(v9, v8);

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke_2;
    block[3] = &unk_1E47B9F28;
    v7 = (id *)v12;
    v12[0] = WeakRetained;
    v12[1] = self;
    v12[2] = a3;
    v8 = block;
    v9 = v10;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playbackLeaseDidEnd:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playbackLease:didEndWithReasonType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)_shouldEndLeaseForError:(id)a3 returningEndReasonType:(unint64_t *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SSServerErrorDomain"))
    && (objc_msgSend(v5, "code") == 3059 || objc_msgSend(v5, "code") == 3060))
  {
    v7 = 1;
    v8 = 2;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SSVFairPlayErrorDomain")))
    v7 = (unint64_t)(objc_msgSend(v5, "code") + 42589) < 2;
  else
    v7 = 0;
  v8 = 1;
  if (a4)
LABEL_10:
    *a4 = v8;
LABEL_11:

  return v7;
}

- (void)_startRefreshTimerIfNecessary
{
  OS_dispatch_source *v3;
  OS_dispatch_source *refreshTimer;
  NSObject *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t handler;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;
  int v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_refreshTimer && self->_leaseExpirationDate && self->_refreshesAutomatically)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_serialQueue);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    v5 = self->_refreshTimer;
    -[NSDate timeIntervalSinceNow](self->_leaseExpirationDate, "timeIntervalSinceNow");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v5, v7, 0, 0);
    objc_initWeak(&location, self);
    v8 = self->_refreshTimer;
    handler = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __49__SSVPlaybackLease__startRefreshTimerIfNecessary__block_invoke;
    v27 = &unk_1E47BA068;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v8, &handler);
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    v11 = objc_msgSend(v9, "shouldLogToDisk");
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v10 |= 2u;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v10 &= 2u;
    if (v10)
    {
      v14 = (id)objc_opt_class();
      -[NSDate timeIntervalSinceNow](self->_leaseExpirationDate, "timeIntervalSinceNow");
      v30 = 138412546;
      v31 = v14;
      v32 = 2048;
      v33 = v15;
      LODWORD(v23) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        dispatch_resume((dispatch_object_t)self->_refreshTimer);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v30, v23, handler, v25, v26, v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v9, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_15;
  }
}

void __49__SSVPlaybackLease__startRefreshTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fireRefreshTimer");

}

- (void)_updateForLeaseResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSData *v8;
  NSData *certificateData;
  double v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *leaseExpirationDate;
  SSVRefreshSubscriptionRequest *v14;
  SSVRefreshSubscriptionRequest *offlineSlotRequest;
  SSVRefreshSubscriptionRequest *v16;
  _QWORD v17[5];
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[SSVPlaybackLease _cancelRefreshTimer](self, "_cancelRefreshTimer");
  if (!self->_certificateData)
  {
    objc_msgSend(v6, "certificateData");
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    certificateData = self->_certificateData;
    self->_certificateData = v8;

  }
  self->_kdMovieIdentifier = objc_msgSend(v6, "KDMovieIdentifier");
  if (v7)
  {
    -[SSVPlaybackLease _updateWithLeaseResponseError:](self, "_updateWithLeaseResponseError:", v7);
  }
  else
  {
    objc_msgSend(v6, "leaseDuration");
    if (v10 >= 2.22044605e-16)
    {
      if (v10 <= 90.0)
      {
        -[SSVPlaybackLease _fireRefreshTimer](self, "_fireRefreshTimer");
      }
      else
      {
        v12 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v10 + -90.0);
        leaseExpirationDate = self->_leaseExpirationDate;
        self->_leaseExpirationDate = v12;

        -[SSVPlaybackLease _startRefreshTimerIfNecessary](self, "_startRefreshTimerIfNecessary");
      }
    }
    else
    {
      v11 = self->_leaseExpirationDate;
      self->_leaseExpirationDate = 0;

    }
    if (objc_msgSend(v6, "isOfflineSlotAvailable") && !self->_offlineSlotRequest && !self->_leaseType)
    {
      v14 = objc_alloc_init(SSVRefreshSubscriptionRequest);
      offlineSlotRequest = self->_offlineSlotRequest;
      self->_offlineSlotRequest = v14;

      -[SSVRefreshSubscriptionRequest setRequestingOfflineSlot:](self->_offlineSlotRequest, "setRequestingOfflineSlot:", 1);
      objc_initWeak(&location, self);
      v16 = self->_offlineSlotRequest;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke;
      v17[3] = &unk_1E47BE498;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      -[SSVRefreshSubscriptionRequest startWithResponseBlock:](v16, "startWithResponseBlock:", v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }

}

void __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[17];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke_2;
    block[3] = &unk_1E47B8790;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v4, block);
  }

}

void __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 104);
  *(_QWORD *)(v1 + 104) = 0;

}

- (void)_updateWithLeaseResponseError:(id)a3
{
  double v4;
  NSDate *v5;
  NSDate *leaseExpirationDate;
  uint64_t v7;

  v7 = 1;
  if (-[SSVPlaybackLease _shouldEndLeaseForError:returningEndReasonType:](self, "_shouldEndLeaseForError:returningEndReasonType:", a3, &v7))
  {
    -[SSVPlaybackLease _endLease](self, "_endLease");
    -[SSVPlaybackLease _sendLeaseDidEndWithEndReasonType:](self, "_sendLeaseDidEndWithEndReasonType:", v7);
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->_leaseExpirationDate, "timeIntervalSinceNow");
    if (v4 < 2.22044605e-16)
    {
      v5 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 90.0);
      leaseExpirationDate = self->_leaseExpirationDate;
      self->_leaseExpirationDate = v5;

    }
    -[SSVPlaybackLease _startRefreshTimerIfNecessary](self, "_startRefreshTimerIfNecessary");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_offlineSlotRequest, 0);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_lastKDLeaseRequest, 0);
  objc_storeStrong((id *)&self->_fairPlaySubscriptionController, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_assetOperations, 0);
}

@end
