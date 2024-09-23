@implementation PKPaymentSession

+ (id)startInAppSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startInAppSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startInAppSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  PKTransactionSessionWrapper *v12;
  PKTransactionSessionWrapper *v13;
  PKPaymentSessionHandle *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting in-app session...", buf, 2u);
  }

  PKTimeProfileBegin((uint64_t)v7, CFSTR("in_app_session_start"));
  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__PKPaymentSession_startInAppSessionWithCompletion_targetQueue___block_invoke;
  v19 = &unk_1E2AC6050;
  v20 = v6;
  v21 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "startECommercePaymentSession:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKTransactionSessionWrapper alloc];
  v13 = -[PKTransactionSessionWrapper initWithNFSession:](v12, "initWithNFSession:", v11, v16, v17, v18, v19);
  v14 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v13, v10);

  return v14;
}

void __64__PKPaymentSession_startInAppSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKInAppPaymentSession *v6;
  NSObject *p_super;
  id v8;
  PKTransactionSessionWrapper *v9;
  PKInAppPaymentSession *v10;
  uint64_t v11;
  int v12;
  PKInAppPaymentSession *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  p_super = objc_claimAutoreleasedReturnValue();
  v8 = PKTimeProfileEnd(p_super, CFSTR("in_app_session_start"), CFSTR("In-App Payment Session Start"));

  if (v5)
  {
    v9 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v10 = -[PKInAppPaymentSession initWithInternalSession:targetQueue:]([PKInAppPaymentSession alloc], "initWithInternalSession:targetQueue:", v9, *(_QWORD *)(a1 + 32));
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKInAppPaymentSession (%p): started in-app session %p.", (uint8_t *)&v12, 0x16u);
    }

    p_super = &v9->super;
  }
  else
  {
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start in-app session - %@.", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKInAppPaymentSession *))(v11 + 16))(v11, v10);

}

