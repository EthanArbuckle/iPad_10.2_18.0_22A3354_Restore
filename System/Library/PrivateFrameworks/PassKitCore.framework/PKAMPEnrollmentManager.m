@implementation PKAMPEnrollmentManager

+ (id)sharedManager
{
  if (_MergedGlobals_226 != -1)
    dispatch_once(&_MergedGlobals_226, &__block_literal_global_91);
  return (id)qword_1ECF22500;
}

void __39__PKAMPEnrollmentManager_sharedManager__block_invoke()
{
  PKAMPEnrollmentManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKAMPEnrollmentManager);
  v1 = (void *)qword_1ECF22500;
  qword_1ECF22500 = (uint64_t)v0;

}

- (PKAMPEnrollmentManager)init
{
  PKAMPEnrollmentManager *v2;
  PKInAppPaymentService *v3;
  PKInAppPaymentService *service;
  NSMutableDictionary *v5;
  NSMutableDictionary *promiseMap;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t v11;
  NSHashTable *observers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKAMPEnrollmentManager;
  v2 = -[PKAMPEnrollmentManager init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKInAppPaymentService);
    service = v2->_service;
    v2->_service = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    promiseMap = v2->_promiseMap;
    v2->_promiseMap = v5;

    v7 = dispatch_queue_create("com.apple.PassKit.PKAMPEnrollmentManager.internal", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.PassKit.PKAMPEnrollmentManager.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)enrollmentStatusForPaymentPass:(id)a3 completion:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke;
  v15[3] = &unk_1E2ACBF80;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_4;
    v12[3] = &unk_1E2ABE148;
    v8 = &v13;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "canEnrollPaymentPass:completion:", v11, v12);
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_2;
    block[3] = &unk_1E2ABD9A0;
    v8 = &v17;
    v17 = v5;
    dispatch_async(v6, block);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_3;
    v14[3] = &unk_1E2AC0DB0;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v4, "pk_addQueue:finishBlock:", v9, v14);

LABEL_5:
  }

}

uint64_t __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = objc_msgSend(v9, "BOOLValue");
    if (v5)
    {
      _EnrollmentErrorWithUnderlyingError(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v7, 0);
    }
  }

}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_4(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v8 = v5;
    if (v5)
    {
      _EnrollmentErrorWithUnderlyingError(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, a2, v7);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, a2, 0);
    }
    v5 = v8;
  }

}

- (void)canEnrollPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  OS_dispatch_queue *callbackQueue;
  id *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[PKAMPEnrollmentManager performCanEnrollPaymentPass:](self, "performCanEnrollPaymentPass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke;
    v13[3] = &unk_1E2AC0DB0;
    v9 = &v14;
    v14 = v6;
    objc_msgSend(v7, "pk_addQueue:finishBlock:", callbackQueue, v13);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    v10 = self->_callbackQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke_2;
    v11[3] = &unk_1E2ABD9A0;
    v9 = &v12;
    v12 = v6;
    dispatch_async(v10, v11);
    goto LABEL_5;
  }
LABEL_6:

}

void __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = objc_msgSend(v9, "BOOLValue");
    if (v5)
    {
      _EnrollmentErrorWithUnderlyingError(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v7, 0);
    }
  }

}

void __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)performCanEnrollPaymentPass:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0CFDA18];
  v5 = a3;
  v6 = [v4 alloc];
  -[PKAMPEnrollmentManager _bag](self, "_bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuerCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithBag:countryCode:", v7, v8);

  objc_msgSend(v5, "passTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "performCanWriteBillingInfoQueryWithPassTypeIdentifier:serialNumber:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PKAMPEnrollmentManager_performCanEnrollPaymentPass___block_invoke;
    v14[3] = &unk_1E2ACBFA8;
    v15 = v9;
    objc_msgSend(v12, "addFinishBlock:", v14);

  }
  return v12;
}

