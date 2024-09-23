@implementation PKSecureElementConsistencyChecker

+ (BOOL)isCheckingConsistencyForSecureElementID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_274);
    objc_msgSend((id)qword_1ECF22AE8, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_274);
    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  id v9;
  PKSecureElementConsistencyCheckerDelegate *v10;
  id v11;
  PKSecureElementConsistencyChecker *v12;
  PKSecureElementConsistencyChecker *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *processingQueue;
  objc_super v17;

  v9 = a3;
  v10 = (PKSecureElementConsistencyCheckerDelegate *)a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKSecureElementConsistencyChecker;
  v12 = -[PKSecureElementConsistencyChecker init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentWebService, a3);
    v13->_delegate = v10;
    objc_storeStrong((id *)&v13->_cloudStoreCoordinatorDelegate, a5);
    v14 = dispatch_queue_create("consistency checker", 0);
    processingQueue = v13->_processingQueue;
    v13->_processingQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: invalidating", v4, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
}

- (void)startWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *processingQueue;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;

  v4 = a3;
  v5 = v4;
  v6 = atomic_load((unsigned __int8 *)&self->_didStart);
  if ((v6 & 1) != 0)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_didStart);
    -[PKPaymentWebService context](self->_paymentWebService, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureElementID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_274);
      v10 = (void *)qword_1ECF22AE8;
      if (!qword_1ECF22AE8)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        v12 = (void *)qword_1ECF22AE8;
        qword_1ECF22AE8 = v11;

        v10 = (void *)qword_1ECF22AE8;
      }
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1ECF22AE8, "setObject:forKeyedSubscript:", v15, v9);

      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Beginning consistency check...", buf, 2u);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_274);
    }
    v17 = MEMORY[0x1E0C809B0];
    processingQueue = self->_processingQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke;
    v21[3] = &unk_1E2AC4930;
    v21[4] = self;
    v22 = v8;
    v23 = v5;
    v19 = v21;
    *(_QWORD *)buf = v17;
    v25 = 3221225472;
    v26 = __dispatch_async_ar_block_invoke_18;
    v27 = &unk_1E2ABD9A0;
    v28 = v19;
    v20 = v8;
    dispatch_async(processingQueue, buf);

  }
}

void __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if ((PKStoreDemoModeEnabled() & 1) != 0 || PKUIOnlyDemoModeEnabled())
  {
    v2 = 0;
  }
  else
  {
    v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
    v2 = (v3 & 1) == 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!v2)
      goto LABEL_8;
LABEL_12:
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke_2;
    v6[3] = &unk_1E2ABDA18;
    v8 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "queue_startWithCompletion:", v6);

    return;
  }
  if (v2 && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "shouldStartConsistencyCheck") & 1) != 0)
    goto LABEL_12;
LABEL_8:
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  EndTrackingConsistencyCheck(*(void **)(a1 + 40));
}

void __57__PKSecureElementConsistencyChecker_startWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  EndTrackingConsistencyCheck(*(void **)(a1 + 32));
}

