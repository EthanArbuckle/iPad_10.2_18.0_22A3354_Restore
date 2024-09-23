@implementation PKPaymentPreference(PKPaymentPreferenceViewController)

- (uint64_t)supportsInlineEditing
{
  void *v2;
  uint64_t v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "contactKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C967F0]) ^ 1;

  return v3;
}

@end
