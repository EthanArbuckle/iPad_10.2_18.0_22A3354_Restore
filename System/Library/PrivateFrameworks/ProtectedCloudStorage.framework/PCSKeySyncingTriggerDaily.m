@implementation PCSKeySyncingTriggerDaily

intptr_t __PCSKeySyncingTriggerDaily_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __PCSKeySyncingTriggerDaily_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