- (void)queue_startWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PKSecureElementConsistencyCheckerDelegate *delegate;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Getting device state for consistency check...", buf, 2u);
  }

  -[PKPaymentWebService context](self->_paymentWebService, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  delegate = self->_delegate;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke;
  v12[3] = &unk_1E2AD8990;
  v12[4] = self;
  v10 = v4;
  v14 = v10;
  v11 = v8;
  v13 = v11;
  -[PKSecureElementConsistencyCheckerDelegate deviceStateWithCompletion:](delegate, "deviceStateWithCompletion:", v12);
  if (-[PKPaymentWebService needsConfiguration](self->_paymentWebService, "needsConfiguration"))
  {
    -[PKPaymentWebService configurePaymentServiceWithCompletion:](self->_paymentWebService, "configurePaymentServiceWithCompletion:", &__block_literal_global_189);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: web service configuration does not need updating", buf, 2u);
    }

  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2;
  v7[3] = &unk_1E2AD8968;
  v7[4] = v4;
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2(id *a1)
{
  unsigned __int8 v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  PKAsyncUnaryOperationComposer *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  uint8_t buf[8];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)a1[4] + 25);
  if ((v2 & 1) != 0)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v3 = a1[5];
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Got device state, beginning consistency check.", buf, 2u);
      }

      CheckConsistencyWithDeviceState(a1[5], a1[6]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "cleanupActions");
      objc_msgSend(v6, "requestedActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("success");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      if (v7)
      {
        v11 = objc_msgSend(v6, "cleanupActions");
        v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        v13 = objc_msgSend(v8, "count");
        v14 = MEMORY[0x1E0C809B0];
        if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v22[0] = v14;
          v22[1] = 3221225472;
          v22[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_115;
          v22[3] = &unk_1E2AD8918;
          v22[4] = a1[4];
          v23 = v8;
          -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v22);

        }
        if ((v11 & 1) != 0)
        {
          v21[0] = v14;
          v21[1] = 3221225472;
          v21[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3;
          v21[3] = &unk_1E2AD8940;
          v21[4] = a1[4];
          -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v21);
        }
        if ((v11 & 2) != 0)
        {
          v20[0] = v14;
          v20[1] = 3221225472;
          v20[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_5;
          v20[3] = &unk_1E2AD8940;
          v20[4] = a1[4];
          -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v20);
        }
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_120;
        v19[3] = &unk_1E2AD8940;
        v19[4] = a1[4];
        -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v19);
        v16[0] = v14;
        v16[1] = 3221225472;
        v16[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_122;
        v16[3] = &unk_1E2AD89B8;
        v16[4] = a1[4];
        v18 = a1[7];
        v17 = a1[6];
        v15 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v12, "evaluateWithInput:completion:", MEMORY[0x1E0C9AAB0], v16);

      }
      else
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Passbook and SE are consistent!", buf, 2u);
        }

        objc_msgSend(a1[4], "_rescheduleCheckInTimeInterval:backoffLevel:", 0, 86400.0);
        (*((void (**)(void))a1[7] + 2))();
      }

    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: failed to get device state. Aborting.", buf, 2u);
      }

      objc_msgSend(a1[4], "_rescheduleWithBackoff");
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = v5;
  v7 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
  if ((v7 & 1) != 0)
  {
    (*((void (**)(id, _QWORD, uint64_t))v5 + 2))(v5, MEMORY[0x1E0C9AAA0], 1);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v8 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_116;
    v11[3] = &unk_1E2ABE518;
    v12 = v5;
    objc_msgSend(v10, "handleRequestedActions:completion:", v9, v11);

  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_116(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
  if ((v9 & 1) != 0)
  {
    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, MEMORY[0x1E0C9AAA0], 1);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_4;
    v11[3] = &unk_1E2ABDDB0;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "_syncWithTSMCompletion:", v11);

  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") & a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
  if ((v11 & 1) != 0)
  {
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, MEMORY[0x1E0C9AAA0], 1);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Downloading passes…", buf, 2u);
    }

    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_119;
    v14[3] = &unk_1E2ABDDB0;
    v16 = v10;
    v15 = v8;
    objc_msgSend(v13, "_downloadPassesWithCompletion:", v14);

  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_119(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Done downloading passes.", v7, 2u);
  }

  AnalyticsSendEvent();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") & a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_120(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_121;
  v11[3] = &unk_1E2ABDA18;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

uint64_t __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_121(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_122(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  unsigned __int8 v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  if ((objc_msgSend(a4, "isCanceled") & 1) != 0 || (v7 = atomic_load((unsigned __int8 *)a1[4] + 25), (v7 & 1) != 0))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Canceled during first pass", buf, 2u);
    }

    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Encountered an error when performing recovery actions. Rescheduling with backoff.", buf, 2u);
    }

    objc_msgSend(a1[4], "_rescheduleWithBackoff");
LABEL_8:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_9;
  }
  v8 = a1[4];
  v9 = (void *)v8[4];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_123;
  v12[3] = &unk_1E2AD8990;
  v12[4] = v8;
  v14 = a1[6];
  v13 = a1[5];
  objc_msgSend(v9, "deviceStateWithCompletion:", v12);

