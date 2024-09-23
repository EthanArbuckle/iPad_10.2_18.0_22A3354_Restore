@implementation LoadIconForAppID

intptr_t ___LoadIconForAppID_block_invoke(uint64_t a1, CGImageRef image)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGImageRetain(image);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