+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startContactlessInterfaceSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  PKTransactionSessionWrapper *v11;
  PKTransactionSessionWrapper *v12;
  PKPaymentSessionHandle *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting contactless nearfield session...", buf, 2u);
    }

    objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __79__PKPaymentSession_startContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke;
    v18 = &unk_1E2AC6078;
    v9 = v6;
    v19 = v9;
    v20 = v5;
    objc_msgSend(v8, "startLoyaltyAndContactlessPaymentSession:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PKTransactionSessionWrapper alloc];
    v12 = -[PKTransactionSessionWrapper initWithNFSession:](v11, "initWithNFSession:", v10, v15, v16, v17, v18);
    v13 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v12, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __79__PKPaymentSession_startContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKContactlessInterfaceSession *v6;
  PKTransactionSessionWrapper *v7;
  PKContactlessInterfaceSession *v8;
  NSObject *v9;
  int v10;
  PKContactlessInterfaceSession *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v8 = -[PKContactlessInterfaceSession initWithInternalSession:targetQueue:]([PKContactlessInterfaceSession alloc], "initWithInternalSession:targetQueue:", v7, *(_QWORD *)(a1 + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started contactless nearfield session %p.", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start contactless nearfield session - %@.", (uint8_t *)&v10, 0xCu);
    }
    v8 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)startDigitalCarKeySessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startDigitalCarKeySessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startDigitalCarKeySessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  PKTransactionSessionWrapper *v11;
  PKTransactionSessionWrapper *v12;
  PKPaymentSessionHandle *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting car key session...", buf, 2u);
    }

    objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __72__PKPaymentSession_startDigitalCarKeySessionWithCompletion_targetQueue___block_invoke;
    v18 = &unk_1E2AC60A0;
    v9 = v6;
    v19 = v9;
    v20 = v5;
    objc_msgSend(v8, "startDigitalCarKeySession:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PKTransactionSessionWrapper alloc];
    v12 = -[PKTransactionSessionWrapper initWithNFSession:](v11, "initWithNFSession:", v10, v15, v16, v17, v18);
    v13 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v12, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __72__PKPaymentSession_startDigitalCarKeySessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKContactlessInterfaceSession *v6;
  PKTransactionSessionWrapper *v7;
  PKContactlessInterfaceSession *v8;
  NSObject *v9;
  int v10;
  PKContactlessInterfaceSession *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v8 = -[PKContactlessInterfaceSession initWithInternalSession:targetQueue:]([PKContactlessInterfaceSession alloc], "initWithInternalSession:targetQueue:", v7, *(_QWORD *)(a1 + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started car key session %p.", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start car key session - %@.", (uint8_t *)&v10, 0xCu);
    }
    v8 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "forceContactlessInterfaceSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  PKTransactionSessionWrapper *v11;
  PKTransactionSessionWrapper *v12;
  PKPaymentSessionHandle *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: force starting contactless nearfield session...", buf, 2u);
    }

    objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __79__PKPaymentSession_forceContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke;
    v18 = &unk_1E2AC6078;
    v9 = v6;
    v19 = v9;
    v20 = v5;
    objc_msgSend(v8, "forceLoyaltyAndContactlessPaymentSession:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PKTransactionSessionWrapper alloc];
    v12 = -[PKTransactionSessionWrapper initWithNFSession:](v11, "initWithNFSession:", v10, v15, v16, v17, v18);
    v13 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v12, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __79__PKPaymentSession_forceContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKContactlessInterfaceSession *v6;
  PKTransactionSessionWrapper *v7;
  PKContactlessInterfaceSession *v8;
  NSObject *v9;
  int v10;
  PKContactlessInterfaceSession *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v8 = -[PKContactlessInterfaceSession initWithInternalSession:targetQueue:]([PKContactlessInterfaceSession alloc], "initWithInternalSession:targetQueue:", v7, *(_QWORD *)(a1 + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): force started contactless nearfield session %p.", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to force start contactless nearfield session - %@.", (uint8_t *)&v10, 0xCu);
    }
    v8 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)startSTSContactlessInterfaceSessionWithDelegate:(id)a3 completion:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  id v8;
  PKTransactionSessionWrapper *v9;
  NSObject *v10;
  PKTransactionSessionWrapper *v11;
  PKPaymentSessionHandle *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  PKTransactionSessionWrapper *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = (Class (__cdecl *)())getSTSSessionClass[0];
    v7 = a3;
    v8 = objc_alloc_init(v6());
    v9 = -[PKTransactionSessionWrapper initWithSTSSession:]([PKTransactionSessionWrapper alloc], "initWithSTSSession:", v8);
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting contactless STS session %p...", buf, 0xCu);
    }

    buf[0] = 0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __79__PKPaymentSession_startSTSContactlessInterfaceSessionWithDelegate_completion___block_invoke;
    v17 = &unk_1E2ABDD88;
    v18 = v9;
    v19 = v5;
    v11 = v9;
    objc_msgSend(v8, "startWithDelegate:isFirstInQueue:completion:", v7, buf, &v14);

    -[PKTransactionSessionWrapper setFirstInQueue:](v11, "setFirstInQueue:", buf[0], v14, v15, v16, v17);
    v12 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v11, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __79__PKPaymentSession_startSTSContactlessInterfaceSessionWithDelegate_completion___block_invoke(uint64_t a1, void *a2)
{
  PKContactlessInterfaceSession *v3;
  NSObject *v4;
  PKContactlessInterfaceSession *v5;
  NSObject *v6;
  void *v7;
  int v8;
  PKContactlessInterfaceSession *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start contactless STS session - %@.", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = -[PKContactlessInterfaceSession initWithInternalSession:targetQueue:]([PKContactlessInterfaceSession alloc], "initWithInternalSession:targetQueue:", *(_QWORD *)(a1 + 32), 0);
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "stsSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218240;
      v9 = v5;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started contactless STS session %p.", (uint8_t *)&v8, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (id)startReaderSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startReaderSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startReaderSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  PKTransactionSessionWrapper *v12;
  PKTransactionSessionWrapper *v13;
  PKPaymentSessionHandle *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting reader nearfield session...", buf, 2u);
  }

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __65__PKPaymentSession_startReaderSessionWithCompletion_targetQueue___block_invoke;
  v19 = &unk_1E2AC60C8;
  v20 = v6;
  v21 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "startReaderSession:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKTransactionSessionWrapper alloc];
  v13 = -[PKTransactionSessionWrapper initWithNFSession:](v12, "initWithNFSession:", v11, v16, v17, v18, v19);
  v14 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v13, v10);

  return v14;
}

