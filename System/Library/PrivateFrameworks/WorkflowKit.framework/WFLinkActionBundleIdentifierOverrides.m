@implementation WFLinkActionBundleIdentifierOverrides

void __WFLinkActionBundleIdentifierOverrides_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC7E98];
  v4[0] = CFSTR("com.apple.springboard.OpenCamera");
  v4[1] = CFSTR("com.apple.AccessibilityUIServer.WFGetAppSettingAction");
  v1 = *MEMORY[0x1E0DC7F30];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = CFSTR("com.apple.AccessibilityUIServer.WFAppSettingEntityUpdaterAction");
  v5[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)WFLinkActionBundleIdentifierOverrides_linkActionBundleIdentifierOverrides;
  WFLinkActionBundleIdentifierOverrides_linkActionBundleIdentifierOverrides = v2;

}

@end
