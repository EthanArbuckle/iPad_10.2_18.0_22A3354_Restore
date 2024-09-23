@implementation PKCreateAlertControllerForNFCRadioDisabled

void __PKCreateAlertControllerForNFCRadioDisabled_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=NFC_LINK"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  objc_msgSend(v1, "setSensitive:", 1);
  v3 = *MEMORY[0x1E0D22D88];
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFrontBoardOptions:", v2);

  PKOpenApplication(v0, v1);
}

@end
