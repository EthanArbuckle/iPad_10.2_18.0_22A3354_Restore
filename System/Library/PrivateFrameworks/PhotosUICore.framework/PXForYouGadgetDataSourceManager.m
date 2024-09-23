@implementation PXForYouGadgetDataSourceManager

- (PXForYouGadgetDataSourceManager)initWithSharedLibraryStatusProvider:(id)a3 libraryFilterState:(id)a4
{
  id v8;
  id v9;
  PXForYouGadgetDataSourceManager *v10;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  NSDictionary *cachedUserRelevanceDateForContentIdentifiers;
  uint64_t v14;
  NSDate *dateUsedForCurrentGadgetOrder;
  void *v16;
  void *v17;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetDataSourceManager.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXForYouGadgetDataSourceManager;
  v10 = -[PXGadgetDataSourceManager initWithQueueName:](&v20, sel_initWithQueueName_, CFSTR("com.mobileslideshow.ForYouGadgetGenerator"));
  if (v10)
  {
    objc_msgSend(v8, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    objc_storeStrong((id *)&v10->_sharedLibraryStatusProvider, a3);
    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
    cachedUserRelevanceDateForContentIdentifiers = v10->_cachedUserRelevanceDateForContentIdentifiers;
    v10->_cachedUserRelevanceDateForContentIdentifiers = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    dateUsedForCurrentGadgetOrder = v10->_dateUsedForCurrentGadgetOrder;
    v10->_dateUsedForCurrentGadgetOrder = (NSDate *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel__calendarDayChanged, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel__pretendDateChanged, CFSTR("PXForYouSimluatedNextDateNotification"), 0);

  }
  return v10;
}

- (PXForYouGadgetDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetDataSourceManager.m"), 94, CFSTR("%s is not available as initializer"), "-[PXForYouGadgetDataSourceManager init]");

  abort();
}

- (void)_invalidateCachedUserRelevanceDates
{
  NSDictionary *cachedUserRelevanceDateForContentIdentifiers;

  cachedUserRelevanceDateForContentIdentifiers = self->_cachedUserRelevanceDateForContentIdentifiers;
  self->_cachedUserRelevanceDateForContentIdentifiers = 0;

}

- (void)_invalidateCachedGadgetProviders
{
  NSArray *cachedForYouGadgetProviders;

  cachedForYouGadgetProviders = self->_cachedForYouGadgetProviders;
  self->_cachedForYouGadgetProviders = 0;

  -[PXForYouGadgetDataSourceManager _invalidateCachedUserRelevanceDates](self, "_invalidateCachedUserRelevanceDates");
}

- (NSDictionary)userRelevanceDateForContentIdentifiers
{
  NSDictionary *cachedUserRelevanceDateForContentIdentifiers;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  cachedUserRelevanceDateForContentIdentifiers = self->_cachedUserRelevanceDateForContentIdentifiers;
  if (!cachedUserRelevanceDateForContentIdentifiers)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PXForYouGadgetDataSourceManager gadgetProviders](self, "gadgetProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "mostRecentContentDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "forYouContentIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = (NSDictionary *)objc_msgSend(v4, "copy");
    v14 = self->_cachedUserRelevanceDateForContentIdentifiers;
    self->_cachedUserRelevanceDateForContentIdentifiers = v13;

    cachedUserRelevanceDateForContentIdentifiers = self->_cachedUserRelevanceDateForContentIdentifiers;
  }
  return cachedUserRelevanceDateForContentIdentifiers;
}

- (void)removeCachedProviders
{
  objc_super v3;

  -[PXForYouGadgetDataSourceManager _invalidateCachedGadgetProviders](self, "_invalidateCachedGadgetProviders");
  v3.receiver = self;
  v3.super_class = (Class)PXForYouGadgetDataSourceManager;
  -[PXGadgetDataSourceManager removeCachedProviders](&v3, sel_removeCachedProviders);
}

