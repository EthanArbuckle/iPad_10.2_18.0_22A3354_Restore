@implementation PDSetDefaultPaymentPassUniqueIdentifier

uint64_t __PDSetDefaultPaymentPassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("PDDefaultPaymentPassUniqueIdentifier"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.passd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
