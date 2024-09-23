@implementation PDSetLastPaymentPassInsertionOrRemovalDate

uint64_t __PDSetLastPaymentPassInsertionOrRemovalDate_block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("PDLastPaymentPassInsertionOrRemovalDate"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.passd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