LABEL_9:
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_124;
  v7[3] = &unk_1E2AD8968;
  v7[4] = v4;
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_124(uint64_t a1)
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
  if ((v2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      CheckConsistencyWithDeviceState(v3, *(void **)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "cleanupActions");
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Notify Broker that our state is messed up.", buf, 2u);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_125;
        block[3] = &unk_1E2ABE030;
        block[4] = *(_QWORD *)(a1 + 32);
        v10 = v4;
        v11 = *(id *)(a1 + 56);
        dispatch_sync(MEMORY[0x1E0C80D38], block);
        objc_msgSend(*(id *)(a1 + 32), "_rescheduleWithBackoff");

      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Passbook and SE are now consistent!", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_rescheduleCheckInTimeInterval:backoffLevel:", 0, 86400.0);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: failed to get device state. Aborting.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_rescheduleWithBackoff");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_125(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v2, "primaryBrokerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_126;
  v5[3] = &unk_1E2AD5270;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "registerDeviceAtBrokerURL:consistencyCheckResults:completion:", v3, v4, v5);

}

uint64_t __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_2_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PKSecureElementConsistencyChecker_queue_startWithCompletion___block_invoke_3_130(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2 == 1)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "PKSecureElementConsistencyChecker: Successfully updated payment service server-side config data";
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "PKSecureElementConsistencyChecker: Failed to update payment service server-side config with error %@";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)_downloadPassesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  PKPaymentWebService *paymentWebService;
  id v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  PKSecureElementConsistencyChecker *v29;
  id v30;
  _QWORD handler[4];
  id v32;
  _QWORD aBlock[5];
  id v34;
  uint8_t *v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentWebService context](self->_paymentWebService, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRegistered");

  if ((v6 & 1) != 0)
  {
    -[PKSecureElementConsistencyCheckerDelegate paymentPasses](self->_delegate, "paymentPasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v10);
    }

    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__69;
    v40 = __Block_byref_object_dispose__69;
    v41 = 0;
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke;
    aBlock[3] = &unk_1E2AD8A28;
    aBlock[4] = self;
    v35 = buf;
    v34 = v4;
    v16 = _Block_copy(aBlock);
    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v18 = (void *)*((_QWORD *)v37 + 5);
    *((_QWORD *)v37 + 5) = v17;

    v19 = *((_QWORD *)v37 + 5);
    v20 = dispatch_time(0, 900000000000);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v21 = *((_QWORD *)v37 + 5);
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3;
    handler[3] = &unk_1E2ABD9A0;
    v22 = v16;
    v32 = v22;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume(*((dispatch_object_t *)v37 + 5));
    paymentWebService = self->_paymentWebService;
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_4;
    v27[3] = &unk_1E2AD8AA0;
    v24 = v8;
    v28 = v24;
    v29 = self;
    v25 = v22;
    v30 = v25;
    -[PKPaymentWebService devicePassesSinceLastUpdatedTag:withCompletion:](paymentWebService, "devicePassesSinceLastUpdatedTag:withCompletion:", 0, v27);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Device needs to register; we will not sync passes with server",
        buf,
        2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  char v7;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AD8A00;
  v7 = a2;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

NSObject *__67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *result;
  uint64_t v4;
  void *v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  result = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (!result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (!result)
  {
    return result;
  }
  dispatch_source_cancel(result);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PKAsyncUnaryOperationComposer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id obj;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v7 = MEMORY[0x1E0C809B0];
  if (a2 == 1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v12, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectForKey:", v14);

          v32[0] = v7;
          v32[1] = 3221225472;
          v32[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_5;
          v32[3] = &unk_1E2AC8040;
          v32[4] = *(_QWORD *)(a1 + 40);
          v32[5] = v12;
          -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v32);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    v5 = v23;
  }
  v31 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v27[0] = v7;
        v27[1] = 3221225472;
        v27[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_135;
        v27[3] = &unk_1E2AC8040;
        v27[4] = *(_QWORD *)(a1 + 40);
        v27[5] = v20;
        -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v27);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3_139;
  v25[3] = &unk_1E2AC9F08;
  v26 = *(id *)(a1 + 48);
  v22 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v6, "evaluateWithInput:completion:", v21, v25);

}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[6];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[PKDownloadRemoteAssetConfiguration configurationWithCloudStoreDelegate:](PKDownloadRemoteAssetConfiguration, "configurationWithCloudStoreDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_6;
  v12[3] = &unk_1E2AD8A50;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = v9;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "downloadRemoteAssetsWithConfiguration:completion:", v8, v12);

}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_6(_QWORD *a1, int a2, void *a3, float a4)
{
  id v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  double v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109634;
      v9[1] = 1;
      v10 = 2048;
      v11 = a4;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Download of remote assets during consistency check, called completion handler with finished=%i progress=%f error=%@", (uint8_t *)v9, 0x1Cu);
    }

    if (!v7)
      objc_msgSend(*(id *)(a1[4] + 32), "didDownloadPaymentPass:", a1[5]);
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_135(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "passTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2_136;
  v13[3] = &unk_1E2AD8A78;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "passWithPassTypeIdentifier:serialNumber:completion:", v9, v10, v13);

}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_2_136(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __67__PKSecureElementConsistencyChecker__downloadPassesWithCompletion___block_invoke_3_139(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_syncWithTSMCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Syncing with TSM…", buf, 2u);
  }

  v6 = -[PKSecureElementConsistencyCheckerDelegate synchronizeWithTSM](self->_delegate, "synchronizeWithTSM");
  v7 = dispatch_time(0, 30000000000);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PKSecureElementConsistencyChecker__syncWithTSMCompletion___block_invoke;
  v9[3] = &unk_1E2ABDCC0;
  v10 = v4;
  v11 = v6;
  v8 = v4;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

uint64_t __60__PKSecureElementConsistencyChecker__syncWithTSMCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: Done syncing with TSM.", v4, 2u);
  }

  AnalyticsSendEvent();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_rescheduleWithBackoff
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint8_t v10[16];

  -[PKPaymentWebService context](self->_paymentWebService, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "consistencyCheckBackoffLevel");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: reschedule consistency check with maximum backoff delay due to lack of primary region.", v10, 2u);
    }

    v5 = 12;
  }
  v7 = 12;
  if (v5 < 12)
    v7 = v5;
  v8 = ConsistencyCheckBackoffLevels[v7];
  v9 = 11;
  if (v5 < 11)
    v9 = v5;
  -[PKSecureElementConsistencyChecker _rescheduleCheckInTimeInterval:backoffLevel:](self, "_rescheduleCheckInTimeInterval:backoffLevel:", v9 + 1, v8);

}

