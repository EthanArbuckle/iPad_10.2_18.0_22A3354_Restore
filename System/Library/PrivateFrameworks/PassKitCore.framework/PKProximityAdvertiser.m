@implementation PKProximityAdvertiser

- (PKProximityAdvertiser)init
{
  PKProximityAdvertiser *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *timerQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *advertiserQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKProximityAdvertiser;
  v2 = -[PKProximityAdvertiser init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PKProximityAdvertiserTimerQueue", 0);
    timerQueue = v2->_timerQueue;
    v2->_timerQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("PKProximityAdvertiserQueue", 0);
    advertiserQueue = v2->_advertiserQueue;
    v2->_advertiserQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKProximityAdvertiser endAdvertising](self, "endAdvertising");
  v3.receiver = self;
  v3.super_class = (Class)PKProximityAdvertiser;
  -[PKProximityAdvertiser dealloc](&v3, sel_dealloc);
}

- (void)startAdvertisingForDuration:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *advertiserQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  if (self->_isAdvertising)
    -[PKProximityAdvertiser endAdvertising](self, "endAdvertising");
  advertiserQueue = self->_advertiserQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKProximityAdvertiser_startAdvertisingForDuration_completion___block_invoke;
  block[3] = &unk_1E2ABE198;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(advertiserQueue, block);

}

void __64__PKProximityAdvertiser_startAdvertisingForDuration_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v2 = objc_alloc_init(_MergedGlobals_175());
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAdvertiseRate:", 60);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  off_1ECF21B60();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setOverrideScreenOff:", 1);
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[1];
  objc_msgSend(v7, "_createAdvertisingActivationBlockWithName:duration:completion:", CFSTR("NearbyInfo"), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateWithCompletion:", v9);

}

- (id)_createAdvertisingActivationBlockWithName:(id)a3 duration:(double)a4 completion:(id)a5
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
  PKProximityAdvertiser *v19;
  id v20;
  id v21;
  double v22;

  v8 = a3;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke;
  v18 = &unk_1E2ACB940;
  v19 = self;
  v20 = v8;
  v22 = a4;
  v21 = v9;
  v10 = v9;
  v11 = v8;
  v12 = _Block_copy(&v15);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  return v13;
}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2;
  block[3] = &unk_1E2ACA840;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v14 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  v8 = v3;
  dispatch_sync(v5, block);

}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Error activating %@ sharing broadcast: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_queue_endAdvertising");
  }
  else
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Activated %@ sharing broadcast", buf, 0xCu);
    }

    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 24));
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

    v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
    if (v11)
    {
      v12 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 48));
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_12;
      handler[3] = &unk_1E2AC3648;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 48) + 16));
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2_13;
    block[3] = &unk_1E2ABDA18;
    v18 = v14;
    v17 = *(id *)(a1 + 32);
    dispatch_async(v15, block);

  }
}

void __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "endAdvertising");
    WeakRetained = v2;
  }

}

uint64_t __87__PKProximityAdvertiser__createAdvertisingActivationBlockWithName_duration_completion___block_invoke_2_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_queue_endAdvertising
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSObject *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_advertiserQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  self->_isAdvertising = 0;
  -[SFService invalidate](self->_nearbyInfoSharingService, "invalidate");
  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated sharing broadcast", v6, 2u);
  }

}

- (void)endAdvertising
{
  NSObject *advertiserQueue;
  _QWORD block[5];

  advertiserQueue = self->_advertiserQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKProximityAdvertiser_endAdvertising__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(advertiserQueue, block);
}

uint64_t __39__PKProximityAdvertiser_endAdvertising__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endAdvertising");
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertiserQueue, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoSharingService, 0);
}

@end
