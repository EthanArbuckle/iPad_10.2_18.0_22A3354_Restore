@implementation RCOperationImmediateRetrySignal

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RCOperationImmediateRetrySignal_onQueue_signal___block_invoke;
  block[3] = &unk_1E470E018;
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);

}

uint64_t __50__RCOperationImmediateRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%p immediate}"), self);
}

@end
