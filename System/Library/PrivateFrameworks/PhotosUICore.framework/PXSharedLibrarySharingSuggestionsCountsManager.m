@implementation PXSharedLibrarySharingSuggestionsCountsManager

- (void)setIsSuggestionsEnabled:(BOOL)a3
{
  if (self->_isSuggestionsEnabled != a3)
  {
    self->_isSuggestionsEnabled = a3;
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateMostRecentSeenSuggestedAssetAddedDate](self, "_invalidateMostRecentSeenSuggestedAssetAddedDate");
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateMostRecentSuggestedAssetFetchResult](self, "_invalidateMostRecentSuggestedAssetFetchResult");
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateNeedsParticipantSetup](self, "_invalidateNeedsParticipantSetup");
  }
}

- (void)setNeedsParticipantSetup:(BOOL)a3
{
  if (self->_needsParticipantSetup != a3)
  {
    self->_needsParticipantSetup = a3;
    -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 16);
  }
}

uint64_t __70__PXSharedLibrarySharingSuggestionsCountsManager_preferencesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsSuggestionsEnabled");
}

uint64_t __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldShowBanner");
}

uint64_t __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldShowBanner");
}

uint64_t __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldShowBanner");
}

uint64_t __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMostRecentSeenSuggestedAssetAddedDate");
}

- (void)_handleLastBannerDismissDateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_handleLastSeenAddedDateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_handleLastNotificationDateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_handleLastSeenSuggestionsDateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)preferencesDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__PXSharedLibrarySharingSuggestionsCountsManager_preferencesDidChange__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", v2);
}

uint64_t __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenSuggestionsDateDidChange___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__PXSharedLibrarySharingSuggestionsCountsManager__handleLastBannerDismissDateDidChange___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__PXSharedLibrarySharingSuggestionsCountsManager__handleLastNotificationDateDidChange___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__handleLastSeenAddedDateDidChange___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

- (void)_invalidateDetailedUnreadCounts
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDetailedUnreadCounts);

}

- (void)_invalidateHasAnySuggestions
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHasAnySuggestions);

}

- (void)_invalidateMostRecentSuggestedAssetFetchResult
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMostRecentSuggestedAssetFetchResult);

}

uint64_t __71__PXSharedLibrarySharingSuggestionsCountsManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateIsSuggestionsEnabled");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMostRecentSuggestedAssetFetchResult");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasAnySuggestions");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateNeedsParticipantSetup");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMostRecentAddedDateEverSeen");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMostRecentSeenSuggestedAssetAddedDate");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDetailedUnreadCounts");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldShowBanner");
}

- (void)_invalidateIsSuggestionsEnabled
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsSuggestionsEnabled);

}

- (void)_invalidateMostRecentSeenSuggestedAssetAddedDate
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMostRecentSeenSuggestedAssetAddedDate);

}

- (void)_invalidateShouldShowBanner
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldShowBanner);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibrarySharingSuggestionsCountsManager;
  -[PXSharedLibrarySharingSuggestionsCountsManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_invalidateNeedsParticipantSetup
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateNeedsParticipantSetup);

}

- (void)_invalidateMostRecentAddedDateEverSeen
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsCountsManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMostRecentAddedDateEverSeen);

}

- (void)_setNeedsUpdate
{
  -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 0);
}