void __65__PKPaymentSession_startReaderSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKNFCTagReaderSession *v6;
  PKTransactionSessionWrapper *v7;
  PKNFCTagReaderSession *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  PKNFCTagReaderSession *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v8 = -[PKNFCTagReaderSession initWithInternalSession:targetQueue:]([PKNFCTagReaderSession alloc], "initWithInternalSession:targetQueue:", v7, *(_QWORD *)(a1 + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = v8;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKNFCTagReaderSession (%p): started reader nearfield session %p.", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start reader nearfield session - %@.", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, PKNFCTagReaderSession *, PKNFCTagReaderSession *))(v10 + 16))(v10, v8, v6);

}

+ (id)startPeerPaymentSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startPeerPaymentSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startPeerPaymentSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  PKTransactionSessionWrapper *v12;
  PKTransactionSessionWrapper *v13;
  PKPaymentSessionHandle *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting peer-payment session...", buf, 2u);
  }

  PKTimeProfileBegin((uint64_t)v7, CFSTR("peer_payment_session_start"));
  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __70__PKPaymentSession_startPeerPaymentSessionWithCompletion_targetQueue___block_invoke;
  v19 = &unk_1E2AC60F0;
  v20 = v6;
  v21 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "startPeerPaymentSession:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKTransactionSessionWrapper alloc];
  v13 = -[PKTransactionSessionWrapper initWithNFSession:](v12, "initWithNFSession:", v11, v16, v17, v18, v19);
  v14 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v13, v10);

  return v14;
}

void __70__PKPaymentSession_startPeerPaymentSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKPeerPaymentSession *v6;
  NSObject *p_super;
  id v8;
  PKTransactionSessionWrapper *v9;
  PKPeerPaymentSession *v10;
  uint64_t v11;
  int v12;
  PKPeerPaymentSession *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  p_super = objc_claimAutoreleasedReturnValue();
  v8 = PKTimeProfileEnd(p_super, CFSTR("peer_payment_session_start"), CFSTR("Peer Payment Session Start"));

  if (v5)
  {
    v9 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v10 = -[PKPeerPaymentSession initWithInternalSession:targetQueue:]([PKPeerPaymentSession alloc], "initWithInternalSession:targetQueue:", v9, *(_QWORD *)(a1 + 32));
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSession (%p): started peer-payment session %p.", (uint8_t *)&v12, 0x16u);
    }

    p_super = &v9->super;
  }
  else
  {
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start peer-payment session - %@.", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentSession *))(v11 + 16))(v11, v10);

}

+ (id)startApplePayTrustSessionWithCompletion:(id)a3
{
  return (id)objc_msgSend(a1, "startApplePayTrustSessionWithCompletion:targetQueue:", a3, 0);
}

+ (id)startApplePayTrustSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  PKTransactionSessionWrapper *v12;
  PKTransactionSessionWrapper *v13;
  PKPaymentSessionHandle *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting trust session...", buf, 2u);
  }

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __72__PKPaymentSession_startApplePayTrustSessionWithCompletion_targetQueue___block_invoke;
  v19 = &unk_1E2AC6118;
  v20 = v6;
  v21 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "startTrustSession:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKTransactionSessionWrapper alloc];
  v13 = -[PKTransactionSessionWrapper initWithNFSession:](v12, "initWithNFSession:", v11, v16, v17, v18, v19);
  v14 = -[PKPaymentSessionHandle initWithInternalSessionHandle:targetQueue:]([PKPaymentSessionHandle alloc], "initWithInternalSessionHandle:targetQueue:", v13, v10);

  return v14;
}

void __72__PKPaymentSession_startApplePayTrustSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKApplePayTrustSession *v6;
  PKTransactionSessionWrapper *v7;
  PKApplePayTrustSession *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  PKApplePayTrustSession *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v5);
    v8 = -[PKApplePayTrustSession initWithInternalSession:targetQueue:]([PKApplePayTrustSession alloc], "initWithInternalSession:targetQueue:", v7, *(_QWORD *)(a1 + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = v8;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKApplePayTrustSession (%p): started trust session %p.", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start trust session - %@.", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, PKApplePayTrustSession *))(v10 + 16))(v10, v8);

}

