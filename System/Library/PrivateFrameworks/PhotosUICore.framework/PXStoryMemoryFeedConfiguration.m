@implementation PXStoryMemoryFeedConfiguration

- (PXStoryMemoryFeedConfiguration)initWithMemoryForYouDataSourceManager:(id)a3 layoutKind:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  PXStoryMemoryFeedConfiguration *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PXStoryMemoryFeedConfiguration_initWithMemoryForYouDataSourceManager_layoutKind___block_invoke;
  v11[3] = &unk_1E51394D0;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStoryMemoryFeedConfiguration initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:](self, "initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:", v11, a4, v8, 0);

  if (v9)
    -[PXFeedConfiguration setShouldEmbedContentLayout:](v9, "setShouldEmbedContentLayout:", -[PXStoryMemoryFeedConfiguration _shouldEmbedContentLayoutForLayoutKind:](v9, "_shouldEmbedContentLayoutForLayoutKind:", a4));

  return v9;
}

- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5
{
  return -[PXStoryMemoryFeedConfiguration initWithMemoriesInPhotoLibrary:layoutKind:viewControllerSetupBlock:visibleRectChangeObserver:](self, "initWithMemoriesInPhotoLibrary:layoutKind:viewControllerSetupBlock:visibleRectChangeObserver:", a3, a4, a5, 0);
}

- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5 visibleRectChangeObserver:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXStoryMemoryFeedConfiguration *v13;
  PXStoryMemoryFeedConfiguration *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke;
  v17[3] = &unk_1E51394D0;
  v12 = v10;
  v18 = v12;
  v13 = -[PXStoryMemoryFeedConfiguration initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:](self, "initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:", v17, a4, v12, a5);
  v14 = v13;
  if (v13)
  {
    -[PXFeedConfiguration setChromeControllerPromise:](v13, "setChromeControllerPromise:", &__block_literal_global_132_227702);
    -[PXFeedConfiguration setShouldEmbedContentLayout:](v14, "setShouldEmbedContentLayout:", -[PXStoryMemoryFeedConfiguration _shouldEmbedContentLayoutForLayoutKind:](v14, "_shouldEmbedContentLayoutForLayoutKind:", a4));
    v15 = (void *)objc_msgSend(v11, "copy");
    -[PXFeedConfiguration setVisibleRectChangeObserver:](v14, "setVisibleRectChangeObserver:", v15);

  }
  return v14;
}

- (PXStoryMemoryFeedConfiguration)initWithSyntheticSectionCount:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4 photoLibrary:(id)a5 layoutKind:(int64_t)a6
{
  PXStoryMemoryFeedConfiguration *v7;
  PXStoryMemoryFeedConfiguration *v8;
  _QWORD v10[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __112__PXStoryMemoryFeedConfiguration_initWithSyntheticSectionCount_numberOfItemsPerSection_photoLibrary_layoutKind___block_invoke;
  v10[3] = &__block_descriptor_48_e70___PXSectionedDataSourceManager_16__0__PXStoryMemoryFeedConfiguration_8l;
  v10[4] = a3;
  v10[5] = a4;
  v7 = -[PXStoryMemoryFeedConfiguration initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:](self, "initWithDataSourceManagerPromise:layoutKind:photoLibrary:viewControllerSetupBlock:", v10, a6, a5, 0);
  v8 = v7;
  if (v7)
    -[PXFeedConfiguration setShouldEmbedContentLayout:](v7, "setShouldEmbedContentLayout:", -[PXStoryMemoryFeedConfiguration _shouldEmbedContentLayoutForLayoutKind:](v7, "_shouldEmbedContentLayoutForLayoutKind:", a6));
  return v8;
}

- (PXStoryMemoryFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 layoutKind:(int64_t)a4 photoLibrary:(id)a5 viewControllerSetupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  PXStoryMemoryFeedItemLayoutFactory *v15;
  PXStoryMemoryFeedConfiguration *v16;
  PXStoryMemoryFeedConfiguration *v17;
  void *v18;
  PXStoryMemoryFeedActionPerformer *v19;
  PXStoryMemoryFeedPlaceholderFactory *v20;
  objc_super v22;
  _QWORD v23[5];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11
    && (+[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "useFeedPlaceholderItems"),
        v13,
        !v14))
  {
    v15 = objc_alloc_init(PXStoryMemoryFeedItemLayoutFactory);
    -[PXStoryMemoryFeedItemLayoutFactory setLayoutKind:](v15, "setLayoutKind:", a4);
  }
  else
  {
    v15 = objc_alloc_init(PXFeedDummyItemLayoutFactory);
  }
  v23[1] = 3221225472;
  v23[2] = __116__PXStoryMemoryFeedConfiguration_initWithDataSourceManagerPromise_layoutKind_photoLibrary_viewControllerSetupBlock___block_invoke;
  v23[3] = &__block_descriptor_40_e99___PXFeedViewLayoutSpecManager_24__0__PXStoryMemoryFeedConfiguration_8__PXExtendedTraitCollection_16l;
  v23[4] = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryMemoryFeedConfiguration;
  v23[0] = MEMORY[0x1E0C809B0];
  v16 = -[PXFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:](&v22, sel_initWithDataSourceManagerPromise_specManagerPromise_itemLayoutFactory_, v10, v23, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_photoLibrary, a5);
    +[PXStoryMemoryFeedConfiguration _photoKitMediaProviderWithPhotoLibrary:](PXStoryMemoryFeedConfiguration, "_photoKitMediaProviderWithPhotoLibrary:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedConfiguration setMediaProvider:](v17, "setMediaProvider:", v18);

    v19 = -[PXStoryMemoryFeedActionPerformer initWithViewControllerSetupBlock:]([PXStoryMemoryFeedActionPerformer alloc], "initWithViewControllerSetupBlock:", v12);
    -[PXFeedConfiguration setActionPerformer:](v17, "setActionPerformer:", v19);
    v20 = objc_alloc_init(PXStoryMemoryFeedPlaceholderFactory);
    -[PXFeedConfiguration setPlaceholderFactory:](v17, "setPlaceholderFactory:", v20);

  }
  return v17;
}