- (PXSharedLibrarySharingSuggestionsCountsManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  char *v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibrarySharingSuggestionsCountsManager;
  v6 = -[PXSharedLibrarySharingSuggestionsCountsManager init](&v25, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v6, sel__setNeedsUpdate);
    v8 = (void *)*((_QWORD *)v6 + 21);
    *((_QWORD *)v6 + 21) = v7;

    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateIsSuggestionsEnabled);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateMostRecentSuggestedAssetFetchResult);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateHasAnySuggestions);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateNeedsParticipantSetup);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateMostRecentAddedDateEverSeen);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateMostRecentSeenSuggestedAssetAddedDate);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateDetailedUnreadCounts);
    objc_msgSend(*((id *)v6 + 21), "addUpdateSelector:", sel__updateShouldShowBanner);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.photos.sharedLibrary.suggestions-counts-fetch-queue", v9);
    v11 = (void *)*((_QWORD *)v6 + 22);
    *((_QWORD *)v6 + 22) = v10;

    objc_storeStrong((id *)v6 + 18, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v6);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = v12;

    objc_msgSend(*((id *)v6 + 17), "registerChangeObserver:context:", v6, PXSharedLibraryStatusProviderObservationContext_136070);
    *(_OWORD *)(v6 + 184) = *(_OWORD *)off_1E50B7ED8;
    *((_QWORD *)v6 + 25) = *((_QWORD *)off_1E50B7ED8 + 2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__handleLastSeenAddedDateDidChange_, CFSTR("PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__handleLastNotificationDateDidChange_, CFSTR("PFSharedLibrarySuggestionsLastNotificationDateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__handleLastSeenSuggestionsDateDidChange_, CFSTR("PFSharedLibrarySuggestionsLastSeenSuggestionsDateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__handleLastBannerDismissDateDidChange_, CFSTR("PFSharedLibrarySuggestionsLastBannerDismissDateDidChangeNotification"), 0);

    PXRegisterPreferencesObserver(v6);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__PXSharedLibrarySharingSuggestionsCountsManager_initWithPhotoLibrary___block_invoke;
    v23[3] = &unk_1E51479C8;
    v24 = v6;
    objc_msgSend(v24, "performChanges:", v23);
    objc_msgSend((id)objc_opt_class(), "mostRecentUserSeenAddedDateAccessor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadValueAsyncIfNeeded");

    objc_msgSend((id)objc_opt_class(), "lastNotificationDateAccessor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loadValueAsyncIfNeeded");

    objc_msgSend((id)objc_opt_class(), "lastSeenSuggestionsDateAccessor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "loadValueAsyncIfNeeded");

    objc_msgSend((id)objc_opt_class(), "lastBannerDismissDateAccessor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loadValueAsyncIfNeeded");

  }
  return (PXSharedLibrarySharingSuggestionsCountsManager *)v6;
}

+ (id)mostRecentUserSeenAddedDateAccessor
{
  if (mostRecentUserSeenAddedDateAccessor_onceToken != -1)
    dispatch_once(&mostRecentUserSeenAddedDateAccessor_onceToken, &__block_literal_global_136135);
  return (id)mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor;
}

+ (id)lastSeenSuggestionsDateAccessor
{
  if (lastSeenSuggestionsDateAccessor_onceToken != -1)
    dispatch_once(&lastSeenSuggestionsDateAccessor_onceToken, &__block_literal_global_197_136127);
  return (id)lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor;
}

+ (id)lastNotificationDateAccessor
{
  if (lastNotificationDateAccessor_onceToken != -1)
    dispatch_once(&lastNotificationDateAccessor_onceToken, &__block_literal_global_193_136131);
  return (id)lastNotificationDateAccessor_lastNotificationDateAccessor;
}

+ (id)lastBannerDismissDateAccessor
{
  if (lastBannerDismissDateAccessor_onceToken != -1)
    dispatch_once(&lastBannerDismissDateAccessor_onceToken, &__block_literal_global_201);
  return (id)lastBannerDismissDateAccessor_lastBannerDismissDateAccessor;
}

- (void)_updateShouldShowBanner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;

  if (-[PXSharedLibrarySharingSuggestionsCountsManager hasAnySuggestions](self, "hasAnySuggestions"))
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager detailedUnreadCounts](self, "detailedUnreadCounts");
    objc_msgSend((id)objc_opt_class(), "lastNotificationDateAccessor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentValueIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "lastSeenSuggestionsDateAccessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentValueIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && v6)
      objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sharingSuggestionsBannerUnreadCountThreshold");

    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sharingSuggestionsMinimumTimeSinceLastBannerDismiss");
    v12 = v11;

    objc_msgSend((id)objc_opt_class(), "lastBannerDismissDateAccessor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentValueIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if ((v9 & 0x8000000000000000) == 0 && v9 <= 0)
    {
      if (v14 && (objc_msgSend(v14, "timeIntervalSinceNow"), fabs(v16) < v12))
      {
        v15 = 0;
      }
      else
      {
        +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sharingSuggestionsMinimumTimeSinceLastAsset");
        v19 = v18;

        -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentAssetFetchResult](self, "mostRecentAssetFetchResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "creationDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = 1;
        if (v22)
        {
          objc_msgSend(v22, "timeIntervalSinceNow");
          if (fabs(v23) < v19)
            v15 = 0;
        }

      }
    }

    v7 = v15;
  }
  else
  {
    v7 = 0;
  }
  -[PXSharedLibrarySharingSuggestionsCountsManager setShouldShowNotificationBanner:](self, "setShouldShowNotificationBanner:", v7);
}

