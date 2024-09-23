@implementation RCComputeFileDigest

uint64_t __RCComputeFileDigest_block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, len);
}

@end
