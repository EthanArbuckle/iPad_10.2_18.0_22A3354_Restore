@implementation PXSharedAlbumActivityHorizontalGadgetProvider

- (PXSharedAlbumActivityHorizontalGadgetProvider)init
{
  PXSharedAlbumActivityHorizontalGadgetProvider *v2;
  void *v3;
  int v4;
  PXFeedSectionInfosManager *v5;
  void *v6;
  uint64_t v7;
  PXFeedSectionInfosManager *feedSectionInfosManager;
  uint64_t v9;
  PXFeedSectionInfosManager *v10;
  uint64_t v11;
  PXInboxAggregateDataSourceManager *inboxDataSourceManager;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSharedAlbumActivityHorizontalGadgetProvider;
  v2 = -[PXGadgetProvider init](&v14, sel_init);
  if (v2)
  {
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "useMockData");

    v5 = [PXFeedSectionInfosManager alloc];
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = -[PXFeedSectionInfosManager initWithPhotoLibraryForTesting:filter:](v5, "initWithPhotoLibraryForTesting:filter:", v6, 3);
      feedSectionInfosManager = v2->_feedSectionInfosManager;
      v2->_feedSectionInfosManager = (PXFeedSectionInfosManager *)v7;

    }
    else
    {
      v9 = -[PXFeedSectionInfosManager initWithPhotoLibrary:configurationBlock:](v5, "initWithPhotoLibrary:configurationBlock:", v6, &__block_literal_global_71544);
      v10 = v2->_feedSectionInfosManager;
      v2->_feedSectionInfosManager = (PXFeedSectionInfosManager *)v9;

      +[PXInboxViewController createInboxDataSourceManager](PXInboxViewController, "createInboxDataSourceManager");
      v11 = objc_claimAutoreleasedReturnValue();
      inboxDataSourceManager = v2->_inboxDataSourceManager;
      v2->_inboxDataSourceManager = (PXInboxAggregateDataSourceManager *)v11;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, *MEMORY[0x1E0D71C28], 0);
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXFeedSectionInfosManager setDelegate:](self->_feedSectionInfosManager, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXSharedAlbumActivityHorizontalGadgetProvider;
  -[PXSharedAlbumActivityHorizontalGadgetProvider dealloc](&v4, sel_dealloc);
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;

  -[PXSharedAlbumActivityHorizontalGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfInvitationsReceived");
  v4 = objc_msgSend(v2, "numberOfSectionInfos") - v3;
  if (v4 >= 4)
    v4 = 4;
  if ((v4 + v3 < 0) ^ __OFADD__(v4, v3) | (v4 + v3 == 0))
    v5 = 0;
  else
    v5 = 1;
  v6 = 2 * v5;

  return v6;
}

- (void)generateGadgets
{
  id v3;

  -[PXSharedAlbumActivityHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");
  -[PXSharedAlbumActivityHorizontalGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

}

- (NSDate)mostRecentContentDate
{
  return +[PXFeedSectionInfosManager mostRecentCreationDate](PXFeedSectionInfosManager, "mostRecentCreationDate");
}

- (int64_t)forYouContentIdentifier
{
  return 5;
}

- (void)_navigateToSharedAlbumActivityFeed:(id)a3
{
  id v3;

  -[PXGadgetProvider gadgetViewControllerHostingGadget:](self, "gadgetViewControllerHostingGadget:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEA0D3A0))
    objc_msgSend(v3, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", 1, 0, 0);

}

- (id)_gadgetTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXForYouActivityGadgetTitle"), CFSTR("PhotosUICore"));
}

- (void)_updateGadgetTitle
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PXGadgetProvider gadgets](self, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgetTitle__block_invoke;
    v5[3] = &unk_1E5136338;
    v5[4] = self;
    objc_msgSend(v4, "performChanges:", v5);
  }

}

- (BOOL)_areSharedStreamsEnabled
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "sharedStreamsEnabledForPhotoLibraryURL:", v3);

  return (char)v2;
}