- (id)viewControllerTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXMemoriesFeedTitle"), CFSTR("PhotosUICore"));
}

- (int64_t)horizontalGadgetStyle
{
  return 1;
}

- (unint64_t)gadgetType
{
  return 5;
}

- (id)gadgetLocalizedTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXForYouMemoriesGadgetTitle"), CFSTR("PhotosUICore"));
}

- (BOOL)wantsMultilineGadgetTitle
{
  return 0;
}

- (unint64_t)gadgetAccessoryButtonType
{
  return 1;
}

- (id)gadgetAccessoryButtonLocalizedTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXForYouSeeAllMemoriesButtonTitle"), CFSTR("PhotosUICore"));
}

- (id)createSeeAllViewController
{
  id v2;
  void *v3;

  v2 = -[PXStoryMemoryFeedConfiguration copyForFullFeed](self, "copyForFullFeed");
  +[PXStoryUIFactory feedViewControllerWithConfiguration:](PXStoryUIFactory, "feedViewControllerWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyForFullFeed
{
  void *v3;
  id v4;
  void *v5;

  -[PXStoryMemoryFeedConfiguration photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMemoriesInPhotoLibrary:layoutKind:viewControllerSetupBlock:", v3, 1, 0);
  else
    v4 = -[PXStoryMemoryFeedConfiguration copyWithLayoutKind:](self, "copyWithLayoutKind:", 1);
  v5 = v4;

  return v5;
}

- (id)copyWithLayoutKind:(int64_t)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)-[PXStoryMemoryFeedConfiguration copy](self, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryMemoryFeedConfiguration_copyWithLayoutKind___block_invoke;
  v6[3] = &__block_descriptor_40_e99___PXFeedViewLayoutSpecManager_24__0__PXStoryMemoryFeedConfiguration_8__PXExtendedTraitCollection_16l;
  v6[4] = a3;
  objc_msgSend(v4, "setSpecManagerPromise:", v6);
  return v4;
}

- (id)objectReferenceForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PXStoryObjectReferenceForDestinationInMemoryDataSource(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)handleContentSeen
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (handleContentSeen_onceToken != -1)
    dispatch_once(&handleContentSeen_onceToken, &__block_literal_global_151_227679);
  v4 = handleContentSeen_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke_2;
  block[3] = &unk_1E5149198;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (BOOL)wantsEmbeddedScrollView
{
  return 1;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return PLIsFeaturedContentAllowed() ^ 1;
}

- (id)_defaultSpecManagerWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4
{
  PXStoryMemoryFeedViewLayoutSpecManager *v4;
  id v8;
  void *v9;
  void *v10;
  PXStoryMemoryFeedViewLayoutSpecManager *v11;
  void *v13;

  v8 = a4;
  v9 = v8;
  switch(a3)
  {
    case 1:
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedConfiguration.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extendedTraitCollection != nil"));

      }
      v11 = -[PXStoryMemoryFeedViewLayoutSpecManager initWithLayoutKind:extendedTraitCollection:]([PXStoryMemoryFeedViewLayoutSpecManager alloc], "initWithLayoutKind:extendedTraitCollection:", 1, v9);
      goto LABEL_9;
    case 2:
      -[PXFeedConfiguration horizontalGadgetViewSpecManagerWithExtendedTraitCollection:](self, "horizontalGadgetViewSpecManagerWithExtendedTraitCollection:", v8);
      v11 = (PXStoryMemoryFeedViewLayoutSpecManager *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v4 = v11;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedConfiguration.m"), 240, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }

  return v4;
}

- (BOOL)_shouldEmbedContentLayoutForLayoutKind:(int64_t)a3
{
  return a3 == 2;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke_2(uint64_t a1)
{
  return +[PXStoryMemoryFeedConfiguration _handleContentSeenForDataSource:](PXStoryMemoryFeedConfiguration, "_handleContentSeenForDataSource:", *(_QWORD *)(a1 + 32));
}

void __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PXStoryMemoryFeed.handleContentSeen", v0);
  v2 = (void *)handleContentSeen_queue;
  handleContentSeen_queue = (uint64_t)v1;

}

uint64_t __53__PXStoryMemoryFeedConfiguration_copyWithLayoutKind___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_defaultSpecManagerWithLayoutKind:extendedTraitCollection:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __116__PXStoryMemoryFeedConfiguration_initWithDataSourceManagerPromise_layoutKind_photoLibrary_viewControllerSetupBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_defaultSpecManagerWithLayoutKind:extendedTraitCollection:", *(_QWORD *)(a1 + 32), a3);
}

PXFeedSyntheticDataSourceManager *__112__PXStoryMemoryFeedConfiguration_initWithSyntheticSectionCount_numberOfItemsPerSection_photoLibrary_layoutKind___block_invoke(uint64_t a1)
{
  return -[PXFeedSyntheticDataSourceManager initWithNumberOfSections:numberOfItemsPerSection:]([PXFeedSyntheticDataSourceManager alloc], "initWithNumberOfSections:numberOfItemsPerSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

PXStoryMemoryFeedDataSourceManager *__127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke(uint64_t a1)
{
  PXStoryMemoryFeedDataSourceManager *v1;

  v1 = -[PXStoryMemoryFeedDataSourceManager initWithPhotoLibrary:]([PXStoryMemoryFeedDataSourceManager alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  -[PXStoryMemoryFeedDataSourceManager performChanges:](v1, "performChanges:", &__block_literal_global_130_227706);
  return v1;
}

PXStoryMemoryFeedChromeController *__127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  PXStoryMemoryFeedChromeController *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[PXStoryMemoryFeedChromeController initWithViewController:dataSourceManager:]([PXStoryMemoryFeedChromeController alloc], "initWithViewController:dataSourceManager:", v5, v4);

  return v6;
}

uint64_t __127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 1);
}

id __83__PXStoryMemoryFeedConfiguration_initWithMemoryForYouDataSourceManager_layoutKind___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_227707);
  return *(id *)(a1 + 32);
}

uint64_t __83__PXStoryMemoryFeedConfiguration_initWithMemoryForYouDataSourceManager_layoutKind___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 1);
}

+ (void)_handleContentSeenForDataSource:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allItemsEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
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
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "assetCollection");
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            PLStoryGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v10;
              _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXFeedGadget incorrect dataSource object. Expect PXMemoryInfo got: %@", buf, 0xCu);
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXMemoriesSeenHelper defaultHelper](PXMemoriesSeenHelper, "defaultHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearAnyPendingNotificationsFromMemories:inLibrary:", v4, v13);
    objc_msgSend(v14, "clearAnyPendingStateFromMemories:inLibrary:", v4, v13);

    v3 = v15;
  }

}

+ (id)_photoKitMediaProviderWithPhotoLibrary:(id)a3
{
  id v3;
  id v4;
  PXPhotoKitUIMediaProvider *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:]([PXPhotoKitUIMediaProvider alloc], "initWithImageManager:library:", v4, v3);

  return v5;
}

@end
