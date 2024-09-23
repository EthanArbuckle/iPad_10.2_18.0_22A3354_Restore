@implementation PDSetUserSpecifiedDefaultPaymentPassUniqueIdentifier

uint64_t __PDSetUserSpecifiedDefaultPaymentPassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("PDUserSpecifiedDefaultPaymentPassUniqueIdentifierKey"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.passd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
