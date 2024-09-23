@implementation RTSemaphoreWait

uint64_t ___RTSemaphoreWait_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("RT"));
}

@end
