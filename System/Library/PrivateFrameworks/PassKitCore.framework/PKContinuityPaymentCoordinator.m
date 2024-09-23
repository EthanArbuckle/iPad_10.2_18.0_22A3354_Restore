@implementation PKContinuityPaymentCoordinator

- (PKContinuityPaymentCoordinator)initWithContinuityPaymentService:(id)a3
{
  id v5;
  PKContinuityPaymentCoordinator *v6;
  PKContinuityPaymentCoordinator *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *callbackQueue;
  const dispatch_source_type_s *v12;
  dispatch_source_t v13;
  OS_dispatch_source *deviceUpdateTimeoutTimer;
  dispatch_source_t v15;
  OS_dispatch_source *deviceTotalUpdateTimeoutTimer;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD handler[4];
  id v24;
  id location;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKContinuityPaymentCoordinator;
  v6 = -[PKContinuityPaymentCoordinator init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_continuityPaymentService, a3);
    -[PKContinuityPaymentService setDelegate:](v7->_continuityPaymentService, "setDelegate:", v7);
    v8 = dispatch_queue_create("com.apple.PassKit.PKContinuityPaymentCoordinator.internal", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.PassKit.PKContinuityPaymentCoordinator.callback", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v10;

    v12 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DD0];
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v7->_internalQueue);
    deviceUpdateTimeoutTimer = v7->_deviceUpdateTimeoutTimer;
    v7->_deviceUpdateTimeoutTimer = (OS_dispatch_source *)v13;

    v15 = dispatch_source_create(v12, 0, 0, (dispatch_queue_t)v7->_internalQueue);
    deviceTotalUpdateTimeoutTimer = v7->_deviceTotalUpdateTimeoutTimer;
    v7->_deviceTotalUpdateTimeoutTimer = (OS_dispatch_source *)v15;

    v7->_updatePaymentDeviceTimeout = 10.0;
    objc_initWeak(&location, v7);
    v17 = v7->_deviceUpdateTimeoutTimer;
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke;
    handler[3] = &unk_1E2AC3648;
    objc_copyWeak(&v24, &location);
    dispatch_source_set_event_handler(v17, handler);
    v19 = v7->_deviceTotalUpdateTimeoutTimer;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke_2;
    v21[3] = &unk_1E2AC3648;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v19, v21);
    dispatch_resume((dispatch_object_t)v7->_deviceUpdateTimeoutTimer);
    dispatch_resume((dispatch_object_t)v7->_deviceTotalUpdateTimeoutTimer);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x19400CFE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceUpdateTimerDidTimeout");

  objc_autoreleasePoolPop(v2);
}

void __67__PKContinuityPaymentCoordinator_initWithContinuityPaymentService___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x19400CFE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceUpdateTotalTimerDidTimeout");

  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_deviceUpdateTimeoutTimer);
  dispatch_source_cancel((dispatch_source_t)self->_deviceTotalUpdateTimeoutTimer);
  -[PKContinuityPaymentService setDelegate:](self->_continuityPaymentService, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentCoordinator;
  -[PKContinuityPaymentCoordinator dealloc](&v3, sel_dealloc);
}

- (PKContinuityPaymentCoordinatorDelegate)delegate
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PKContinuityPaymentCoordinator_delegate__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKContinuityPaymentCoordinatorDelegate *)v3;
}

void __42__PKContinuityPaymentCoordinator_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKContinuityPaymentCoordinator_setDelegate___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

id __46__PKContinuityPaymentCoordinator_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (double)updatePaymentDeviceTimeout
{
  NSObject *internalQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PKContinuityPaymentCoordinator_updatePaymentDeviceTimeout__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __60__PKContinuityPaymentCoordinator_updatePaymentDeviceTimeout__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 88);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setUpdatePaymentDeviceTimeout:(double)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PKContinuityPaymentCoordinator_setUpdatePaymentDeviceTimeout___block_invoke;
  v4[3] = &unk_1E2AC4430;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

double __64__PKContinuityPaymentCoordinator_setUpdatePaymentDeviceTimeout___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 88) = result;
  return result;
}

- (PKRemotePaymentRequest)currentRemotePaymentRequest
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKContinuityPaymentCoordinator_currentRemotePaymentRequest__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKRemotePaymentRequest *)v3;
}

