@implementation PKContinuityPaymentService

+ (id)sharedService
{
  if (qword_1ECF225D8 != -1)
    dispatch_once(&qword_1ECF225D8, &__block_literal_global_118);
  return (id)_MergedGlobals_237;
}

void __43__PKContinuityPaymentService_sharedService__block_invoke()
{
  PKContinuityPaymentService *v0;
  void *v1;

  v0 = objc_alloc_init(PKContinuityPaymentService);
  v1 = (void *)_MergedGlobals_237;
  _MergedGlobals_237 = (uint64_t)v0;

}

- (PKContinuityPaymentService)init
{
  PKContinuityPaymentService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *delegateQueue;
  PKXPCService *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKXPCService *remoteService;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKContinuityPaymentService;
  v2 = -[PKContinuityPaymentService init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passd.paymentcontinuityservice.delegate", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    v2->_remoteDeviceLock._os_unfair_lock_opaque = 0;
    v5 = [PKXPCService alloc];
    PDContinuityPaymentServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKContinuityPaymentServiceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v5, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.payment-continuity"), v6, v7, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;

  }
  return v2;
}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)updatePaymentDevices
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke;
  v2[3] = &unk_1E2AC4430;
  v2[4] = self;
  v2[5] = a2;
  _os_activity_initiate(&dword_18FC92000, "refresh remote payment devices", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD aBlock[4];
  __int128 v7;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v7 = *(_OWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_10;
  v5[3] = &unk_1E2AC0EF0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "updatePaymentDevicesWithHandler:", v5);

}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __50__PKContinuityPaymentService_updatePaymentDevices__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  if (v2)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Failed to discover remote payment devices", v4, 2u);
    }

  }
}

- (void)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ABE080;
  activity_block[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  _os_activity_initiate(&dword_18FC92000, "send remote payment request", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 56);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_12;
  v8[3] = &unk_1E2ABDD88;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v5, "sendRemotePaymentRequest:handler:", v6, v8);

}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __66__PKContinuityPaymentService_sendRemotePaymentRequest_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment request", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD activity_block[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ACA840;
  v18 = v11;
  v19 = a2;
  activity_block[4] = self;
  v16 = v9;
  v17 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  _os_activity_initiate(&dword_18FC92000, "send remote payment request update", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 64);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_13;
  v9[3] = &unk_1E2ABDD88;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "sendPaymentHostUpdate:forRemotePaymentRequest:handler:", v6, v7, v9);

}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __87__PKContinuityPaymentService_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send update payment request", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD activity_block[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ACA840;
  v18 = v11;
  v19 = a2;
  activity_block[4] = self;
  v16 = v9;
  v17 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  _os_activity_initiate(&dword_18FC92000, "send remote payment request update response", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 64);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_14;
  v9[3] = &unk_1E2ABDD88;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "sendPaymentClientUpdate:forRemotePaymentRequest:handler:", v6, v7, v9);

}

void __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __89__PKContinuityPaymentService_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD activity_block[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ACA840;
  v18 = v11;
  v19 = a2;
  activity_block[4] = self;
  v16 = v9;
  v17 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  _os_activity_initiate(&dword_18FC92000, "send remote payment", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 64);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_15;
  v9[3] = &unk_1E2ABDD88;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "sendPayment:forRemotePaymentRequest:handler:", v6, v7, v9);

}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __77__PKContinuityPaymentService_sendPayment_forRemotePaymentRequest_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD activity_block[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ACA840;
  v18 = v11;
  v19 = a2;
  activity_block[4] = self;
  v16 = v9;
  v17 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  _os_activity_initiate(&dword_18FC92000, "send payment result", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 64);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_16;
  v9[3] = &unk_1E2ABDD88;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "sendPaymentResult:forRemotePaymentRequest:handler:", v6, v7, v9);

}

void __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __83__PKContinuityPaymentService_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PKPaymentAuthorizationResult *v10;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v10, "setStatus:", a3);
  -[PKContinuityPaymentService sendPaymentResult:forRemotePaymentRequest:completion:](self, "sendPaymentResult:forRemotePaymentRequest:completion:", v10, v9, v8);

}

- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height;
  double width;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[6];

  height = a5.height;
  width = a5.width;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  aBlock[4] = self;
  aBlock[5] = a2;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKContinuityPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_18;
  v19[3] = &unk_1E2AC45E0;
  v19[4] = self;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "requestInstrumentThumbnail:forRemoteDevice:size:handler:", v15, v14, v19, width, height);

}