- (PKPaymentSession)init
{
  return -[PKPaymentSession initWithInternalSession:targetQueue:](self, "initWithInternalSession:targetQueue:", 0, 0);
}

- (PKPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
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
  v13.super_class = (Class)PKPaymentSession;
  v9 = -[PKPaymentSession init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.passkit.paymentsession.internalSession", 0);
    v11 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v10;

    if (v8)
      dispatch_set_target_queue(*((dispatch_object_t *)v9 + 1), v8);
    objc_storeStrong((id *)v9 + 2, a3);
    dispatch_queue_set_specific(*((dispatch_queue_t *)v9 + 1), CFSTR("context"), v9, 0);
  }
  else
  {
    objc_msgSend(v7, "endSession");
  }

  return (PKPaymentSession *)v9;
}

- (void)invalidateSession
{
  -[PKPaymentSession invalidateSessionWithCompletion:](self, "invalidateSessionWithCompletion:", 0);
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E2AC6140;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);

}

void __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): invalidating...", buf, 0x16u);
    }

    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke_80;
    v16[3] = &unk_1E2ABE198;
    v17 = v5;
    v19 = v6;
    v18 = v8;
    v10 = v5;
    objc_msgSend(v9, "endSessionWithCompletion:", v16);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = 0;

    goto LABEL_7;
  }
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_4;
    v21 = &unk_1E2ABD9A0;
    v22 = v14;
    v15 = v14;
    dispatch_async(v10, buf);

LABEL_7:
  }

}

void __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke_80(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _BYTE v9[24];
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[6];
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = v3;
    *(_WORD *)&v9[12] = 2048;
    *(_QWORD *)&v9[14] = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): invalidated.", v9, 0x16u);
  }

  v5 = (void *)a1[5];
  if (v5)
  {
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5;
    *(_QWORD *)v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v9[8] = 3221225472;
    *(_QWORD *)&v9[16] = __dispatch_async_ar_block_invoke_4;
    v10 = &unk_1E2ABD9A0;
    v11 = v7;
    v8 = v7;
    dispatch_async(v6, v9);

  }
}

- (void)createSessionHandoffTokenWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __60__PKPaymentSession_createSessionHandoffTokenWithCompletion___block_invoke;
    v6[3] = &unk_1E2AC6140;
    v6[4] = self;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);

    v4 = v5;
  }

}

void __60__PKPaymentSession_createSessionHandoffTokenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "nfSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "nfSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v3, "createSessionHandoffToken:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4, v5);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("createSessionHandoffTokenWithCompletion: only works for NFSession");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

- (void)performBlockAsyncOnInternalSession:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalSessionSerialQueue;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalSessionSerialQueue = self->_internalSessionSerialQueue;
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PKPaymentSession_performBlockAsyncOnInternalSession___block_invoke;
    v9[3] = &unk_1E2ABDA18;
    v9[4] = self;
    v10 = v4;
    v8 = v9;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_4;
    block[3] = &unk_1E2ABD9A0;
    v12 = v8;
    dispatch_async(internalSessionSerialQueue, block);

  }
}

uint64_t __55__PKPaymentSession_performBlockAsyncOnInternalSession___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)performBlockSyncOnInternalSession:(id)a3
{
  void (**v4)(id, PKTransactionSessionWrapper *);
  NSObject *internalSessionSerialQueue;
  void (**v6)(id, PKTransactionSessionWrapper *);
  _QWORD block[5];
  void (**v8)(id, PKTransactionSessionWrapper *);

  v4 = (void (**)(id, PKTransactionSessionWrapper *))a3;
  if (v4)
  {
    v6 = v4;
    if (dispatch_get_specific(CFSTR("context")) == self)
    {
      v6[2](v6, self->_internalSession);
    }
    else
    {
      internalSessionSerialQueue = self->_internalSessionSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PKPaymentSession_performBlockSyncOnInternalSession___block_invoke;
      block[3] = &unk_1E2ABDA18;
      block[4] = self;
      v8 = v6;
      dispatch_sync(internalSessionSerialQueue, block);

    }
    v4 = v6;
  }

}

uint64_t __54__PKPaymentSession_performBlockSyncOnInternalSession___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (unint64_t)lifecycleState
{
  return self->_lifecycleState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSession, 0);
  objc_storeStrong((id *)&self->_internalSessionSerialQueue, 0);
}

@end
