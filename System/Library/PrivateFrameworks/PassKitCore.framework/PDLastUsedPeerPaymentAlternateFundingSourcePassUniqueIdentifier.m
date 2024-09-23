@implementation PDLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier

void __PDLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;

  v2 = CFPreferencesCopyAppValue(CFSTR("PDLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier"), CFSTR("com.apple.passd"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
