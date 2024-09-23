@implementation PXSharedLibrarySendAnalyticsForUserAction

void ___PXSharedLibrarySendAnalyticsForUserAction_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D09910];
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = CFSTR("action");
  v10[1] = CFSTR("suggestedBy");
  v11[0] = v5;
  v11[1] = a2;
  v10[2] = CFSTR("assetsCount");
  v11[2] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.sharedlibrary.userActionOnAssets"), v9);

}

@end
