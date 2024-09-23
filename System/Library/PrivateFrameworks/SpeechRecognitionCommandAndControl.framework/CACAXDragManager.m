@implementation CACAXDragManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CACAXDragManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_3 != -1)
    dispatch_once(&sharedManager_onceToken_3, block);
  return (id)sharedManager_SharedManager;
}

void __33__CACAXDragManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithMachServiceName:", *MEMORY[0x24BE00048]);
  v3 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = v2;

}

@end
