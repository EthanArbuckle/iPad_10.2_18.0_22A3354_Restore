@implementation UIApplicationUsesAlternateFont

void ___UIApplicationUsesAlternateFont_block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  char v3;
  void *v4;

  if (os_variant_has_internal_diagnostics())
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("UIUseAlternateFont"), (CFStringRef)*MEMORY[0x1E0C9B228]);
    v1 = (void *)v0;
    if (v0)
    {
      v4 = (void *)v0;
      v2 = objc_opt_respondsToSelector();
      v1 = v4;
      if ((v2 & 1) != 0)
      {
        v3 = objc_msgSend(v4, "BOOLValue");
        v1 = v4;
        byte_1EDDC8026 = v3;
      }
    }

  }
}

@end
