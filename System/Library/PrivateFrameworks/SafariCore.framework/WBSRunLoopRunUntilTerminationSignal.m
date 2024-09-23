@implementation WBSRunLoopRunUntilTerminationSignal

void __WBSRunLoopRunUntilTerminationSignal_block_invoke(uint64_t a1)
{
  CFRunLoopStop(*(CFRunLoopRef *)(a1 + 32));
}

@end
