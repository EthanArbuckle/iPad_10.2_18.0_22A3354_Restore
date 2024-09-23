@implementation RCTestBlockForProtocol

uint64_t __RCTestBlockForProtocol_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

@end
