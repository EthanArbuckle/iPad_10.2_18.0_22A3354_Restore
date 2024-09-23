@implementation PDUserSpecifiedDefaultPaymentPassUniqueIdentifier

void __PDUserSpecifiedDefaultPaymentPassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = CFPreferencesCopyAppValue(CFSTR("PDUserSpecifiedDefaultPaymentPassUniqueIdentifierKey"), CFSTR("com.apple.passd"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

@end
