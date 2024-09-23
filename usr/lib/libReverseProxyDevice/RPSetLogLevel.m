@implementation RPSetLogLevel

NSObject *___RPSetLogLevel_block_invoke(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    result = dispatch_semaphore_signal(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

@end