- (BOOL)_canShowSurveyQuestionsGadget
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canShowInternalUI"))
  {
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showSurveyQuestions");

    if (!v4)
      return 0;
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "surveyQuestionsHideDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      return 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v2) != -1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)gadgetProviders
{
  NSArray *cachedForYouGadgetProviders;
  id v4;
  void *v5;
  int v6;
  void *v7;
  PXSurveyQuestionsHorizontalGadgetProvider *v8;
  PXSharedLibraryInvitationsHorizontalGadgetProvider *v9;
  void *v10;
  PXSharedLibraryInvitationsHorizontalGadgetProvider *v11;
  PXSharedLibrarySharingSuggestionsGadgetProvider *v12;
  void *v13;
  PXSharedLibrarySharingSuggestionsGadgetProvider *v14;
  PXForYouMemoryGadgetProvider *v15;
  void *v16;
  PXForYouMemoryGadgetProvider *v17;
  PXForYouSettingAdvisoryGadgetProvider *v18;
  PXSharedAlbumActivityHorizontalGadgetProvider *v19;
  PXSharedAlbumActivityAccompanyingInboxGadgetProvider *v20;
  void *v21;
  void *v22;
  PXCMMWorkflowCoordinatorPresenter *v23;
  PXCMMInvitationsHorizontalGadgetProvider *v24;
  void *v25;
  PXCMMInvitationsHorizontalGadgetProvider *v26;
  PXHorizontalContentSyndicationGadgetProvider *v27;
  void *v28;
  PXHorizontalContentSyndicationGadgetProvider *v29;
  PXForYouRecentInterestSuggestionsGadgetProvider *v30;
  void *v31;
  PXForYouRecentInterestSuggestionsGadgetProvider *v32;
  PXForYouRecentInterestHorizontalGadgetProvider *v33;
  void *v34;
  PXForYouRecentInterestHorizontalGadgetProvider *v35;
  PXForYouFooterGadgetProvider *v36;
  void *v37;
  void *v38;
  NSArray *v39;
  NSArray *v40;

  cachedForYouGadgetProviders = self->_cachedForYouGadgetProviders;
  if (!cachedForYouGadgetProviders)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = PLIsFeaturedContentAllowed();
    if (-[PXForYouGadgetDataSourceManager _canShowSurveyQuestionsGadget](self, "_canShowSurveyQuestionsGadget"))
    {
      +[PXSurveyQuestionsHorizontalGadgetProviderConfiguration generalConfiguration](PXSurveyQuestionsHorizontalGadgetProviderConfiguration, "generalConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[PXSurveyQuestionsHorizontalGadgetProvider initWithConfiguration:]([PXSurveyQuestionsHorizontalGadgetProvider alloc], "initWithConfiguration:", v7);
        objc_msgSend(v4, "addObject:", v8);

      }
    }
    if (objc_msgSend(v5, "showSharedLibraryInvitations"))
    {
      v9 = [PXSharedLibraryInvitationsHorizontalGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXSharedLibraryInvitationsHorizontalGadgetProvider initWithSharedLibraryStatusProvider:](v9, "initWithSharedLibraryStatusProvider:", v10);

      objc_msgSend(v4, "addObject:", v11);
    }
    if (objc_msgSend(v5, "showSharedLibrarySharingSuggestions")
      && PLIsSharedLibrarySuggestionsEnabled())
    {
      v12 = [PXSharedLibrarySharingSuggestionsGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager libraryFilterState](self, "libraryFilterState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXSharedLibrarySharingSuggestionsGadgetProvider initWithLibraryFilterState:](v12, "initWithLibraryFilterState:", v13);

      objc_msgSend(v4, "addObject:", v14);
    }
    if ((objc_msgSend(v5, "showMemories") & v6) == 1)
    {
      v15 = [PXForYouMemoryGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager libraryFilterState](self, "libraryFilterState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PXForYouMemoryGadgetProvider initWithLibraryFilterState:](v15, "initWithLibraryFilterState:", v16);

      objc_msgSend(v4, "addObject:", v17);
    }
    if ((v6 & 1) == 0)
    {
      v18 = objc_alloc_init(PXForYouSettingAdvisoryGadgetProvider);
      objc_msgSend(v4, "addObject:", v18);

    }
    if (objc_msgSend(v5, "showSharedAlbumActivity"))
    {
      v19 = objc_alloc_init(PXSharedAlbumActivityHorizontalGadgetProvider);
      objc_msgSend(v4, "addObject:", v19);
      v20 = objc_alloc_init(PXSharedAlbumActivityAccompanyingInboxGadgetProvider);
      objc_msgSend(v4, "addObject:", v20);

    }
    if (objc_msgSend(v5, "showCMMInvitations"))
    {
      -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rootNavigationHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[PXCMMWorkflowCoordinatorPresenter initWithNavigationHelper:]([PXCMMWorkflowCoordinatorPresenter alloc], "initWithNavigationHelper:", v22);
      v24 = [PXCMMInvitationsHorizontalGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager libraryFilterState](self, "libraryFilterState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[PXCMMInvitationsHorizontalGadgetProvider initWithWorkflowPresenter:libraryFilterState:](v24, "initWithWorkflowPresenter:libraryFilterState:", v23, v25);

      objc_msgSend(v4, "addObject:", v26);
    }
    if (objc_msgSend(v5, "showContentSyndication"))
    {
      v27 = [PXHorizontalContentSyndicationGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager libraryFilterState](self, "libraryFilterState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PXHorizontalContentSyndicationGadgetProvider initWithLibraryFilterState:](v27, "initWithLibraryFilterState:", v28);

      objc_msgSend(v4, "addObject:", v29);
    }
    if ((objc_msgSend(v5, "showRecentInterestSuggestions") & v6) == 1)
    {
      v30 = [PXForYouRecentInterestSuggestionsGadgetProvider alloc];
      -[PXForYouGadgetDataSourceManager libraryFilterState](self, "libraryFilterState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[PXForYouRecentInterestSuggestionsGadgetProvider initWithLibraryFilterState:](v30, "initWithLibraryFilterState:", v31);

      v33 = [PXForYouRecentInterestHorizontalGadgetProvider alloc];
      -[PXForYouSuggestionsGadgetProvider localizedTitle](v32, "localizedTitle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[PXForYouRecentInterestHorizontalGadgetProvider initWithContentGadgetProvider:title:](v33, "initWithContentGadgetProvider:title:", v32, v34);

      objc_msgSend(v4, "addObject:", v35);
    }
    if (objc_msgSend(v5, "showFooter"))
    {
      v36 = objc_alloc_init(PXForYouFooterGadgetProvider);
      objc_msgSend(v4, "addObject:", v36);

    }
    if (PFOSVariantHasInternalUI())
    {
      if (objc_msgSend(v5, "showVerticalSampleGadgets"))
      {
        +[PXForYouSampleGadgetProvider defaultForYouSampleGadgetProviders](PXForYouSampleGadgetProvider, "defaultForYouSampleGadgetProviders");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v37);

      }
      if (objc_msgSend(v5, "showHorizontalGadget"))
      {
        +[PXForYouSampleGadgetProvider defaultForYouSampleHorizontalCollectionGadgetProvider](PXForYouSampleGadgetProvider, "defaultForYouSampleHorizontalCollectionGadgetProvider");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v38);

      }
    }
    v39 = (NSArray *)objc_msgSend(v4, "copy");
    v40 = self->_cachedForYouGadgetProviders;
    self->_cachedForYouGadgetProviders = v39;

    cachedForYouGadgetProviders = self->_cachedForYouGadgetProviders;
  }
  return cachedForYouGadgetProviders;
}

- (id)gadgetSortComparator
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetDataSourceManager.m"), 231, CFSTR("Unexpected call to [PXForYouGadgetDataSourceManager gadgetSortComparator] for you should not need to sort gadgets"));

  return 0;
}

- (id)gadgetProviderSortComparator
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PXForYouGadgetDataSourceManager_gadgetProviderSortComparator__block_invoke;
  v5[3] = &unk_1E5134B30;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  return v3;
}

- (void)_calendarDayChanged
{
  void *v3;
  NSDate *dateUsedForCurrentGadgetOrder;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dateUsedForCurrentGadgetOrder = self->_dateUsedForCurrentGadgetOrder;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(dateUsedForCurrentGadgetOrder) = objc_msgSend(v3, "isDate:inSameDayAsDate:", dateUsedForCurrentGadgetOrder, v5);

  if ((dateUsedForCurrentGadgetOrder & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dateUsedForCurrentGadgetOrder;
    self->_dateUsedForCurrentGadgetOrder = v6;

    -[PXGadgetDataSourceManager invalidateGadgets](self, "invalidateGadgets");
  }
}

- (void)_pretendDateChanged
{
  void *v3;
  void *v4;
  NSDate *v5;
  NSDate *dateUsedForCurrentGadgetOrder;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setDay:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v7, v4, 0);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

  dateUsedForCurrentGadgetOrder = self->_dateUsedForCurrentGadgetOrder;
  self->_dateUsedForCurrentGadgetOrder = v5;

  -[PXGadgetDataSourceManager invalidateGadgets](self, "invalidateGadgets");
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_dateUsedForCurrentGadgetOrder, 0);
  objc_storeStrong((id *)&self->_cachedUserRelevanceDateForContentIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedForYouGadgetProviders, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __63__PXForYouGadgetDataSourceManager_gadgetProviderSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(void *, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[5];

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXForYouGadgetDataSourceManager_gadgetProviderSortComparator__block_invoke_2;
  aBlock[3] = &unk_1E5134B08;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v8 = v5;
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE9FAD30) & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("PXForYouGadgetDataSourceManager.m"), 243, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("provider1"), CFSTR("PXForYouRankable"), v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXForYouGadgetDataSourceManager.m"), 243, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("provider1"), CFSTR("PXForYouRankable"));
  }

LABEL_3:
  v7[2](v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v6;
  v12 = v11;
  if (v11)
  {
    if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EE9FAD30) & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, CFSTR("PXForYouGadgetDataSourceManager.m"), 244, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("provider2"), CFSTR("PXForYouRankable"), v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXForYouGadgetDataSourceManager.m"), 244, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("provider2"), CFSTR("PXForYouRankable"));
  }

LABEL_5:
  v7[2](v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = PXForYouRankableShouldBeFeaturedOnDate(v10, *(void **)(*(_QWORD *)(a1 + 32) + 200));
  v15 = PXForYouRankableShouldBeFeaturedOnDate(v13, *(void **)(*(_QWORD *)(a1 + 32) + 200));
  v16 = v9;
  v17 = v16;
  if (v9)
  {
    if ((objc_msgSend(v16, "conformsToProtocol:", &unk_1EE9FAD30) & 1) != 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v36, v35, CFSTR("PXForYouGadgetDataSourceManager.m"), 249, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("provider1"), CFSTR("PXForYouRankable"), v34);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXForYouGadgetDataSourceManager.m"), 249, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("provider1"), CFSTR("PXForYouRankable"));
  }

LABEL_7:
  v18 = v12;
  v19 = v18;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXForYouGadgetDataSourceManager.m"), 249, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("provider2"), CFSTR("PXForYouRankable"));
LABEL_21:

    goto LABEL_9;
  }
  if (!objc_msgSend(v18, "conformsToProtocol:", &unk_1EE9FAD30))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 40);
    v37 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v32, v37, CFSTR("PXForYouGadgetDataSourceManager.m"), 249, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("provider2"), CFSTR("PXForYouRankable"), v33);

    goto LABEL_21;
  }
LABEL_9:
  v20 = PXForYouRankableCompare(v17, v14, v19, v15);

  return v20;
}

id __63__PXForYouGadgetDataSourceManager_gadgetProviderSortComparator__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "forYouContentIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userRelevanceDateForContentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
