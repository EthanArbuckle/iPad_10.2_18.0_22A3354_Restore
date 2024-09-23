@implementation AXSShouldLoadInvertBundles

void ___AXSShouldLoadInvertBundles_block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    if (_AXSProcessIsSpringBoard_onceToken != -1)
      dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_1634);
    if ((_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard & 1) == 0)
    {
      v0 = (void *)CFPreferencesCopyValue(CFSTR("AXSSystemUIProcessAppSmartInvertEnabledPreference"), (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        _kAXSystemUIProcessShouldLoadInvertBundles = objc_msgSend(v0, "BOOLValue");
      AXLogInvertColorsLoadBundles();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _kAXSystemUIProcessShouldLoadInvertBundles);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = 138412290;
        v4 = v2;
        _os_log_impl(&dword_18F1A7000, v1, OS_LOG_TYPE_DEFAULT, "SystemUIProcessShouldLoadInvertBundles: %@", (uint8_t *)&v3, 0xCu);

      }
    }
  }
}

@end
