@implementation PXSharedLibrarySharingSuggestionsFeedConfiguration

- (PXSharedLibrarySharingSuggestionsFeedConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedConfiguration.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionsFeedConfiguration init]");

  abort();
}

- (PXSharedLibrarySharingSuggestionsFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 specManagerPromise:(id)a4 itemLayoutFactory:(id)a5
{
  PXSharedLibrarySharingSuggestionsFeedConfiguration *v5;
  PXSharedLibrarySharingSuggestionsFeedActionPerformer *v6;
  void *v7;
  void *v8;
  void *v9;
  PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibrarySharingSuggestionsFeedConfiguration;
  v5 = -[PXFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:](&v12, sel_initWithDataSourceManagerPromise_specManagerPromise_itemLayoutFactory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PXSharedLibrarySharingSuggestionsFeedActionPerformer);
    -[PXFeedConfiguration setActionPerformer:](v5, "setActionPerformer:", v6);

    -[PXSharedLibrarySharingSuggestionsFeedConfiguration suggestionsDataSourceManager](v5, "suggestionsDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedConfiguration setMediaProvider:](v5, "setMediaProvider:", v9);

    v10 = -[PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory initWithPhotoLibrary:]([PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory alloc], "initWithPhotoLibrary:", v8);
    -[PXFeedConfiguration setPlaceholderFactory:](v5, "setPlaceholderFactory:", v10);

  }
  return v5;
}

- (PXSharedLibrarySharingSuggestionsFeedConfiguration)initWithDataSourceManager:(id)a3
{
  id v4;
  PXSharedLibrarySharingSuggestionsFeedItemLayoutFactory *v5;
  id v6;
  PXSharedLibrarySharingSuggestionsFeedConfiguration *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(PXSharedLibrarySharingSuggestionsFeedItemLayoutFactory);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PXSharedLibrarySharingSuggestionsFeedConfiguration_initWithDataSourceManager___block_invoke;
  v9[3] = &unk_1E51382E8;
  v10 = v4;
  v6 = v4;
  v7 = -[PXSharedLibrarySharingSuggestionsFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:](self, "initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:", v9, &__block_literal_global_221274, v5);

  return v7;
}

- (PXSharedLibrarySharingSuggestionsFeedActionPerformer)actionPerformer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibrarySharingSuggestionsFeedConfiguration;
  -[PXFeedConfiguration actionPerformer](&v3, sel_actionPerformer);
  return (PXSharedLibrarySharingSuggestionsFeedActionPerformer *)(id)objc_claimAutoreleasedReturnValue();
}

- (PXSharedLibrarySharingSuggestionsDataSourceManager)suggestionsDataSourceManager
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedConfiguration.m"), 64, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.dataSourceManager"), v8, v9);

    }
  }
  return (PXSharedLibrarySharingSuggestionsDataSourceManager *)v4;
}

- (int64_t)horizontalGadgetStyle
{
  return 0;
}

- (unint64_t)gadgetType
{
  return 20;
}

- (id)gadgetLocalizedTitle
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionGadgetTitle"));
}

- (BOOL)wantsMultilineGadgetTitle
{
  return 1;
}

- (id)localizedSubtitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsAnyItems"))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionGadgetSubtitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)gadgetAccessoryButtonType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXFeedConfiguration dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  return v4;
}

- (id)gadgetAccessoryButtonLocalizedTitle
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionGadgetSeeAllTitle"));
}

- (id)createSeeAllViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXSharedLibrarySharingSuggestionsFeedConfiguration actionPerformer](self, "actionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionsFeedConfiguration suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSeeAllViewControllerForPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectReferenceForDestination:(id)a3
{
  return 0;
}

- (BOOL)wantsEmbeddedScrollView
{
  return 1;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return 0;
}

- (void)handleContentSeen
{
  void *v2;
  void *v3;
  id v4;

  -[PXSharedLibrarySharingSuggestionsFeedConfiguration suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sharedLibrarySharingSuggestionsCountsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAnyNotificationsAsRead");

}

- (void)handleContentDismissed
{
  void *v2;
  void *v3;
  id v4;

  -[PXSharedLibrarySharingSuggestionsFeedConfiguration suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sharedLibrarySharingSuggestionsCountsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAllSuggestionsAsRead");

}

id __80__PXSharedLibrarySharingSuggestionsFeedConfiguration_initWithDataSourceManager___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __80__PXSharedLibrarySharingSuggestionsFeedConfiguration_initWithDataSourceManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "horizontalGadgetViewSpecManagerWithExtendedTraitCollection:");
}

@end
