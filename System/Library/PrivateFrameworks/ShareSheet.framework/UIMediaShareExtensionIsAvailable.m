@implementation UIMediaShareExtensionIsAvailable

intptr_t ___UIMediaShareExtensionIsAvailable_block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
