@implementation SBCAContextForContextID

BOOL __SBCAContextForContextID_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextId") == *(_DWORD *)(a1 + 32);
}

@end
