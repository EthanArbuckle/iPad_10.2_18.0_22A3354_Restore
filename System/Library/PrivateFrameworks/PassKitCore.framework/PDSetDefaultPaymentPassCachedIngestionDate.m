@implementation PDSetDefaultPaymentPassCachedIngestionDate

uint64_t __PDSetDefaultPaymentPassCachedIngestionDate_block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("PDDefaultPaymentPassCachedIngestionDate"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.passd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
