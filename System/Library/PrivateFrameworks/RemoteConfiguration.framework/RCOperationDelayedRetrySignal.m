@implementation RCOperationDelayedRetrySignal

- (RCOperationDelayedRetrySignal)initWithDelay:(double)a3
{
  RCOperationDelayedRetrySignal *v4;
  RCOperationDelayedRetrySignal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCOperationDelayedRetrySignal;
  v4 = -[RCOperationDelayedRetrySignal init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_delay = a3;
    v4->_signalTime = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  return v5;
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6;
  dispatch_time_t signalTime;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a4;
  signalTime = self->_signalTime;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RCOperationDelayedRetrySignal_onQueue_signal___block_invoke;
  block[3] = &unk_1E470E018;
  v10 = v6;
  v8 = v6;
  dispatch_after(signalTime, (dispatch_queue_t)a3, block);

}

uint64_t __48__RCOperationDelayedRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%p delay=%.2f}"), self, *(_QWORD *)&self->_delay);
}

@end
