@implementation PXSharedLibrarySharingSuggestionsBannerConfiguration

void __PXSharedLibrarySharingSuggestionsBannerConfiguration_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PXBannerViewConfiguration *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySuggestionsBannerTitle_iOS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0uLL;
  v19 = 0;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "detailedUnreadCounts");
    if ((_QWORD)v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySuggestionsBannerSubtitlePlaceholder"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = *((_QWORD *)&v18 + 1);
    v4 = v19;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  v16 = v18;
  v17 = v19;
  PXLocalizedStringForDetailedCountsWithUsage(&v16, 1);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v7 = (void *)v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __PXSharedLibrarySharingSuggestionsBannerConfiguration_block_invoke_3;
  aBlock[3] = &unk_1E512E700;
  v15 = *(id *)(a1 + 32);
  v8 = _Block_copy(aBlock);
  v9 = [PXBannerViewConfiguration alloc];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySuggestionsBannerActionReview"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySuggestionsBannerActionNotNow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXBannerViewConfiguration initWithTitle:subtitle:actionButtonTitle:cancelButtonTitle:actionButtonHandler:cancelButtonHandler:primaryActionIdentifier:cancelActionIdentifier:](v9, "initWithTitle:subtitle:actionButtonTitle:cancelButtonTitle:actionButtonHandler:cancelButtonHandler:primaryActionIdentifier:cancelActionIdentifier:", v2, v7, v10, v11, &__block_literal_global_151759, v8, 0, 0);
  v13 = (void *)PXSharedLibrarySharingSuggestionsBannerConfiguration_config;
  PXSharedLibrarySharingSuggestionsBannerConfiguration_config = v12;

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.sharedLibrary.suggestionsBanner.presented"), MEMORY[0x1E0C9AA70]);
}

uint64_t __PXSharedLibrarySharingSuggestionsBannerConfiguration_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "markAnyNotificationsAsRead");
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.sharedLibrary.suggestionsBanner.dismissed"), MEMORY[0x1E0C9AA70]);
}

uint64_t __PXSharedLibrarySharingSuggestionsBannerConfiguration_block_invoke_2()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_navigateToForYouRevealingSharedLibrarySharingSuggestionsWithCompletionHandler:", 0);

  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.sharedLibrary.suggestionsBanner.reviewed"), MEMORY[0x1E0C9AA70]);
}

@end
