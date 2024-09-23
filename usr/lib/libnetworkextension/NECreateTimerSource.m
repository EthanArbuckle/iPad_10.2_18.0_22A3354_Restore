@implementation NECreateTimerSource

void __NECreateTimerSource_block_invoke(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_release(v1);
}

@end
