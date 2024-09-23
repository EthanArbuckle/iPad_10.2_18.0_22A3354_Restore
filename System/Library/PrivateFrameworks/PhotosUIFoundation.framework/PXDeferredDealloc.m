@implementation PXDeferredDealloc

void __PXDeferredDealloc_block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = PXDeferredDealloc_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __PXDeferredDealloc_block_invoke_3;
  block[3] = &unk_2514D11A8;
  v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

}

uint64_t __PXDeferredDealloc_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hash");
}

void __PXDeferredDealloc_block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial("com.apple.PXDeferredDealloc", QOS_CLASS_UTILITY);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PXDeferredDealloc_queue;
  PXDeferredDealloc_queue = v0;

}

@end
