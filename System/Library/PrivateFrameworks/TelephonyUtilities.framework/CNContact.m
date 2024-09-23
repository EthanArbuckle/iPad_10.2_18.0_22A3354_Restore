@implementation CNContact

void __54__CNContact_TUSearchUtilities__keysToFetchForFaceTime__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v6[0] = v0;
  v6[1] = v1;
  v2 = *MEMORY[0x1E0C967C0];
  v6[2] = *MEMORY[0x1E0C96890];
  v6[3] = v2;
  v3 = *MEMORY[0x1E0C96680];
  v6[4] = *MEMORY[0x1E0C966A8];
  v6[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)keysToFetchForFaceTime_keysToFetchForFaceTime;
  keysToFetchForFaceTime_keysToFetchForFaceTime = v4;

}

@end
