@implementation PDSetLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier

uint64_t __PDSetLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("PDLastUsedPeerPaymentAlternateFundingSourcePassUniqueIdentifier"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.passd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
