@implementation TSDClearCGContextInfo

uint64_t __TSDClearCGContextInfo_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

@end
