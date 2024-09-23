@implementation PKPaymentVerificationObserver

- (PKPaymentVerificationObserver)initWithPaymentPass:(id)a3 verificationChannel:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentVerificationObserver *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentVerificationObserver;
  v12 = -[PKPaymentVerificationObserver init](&v16, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("VerificationObserver", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_pass, a3);
    objc_storeStrong((id *)&v12->_verificationChannel, a4);
    objc_storeStrong((id *)&v12->_identifier, a5);
  }

  return v12;
}

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationObserver;
  -[PKPaymentVerificationObserver dealloc](&v4, sel_dealloc);
}

- (void)startObservingVerificationSourceWithTimeout:(double)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke;
  v4[3] = &unk_1E2AC4430;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

void __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  dispatch_source_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "type") == 2)
    {
      PKLogFacilityTypeGetObject(0x24uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(_QWORD *)(v4 + 48);
        objc_msgSend(*(id *)(v4 + 64), "sourceAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v6;
        v24 = 2048;
        v25 = v5;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Starting SMS verification observer with timeout: %f sourceAddress: %@", buf, 0x20u);

      }
      v8 = PKEnableUpdatedOneTimeCodeParsing();
      v9 = *(void **)(a1 + 32);
      if (v8)
        objc_msgSend(v9, "_startObserving");
      else
        objc_msgSend(v9, "_startObservingUsingLegacyObserver");
    }
    if (*(double *)(a1 + 40) > 0.0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(NSObject **)(v10 + 24);
      if (v11)
      {
        dispatch_source_cancel(v11);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 24);
        *(_QWORD *)(v12 + 24) = 0;

        v10 = *(_QWORD *)(a1 + 32);
      }
      v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v10 + 16));
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 24);
      *(_QWORD *)(v15 + 24) = v14;

      v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      v18 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke_36;
      v20[3] = &unk_1E2ABE7B0;
      objc_copyWeak(&v21, (id *)buf);
      v20[4] = *(_QWORD *)(a1 + 32);
      dispatch_source_set_event_handler(v19, v20);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __77__PKPaymentVerificationObserver_startObservingVerificationSourceWithTimeout___block_invoke_36(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 8))
  {
    PKLogFacilityTypeGetObject(0x24uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification observer timed out", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "_queue_stop");
    v6 = objc_loadWeakRetained(v3 + 9);
    objc_msgSend(v6, "verificationObserverDidTimeout:", v3);

  }
}

- (void)_startObserving
{
  id v3;
  IMOneTimeCodeAccelerator *v4;
  IMOneTimeCodeAccelerator *oneTimeCodeObserver;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)getIMOneTimeCodeAcceleratorClass[0]());
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKPaymentVerificationObserver__startObserving__block_invoke;
  v6[3] = &unk_1E2AD8028;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v4 = (IMOneTimeCodeAccelerator *)objc_msgSend(v3, "initWithBlockForUpdates:", v6);
  oneTimeCodeObserver = self->_oneTimeCodeObserver;
  self->_oneTimeCodeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__PKPaymentVerificationObserver__startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PKPaymentVerificationObserver__startObserving__block_invoke_2;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void __48__PKPaymentVerificationObserver__startObserving__block_invoke_2(id *a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && *((_BYTE *)WeakRetained + 8))
  {
    v19 = WeakRetained;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = a1[4];
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          PKLogFacilityTypeGetObject(0x24uLL);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *((_QWORD *)a1[5] + 6);
            *(_DWORD *)buf = 138412547;
            v26 = v9;
            v27 = 2113;
            v28 = v7;
            _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Detected potential verification code: %{private}@", buf, 0x16u);
          }

          _MergedGlobals_183();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "PKStringForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            off_1ECF21C10();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "PKStringForKey:", v14);
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          off_1ECF21C18();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "PKStringForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          off_1ECF21C20();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "PKStringForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 && v16 && v18 && objc_msgSend(a1[5], "_handleVerificationCode:fromSource:", v13, v16))
          {
            objc_msgSend(v19[4], "consumeCodeWithGuid:", v18);
            objc_msgSend(v19, "_queue_stop");

            goto LABEL_21;
          }

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_21:

    WeakRetained = v19;
  }

}

- (void)_startObservingUsingLegacyObserver
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a5;
  v8 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke_2;
  v13[3] = &unk_1E2ABE9D0;
  v13[4] = v9;
  v14 = v7;
  v11 = v7;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v15 = v8;
  v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
}

void __67__PKPaymentVerificationObserver__startObservingUsingLegacyObserver__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x24uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v6 = 138412547;
    v7 = v4;
    v8 = 2113;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Detected candidate verification code: %{private}@", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleVerificationCode:fromSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)_handleVerificationCode:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSString *identifier;
  id WeakRetained;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void *v19;
  int v21;
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") > 4)
  {
    -[PKVerificationChannel sourceAddress](self->_verificationChannel, "sourceAddress");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_skipSourceCheck || !v11 || (objc_msgSend(v11, "isLikePhoneNumber:", v12) & 1) != 0)
    {
      PKLogFacilityTypeGetObject(0x24uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        v21 = 138412547;
        v22 = identifier;
        v23 = 2113;
        v24 = v6;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Observer<%@>: handling valid code %{private}@", (uint8_t *)&v21, 0x16u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!WeakRetained)
      {
        v10 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject verificationObserver:didObserveVerificationCode:](v16, "verificationObserver:didObserveVerificationCode:", self, v6);
      v10 = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x24uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_identifier;
        objc_msgSend(v12, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413059;
        v22 = v17;
        v23 = 2113;
        v24 = v6;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification code %{private}@ source address %@ does not match expected source address: %@ -- ignoring", (uint8_t *)&v21, 0x2Au);

      }
      v10 = 0;
    }

    goto LABEL_17;
  }
  PKLogFacilityTypeGetObject(0x24uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_identifier;
    v21 = 138412803;
    v22 = v9;
    v23 = 2113;
    v24 = v6;
    v25 = 1024;
    LODWORD(v26) = 5;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Verification code %{private}@ is not of minimum length %d -- ignoring.", (uint8_t *)&v21, 0x1Cu);
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (void)stop
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PKPaymentVerificationObserver_stop__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __37__PKPaymentVerificationObserver_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stop");
}

- (void)_queue_stop
{
  NSObject *v3;
  NSString *identifier;
  NSObject *timer;
  OS_dispatch_source *v6;
  NSString *v7;
  IMOneTimeCodeAccelerator *oneTimeCodeObserver;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x24uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v9 = 138412290;
    v10 = identifier;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Observer<%@>: Stopping verification observer", (uint8_t *)&v9, 0xCu);
  }

  if (self->_observing)
  {
    self->_observing = 0;
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v6 = self->_timer;
      self->_timer = 0;

    }
    if (self->_identifier)
    {
      HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
      v7 = self->_identifier;
      self->_identifier = 0;

    }
    oneTimeCodeObserver = self->_oneTimeCodeObserver;
    self->_oneTimeCodeObserver = 0;

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKVerificationChannel)verificationChannel
{
  return self->_verificationChannel;
}

- (PKPaymentVerificationObserverDelegate)delegate
{
  return (PKPaymentVerificationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)skipSourceCheck
{
  return self->_skipSourceCheck;
}

- (void)setSkipSourceCheck:(BOOL)a3
{
  self->_skipSourceCheck = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verificationChannel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeObserver, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
