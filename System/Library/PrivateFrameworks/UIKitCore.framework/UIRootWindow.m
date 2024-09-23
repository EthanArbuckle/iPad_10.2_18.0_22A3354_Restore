@implementation UIRootWindow

void __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_visibilityLock_enqueueUpdateIfNecessary_body");
  objc_autoreleasePoolPop(v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke_2;
  block[3] = &unk_1E16B14C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