- (int64_t)_countOfSectionInfosToDisplay:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  if (!-[PXSharedAlbumActivityHorizontalGadgetProvider _areSharedStreamsEnabled](self, "_areSharedStreamsEnabled"))
    return 0;
  -[PXSharedAlbumActivityHorizontalGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSectionInfos");
  v7 = 0;
  if (v6 >= 1 && a3)
  {
    v8 = v6;
    v7 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v5, "sectionInfoAtIndex:", v8 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "reload");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v11, "numberOfItems"))
        {
          ++v7;
          if (objc_msgSend(v11, "sectionType") != 2)
            ++v9;
        }
      }

      if (v8 < 2)
        break;
      --v8;
    }
    while (v9 < a3);
  }

  return v7;
}

- (void)_updateGadgets
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PXSharedAlbumActivityGadgetProvider *v8;
  PXSharedAlbumGadgetDataSourceManager *v9;
  void *v10;
  PXSharedAlbumGadgetDataSourceManager *v11;
  _PXSharedAlbumActivityHorizontalCollectionGadget *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v5 = -[PXSharedAlbumActivityHorizontalGadgetProvider _countOfSectionInfosToDisplay:](self, "_countOfSectionInfosToDisplay:", 4);
  -[PXSharedAlbumActivityHorizontalGadgetProvider _currentGadgetOfType:](self, "_currentGadgetOfType:", 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 < 1)
  {
    if (v6)
      objc_msgSend(v4, "addObject:", v6);
  }
  else if (!v6)
  {
    v8 = objc_alloc_init(PXSharedAlbumActivityGadgetProvider);
    v9 = [PXSharedAlbumGadgetDataSourceManager alloc];
    v24[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSharedAlbumGadgetDataSourceManager initWithGadgetProviders:](v9, "initWithGadgetProviders:", v10);

    v12 = -[PXHorizontalCollectionGadget initWithDataSourceManager:]([_PXSharedAlbumActivityHorizontalCollectionGadget alloc], "initWithDataSourceManager:", v11);
    -[PXHorizontalCollectionGadget setGadgetType:](v12, "setGadgetType:", 2);
    -[PXHorizontalCollectionGadget setDefaultColumnSpan:](v12, "setDefaultColumnSpan:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetUIViewController setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke;
    v23[3] = &unk_1E5136B60;
    v23[4] = self;
    -[PXHorizontalCollectionGadget setAccessoryButtonAction:](v12, "setAccessoryButtonAction:", v23);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke_2;
    v22[3] = &unk_1E5136338;
    v22[4] = self;
    -[PXHorizontalCollectionGadget performChanges:](v12, "performChanges:", v22);
    objc_msgSend(v3, "addObject:", v12);

  }
  v15 = objc_msgSend(v3, "count");
  v16 = objc_msgSend(v4, "count");
  if (v15 | v16)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke_3;
    v17[3] = &unk_1E5121118;
    v20 = v16 != 0;
    v18 = v4;
    v21 = v15 != 0;
    v19 = v3;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v17);

  }
}

- (id)_currentGadgetOfType:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXGadgetProvider gadgets](self, "gadgets");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "gadgetType", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (PXFeedSectionInfosManager)feedSectionInfosManager
{
  return self->_feedSectionInfosManager;
}

- (void)setFeedSectionInfosManager:(id)a3
{
  objc_storeStrong((id *)&self->_feedSectionInfosManager, a3);
}

- (PXInboxAggregateDataSourceManager)inboxDataSourceManager
{
  return self->_inboxDataSourceManager;
}

- (void)setInboxDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_inboxDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxDataSourceManager, 0);
  objc_storeStrong((id *)&self->_feedSectionInfosManager, 0);
}

uint64_t __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_navigateToSharedAlbumActivityFeed:", a2);
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.navigatedToSharedAlbumActivityViewFromSeeAllButton"), MEMORY[0x1E0C9AA70]);
}

void __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_gadgetTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionTitle:", v4);

  objc_msgSend(v3, "setCollectionAccessoryButtonType:", 1);
  PXLocalizedStringFromTable(CFSTR("PXForYouActivitySeeAllButtonTitle"), CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionAccessoryButtonTitle:", v5);

}

void __63__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgets__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "removeGadgets:", *(_QWORD *)(a1 + 32));
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v4, "addGadgets:", *(_QWORD *)(a1 + 40));
    v3 = v4;
  }

}

void __67__PXSharedAlbumActivityHorizontalGadgetProvider__updateGadgetTitle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_gadgetTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionTitle:", v4);

}

uint64_t __53__PXSharedAlbumActivityHorizontalGadgetProvider_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEntryFilter:", 3);
}

@end
