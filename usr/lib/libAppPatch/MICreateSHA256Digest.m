@implementation MICreateSHA256Digest

uint64_t __MICreateSHA256Digest_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, a3);
  return 1;
}

@end
