@implementation PDDefaultPaymentPassUniqueIdentifier

void __PDDefaultPaymentPassUniqueIdentifier_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;
  CFPropertyListRef v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = CFPreferencesCopyValue(CFSTR("PDDefaultPaymentPassUniqueIdentifier"), CFSTR("com.apple.passd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = CFPreferencesCopyAppValue(CFSTR("PDDefaultPaymentPassUniqueIdentifier"), CFSTR("com.apple.passd"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

@end
