@implementation PDLastPaymentPassInsertionOrRemovalDate

void __PDLastPaymentPassInsertionOrRemovalDate_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;

  v2 = CFPreferencesCopyValue(CFSTR("PDLastPaymentPassInsertionOrRemovalDate"), CFSTR("com.apple.passd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
