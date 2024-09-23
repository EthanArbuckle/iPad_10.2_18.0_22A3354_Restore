@implementation PDExpressPassesInformation

void __PDExpressPassesInformation_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;
  CFPropertyListRef v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v2 = CFPreferencesCopyAppValue(CFSTR("PDExpressPasses"), CFSTR("com.apple.stockholm"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = CFPreferencesCopyAppValue(CFSTR("PDExpressPasses"), CFSTR("com.apple.passd"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (PKRunningInPassd())
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Migrating expressPassesInformation to com.apple.stockholm domain", v11, 2u);
        }

        _PDSetExpressPassesInformation(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        CFPreferencesSetAppValue(CFSTR("PDExpressPasses"), 0, CFSTR("com.apple.passd"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.passd"));
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

@end
