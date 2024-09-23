@implementation PKFieldPropertiesProbe

+ (id)createProbeForProperties:(id)a3 queue:(id)a4
{
  id v5;
  id result;
  id v7;
  id v8;

  v5 = a3;
  result = a4;
  if (v5 && (v7 = result) != 0)
  {
    v8 = -[PKFieldPropertiesProbe _initWithProperties:queue:]([PKFieldPropertiesProbe alloc], "_initWithProperties:queue:", v5, result);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (PKFieldPropertiesProbe)init
{

  return 0;
}

- (id)_initWithProperties:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  PKFieldPropertiesProbe *v9;
  PKFieldPropertiesProbe *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKFieldPropertiesProbe;
  v9 = -[PKFieldPropertiesProbe init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_properties, a3);
    v10->_type = -[PKFieldProperties accessTerminalSubtype](v10->_properties, "accessTerminalSubtype") == 2;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKFieldPropertiesProbe invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKFieldPropertiesProbe;
  -[PKFieldPropertiesProbe dealloc](&v3, sel_dealloc);
}

- (void)beginWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id completion;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t type;
  uint64_t v14;
  void *v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *timeout;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  id buf[2];

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_started)
    {
      self->_started = 1;
      if (self->_invalidated)
      {
        os_unfair_lock_unlock(&self->_lock);
LABEL_20:

        return;
      }
      v6 = _Block_copy(v5);
      completion = self->_completion;
      self->_completion = v6;

      os_unfair_lock_unlock(&self->_lock);
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: starting lookup session...", (uint8_t *)buf, 2u);
      }

      PKTimeProfileBegin((uint64_t)v8, CFSTR("field_detector_lookup"));
      PKTimeProfileBegin((uint64_t)v8, CFSTR("field_detector_lookup_start"));

      objc_initWeak(buf, self);
      v9 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke;
      aBlock[3] = &unk_1E2AD7440;
      objc_copyWeak(&v24, buf);
      v10 = _Block_copy(aBlock);
      objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      type = self->_type;
      if (type)
      {
        if (type != 1)
        {
          v15 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v11, "startDigitalCarKeySession:", v10);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "startLoyaltyAndContactlessPaymentSession:", v10);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v14;
LABEL_13:
      os_unfair_lock_lock(&self->_lock);
      if (self->_invalidated)
      {
        os_unfair_lock_unlock(&self->_lock);
        if (v15)
          objc_msgSend(v15, "endSession");
      }
      else
      {
        if (!self->_session)
          objc_storeStrong((id *)&self->_startHandle, v15);

        v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
        timeout = self->_timeout;
        self->_timeout = v16;

        v18 = self->_timeout;
        v19 = dispatch_time(0, 5000000000);
        dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v20 = self->_timeout;
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_154;
        v21[3] = &unk_1E2AC3648;
        objc_copyWeak(&v22, buf);
        dispatch_source_set_event_handler(v20, v21);
        dispatch_resume((dispatch_object_t)self->_timeout);
        objc_destroyWeak(&v22);
        os_unfair_lock_unlock(&self->_lock);
        v15 = 0;
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(buf);
      goto LABEL_20;
    }
  }
  __break(1u);
}

void __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  NSObject **v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_2;
    block[3] = &unk_1E2ABE0F8;
    v11 = v5;
    v12 = v6;
    v13 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(v5, "endSession");
  }

}

uint64_t __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 48), "_acceptSession:");
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: failed to start lookup session. Error: %@.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  return objc_msgSend(*(id *)(a1 + 48), "_resolve");
}

