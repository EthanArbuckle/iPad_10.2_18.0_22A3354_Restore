@implementation ZN5dyld45Atlas7ProcessD2Ev

NSObject *___ZN5dyld45Atlas7ProcessD2Ev_block_invoke(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(a1 + 32);
  if (LODWORD(result[5].isa) == 1)
    return dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)result);
  return result;
}

@end
