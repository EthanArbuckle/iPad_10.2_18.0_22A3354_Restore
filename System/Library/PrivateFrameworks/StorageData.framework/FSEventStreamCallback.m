@implementation FSEventStreamCallback

uint64_t ___FSEventStreamCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processEvents:", *(_QWORD *)(a1 + 40));
}

@end
