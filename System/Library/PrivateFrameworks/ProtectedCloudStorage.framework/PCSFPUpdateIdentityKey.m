@implementation PCSFPUpdateIdentityKey

void ___PCSFPUpdateIdentityKey_block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  const void *PublicKey;

  PublicKey = (const void *)PCSIdentityGetPublicKey(a3);
  if (!CFEqual(a2, PublicKey))
    abort();
  if (!CFEqual(a2, *(CFTypeRef *)(a1 + 32)))
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), a2);
}

@end
