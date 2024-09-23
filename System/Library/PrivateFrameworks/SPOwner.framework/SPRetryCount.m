@implementation SPRetryCount

- (SPRetryCount)init
{
  SPRetryCount *v2;
  SPRetryCount *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPRetryCount;
  v2 = -[SPRetryCount init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_retryCount = 0;
    v4 = dispatch_queue_create("com.apple.SPOwner.retryCountQueue", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (double)decayWaitInterval
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SPRetryCount serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SPRetryCount_decayWaitInterval__block_invoke;
  v6[3] = &unk_1E5E16AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__SPRetryCount_decayWaitInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_decayedWaitIntervalForRetryCount:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)increment
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SPRetryCount serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__SPRetryCount_increment__block_invoke;
  v4[3] = &unk_1E5E16B08;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __25__SPRetryCount_increment__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1);
    WeakRetained = v2;
  }

}

- (void)reset
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SPRetryCount serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __21__SPRetryCount_reset__block_invoke;
  v4[3] = &unk_1E5E16B08;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __21__SPRetryCount_reset__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setRetryCount:", 0);
    WeakRetained = v2;
  }

}

- (double)_decayedWaitIntervalForRetryCount:(unint64_t)a3
{
  double result;

  result = exp2((double)a3);
  if (result > 60.0)
    return 60.0;
  return result;
}

- (void)setDecayWaitInterval:(double)a3
{
  self->_decayWaitInterval = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

@end
