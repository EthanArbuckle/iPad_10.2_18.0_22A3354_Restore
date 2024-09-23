@implementation ArrayContainsStringIgnoringCase

BOOL ___ArrayContainsStringIgnoringCase_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

@end
