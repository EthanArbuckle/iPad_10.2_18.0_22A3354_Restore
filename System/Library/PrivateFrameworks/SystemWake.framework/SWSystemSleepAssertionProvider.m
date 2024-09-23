@implementation SWSystemSleepAssertionProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SWSystemSleepAssertionProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_253DA1598 != -1)
    dispatch_once(&qword_253DA1598, block);
  return (id)_MergedGlobals_1;
}

void __48__SWSystemSleepAssertionProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v1;

}

- (id)acquirePreventSystemSleepAssertionWithIdentifier:(id)a3
{
  id v3;
  SWPreventSystemSleepAssertion *v4;

  v3 = a3;
  v4 = -[SWPreventSystemSleepAssertion initWithIdentifier:]([SWPreventSystemSleepAssertion alloc], "initWithIdentifier:", v3);
  -[SWPreventSystemSleepAssertion acquireWithTimeout:handler:](v4, "acquireWithTimeout:handler:", 0, 0.0);

  return v4;
}

- (id)acquireSystemActivityAssertionWithIdentifier:(id)a3
{
  id v3;
  SWSystemActivityAssertion *v4;

  v3 = a3;
  v4 = -[SWSystemActivityAssertion initWithIdentifier:]([SWSystemActivityAssertion alloc], "initWithIdentifier:", v3);
  -[SWSystemActivityAssertion acquireWithTimeout:handler:](v4, "acquireWithTimeout:handler:", 0, 0.0);

  return v4;
}

@end
