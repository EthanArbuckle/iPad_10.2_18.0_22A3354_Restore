@implementation KeychainCopyOrderedIdentities

void __KeychainCopyOrderedIdentities_block_invoke(uint64_t a1, int a2, CFTypeRef cf2)
{
  CFTypeRef v5;

  v5 = *(CFTypeRef *)(a1 + 40);
  if (cf2 && v5)
  {
    if (CFEqual(v5, cf2))
      return;
  }
  else if (v5 == cf2)
  {
    return;
  }
  if (_PCSIdentityValidate((uint64_t)cf2, (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), cf2);
  }
}

@end
