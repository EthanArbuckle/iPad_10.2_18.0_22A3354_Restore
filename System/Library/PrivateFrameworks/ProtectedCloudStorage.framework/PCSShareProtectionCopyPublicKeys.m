@implementation PCSShareProtectionCopyPublicKeys

void __PCSShareProtectionCopyPublicKeys_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;

  v4 = PCSIdentityCopyPublicIdentity(a3);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 48), v4);
  if (v4)
    CFRelease(v4);
}

@end