- (void)setShouldShowNotificationBanner:(BOOL)a3
{
  if (self->_shouldShowNotificationBanner != a3)
  {
    self->_shouldShowNotificationBanner = a3;
    -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 8);
  }
}

- (BOOL)hasAnySuggestions
{
  return self->_hasAnySuggestions;
}

void __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D75948];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateDidChangeNotification"), 0, v5);
}

void __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D75940];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PFSharedLibrarySuggestionsLastSeenSuggestionsDateDidChangeNotification"), 0, v5);
}

void __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D75930];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PFSharedLibrarySuggestionsLastBannerDismissDateDidChangeNotification"), 0, v5);
}

void __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D75938];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PFSharedLibrarySuggestionsLastNotificationDateDidChangeNotification"), 0, v5);
}

- (void)_updateHasAnySuggestions
{
  id v3;

  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentSuggestedAssetFetchResult](self, "mostRecentSuggestedAssetFetchResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionsCountsManager setHasAnySuggestions:](self, "setHasAnySuggestions:", objc_msgSend(v3, "count") != 0);

}

- (void)setHasAnySuggestions:(BOOL)a3
{
  if (self->_hasAnySuggestions != a3)
  {
    self->_hasAnySuggestions = a3;
    -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 1);
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateShouldShowBanner](self, "_invalidateShouldShowBanner");
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateDetailedUnreadCounts](self, "_invalidateDetailedUnreadCounts");
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateNeedsParticipantSetup](self, "_invalidateNeedsParticipantSetup");
  }
}

- (void)_updateMostRecentAddedDateEverSeen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentAddedDateEverSeen](self, "mostRecentAddedDateEverSeen");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentSuggestedAssetFetchResult](self, "mostRecentSuggestedAssetFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v9, "laterDate:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v6;
    }
    v8 = v7;
    -[PXSharedLibrarySharingSuggestionsCountsManager setMostRecentAddedDateEverSeen:](self, "setMostRecentAddedDateEverSeen:", v7);

  }
}

- (NSDate)mostRecentAddedDateEverSeen
{
  return self->_mostRecentAddedDateEverSeen;
}

- (void)_updateMostRecentSuggestedAssetFetchResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentSuggestedAssetFetchResult](self, "mostRecentSuggestedAssetFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[PXSharedLibrarySharingSuggestionsCountsManager isSuggestionsEnabled](self, "isSuggestionsEnabled"))
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setFetchLimit:", 1);
    v16[0] = *MEMORY[0x1E0CD1978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchPropertySets:", v6);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInternalSortDescriptors:", v8);

    v9 = (void *)MEMORY[0x1E0CD1390];
    -[PXSharedLibrarySharingSuggestionsCountsManager sharingSuggestionsSmartAlbum](self, "sharingSuggestionsSmartAlbum");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAssetsInAssetCollection:options:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestionsCountsManager setMostRecentSuggestedAssetFetchResult:](self, "setMostRecentSuggestedAssetFetchResult:", v11);

    return;
  }
  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentSuggestedAssetFetchResult](self, "mostRecentSuggestedAssetFetchResult");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[PXSharedLibrarySharingSuggestionsCountsManager isSuggestionsEnabled](self, "isSuggestionsEnabled");

    if (!v14)
      -[PXSharedLibrarySharingSuggestionsCountsManager setMostRecentSuggestedAssetFetchResult:](self, "setMostRecentSuggestedAssetFetchResult:", 0);
  }
}

- (PHFetchResult)mostRecentSuggestedAssetFetchResult
{
  return self->_mostRecentSuggestedAssetFetchResult;
}