void __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __89__PKContinuityPaymentService_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGImageRef v6;
  CGImageRef v7;
  void *v8;
  NSData *v9;

  v9 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = PKCreateCGImage(v9);
    if (v6)
    {
      v7 = v6;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      CFRelease(v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E2ABE080;
  activity_block[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  _os_activity_initiate(&dword_18FC92000, "present remote payment interface", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 56);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_21;
  v8[3] = &unk_1E2ABDD88;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v5, "presentContinuityPaymentInterfaceWithRequestIdentifier:handler:", v6, v8);

}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __96__PKContinuityPaymentService_presentContinuityPaymentInterfaceWithRequestIdentifier_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to present interface", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke;
  activity_block[3] = &unk_1E2ABE080;
  activity_block[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  _os_activity_initiate(&dword_18FC92000, "cancel remote payment request", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 56);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_22;
  v8[3] = &unk_1E2ABDD88;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v5, "cancelRemotePaymentRequest:handler:", v6, v8);

}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __68__PKContinuityPaymentService_cancelRemotePaymentRequest_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to cancel request", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (BOOL)hasRemoteDevices
{
  PKContinuityPaymentService *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKContinuityPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PKContinuityPaymentService_hasRemoteDevices__block_invoke;
  v5[3] = &unk_1E2ACFED0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "hasRemoteDevicesWithHandler:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__PKContinuityPaymentService_hasRemoteDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to retrieve registered host device status", v7, 2u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)canMakePaymentsWithRemoteDevices
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKContinuityPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PKContinuityPaymentService_canMakePaymentsWithRemoteDevices__block_invoke;
  v5[3] = &unk_1E2ACFEF8;
  v5[4] = &v6;
  objc_msgSend(v2, "canMakePaymentsWithRemoteDevicesWithHandler:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __62__PKContinuityPaymentService_canMakePaymentsWithRemoteDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to retrieve registered host device status: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (NSArray)remoteDevices
{
  os_unfair_lock_s *p_remoteDeviceLock;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  p_remoteDeviceLock = &self->_remoteDeviceLock;
  os_unfair_lock_lock(&self->_remoteDeviceLock);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__37;
  v13 = __Block_byref_object_dispose__37;
  v14 = (id)-[NSArray copy](self->_remoteDevices, "copy");
  os_unfair_lock_unlock(p_remoteDeviceLock);
  v4 = (void *)v10[5];
  if (!v4)
  {
    -[PKContinuityPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__PKContinuityPaymentService_remoteDevices__block_invoke;
    v8[3] = &unk_1E2ACFF20;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v5, "fetchRemoteDevicesWithHandler:", v8);
    -[PKContinuityPaymentService setRemoteDevices:](self, "setRemoteDevices:", v10[5]);

    v4 = (void *)v10[5];
  }
  v6 = v4;
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __43__PKContinuityPaymentService_remoteDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to retrieve remote devices", v10, 2u);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (void)setRemoteDevices:(id)a3
{
  os_unfair_lock_s *p_remoteDeviceLock;
  id v5;
  NSArray *v6;
  NSArray *remoteDevices;

  p_remoteDeviceLock = &self->_remoteDeviceLock;
  v5 = a3;
  os_unfair_lock_lock(p_remoteDeviceLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  remoteDevices = self->_remoteDevices;
  self->_remoteDevices = v6;

  os_unfair_lock_unlock(p_remoteDeviceLock);
}

- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[6];

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  aBlock[4] = self;
  aBlock[5] = a2;
  v11 = a4;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKContinuityPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke_25;
  v16[3] = &unk_1E2ABDD88;
  v16[4] = self;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v14, "sendPaymentSetupRequest:appDisplayName:handler:", v12, v11, v16);

}

void __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __80__PKContinuityPaymentService_sendPaymentSetupRequest_appDisplayName_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send payment setup request: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD activity_block[5];
  id v14;
  id v15;
  SEL v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke;
  activity_block[3] = &unk_1E2AC4798;
  activity_block[4] = self;
  v14 = v9;
  v17 = a4;
  v15 = v10;
  v16 = a2;
  v11 = v10;
  v12 = v9;
  _os_activity_initiate(&dword_18FC92000, "prompt details for virtual card", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[6];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC4430;
  v3 = *(_QWORD *)(a1 + 56);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = v3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 64);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_26;
  v9[3] = &unk_1E2ABDD88;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "promptDetailsForVirtualCard:showNotification:handler:", v7, v6, v9);

}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKContinuityService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __86__PKContinuityPaymentService_promptDetailsForVirtualCard_showNotification_completion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to prompt details for virtual card: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)didReceiveUpdatedPaymentDevices:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKContinuityPaymentService setRemoteDevices:](self, "setRemoteDevices:");
  -[PKContinuityPaymentService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didReceiveUpdatedPaymentDevices:", v7);

  }
}

- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKContinuityPaymentService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceivePaymentHostUpdate:forRemotePaymentRequest:", v10, v6);

  }
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKContinuityPaymentService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceivePaymentClientUpdate:forRemotePaymentRequest:", v10, v6);

  }
}

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKContinuityPaymentService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceivePayment:forRemotePaymentRequest:", v10, v6);

  }
}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKContinuityPaymentService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceivePaymentResult:forRemotePaymentRequest:", v10, v6);

  }
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKContinuityPaymentService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKContinuityPaymentService delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didReceiveCancellationForRemotePaymentRequest:", v7);

  }
}

- (PKContinuityPaymentServiceDelegate)delegate
{
  return (PKContinuityPaymentServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
