@implementation PSIsRunningInAssistant

void __PSIsRunningInAssistant_block_invoke()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (_QWORD *)getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
  v8 = getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
  if (!getBYSetupAssistantBundleIdentifierSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke;
    v4[3] = &unk_1E4A65650;
    v4[4] = &v5;
    __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (_QWORD *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  PSIsRunningInAssistant_isRunningInAssistant = objc_msgSend(v1, "isEqualToString:", *v2);

}

@end