void __61__PKContinuityPaymentCoordinator_currentRemotePaymentRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (BOOL)isAwaitingReply
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKContinuityPaymentCoordinator_isAwaitingReply__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__PKContinuityPaymentCoordinator_isAwaitingReply__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64) != *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)updatePaymentDevices
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKContinuityPaymentCoordinator_updatePaymentDevices__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __54__PKContinuityPaymentCoordinator_updatePaymentDevices__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = result;
    *(_BYTE *)(v1 + 48) = 1;
    v3 = *(double *)(*(_QWORD *)(result + 32) + 88);
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Updating remote payment devices with timeout: %g", (uint8_t *)&v9, 0xCu);
    }

    v5 = *(NSObject **)(*(_QWORD *)(v2 + 32) + 32);
    v6 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v7 = *(NSObject **)(*(_QWORD *)(v2 + 32) + 40);
    v8 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 8), "updatePaymentDevices");
  }
  return result;
}

- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *internalQueue;
  id v11;
  NSObject *v12;
  NSObject *callbackQueue;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD block[5];
  id v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];
  char v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__76;
  v23[4] = __Block_byref_object_dispose__76;
  v24 = 0;
  v8 = dispatch_group_create();
  v9 = MEMORY[0x1E0C809B0];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2ADA390;
  block[4] = self;
  v11 = v6;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v21 = v23;
  v22 = v25;
  dispatch_sync(internalQueue, block);
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_16;
    v14[3] = &unk_1E2AC5748;
    v15 = v7;
    v16 = v25;
    v17 = v23;
    dispatch_group_notify(v12, callbackQueue, v14);

  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Request already sent"));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v4;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Sending remote payment request to '%@' with identifier: %@", buf, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_14;
  v15[3] = &unk_1E2ADA368;
  v15[4] = v7;
  v16 = v2;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 64);
  v17 = v10;
  v19 = v11;
  v14 = *(_OWORD *)(a1 + 48);
  v12 = (id)v14;
  v18 = v14;
  v13 = v2;
  objc_msgSend(v9, "sendRemotePaymentRequest:completion:", v10, v15);

}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v14;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_2;
  block[3] = &unk_1E2ADA340;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = *(_OWORD *)(a1 + 64);
  v8 = v3;
  dispatch_sync(v5, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendRemotePaymentRequest identifier %@ completion with error: %@", (uint8_t *)&v11, 0x16u);

    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "_resetRequest");
    }
    else
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;

      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendRemotePaymentRequest completion, discarding", (uint8_t *)&v11, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
}

uint64_t __70__PKContinuityPaymentCoordinator_sendRemotePaymentRequest_completion___block_invoke_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)sendPaymentClientUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *internalQueue;
  NSObject *v11;
  id v12;
  NSObject *callbackQueue;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD block[5];
  NSObject *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];
  char v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__76;
  v23[4] = __Block_byref_object_dispose__76;
  v24 = 0;
  v8 = dispatch_group_create();
  v9 = MEMORY[0x1E0C809B0];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke;
  block[3] = &unk_1E2ADA390;
  block[4] = self;
  v11 = v8;
  v19 = v11;
  v12 = v6;
  v20 = v12;
  v21 = v23;
  v22 = v25;
  dispatch_sync(internalQueue, block);
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_18;
    v14[3] = &unk_1E2AC5748;
    v15 = v7;
    v16 = v25;
    v17 = v23;
    dispatch_group_notify(v11, callbackQueue, v14);

  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(8uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v3;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Sending payment client update to '%@' with identifier: %@", buf, 0x16u);

  }
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 8);
  v10 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_17;
  v13[3] = &unk_1E2ADA3B8;
  v11 = *(_QWORD *)(v7 + 56);
  v13[1] = 3221225472;
  v13[4] = v7;
  v14 = v6;
  v16 = *(_OWORD *)(a1 + 56);
  v15 = v8;
  v12 = v6;
  objc_msgSend(v9, "sendPaymentClientUpdate:forRemotePaymentRequest:completion:", v10, v11, v13);

}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_2;
  block[3] = &unk_1E2ADA390;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v13 = *(_OWORD *)(a1 + 56);
  v8 = v3;
  dispatch_sync(v5, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentClientUpdate complete with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentClientUpdate completion, discarding", (uint8_t *)&v8, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __69__PKContinuityPaymentCoordinator_sendPaymentClientUpdate_completion___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)sendPaymentResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKContinuityPaymentCoordinator_sendPaymentResult_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, block);

}