void __46__PKFieldPropertiesProbe_beginWithCompletion___block_invoke_154(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resolve");
    WeakRetained = v2;
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NFSession *v4;
  id completion;
  NFSession *startHandle;
  NFSession *session;
  NSObject *timeout;
  OS_dispatch_source *v9;
  NFSession *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v10 = 0;
    v4 = 0;
  }
  else
  {
    self->_invalidated = 1;
    completion = self->_completion;
    self->_completion = 0;

    v10 = self->_startHandle;
    startHandle = self->_startHandle;
    self->_startHandle = 0;

    v4 = self->_session;
    session = self->_session;
    self->_session = 0;

    timeout = self->_timeout;
    if (timeout)
    {
      dispatch_source_cancel(timeout);
      v9 = self->_timeout;
      self->_timeout = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
  -[NFSession endSession](v10, "endSession");
  if (v4)
  {
    if (self->_type <= 1uLL)
      -[NFSession setDelegate:](v4, "setDelegate:", 0);
    -[NFSession endSession](v4, "endSession");
  }

}

- (void)_resolve
{
  os_unfair_lock_s *p_lock;
  _BOOL4 invalidated;
  id completion;
  void (**v6)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_resolved)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = 0;
  }
  else
  {
    self->_resolved = 1;
    invalidated = self->_invalidated;
    if (self->_invalidated)
      v6 = 0;
    else
      v6 = (void (**)(void))_Block_copy(self->_completion);
    completion = self->_completion;
    self->_completion = 0;

    os_unfair_lock_unlock(p_lock);
    if (!invalidated && v6)
      v6[2]();
  }
  -[PKFieldPropertiesProbe invalidate](self, "invalidate");

}

- (void)_acceptSession:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NFSession *startHandle;
  int64_t type;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    __break(1u);
  v6 = v5;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: started lookup session %p.", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  startHandle = self->_startHandle;
  self->_startHandle = 0;

  if (!self->_invalidated)
  {
    objc_storeStrong((id *)&self->_session, a3);
    os_unfair_lock_unlock(&self->_lock);
    type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        objc_msgSend(v6, "setDelegate:", self);
        if ((PKFieldPropertiesStartSecondaryLookup(self->_properties, v6, 0) & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v6, "setDelegate:", self);
      if (PKFieldPropertiesStartSecondaryLookup(self->_properties, v6, 0))
      {
LABEL_9:
        v11 = CFSTR("eventType");
        v12 = CFSTR("cardEmulationStarted");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("fieldDetect"), v10);

        goto LABEL_12;
      }
    }
    -[PKFieldPropertiesProbe _resolve](self, "_resolve");
    goto LABEL_12;
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "endSession");
LABEL_12:

}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __91__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 74) || *(_BYTE *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed VAS transaction.", v5, 2u);
    }

    v4 = PKTimeProfileEnd(v3, CFSTR("field_detect_lookup"), CFSTR("Field Detector Lookup Session"));
    objc_msgSend(*(id *)(a1 + 32), "_resolve");
  }
}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKFieldPropertiesProbe_loyaltyAndPaymentSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __69__PKFieldPropertiesProbe_loyaltyAndPaymentSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session terminated.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_resolve");
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didEndTransaction___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __69__PKFieldPropertiesProbe_loyaltyAndPaymentSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 74) || *(_BYTE *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed transaction.", v5, 2u);
    }

    v4 = PKTimeProfileEnd(v3, CFSTR("field_detect_lookup"), CFSTR("Field Detector Lookup Session"));
    objc_msgSend(*(id *)(a1 + 32), "_resolve");
  }
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKFieldPropertiesProbe_sessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__PKFieldPropertiesProbe_sessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session terminated.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_resolve");
}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKFieldPropertiesProbe_session_didEndTransaction___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __52__PKFieldPropertiesProbe_session_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 74) || *(_BYTE *)(v2 + 73))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    PKFieldPropertiesResolveSecondaryLookup(*(void **)(v2 + 24), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldPropertiesProbe: lookup session performed transaction.", v5, 2u);
    }

    v4 = PKTimeProfileEnd(v3, CFSTR("field_detect_lookup"), CFSTR("Field Detector Lookup Session"));
    objc_msgSend(*(id *)(a1 + 32), "_resolve");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_startHandle, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
