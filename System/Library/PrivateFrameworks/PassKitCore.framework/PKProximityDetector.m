@implementation PKProximityDetector

- (PKProximityDetector)initWithAdvertisingDeviceUUID:(id)a3
{
  id v5;
  PKProximityDetector *v6;
  PKProximityDetector *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *timerQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *discoveryQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKProximityDetector;
  v6 = -[PKProximityDetector init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_advertisingDeviceUUID, a3);
    v7->_advertisingDeviceNearby = 0;
    v8 = dispatch_queue_create("PKProximityDetectorTimerQueue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("PKProximityDetectorQueue", 0);
    discoveryQueue = v7->_discoveryQueue;
    v7->_discoveryQueue = (OS_dispatch_queue *)v10;

    v7->_powerAssertionIdentifier = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKProximityDetector endDetecting](self, "endDetecting");
  v3.receiver = self;
  v3.super_class = (Class)PKProximityDetector;
  -[PKProximityDetector dealloc](&v3, sel_dealloc);
}

- (void)startDetectingWithDuration:(double)a3 completion:(id)a4
{
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *nearbyInfoDiscovery;
  SFDeviceDiscovery *v8;
  void *v9;
  SFDeviceDiscovery *v10;
  void *v11;
  SFDeviceDiscovery *v12;
  void *v13;
  SFDeviceDiscovery *v14;
  void *v15;
  id v16;

  v16 = a4;
  if (self->_isDetecting)
    -[PKProximityDetector endDetecting](self, "endDetecting");
  -[PKProximityDetector _createPowerAssertion](self, "_createPowerAssertion");
  v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)getSFDeviceDiscoveryClass[0]());
  nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
  self->_nearbyInfoDiscovery = v6;

  if (self->_advertisingDeviceUUID)
  {
    v8 = self->_nearbyInfoDiscovery;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceDiscovery setDeviceFilter:](v8, "setDeviceFilter:", v9);

  }
  -[SFDeviceDiscovery setDiscoveryFlags:](self->_nearbyInfoDiscovery, "setDiscoveryFlags:", 1);
  -[SFDeviceDiscovery setScanRate:](self->_nearbyInfoDiscovery, "setScanRate:", 50);
  v10 = self->_nearbyInfoDiscovery;
  -[PKProximityDetector _createDeviceFoundBlockWithName:](self, "_createDeviceFoundBlockWithName:", CFSTR("NearbyInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceDiscovery setDeviceFoundHandler:](v10, "setDeviceFoundHandler:", v11);

  v12 = self->_nearbyInfoDiscovery;
  -[PKProximityDetector _createDeviceLostBlockWithName:](self, "_createDeviceLostBlockWithName:", CFSTR("NearbyInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceDiscovery setDeviceLostHandler:](v12, "setDeviceLostHandler:", v13);

  -[SFDeviceDiscovery setOverrideScreenOff:](self->_nearbyInfoDiscovery, "setOverrideScreenOff:", 1);
  self->_isDetecting = 1;
  v14 = self->_nearbyInfoDiscovery;
  -[PKProximityDetector _createDiscoveryActivationBlockWithName:duration:completion:](self, "_createDiscoveryActivationBlockWithName:duration:completion:", CFSTR("NearbyInfo"), v16, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceDiscovery activateWithCompletion:](v14, "activateWithCompletion:", v15);

}

- (id)_createDeviceFoundBlockWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  PKProximityDetector *v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__PKProximityDetector__createDeviceFoundBlockWithName___block_invoke;
  v12 = &unk_1E2AD5890;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v5 = v4;
  v14 = v5;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __55__PKProximityDetector__createDeviceFoundBlockWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "advertisingDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) && *((_QWORD *)WeakRetained + 8))
  {
    PKLogFacilityTypeGetObject(8uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ device discovery detected device nearby: %@", (uint8_t *)&v11, 0x16u);

    }
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 8) + 16))();
    *((_BYTE *)WeakRetained + 16) = 1;
  }

}