- (void)_updateNeedsParticipantSetup
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PXSharedLibrarySharingSuggestionsCountsManager isSuggestionsEnabled](self, "isSuggestionsEnabled")
    && !-[PXSharedLibrarySharingSuggestionsCountsManager hasAnySuggestions](self, "hasAnySuggestions"))
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager libraryStatusProvider](self, "libraryStatusProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "autoSharePolicy") == 1)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v6, "personUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "count") == 0;

    }
  }
  else
  {
    v3 = 0;
  }
  -[PXSharedLibrarySharingSuggestionsCountsManager setNeedsParticipantSetup:](self, "setNeedsParticipantSetup:", v3);
}

- (void)_updateMostRecentSeenSuggestedAssetAddedDate
{
  void *v3;
  id v4;

  if (-[PXSharedLibrarySharingSuggestionsCountsManager isSuggestionsEnabled](self, "isSuggestionsEnabled"))
  {
    objc_msgSend((id)objc_opt_class(), "mostRecentUserSeenAddedDateAccessor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentValueIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  -[PXSharedLibrarySharingSuggestionsCountsManager setMostRecentUserSeenAddedDate:](self, "setMostRecentUserSeenAddedDate:", v4);

}

- (BOOL)isSuggestionsEnabled
{
  return self->_isSuggestionsEnabled;
}

- (void)setMostRecentUserSeenAddedDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;
  char v7;
  void *v8;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v5 = self->_mostRecentUserSeenAddedDate;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSDate isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentUserSeenAddedDate, a3);
      -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateDetailedUnreadCounts](self, "_invalidateDetailedUnreadCounts");
      -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 4);
      if (v9)
      {
        -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          -[PXSharedLibrarySharingSuggestionsCountsManager _fetchUnreadAssetsAfterDate](self, "_fetchUnreadAssetsAfterDate");
      }
    }
  }

}

- (void)_updateIsSuggestionsEnabled
{
  void *v3;
  int v4;
  uint64_t v5;

  -[PXSharedLibrarySharingSuggestionsCountsManager libraryStatusProvider](self, "libraryStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSharedLibrary");

  if (v4)
    v5 = PLIsSharedLibrarySuggestionsEnabled();
  else
    v5 = 0;
  -[PXSharedLibrarySharingSuggestionsCountsManager setIsSuggestionsEnabled:](self, "setIsSuggestionsEnabled:", v5);
}

- (PXSharedLibraryStatusProvider)libraryStatusProvider
{
  return self->_libraryStatusProvider;
}

void __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, *MEMORY[0x1E0D75930], &__block_literal_global_202_136121, &__block_literal_global_203, &__block_literal_global_204_136122);
  v2 = (void *)lastBannerDismissDateAccessor_lastBannerDismissDateAccessor;
  lastBannerDismissDateAccessor_lastBannerDismissDateAccessor = v1;

}

void __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, *MEMORY[0x1E0D75940], &__block_literal_global_198_136128, &__block_literal_global_199_136129, &__block_literal_global_200_136130);
  v2 = (void *)lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor;
  lastSeenSuggestionsDateAccessor_lastSeenSuggestionsDateAccessor = v1;

}

void __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, *MEMORY[0x1E0D75938], &__block_literal_global_194_136132, &__block_literal_global_195_136133, &__block_literal_global_196_136134);
  v2 = (void *)lastNotificationDateAccessor_lastNotificationDateAccessor;
  lastNotificationDateAccessor_lastNotificationDateAccessor = v1;

}

void __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, *MEMORY[0x1E0D75948], &__block_literal_global_187_136136, &__block_literal_global_189_136137, &__block_literal_global_191_136138);
  v2 = (void *)mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor;
  mostRecentUserSeenAddedDateAccessor_userMostRecentSeenAddedDateAccessor = v1;

}

- (void)_updateDetailedUnreadCounts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v8[3];

  -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = objc_msgSend(v4, "countOfAssetsWithMediaType:", 1);
    v8[1] = objc_msgSend(v4, "countOfAssetsWithMediaType:", 2);
    v8[2] = objc_msgSend(v4, "countOfAssetsWithMediaType:", 3);
    -[PXSharedLibrarySharingSuggestionsCountsManager setDetailedUnreadCounts:](self, "setDetailedUnreadCounts:", v8);

  }
  else
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentUserSeenAddedDate](self, "mostRecentUserSeenAddedDate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[PXSharedLibrarySharingSuggestionsCountsManager hasAnySuggestions](self, "hasAnySuggestions");

      if (v7)
        -[PXSharedLibrarySharingSuggestionsCountsManager _fetchUnreadAssetsAfterDate](self, "_fetchUnreadAssetsAfterDate");
    }
  }
}

