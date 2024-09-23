@implementation TIGetHardwareKeyboardSupport

void __TIGetHardwareKeyboardSupport_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(&unk_1E24C0210, "objectForKey:", CFSTR("HardwareKeyboardSupport.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIGetHardwareKeyboardSupport___hardwareSupport;
  TIGetHardwareKeyboardSupport___hardwareSupport = v0;

  if (!TIGetHardwareKeyboardSupport___hardwareSupport)
  {
    TIGetTextInputFrameworkPath();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TILoadBundlePlist(CFSTR("HardwareKeyboardSupport.plist"), v4);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)TIGetHardwareKeyboardSupport___hardwareSupport;
    TIGetHardwareKeyboardSupport___hardwareSupport = v2;

  }
}

@end