- (void)enrollPaymentPass:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke;
  v13[3] = &unk_1E2ABE210;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "performEnrollPaymentPass:isDefault:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_2;
    v16[3] = &unk_1E2ACBFF8;
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v18 = v4;
    v16[4] = v5;
    v17 = v6;
    objc_msgSend(v2, "pk_addQueue:finishBlock:", v3, v16);

    v7 = v18;
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_4;
      block[3] = &unk_1E2ABD9A0;
      v15 = v8;
      dispatch_async(v9, block);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_5;
    v11[3] = &unk_1E2ACC020;
    v10 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v12, "_accessObserversWithHandler:", v11);
    v7 = v13;
  }

}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "BOOLValue");
  v8 = a1[6];
  if (v8)
  {
    v9 = objc_msgSend(v5, "BOOLValue");
    if (v6)
    {
      _EnrollmentErrorWithUnderlyingError(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, v9, 0);
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_3;
  v12[3] = &unk_1E2ACBFD0;
  v11 = (void *)a1[5];
  v13 = (id)a1[4];
  v14 = v11;
  v15 = v7;
  objc_msgSend(v13, "_accessObserversWithHandler:", v12);

}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "ampEnrollmentManager:didEnrollPaymentPass:success:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "ampEnrollmentManager:didEnrollPaymentPass:success:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (BOOL)shouldOfferAMPEnrollmentForPaymentPass:(id)a3
{
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "cardType") - 2) > 2)
  {
    objc_msgSend(v4, "devicePrimaryInAppPaymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "paymentNetworkIdentifier");

    if (v9 - 103 <= 0x23 && ((1 << (v9 - 103)) & 0xF5F087CF1) != 0
      || v9 <= 0x1A && ((1 << v9) & 0x7400000) != 0
      || v9 == 301)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "serialNumber");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v6;
        v7 = "Not presenting AMP offer for pass: %@ as it is not a supported credential type";
        goto LABEL_8;
      }
    }
    else
    {
      v11 = objc_msgSend(v4, "effectiveContactlessPaymentApplicationState");
      if (v11 > 0xF)
        goto LABEL_11;
      v12 = v11;
      if (((1 << v11) & 0x7F9) == 0)
      {
        if (((1 << v11) & 0x8006) == 0)
          goto LABEL_11;
        PKLogFacilityTypeGetObject(6uLL);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "serialNumber");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = v14;
          v17 = 2048;
          v18 = v12;
          _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Presenting AMP offer for pass: %@ state is %lu and has been Personalized or Personalizing", (uint8_t *)&v15, 0x16u);

        }
        v3 = 1;
        goto LABEL_10;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "serialNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2048;
        v18 = v12;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Not presenting AMP offer for pass: %@ state is %lu and needs to be Personalized or Personalizing", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "serialNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v6;
      v7 = "Not presenting AMP offer for pass: %@ as it is not a valid card type";
LABEL_8:
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v15, 0xCu);

    }
  }
  v3 = 0;
LABEL_10:

LABEL_11:
  return v3 & 1;
}

- (id)performEnrollPaymentPass:(id)a3 isDefault:(BOOL)a4
{
  id v6;
  NSMutableDictionary *promiseMap;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PKAMPEnrollmentManager *v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  promiseMap = self->_promiseMap;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](promiseMap, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CFDBD8]);
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke;
    v25[3] = &unk_1E2ACC048;
    v25[4] = self;
    v12 = v6;
    v26 = v12;
    objc_msgSend(v10, "addFinishBlock:", v25);
    v13 = self->_promiseMap;
    objc_msgSend(v12, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v10, v14);

    -[PKAMPEnrollmentManager _bag](self, "_bag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CFDA20];
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_3;
    v19[3] = &unk_1E2ACC098;
    v9 = v10;
    v20 = v9;
    v21 = self;
    v24 = a4;
    v22 = v12;
    v23 = v15;
    v17 = v15;
    objc_msgSend(v16, "paymentSessionWithBag:completion:", v17, v19);

  }
  return v9;
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2;
  v4[3] = &unk_1E2ABE0D0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  char v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlerAdapter");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to obtain merchant session: %@", buf, 0xCu);
    }

    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v6);
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 48), "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_28;
    v11[3] = &unk_1E2ACC070;
    v13 = v7;
    v14 = *(_BYTE *)(a1 + 64);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v9, "enrollPaymentPassWithUniqueIdentifier:merchantSession:completion:", v10, v5, v11);

  }
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_28(uint64_t a1, char a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if ((a2 & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CFDA28];
    v5 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2_30;
    v9[3] = &unk_1E2ABE148;
    v6 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "verifyPayment:isDefault:bag:completion:", a3, v5, v6, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);

  }
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2_30(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  void (*v6)(uint64_t, _QWORD);
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v4, "numberWithBool:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v6 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v7 = a3;
    v6(v3, 0);
  }

}

- (id)_bag
{
  return (id)objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("Wallet"), CFSTR("1"));
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PKAMPEnrollmentManager__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(callbackQueue, v8);

  }
}

void __54__PKAMPEnrollmentManager__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_promiseMap, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
