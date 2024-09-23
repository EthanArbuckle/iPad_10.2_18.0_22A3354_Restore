@implementation KeychainCopyIdentities

void __KeychainCopyIdentities_block_invoke(uint64_t a1, const void *a2)
{
  __CFDictionary *v3;
  const void *PublicKey;

  v3 = *(__CFDictionary **)(a1 + 32);
  PublicKey = (const void *)PCSIdentityGetPublicKey((uint64_t)a2);
  CFDictionarySetValue(v3, PublicKey, a2);
}

@end