- (PHFetchResult)unreadSuggestedAssetsFetchResult
{
  return self->_unreadSuggestedAssetsFetchResult;
}

- (NSDate)mostRecentUserSeenAddedDate
{
  return self->_mostRecentUserSeenAddedDate;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsCountsManager.m"), 63, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionsCountsManager init]");

  abort();
}

- (void)markAllSuggestionsAsRead
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentAddedDateEverSeen](self, "mostRecentAddedDateEverSeen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PLSharedLibraryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@ mostRecentAddedDate:%@", (uint8_t *)&v16, 0x20u);

  }
  if (v3)
  {
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Updating PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateKey with date:%@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "mostRecentUserSeenAddedDateAccessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 == v3)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqual:", v3);

      if ((v12 & 1) == 0)
      {
        if (v11
          && (objc_msgSend(v11, "laterDate:", v3),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isEqualToDate:", v11),
              v13,
              v14))
        {
          PLSharedLibraryGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = 138412546;
            v17 = v11;
            v18 = 2112;
            v19 = v3;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Exisitng PFSharedLibrarySuggestionsMostRecentUserSeenAddedDateKey %@ is newer or the same as the one being set %@, ignoring.", (uint8_t *)&v16, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v9, "setCurrentValue:", v3);
        }
      }
    }

  }
}

- (void)markAnyNotificationsAsRead
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSharedLibraryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastSeenSuggestionsDateAccessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentValue:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastBannerDismissDateAccessor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentValue:", v10);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PXSharedLibrarySharingSuggestionsCountsManager_markAnyNotificationsAsRead__block_invoke;
  v12[3] = &unk_1E51479C8;
  v12[4] = self;
  -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", v12);
}

- (void)clearStoredDates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mostRecentUserSeenAddedDateAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentValue:", v2);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastSeenSuggestionsDateAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentValue:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastNotificationDateAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentValue:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastBannerDismissDateAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentValue:", v9);

}

- (void)setDetailedUnreadCounts:(id *)a3
{
  __int128 v6;

  if (self->_detailedUnreadCounts.photosCount != a3->var0
    || self->_detailedUnreadCounts.videosCount != a3->var1
    || self->_detailedUnreadCounts.othersCount != a3->var2)
  {
    v6 = *(_OWORD *)&a3->var0;
    self->_detailedUnreadCounts.othersCount = a3->var2;
    *(_OWORD *)&self->_detailedUnreadCounts.photosCount = v6;
    -[PXSharedLibrarySharingSuggestionsCountsManager signalChange:](self, "signalChange:", 2);
    -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateShouldShowBanner](self, "_invalidateShouldShowBanner");
  }
}

- (NSDate)priorityDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PXSharedLibrarySharingSuggestionsCountsManager shouldShowNotificationBanner](self, "shouldShowNotificationBanner"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentAddedDateEverSeen](self, "mostRecentAddedDateEverSeen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "lastNotificationDateAccessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v6, "laterDate:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v6;
    }
    v3 = v7;

  }
  return (NSDate *)v3;
}

- (NSDate)notificationDate
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "lastNotificationDateAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isAssetUnread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "curationProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentUserSeenAddedDate](self, "mostRecentUserSeenAddedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToDate:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PHFetchResult)mostRecentAssetFetchResult
{
  PHFetchResult *mostRecentAssetFetchResult;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  mostRecentAssetFetchResult = self->_mostRecentAssetFetchResult;
  if (!mostRecentAssetFetchResult)
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v7);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v5);
    v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v9 = self->_mostRecentAssetFetchResult;
    self->_mostRecentAssetFetchResult = v8;

    mostRecentAssetFetchResult = self->_mostRecentAssetFetchResult;
  }
  return mostRecentAssetFetchResult;
}

- (void)setMostRecentAssetFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;
  char v7;
  PHFetchResult *v8;

  v8 = (PHFetchResult *)a3;
  v5 = self->_mostRecentAssetFetchResult;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PHFetchResult isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentAssetFetchResult, a3);
      -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateShouldShowBanner](self, "_invalidateShouldShowBanner");
    }
  }

}

