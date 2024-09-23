@implementation CNContact

void __66__CNContact_SafariSharedExtras__safari_oneTimeCodeViewDescriptors__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966C0];
  v6[0] = *MEMORY[0x1E0C966D0];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0C967B8];
  v6[2] = *MEMORY[0x1E0C96780];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0C96708];
  v6[4] = *MEMORY[0x1E0C967C0];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E0C96890];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)safari_oneTimeCodeViewDescriptors_descriptors;
  safari_oneTimeCodeViewDescriptors_descriptors = v4;

}

@end
