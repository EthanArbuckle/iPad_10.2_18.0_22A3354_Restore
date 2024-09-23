@implementation PDSetLastUsedInAppFundingSource

void __PDSetLastUsedInAppFundingSource_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("PDLastUsedInAppFundingSourceKey"), CFSTR("com.apple.passd"));
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v5;

  objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_msgSend(v7, "copy");
  CFPreferencesSetAppValue(CFSTR("PDLastUsedInAppFundingSourceKey"), v6, CFSTR("com.apple.passd"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
}

@end
