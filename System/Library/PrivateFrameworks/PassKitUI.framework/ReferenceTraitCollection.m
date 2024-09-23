@implementation ReferenceTraitCollection

uint64_t __ReferenceTraitCollection_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredContentSizeCategory:", *(_QWORD *)(a1 + 32));
}

@end