- (id)_createDeviceLostBlockWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  PKProximityDetector *v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__PKProximityDetector__createDeviceLostBlockWithName___block_invoke;
  v12 = &unk_1E2AD5890;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v5 = v4;
  v14 = v5;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __54__PKProximityDetector__createDeviceLostBlockWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "advertisingDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) && *((_QWORD *)WeakRetained + 8))
  {
    PKLogFacilityTypeGetObject(8uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ device discovery lost device nearby: %@", (uint8_t *)&v11, 0x16u);

    }
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 8) + 16))();
    *((_BYTE *)WeakRetained + 16) = 0;
  }

}

- (id)_createDiscoveryActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  PKProximityDetector *v19;
  id v20;
  id v21;
  id v22[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke;
  v18 = &unk_1E2AD58E0;
  v19 = self;
  v10 = v8;
  v20 = v10;
  objc_copyWeak(v22, &location);
  v22[1] = *(id *)&a4;
  v11 = v9;
  v21 = v11;
  v12 = _Block_copy(&v15);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  return v13;
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12[2];

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2;
  v7[3] = &unk_1E2AD58B8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v10 = *(_QWORD *)(a1 + 32);
  v12[1] = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 48);
  dispatch_async(v5, v7);

  objc_destroyWeak(v12);
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  dispatch_source_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD handler[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  PKLogFacilityTypeGetObject(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v2, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Failed to activate %@ proximate device discovery: %@", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_queue_endDetecting");

  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Activated %@ proximate device discovery for paired device: %@", buf, 0x16u);
    }

    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 32));
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
    if (v13)
    {
      v14 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 72) * 1000000000.0));
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 48));
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_14;
      handler[3] = &unk_1E2AC3648;
      objc_copyWeak(&v22, (id *)buf);
      dispatch_source_set_event_handler(v15, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 48) + 24));
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  v16 = *(void **)(a1 + 56);
  if (v16)
  {
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2_16;
    block[3] = &unk_1E2ABDA18;
    v20 = v16;
    v19 = *(id *)(a1 + 32);
    dispatch_async(v17, block);

  }
}

void __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "endDetecting");
    WeakRetained = v2;
  }

}

uint64_t __83__PKProximityDetector__createDiscoveryActivationBlockWithName_duration_completion___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_queue_endDetecting
{
  NSObject *timer;
  OS_dispatch_source *v4;
  id handler;
  NSObject *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoveryQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  if (self->_powerAssertionIdentifier)
    -[PKProximityDetector _endPowerAssertion](self, "_endPowerAssertion");
  -[SFDeviceDiscovery invalidate](self->_nearbyInfoDiscovery, "invalidate");
  handler = self->_handler;
  self->_handler = 0;

  self->_isDetecting = 0;
  PKLogFacilityTypeGetObject(8uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Deactivated proximate device discovery", v7, 2u);
  }

}

- (void)endDetecting
{
  NSObject *discoveryQueue;
  _QWORD block[5];

  discoveryQueue = self->_discoveryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PKProximityDetector_endDetecting__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(discoveryQueue, block);
}

uint64_t __35__PKProximityDetector_endDetecting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endDetecting");
}

- (void)_createPowerAssertion
{
  void *v3;
  const __CFDictionary *v4;
  NSObject *v5;
  uint8_t v6[4];
  IOPMAssertionID AssertionID;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  AssertionID = 0;
  v8[0] = CFSTR("AssertType");
  v8[1] = CFSTR("AssertLevel");
  v9[0] = CFSTR("PreventUserIdleSystemSleep");
  v9[1] = &unk_1E2C3F370;
  v9[2] = CFSTR("Apple Pay Discovery Request: BT");
  v8[2] = CFSTR("AssertName");
  v8[3] = CFSTR("TimeoutSeconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (!IOPMAssertionCreateWithProperties(v4, &AssertionID))
  {
    self->_powerAssertionIdentifier = AssertionID;
    PKLogFacilityTypeGetObject(8uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Created power assertion for sharing broadcast", v6, 2u);
    }

  }
}

- (void)_endPowerAssertion
{
  IOPMAssertionID powerAssertionIdentifier;

  powerAssertionIdentifier = self->_powerAssertionIdentifier;
  if (powerAssertionIdentifier)
    IOPMAssertionRelease(powerAssertionIdentifier);
}

- (NSUUID)advertisingDeviceUUID
{
  return self->_advertisingDeviceUUID;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isDetecting
{
  return self->_isDetecting;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_advertisingDeviceUUID, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDiscovery, 0);
}

@end