uint64_t __63__PKContinuityPaymentCoordinator_sendPaymentResult_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendPaymentResult:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)cancelRemotePaymentRequestWithCompletion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke;
  block[3] = &unk_1E2ABE058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel remote payment request to '%@' with identifier: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_resetRequest");
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_19;
    v9[3] = &unk_1E2AD9270;
    v10 = v2;
    v8 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    objc_msgSend(v7, "cancelRemotePaymentRequest:completion:", v10, v9);

  }
}

void __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(8uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Canceled remote payment request with identifier: %@; error: %@",
      buf,
      0x16u);

  }
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_20;
    v8[3] = &unk_1E2ABDA18;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __75__PKContinuityPaymentCoordinator_cancelRemotePaymentRequestWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)didReceiveUpdatedPaymentDevices:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKContinuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __66__PKContinuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Received device update with %tu payment devices: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_send_didReceiveUpdatedPaymentDevice:", *(_QWORD *)(a1 + 40));
}

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKContinuityPaymentCoordinator_didReceivePayment_forRemotePaymentRequest___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(internalQueue, block);

}

void __76__PKContinuityPaymentCoordinator_didReceivePayment_forRemotePaymentRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  PKPaymentAuthorizationResult *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (!v4)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v11 = (PKPaymentAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_18FC92000, &v11->super, OS_LOG_TYPE_DEFAULT, "Received payment for unknown payment request with identifier: %@, discarding", (uint8_t *)&v14, 0xCu);

    }
    goto LABEL_11;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_QWORD *)(v5 + 72);
  PKLogFacilityTypeGetObject(8uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 != v7)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Received unexpected payment for request with identifier: %@, try again", (uint8_t *)&v14, 0xCu);

    }
    v11 = objc_alloc_init(PKPaymentAuthorizationResult);
    -[PKPaymentAuthorizationResult setStatus:](v11, "setStatus:", 1000);
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendPaymentResult:completion:", v11, 0);
LABEL_11:

    return;
  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Received payment for request with identifier: %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_send_didReceivePayment:", *(_QWORD *)(a1 + 48));
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKContinuityPaymentCoordinator_didReceiveCancellationForRemotePaymentRequest___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __80__PKContinuityPaymentCoordinator_didReceiveCancellationForRemotePaymentRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134349056;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentCoordinator (%{public}p): Received cancel for current payment request; will cancel",
        (uint8_t *)&v8,
        0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_send_didReceiveCancellation");
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received cancellation for unknown payment request, discarding", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)_queue_sendPaymentResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  PKRemotePaymentRequest *currentRemotePaymentRequest;
  void *v15;
  PKContinuityPaymentService *continuityPaymentService;
  uint64_t v17;
  PKRemotePaymentRequest *v18;
  id v19;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[3];
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__76;
  v29[4] = __Block_byref_object_dispose__76;
  v30 = 0;
  v8 = dispatch_group_create();
  PKLogFacilityTypeGetObject(8uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "status");
    -[PKRemotePaymentRequest device](self->_currentRemotePaymentRequest, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceName");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PKRemotePaymentRequest identifier](self->_currentRemotePaymentRequest, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v34 = v10;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Sending payment status %ld to '%@' for request with identifier: %@", buf, 0x20u);

  }
  currentRemotePaymentRequest = self->_currentRemotePaymentRequest;
  ++self->_messageSendCount;
  -[PKRemotePaymentRequest identifier](currentRemotePaymentRequest, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  continuityPaymentService = self->_continuityPaymentService;
  v17 = MEMORY[0x1E0C809B0];
  v18 = self->_currentRemotePaymentRequest;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke;
  v25[3] = &unk_1E2ADA3E0;
  v25[4] = self;
  v19 = v15;
  v26 = v19;
  v27 = v29;
  v28 = v31;
  -[PKContinuityPaymentService sendPaymentResult:forRemotePaymentRequest:completion:](continuityPaymentService, "sendPaymentResult:forRemotePaymentRequest:completion:", v6, v18, v25);
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_22;
    block[3] = &unk_1E2AC5748;
    v22 = v7;
    v23 = v31;
    v24 = v29;
    dispatch_group_notify(v8, callbackQueue, block);

  }
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