- (void)_rescheduleCheckInTimeInterval:(double)a3 backoffLevel:(int64_t)a4
{
  unsigned __int8 v4;
  char v8;
  PKSecureElementConsistencyCheckerDelegate *delegate;
  void *v10;
  PKSecureElementConsistencyCheckerDelegate *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[16];

  v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v4 & 1) == 0)
  {
    v8 = objc_opt_respondsToSelector();
    delegate = self->_delegate;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, 28800.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementConsistencyCheckerDelegate scheduleConsistencyCheck:pluggedIn:backoffLevel:](delegate, "scheduleConsistencyCheck:pluggedIn:backoffLevel:", v13, a3 > 28800.0, v10);

LABEL_6:
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = self->_delegate;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementConsistencyCheckerDelegate scheduleConsistencyCheck:pluggedIn:](v11, "scheduleConsistencyCheck:pluggedIn:", v13, a3 > 28800.0);
      goto LABEL_6;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKSecureElementConsistencyChecker: unable to reschedule check, delegate doesn't response to any scheduleConsistencyCheck selector", buf, 2u);
    }

  }
}

- (PKSecureElementConsistencyCheckerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PKSecureElementConsistencyCheckerDelegate *)a3;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, 0);
}

- (PKSecureElementConsistencyChecker)initWithPaymentWebService:(id)a3 delegate:(id)a4
{
  return -[PKSecureElementConsistencyChecker initWithPaymentWebService:delegate:cloudStoreCoordinatorDelegate:](self, "initWithPaymentWebService:delegate:cloudStoreCoordinatorDelegate:", a3, a4, 0);
}

@end
