@implementation AXSAutomationPreferredLocalization

void ___AXSAutomationPreferredLocalization_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  _AXSAutomationPreferredLocalization_loc = (uint64_t)_copyValuePreferenceApp((const __CFString *)kAXSAutomationPreferredLanguagePreference, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("AppleLanguages"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", _AXSAutomationPreferredLocalization_loc);

  if (v2)
  {
    CFRelease((CFTypeRef)_AXSAutomationPreferredLocalization_loc);
    _AXSAutomationPreferredLocalization_loc = 0;
  }

}

@end
