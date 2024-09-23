@implementation PKAdditionalSupportedNetworks

void __PKAdditionalSupportedNetworks_block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = CFPreferencesCopyAppValue(CFSTR("PKAdditionalSupportedNetworks"), (CFStringRef)*MEMORY[0x1E0C9B228]);
  v1 = (void *)qword_1ECF21D28;
  qword_1ECF21D28 = (uint64_t)v0;

  if (qword_1ECF21D28)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Additional supported networks have been added to the device! Proceed with caution.", v3, 2u);
    }

  }
}

@end