void __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_2;
  block[3] = &unk_1E2ADA390;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v13 = *(_OWORD *)(a1 + 48);
  v8 = v3;
  dispatch_sync(v5, block);

}

void __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentStatus complete with error: %@", (uint8_t *)&v8, 0xCu);
    }

    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received sendPaymentStatus completion, discarding", (uint8_t *)&v8, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __70__PKContinuityPaymentCoordinator__queue_sendPaymentResult_completion___block_invoke_22(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_resetRequest
{
  PKRemotePaymentRequest *currentRemotePaymentRequest;

  currentRemotePaymentRequest = self->_currentRemotePaymentRequest;
  self->_currentRemotePaymentRequest = 0;

  self->_messageSendCount = 0;
  self->_messageSendCompleteCount = 0;
}

- (void)_deviceUpdateTimerDidTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Continuity payment service timed out", v4, 2u);
  }

  -[PKContinuityPaymentCoordinator _send_didTimeoutUpdatePaymentDevices](self, "_send_didTimeoutUpdatePaymentDevices");
}

- (void)_deviceUpdateTotalTimerDidTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Continuity payment service timed out - total", v4, 2u);
  }

  -[PKContinuityPaymentCoordinator _send_didTimeoutTotalUpdatePaymentDevices](self, "_send_didTimeoutTotalUpdatePaymentDevices");
}

- (void)_send_didTimeoutUpdatePaymentDevices
{
  id WeakRetained;
  NSObject *callbackQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  PKContinuityPaymentCoordinator *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PKContinuityPaymentCoordinator__send_didTimeoutUpdatePaymentDevices__block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = WeakRetained;
  v8 = self;
  v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);

}

uint64_t __70__PKContinuityPaymentCoordinator__send_didTimeoutUpdatePaymentDevices__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices:", *(_QWORD *)(a1 + 40));
}

- (void)_send_didTimeoutTotalUpdatePaymentDevices
{
  id WeakRetained;
  NSObject *callbackQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  PKContinuityPaymentCoordinator *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PKContinuityPaymentCoordinator__send_didTimeoutTotalUpdatePaymentDevices__block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = WeakRetained;
  v8 = self;
  v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);

}

void __75__PKContinuityPaymentCoordinator__send_didTimeoutTotalUpdatePaymentDevices__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(v2 + 8), "remoteDevices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "continuityPaymentCoordinator:didTimeoutTotalWithPaymentDevices:", v2, v3);

}

- (void)_send_didReceiveUpdatedPaymentDevice:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *callbackQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  PKContinuityPaymentCoordinator *v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKContinuityPaymentCoordinator__send_didReceiveUpdatedPaymentDevice___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v10 = WeakRetained;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = WeakRetained;
  dispatch_async(callbackQueue, block);

}

uint64_t __71__PKContinuityPaymentCoordinator__send_didReceiveUpdatedPaymentDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continuityPaymentCoordinator:didReceiveUpdatedPaymentDevices:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_send_didReceivePayment:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *callbackQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  PKContinuityPaymentCoordinator *v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKContinuityPaymentCoordinator__send_didReceivePayment___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v10 = WeakRetained;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = WeakRetained;
  dispatch_async(callbackQueue, block);

}

uint64_t __58__PKContinuityPaymentCoordinator__send_didReceivePayment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continuityPaymentCoordinator:didReceivePayment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_send_didReceiveCancellation
{
  id WeakRetained;
  NSObject *callbackQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  PKContinuityPaymentCoordinator *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PKContinuityPaymentCoordinator__send_didReceiveCancellation__block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = WeakRetained;
  v8 = self;
  v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);

}

uint64_t __62__PKContinuityPaymentCoordinator__send_didReceiveCancellation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continuityPaymentCoordinatorDidReceiveCancellation:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentRemotePaymentRequest, 0);
  objc_storeStrong((id *)&self->_deviceTotalUpdateTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_deviceUpdateTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_continuityPaymentService, 0);
}

@end