- (void)_fetchUnreadAssetsAfterDate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  if (!-[PXSharedLibrarySharingSuggestionsCountsManager isFetchingUnreadSuggestedAssetsFetchResult](self, "isFetchingUnreadSuggestedAssetsFetchResult"))
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager setIsFetchingUnreadSuggestedAssetsFetchResult:](self, "setIsFetchingUnreadSuggestedAssetsFetchResult:", 1);
    objc_initWeak(&location, self);
    -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentUserSeenAddedDate](self, "mostRecentUserSeenAddedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestionsCountsManager queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXSharedLibrarySharingSuggestionsCountsManager__fetchUnreadAssetsAfterDate__block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    v5 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_fetchUnreadAssetsAfterDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXSharedLibrarySharingSuggestionsCountsManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleUnreadSuggestedAssetsFetchResult:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  PXSharedLibrarySharingSuggestionsCountsManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[PXSharedLibrarySharingSuggestionsCountsManager setIsFetchingUnreadSuggestedAssetsFetchResult:](self, "setIsFetchingUnreadSuggestedAssetsFetchResult:", 0);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __98__PXSharedLibrarySharingSuggestionsCountsManager__handleUnreadSuggestedAssetsFetchResult_forDate___block_invoke;
  v15 = &unk_1E5144868;
  v16 = self;
  v17 = v6;
  v8 = v6;
  -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", &v12);
  -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentUserSeenAddedDate](self, "mostRecentUserSeenAddedDate", v12, v13, v14, v15, v16);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {

  }
  else
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "isEqual:", v7);

    if ((v11 & 1) == 0)
      -[PXSharedLibrarySharingSuggestionsCountsManager _fetchUnreadAssetsAfterDate](self, "_fetchUnreadAssetsAfterDate");
  }

}

- (PHAssetCollection)sharingSuggestionsSmartAlbum
{
  PHAssetCollection *sharingSuggestionsSmartAlbum;
  void *v4;
  void *v5;
  void *v6;
  PHAssetCollection *v7;
  PHAssetCollection *v8;

  sharingSuggestionsSmartAlbum = self->_sharingSuggestionsSmartAlbum;
  if (!sharingSuggestionsSmartAlbum)
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000214, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sharingSuggestionsSmartAlbum;
    self->_sharingSuggestionsSmartAlbum = v7;

    sharingSuggestionsSmartAlbum = self->_sharingSuggestionsSmartAlbum;
  }
  return sharingSuggestionsSmartAlbum;
}

- (void)setMostRecentSuggestedAssetFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;
  char v7;
  PHFetchResult *v8;

  v8 = (PHFetchResult *)a3;
  v5 = self->_mostRecentSuggestedAssetFetchResult;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PHFetchResult isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mostRecentSuggestedAssetFetchResult, a3);
      -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateHasAnySuggestions](self, "_invalidateHasAnySuggestions");
      -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateMostRecentAddedDateEverSeen](self, "_invalidateMostRecentAddedDateEverSeen");
    }
  }

}

- (void)setUnreadSuggestedAssetsFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;
  char v7;
  PHFetchResult *v8;

  v8 = (PHFetchResult *)a3;
  v5 = self->_unreadSuggestedAssetsFetchResult;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PHFetchResult isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_unreadSuggestedAssetsFetchResult, a3);
      -[PXSharedLibrarySharingSuggestionsCountsManager _invalidateDetailedUnreadCounts](self, "_invalidateDetailedUnreadCounts");
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_136070 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsCountsManager.m"), 584, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if ((v6 & 2) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke;
    v14[3] = &unk_1E51479C8;
    v14[4] = self;
    -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", v14);
  }
  if ((v6 & 0x10) != 0)
  {
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke_2;
    v13[3] = &unk_1E51479C8;
    v13[4] = self;
    -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", v13);
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "countOfAssetsWithMediaType:", 1);
  }

  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PXSharedLibrarySharingSuggestionsCountsManager *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (self->_mostRecentSuggestedAssetFetchResult)
  {
    objc_msgSend(v6, "changeDetailsForFetchResult:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXSharedLibrarySharingSuggestionsCountsManager unreadSuggestedAssetsFetchResult](self, "unreadSuggestedAssetsFetchResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeDetailsForFetchResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (self->_mostRecentAssetFetchResult)
  {
    objc_msgSend(v6, "changeDetailsForFetchResult:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_13;
  }
  else
  {
    v12 = 0;
    if (v8)
    {
LABEL_13:
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __100__PXSharedLibrarySharingSuggestionsCountsManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
      v13[3] = &unk_1E512D718;
      v14 = v8;
      v15 = self;
      v16 = v11;
      v17 = v12;
      -[PXSharedLibrarySharingSuggestionsCountsManager performChanges:](self, "performChanges:", v13);

      goto LABEL_14;
    }
  }
  if (v11 || v12)
    goto LABEL_13;
LABEL_14:

}

- (BOOL)needsParticipantSetup
{
  return self->_needsParticipantSetup;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedUnreadCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = *($C8986E5AD9146E03F7E851F39E835596 *)((char *)self + 184);
  return self;
}

- (BOOL)shouldShowNotificationBanner
{
  return self->_shouldShowNotificationBanner;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setMostRecentAddedDateEverSeen:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentAddedDateEverSeen, a3);
}

- (BOOL)isFetchingUnreadSuggestedAssetsFetchResult
{
  return self->_isFetchingUnreadSuggestedAssetsFetchResult;
}

- (void)setIsFetchingUnreadSuggestedAssetsFetchResult:(BOOL)a3
{
  self->_isFetchingUnreadSuggestedAssetsFetchResult = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_unreadSuggestedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_mostRecentAddedDateEverSeen, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_mostRecentUserSeenAddedDate, 0);
  objc_storeStrong((id *)&self->_sharingSuggestionsSmartAlbum, 0);
  objc_storeStrong((id *)&self->_mostRecentAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_mostRecentSuggestedAssetFetchResult, 0);
}

void __100__PXSharedLibrarySharingSuggestionsCountsManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "fetchResultAfterChanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setMostRecentSuggestedAssetFetchResult:", v4);

  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    objc_msgSend(v5, "fetchResultAfterChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setUnreadSuggestedAssetsFetchResult:", v6);

  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    objc_msgSend(v7, "fetchResultAfterChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setMostRecentAssetFetchResult:", v8);

  }
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsSuggestionsEnabled");
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateNeedsParticipantSetup");
}

uint64_t __98__PXSharedLibrarySharingSuggestionsCountsManager__handleUnreadSuggestedAssetsFetchResult_forDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUnreadSuggestedAssetsFetchResult:", *(_QWORD *)(a1 + 40));
}

void __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("addedDate > %@"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v4);

  objc_msgSend(v3, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(*(id *)(a1 + 32), "sharingSuggestionsSmartAlbum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsInAssetCollection:options:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "countOfAssetsWithMediaType:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke_2;
  block[3] = &unk_1E5147B18;
  objc_copyWeak(&v12, &location);
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __84__PXSharedLibrarySharingSuggestionsCountsManager__queue_fetchUnreadAssetsAfterDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleUnreadSuggestedAssetsFetchResult:forDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __77__PXSharedLibrarySharingSuggestionsCountsManager__fetchUnreadAssetsAfterDate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_fetchUnreadAssetsAfterDate:", *(_QWORD *)(a1 + 32));

}

uint64_t __76__PXSharedLibrarySharingSuggestionsCountsManager_markAnyNotificationsAsRead__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowNotificationBanner:", 0);
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 == a3)
    return 0;
  else
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
}

uint64_t __79__PXSharedLibrarySharingSuggestionsCountsManager_lastBannerDismissDateAccessor__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

uint64_t __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 == a3)
    return 0;
  else
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
}

uint64_t __81__PXSharedLibrarySharingSuggestionsCountsManager_lastSeenSuggestionsDateAccessor__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

uint64_t __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 == a3)
    return 0;
  else
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
}

uint64_t __78__PXSharedLibrarySharingSuggestionsCountsManager_lastNotificationDateAccessor__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

uint64_t __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 == a3)
    return 0;
  else
    return objc_msgSend(a2, "isEqual:", v3, v4) ^ 1;
}

uint64_t __85__PXSharedLibrarySharingSuggestionsCountsManager_mostRecentUserSeenAddedDateAccessor__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

@end
