@implementation PXTripsFeedConfiguration

- (PXTripsFeedConfiguration)initWithPhotoLibrary:(id)a3 actionPerformer:(id)a4
{
  id v7;
  id v8;
  PXTripsFeedItemLayoutFactory *v9;
  id v10;
  PXTripsFeedConfiguration *v11;
  PXTripsFeedConfiguration *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  PXTripsFeedConfiguration *v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(PXTripsFeedItemLayoutFactory);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PXTripsFeedConfiguration_initWithPhotoLibrary_actionPerformer___block_invoke;
  v16[3] = &unk_1E5141888;
  v10 = v7;
  v17 = v10;
  v18 = self;
  v15.receiver = v18;
  v15.super_class = (Class)PXTripsFeedConfiguration;
  v11 = -[PXFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:](&v15, sel_initWithDataSourceManagerPromise_specManagerPromise_itemLayoutFactory_, v16, &__block_literal_global_263422, v9);
  v12 = v11;
  if (v11)
  {
    -[PXFeedConfiguration setActionPerformer:](v11, "setActionPerformer:", v8);
    +[PXTripsFeedConfiguration _photoKitMediaProviderWithPhotoLibrary:](PXTripsFeedConfiguration, "_photoKitMediaProviderWithPhotoLibrary:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedConfiguration setMediaProvider:](v12, "setMediaProvider:", v13);

    objc_storeStrong((id *)&v12->_photoLibrary, a3);
  }

  return v12;
}

- (PXTripsFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 specManagerPromise:(id)a4 itemLayoutFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedConfiguration.m"), 85, CFSTR("%s is not available as initializer"), "-[PXTripsFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXTripsFeedConfiguration *v4;
  void *v5;
  void *v6;
  PXTripsFeedConfiguration *v7;
  void *v8;

  v4 = [PXTripsFeedConfiguration alloc];
  -[PXTripsFeedConfiguration photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedConfiguration actionPerformer](self, "actionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXTripsFeedConfiguration initWithPhotoLibrary:actionPerformer:](v4, "initWithPhotoLibrary:actionPerformer:", v5, v6);

  -[PXFeedConfiguration dataSourceManagerPromise](self, "dataSourceManagerPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedConfiguration setDataSourceManagerPromise:](v7, "setDataSourceManagerPromise:", v8);

  return v7;
}

- (id)objectReferenceForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assetCollectionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "type") == 28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "assetCollectionUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXTripsFeedConfiguration objectReferenceForDestination:]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXTripsFeedConfiguration.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tripUUID != nil"));

        }
        PLStoryGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v15 = v8;
          v16 = 2112;
          v17 = v7;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "couldn't find tripUUID %@ in %@", buf, 0x16u);
        }

      }
    }
    PLStoryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "couldn't find %@ in feed data source %@", buf, 0x16u);
    }

  }
  return 0;
}

- (id)viewControllerTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXCollectionTripsTitle"), CFSTR("LemonadeLocalizable"));
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXTripsFeedConfigurationDataSourceManagerContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedConfiguration.m"), 136, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXTripsFeedConfiguration _handleDataSourceChange](self, "_handleDataSourceChange");
    v9 = v11;
  }

}

- (id)_defaultSpecManagerWithExtendedTraitCollection:(id)a3
{
  id v3;
  PXTripsFeedViewLayoutSpecManager *v4;

  v3 = a3;
  v4 = -[PXTripsFeedViewLayoutSpecManager initWithTraitCollection:]([PXTripsFeedViewLayoutSpecManager alloc], "initWithTraitCollection:", v3);

  return v4;
}

- (BOOL)hidesBackButton
{
  return 1;
}

- (BOOL)wantsEmbeddedScrollView
{
  return 1;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return PLIsFeaturedContentAllowed() ^ 1;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

PXPhotoKitCollectionsDataSourceManager *__65__PXTripsFeedConfiguration_initWithPhotoLibrary_actionPerformer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v15;
  PXPhotoKitCollectionsDataSourceManager *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d OR type == %d"), 1, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonInterestingPromotionScore");
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("promotionScore >= %lf"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v13);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionsFetchResult:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionsFetchResult:", v14);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setUpdateKeyAssetFetchesInBackground:](v15, "setUpdateKeyAssetFetchesInBackground:", 1);
  v16 = -[PXPhotoKitCollectionsDataSourceManager initWithConfiguration:]([PXPhotoKitCollectionsDataSourceManager alloc], "initWithConfiguration:", v15);
  -[PXPhotoKitCollectionsDataSourceManager prepareBackgroundFetchingIfNeeded](v16, "prepareBackgroundFetchingIfNeeded");
  -[PXPhotoKitCollectionsDataSourceManager startBackgroundFetchingIfNeeded](v16, "startBackgroundFetchingIfNeeded");
  -[PXCollectionsDataSourceManager registerChangeObserver:context:](v16, "registerChangeObserver:context:", *(_QWORD *)(a1 + 40), PXTripsFeedConfigurationDataSourceManagerContext);

  return v16;
}

uint64_t __65__PXTripsFeedConfiguration_initWithPhotoLibrary_actionPerformer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_defaultSpecManagerWithExtendedTraitCollection:");
}

+ (id)_photoKitMediaProviderWithPhotoLibrary:(id)a3
{
  objc_class *v5;
  id v6;
  id v7;
  PXPhotoKitUIMediaProvider *v8;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0CD15A0];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXTripsFeedConfiguration.m"), 96, CFSTR("Attempting to present trips but photoLibrary is nil"));

  }
  v8 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:]([PXPhotoKitUIMediaProvider alloc], "initWithImageManager:library:", v7, v6);

  return v8;
}

@end
