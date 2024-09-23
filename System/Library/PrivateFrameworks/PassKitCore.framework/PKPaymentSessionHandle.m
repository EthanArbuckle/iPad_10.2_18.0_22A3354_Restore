@implementation PKPaymentSessionHandle

- (PKPaymentSessionHandle)initWithInternalSessionHandle:(id)a3 targetQueue:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSessionHandle;
  v9 = -[PKPaymentSessionHandle init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.passkit.sessionHandle.internalSession", 0);
    v11 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v10;

    if (v8)
      dispatch_set_target_queue(*((dispatch_object_t *)v9 + 1), v8);
    objc_storeStrong((id *)v9 + 2, a3);
  }
  else
  {
    objc_msgSend(v7, "endSession");
  }

  return (PKPaymentSessionHandle *)v9;
}

- (BOOL)isFirstInQueue
{
  return -[PKTransactionSessionWrapper isFirstInQueue](self->_sessionHandle, "isFirstInQueue");
}

- (void)invalidateSession
{
  -[PKPaymentSessionHandle invalidateSessionWithCompletion:](self, "invalidateSessionWithCompletion:", 0);
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *internalSessionSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalSessionSerialQueue = self->_internalSessionSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalSessionSerialQueue, v7);

}

void __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating Payment Session via Handle", buf, 2u);
    }

    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_46;
    v9[3] = &unk_1E2ABDA18;
    v5 = v3;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    objc_msgSend(v4, "endSessionWithCompletion:", v9);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
  }
}

void __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_46(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2;
    block[3] = &unk_1E2ABD9A0;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong((id *)&self->_internalSessionSerialQueue, 0);
}

@end
