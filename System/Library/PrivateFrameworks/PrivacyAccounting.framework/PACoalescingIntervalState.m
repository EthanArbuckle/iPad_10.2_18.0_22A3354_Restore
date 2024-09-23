@implementation PACoalescingIntervalState

- (PAAccessInterval)interval
{
  return self->_interval;
}

- (void)touch
{
  uint64_t (**v3)(void);
  unint64_t v4;
  double v5;
  NSObject *endTimer;
  unint64_t v7;
  dispatch_time_t v8;

  -[PACoalescingIntervalState clock](self, "clock");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  self->_startTimes.absolute = v3[2]();
  self->_startTimes.continuous = v4;

  self->_lastCoalescedTime = self->_startTimes.absolute;
  -[PACoalescingIntervalState intervalEndTime](self, "intervalEndTime");
  endTimer = self->_endTimer;
  if (endTimer)
  {
    v7 = (unint64_t)(v5 * 1000000000.0);
    v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(endTimer, v8, 0xFFFFFFFFFFFFFFFFLL, v7 >> 2);
  }
}

__uint64_t __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke()
{
  __uint64_t v0;

  v0 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  return v0;
}

- (double)intervalEndTime
{
  return self->_intervalEndTime;
}

- (id)clock
{
  return self->_clock;
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5 expiry:(double)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  PACoalescingIntervalState *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id from;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  objc_msgSend(v12, "intervalEndTime");
  v14 = v13;
  objc_msgSend(v12, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke_2;
  v20[3] = &unk_1E4FA5138;
  objc_copyWeak(&v22, &from);
  objc_copyWeak(&v23, &location);
  v17 = v11;
  v21 = v17;
  v18 = -[PACoalescingIntervalState initWithInterval:intervalExpirationTime:expiryQueue:clock:onExpiration:expiry:](self, "initWithInterval:intervalExpirationTime:expiryQueue:clock:onExpiration:expiry:", v10, v16, &__block_literal_global_5, v20, v14, a6);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v18;
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5
{
  return -[PACoalescingIntervalState initWithInterval:matcher:tracker:expiry:](self, "initWithInterval:matcher:tracker:expiry:", a3, a4, a5, -1.0);
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7 expiry:(double)a8
{
  id v15;
  NSObject *v16;
  uint64_t (**v17)(_QWORD);
  id v18;
  PACoalescingIntervalState *v19;
  PACoalescingIntervalState *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id clock;
  dispatch_source_t v25;
  OS_dispatch_source *sigTermSource;
  dispatch_source_t v27;
  OS_dispatch_source *endTimer;
  dispatch_time_t v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id location;
  objc_super v39;

  v15 = a3;
  v16 = a5;
  v17 = (uint64_t (**)(_QWORD))a6;
  v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PACoalescingIntervalState;
  v19 = -[PACoalescingIntervalState init](&v39, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interval, a3);
    v21 = v17[2](v17);
    v20->_startTimes.absolute = v21;
    v20->_startTimes.continuous = v22;
    v20->_lastCoalescedTime = v21;
    v20->_intervalEndTime = a4;
    v23 = _Block_copy(v17);
    clock = v20->_clock;
    v20->_clock = v23;

    objc_initWeak(&location, v20);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__2;
    v36[4] = __Block_byref_object_dispose__2;
    v37 = (id)os_transaction_create();
    signal(15, (void (__cdecl *)(int))1);
    v25 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, v16);
    sigTermSource = v20->_sigTermSource;
    v20->_sigTermSource = (OS_dispatch_source *)v25;

    v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v16);
    endTimer = v20->_endTimer;
    v20->_endTimer = (OS_dispatch_source *)v27;

    if (a8 == -1.0)
      v29 = -1;
    else
      v29 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v20->_endTimer, v29, 0xFFFFFFFFFFFFFFFFLL, 0);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __107__PACoalescingIntervalState_initWithInterval_intervalExpirationTime_expiryQueue_clock_onExpiration_expiry___block_invoke;
    v32[3] = &unk_1E4FA5160;
    objc_copyWeak(&v35, &location);
    v33 = v18;
    v34 = v36;
    v30 = _Block_copy(v32);
    dispatch_source_set_event_handler((dispatch_source_t)v20->_endTimer, v30);
    dispatch_activate((dispatch_object_t)v20->_endTimer);
    dispatch_source_set_event_handler((dispatch_source_t)v20->_sigTermSource, v30);
    dispatch_activate((dispatch_object_t)v20->_sigTermSource);

    objc_destroyWeak(&v35);
    _Block_object_dispose(v36, 8);

    objc_destroyWeak(&location);
  }

  return v20;
}

void __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "expireIntervalWithMatcher:state:", *(_QWORD *)(a1 + 32), WeakRetained);

}

- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7
{
  return -[PACoalescingIntervalState initWithInterval:intervalExpirationTime:expiryQueue:clock:onExpiration:expiry:](self, "initWithInterval:intervalExpirationTime:expiryQueue:clock:onExpiration:expiry:", a3, a5, a6, a7, a4, -1.0);
}

void __107__PACoalescingIntervalState_initWithInterval_intervalExpirationTime_expiryQueue_clock_onExpiration_expiry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[PACoalescingIntervalState invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PACoalescingIntervalState;
  -[PACoalescingIntervalState dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *endTimer;
  OS_dispatch_source *v4;
  NSObject *sigTermSource;
  OS_dispatch_source *v6;

  endTimer = self->_endTimer;
  if (endTimer)
  {
    dispatch_source_cancel(endTimer);
    v4 = self->_endTimer;
    self->_endTimer = 0;

  }
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel(sigTermSource);
    v6 = self->_sigTermSource;
    self->_sigTermSource = 0;

  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  PAAccessInterval *interval;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  interval = self->_interval;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PACoalescingIntervalState idleTime](self, "idleTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p interval:%@ idleTime:%@>"), v4, self, interval, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)idleTime
{
  uint64_t (**v3)(void);
  unint64_t v4;

  -[PACoalescingIntervalState clock](self, "clock");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = (v3[2]() - self->_lastCoalescedTime) / 0x3E8;

  return (double)v4 / 1000000.0;
}

- (double)timestampAdjustment
{
  void (**v3)(void);
  uint64_t v4;
  uint64_t v5;

  -[PACoalescingIntervalState clock](self, "clock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v5 = v4;

  return (double)((v5 + self->_startTimes.absolute - (self->_startTimes.continuous + self->_lastCoalescedTime)) / 0x3E8)
       / -1000000.0;
}

- (void)setIntervalEndTime:(double)a3
{
  self->_intervalEndTime = a3;
}

- (NSSet)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_accessCount = a3;
}

- (void)setClock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clock, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_endTimer, 0);
}

@end
