@implementation WFActionGreenTeaContentDestinationMayLeaveDevice

void __WFActionGreenTeaContentDestinationMayLeaveDevice_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0DC7EE8];
  v5[0] = *MEMORY[0x1E0DC7EB0];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)WFActionGreenTeaContentDestinationMayLeaveDevice_exfiltratingAppBundleIdentifier;
  WFActionGreenTeaContentDestinationMayLeaveDevice_exfiltratingAppBundleIdentifier = v3;

}

void __WFActionGreenTeaContentDestinationMayLeaveDevice_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.shortcuts.airdropDestination");
  v4[1] = CFSTR("com.apple.shortcuts.appleScriptDestination");
  v4[2] = CFSTR("com.apple.shortcuts.javaScriptForAutomationDestination");
  v4[3] = CFSTR("com.apple.shortcuts.printDestination");
  v4[4] = CFSTR("com.apple.shortcuts.shareExtensionDestination");
  v4[5] = CFSTR("com.apple.shortcuts.shellDestination");
  v4[6] = CFSTR("com.apple.shortcuts.webpagesDestination");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)WFActionGreenTeaContentDestinationMayLeaveDevice_dataLeavingContentDestination;
  WFActionGreenTeaContentDestinationMayLeaveDevice_dataLeavingContentDestination = v2;

}

@end
