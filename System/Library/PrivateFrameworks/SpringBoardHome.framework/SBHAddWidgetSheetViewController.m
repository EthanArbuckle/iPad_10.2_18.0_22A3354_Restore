@implementation SBHAddWidgetSheetViewController

- (SBHAddWidgetSheetViewController)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SBHAddWidgetSheetViewController *v10;
  SBHAddWidgetSheetViewController *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "listLayoutProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconViewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "style");
  v8 = SBHWidgetFilteringParametersNone();
  v13.receiver = self;
  v13.super_class = (Class)SBHAddWidgetSheetViewController;
  v10 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v13, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, v5, v6, v8, v9, 0, v7);
  v11 = v10;
  if (v10)
    -[SBHAddWidgetSheetViewController setConfiguration:](v10, "setConfiguration:", v4);

  return v11;
}

- (SBHAddWidgetSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  SBHAddWidgetSheetViewController *v7;
  SBHAddWidgetSheetViewController *v8;
  uint64_t v9;
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGSize v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGSize v23;
  __int128 v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGSize v31;
  __int128 v32;
  double v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SBHAddWidgetSheetViewController;
  v7 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v34, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, a3, a4, a5.families, *(_QWORD *)&a5.includesNonStackable, a6, a7);
  v8 = v7;
  if (v7)
  {
    v7->_galleryLayoutSize = 4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    suggestedItemsByGalleryLayoutSize = v8->_suggestedItemsByGalleryLayoutSize;
    v8->_suggestedItemsByGalleryLayoutSize = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](v8, "addWidgetSheetStyle") == 1)
    {
      v12 = SBHScreenTypeForCurrentDevice();
      SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v12, 3, (uint64_t)&v26);
      v13 = v26;
      v14 = v27;
      v15 = v29;
      *(_OWORD *)&v8->_landscapeMetrics.trailingPadding = v28;
      *(_OWORD *)&v8->_landscapeMetrics.widgetScaleFactor = v15;
      *(_OWORD *)&v8->_landscapeMetrics.sheetMargin = v13;
      *(_OWORD *)&v8->_landscapeMetrics.sidebarWidth = v14;
      v16 = v30;
      v17 = v31;
      v18 = v32;
      v8->_landscapeMetrics.detailPageControlTopSpacing = v33;
      v8->_landscapeMetrics.detailWidgetPadding = v17;
      *(_OWORD *)&v8->_landscapeMetrics.detailAddButtonTopSpacing = v18;
      *(_OWORD *)&v8->_landscapeMetrics.scaledWidgetSize.height = v16;
      SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v12, 1, (uint64_t)&v26);
      v19 = v26;
      v20 = v27;
      v21 = v29;
      *(_OWORD *)&v8->_portraitMetrics.trailingPadding = v28;
      *(_OWORD *)&v8->_portraitMetrics.widgetScaleFactor = v21;
      *(_OWORD *)&v8->_portraitMetrics.sheetMargin = v19;
      *(_OWORD *)&v8->_portraitMetrics.sidebarWidth = v20;
      v22 = v30;
      v23 = v31;
      v24 = v32;
      v8->_portraitMetrics.detailPageControlTopSpacing = v33;
      v8->_portraitMetrics.detailWidgetPadding = v23;
      *(_OWORD *)&v8->_portraitMetrics.detailAddButtonTopSpacing = v24;
      *(_OWORD *)&v8->_portraitMetrics.scaledWidgetSize.height = v22;
    }
    else if (!-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](v8, "addWidgetSheetStyle"))
    {
      -[SBHAddWidgetSheetViewController setWantsBottomAttachedPresentation:](v8, "setWantsBottomAttachedPresentation:", 1);
    }
    v8->_widgetScaleFactor = 1.0;
    v8->_isShowingDisfavoredApplicationWidgetCollections = 0;
  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController dealloc](&v4, sel_dealloc);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
    return 30;
  else
    return 2;
}

- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4
{
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suggestedItemsByGalleryLayoutSize, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v12)
  {
    v9 = self->_suggestedItemsByGalleryLayoutSize;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, v10);

    if (-[SBHAddWidgetSheetViewController isViewLoaded](self, "isViewLoaded")
      && self->_galleryLayoutSize == a4)
    {
      -[SBHAddWidgetSheetViewController _makeGalleryItemsFromHomeScreenItems:](self, "_makeGalleryItemsFromHomeScreenItems:", v12);
    }
    -[SBHAddWidgetSheetViewController _presentedGalleryViewController](self, "_presentedGalleryViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSuggestedItems:forGalleryLayoutSize:", v12, a4);

  }
}

- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3
{
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v4;
  void *v5;

  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suggestedItemsByGalleryLayoutSize, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_suggestedItems
{
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v3;
  void *v4;

  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_galleryLayoutSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suggestedItemsByGalleryLayoutSize, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *applicationWidgetCollections;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  NSMapTable *applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  NSMapTable *v12;
  NSMapTable *v13;
  NSArray *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v4 = a3;
  v5 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  applicationWidgetCollections = self->_applicationWidgetCollections;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke;
  v16[3] = &__block_descriptor_48_e40_B16__0__SBHApplicationWidgetCollection_8l;
  v16[4] = v5;
  v16[5] = v8;
  objc_msgSend(v4, "bs_filter:", v16);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v10 = self->_applicationWidgetCollections;
  self->_applicationWidgetCollections = v9;

  applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    -[NSMapTable removeAllObjects](applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v12;

  }
  v14 = self->_applicationWidgetCollections;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_3;
  v15[3] = &unk_1E8D87030;
  v15[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v15);
  -[SBHAddWidgetSheetViewController _splitApplicationWidgetCollections](self, "_splitApplicationWidgetCollections");
  if (applicationWidgetCollections)
    -[SBHAddWidgetSheetViewController _refreshData:](self, "_refreshData:", -[SBHAddWidgetSheetViewController _shouldAnimateChanges](self, "_shouldAnimateChanges"));
  else
    -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");
}

uint64_t __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  objc_msgSend(a2, "widgetDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_2;
  v6[3] = &__block_descriptor_48_e40_B16__0___SBHAddWidgetSheetGalleryItem__8l;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = SBHWidgetFilteringParametersNone();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6 == v4 && (v5 & 1) == *(_BYTE *)(a1 + 40) && ((v5 >> 8) & 1) == *(_BYTE *)(a1 + 41))
    goto LABEL_10;
  if ((objc_msgSend(v3, "sbh_supportedSizeClasses") & v6) == 0
    || !*(_BYTE *)(a1 + 40) && !objc_msgSend(v3, "sbh_canBeAddedToStack"))
  {
    v7 = 0;
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 41))
  {
LABEL_10:
    v7 = 1;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v3, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");
LABEL_11:

  return v7;
}

void __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1504);
  v3 = a2;
  objc_msgSend(v3, "collectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)setFavoredApplicationWidgetCollections:(id)a3
{
  id v5;
  NSObject *v6;
  NSMapTable *favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  NSMapTable *v8;
  NSMapTable *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAddWidgetSheet();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "setFavoredApplicationWidgetCollections:%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, a3);
  favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    -[NSMapTable removeAllObjects](favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v8;

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SBHAddWidgetSheetViewController_setFavoredApplicationWidgetCollections___block_invoke;
  v10[3] = &unk_1E8D87030;
  v10[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

}

void __74__SBHAddWidgetSheetViewController_setFavoredApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1512);
  v3 = a2;
  objc_msgSend(v3, "collectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)setDisfavoredApplicationWidgetCollections:(id)a3
{
  id v5;
  NSObject *v6;
  NSMapTable *disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  NSMapTable *v8;
  NSMapTable *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAddWidgetSheet();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "setDisFavoredApplicationWidgetCollections:%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, a3);
  disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    -[NSMapTable removeAllObjects](disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v8;

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBHAddWidgetSheetViewController_setDisfavoredApplicationWidgetCollections___block_invoke;
  v10[3] = &unk_1E8D87030;
  v10[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

}

void __77__SBHAddWidgetSheetViewController_setDisfavoredApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1520);
  v3 = a2;
  objc_msgSend(v3, "collectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)setCustomApplicationWidgetCollections:(id)a3
{
  NSArray *customApplicationWidgetCollections;
  NSMapTable *customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  NSMapTable *v7;
  NSMapTable *v8;
  id v9;
  id v10;
  _QWORD v11[5];

  v9 = a3;
  customApplicationWidgetCollections = self->_customApplicationWidgetCollections;
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, a3);
  customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    -[NSMapTable removeAllObjects](customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v7;

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SBHAddWidgetSheetViewController_setCustomApplicationWidgetCollections___block_invoke;
  v11[3] = &unk_1E8D87030;
  v11[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11, v9);
  if (customApplicationWidgetCollections)
    -[SBHAddWidgetSheetViewController _refreshData:](self, "_refreshData:", -[SBHAddWidgetSheetViewController _shouldAnimateChanges](self, "_shouldAnimateChanges"));
  else
    -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");

}

void __73__SBHAddWidgetSheetViewController_setCustomApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1528);
  v3 = a2;
  objc_msgSend(v3, "collectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
  -[SBHAddWidgetSheetViewController _splitApplicationWidgetCollections](self, "_splitApplicationWidgetCollections");
}

- (void)setGalleryLayoutSize:(unint64_t)a3
{
  void *v5;
  id v6;

  if (self->_galleryLayoutSize != a3)
  {
    self->_galleryLayoutSize = a3;
    if (-[SBHAddWidgetSheetViewController _shouldShowGallery](self, "_shouldShowGallery")
      && !-[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
    {
      -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");
    }
    else
    {
      -[SBHAddWidgetSheetViewController _suggestedItems](self, "_suggestedItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetSheetViewController _makeGalleryItemsFromHomeScreenItems:](self, "_makeGalleryItemsFromHomeScreenItems:", v5);

    }
    -[SBHAddWidgetSheetViewController _presentedGalleryViewController](self, "_presentedGalleryViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGalleryLayoutSize:", a3);

  }
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_wantsBottomAttachedPresentation != a3)
  {
    v3 = a3;
    self->_wantsBottomAttachedPresentation = a3;
    -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_searchController, "setShouldInsetContentForGrabber:");
    -[SBHAddWidgetSheetViewController sheetPresentationController](self, "sheetPresentationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setWantsBottomAttached:", v3);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  MTMaterialView *v5;
  MTMaterialView *backgroundView;
  MTMaterialView *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _SBHAddWidgetSheetCollectionView *v12;
  _SBHAddWidgetSheetCollectionView *v13;
  _SBHAddWidgetSheetCollectionView *collectionView;
  id v15;
  _SBHAddWidgetSheetCollectionView *v16;
  UICollectionViewDiffableDataSource *v17;
  UICollectionViewDiffableDataSource *diffableDataSource;
  _SBHAddWidgetSheetCollectionView *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  SBHWidgetSearchController *v26;
  SBHWidgetSearchController *searchController;
  SBHWidgetSearchController *v28;
  void *v29;
  SBHWidgetSearchController *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  NSArray *searchBarGradientMaskLayers;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id *v43;
  id *v44;
  id *v45;
  uint64_t v46;
  uint64_t v47;
  id (*v48)(uint64_t, void *, void *, void *);
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  objc_super v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController loadView](&v54, sel_loadView);
  -[SBHAddWidgetSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") != 1)
  {
    v5 = -[SBHAddWidgetSheetViewController _newBackgroundView](self, "_newBackgroundView");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    v7 = self->_backgroundView;
    objc_msgSend(v3, "bounds");
    -[MTMaterialView setFrame:](v7, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", self->_backgroundView);
  }
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v9 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __43__SBHAddWidgetSheetViewController_loadView__block_invoke;
  v51[3] = &unk_1E8D87058;
  v45 = &v52;
  objc_copyWeak(&v52, &location);
  v10 = (void *)objc_msgSend(v8, "initWithSectionProvider:", v51);
  v11 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  objc_msgSend(v11, "setInterSectionSpacing:", 16.0);
  objc_msgSend(v10, "setConfiguration:", v11);
  v12 = [_SBHAddWidgetSheetCollectionView alloc];
  objc_msgSend(v3, "bounds");
  v13 = -[_SBHAddWidgetSheetCollectionView initWithFrame:collectionViewLayout:](v12, "initWithFrame:collectionViewLayout:", v10);
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  -[_SBHAddWidgetSheetCollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[_SBHAddWidgetSheetCollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[_SBHAddWidgetSheetCollectionView setDelaysContentTouches:](self->_collectionView, "setDelaysContentTouches:", 0);
  -[_SBHAddWidgetSheetCollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("add-sheet-collection-view"));
  -[_SBHAddWidgetSheetCollectionView setContainsInteractiveUIControls:](self->_collectionView, "setContainsInteractiveUIControls:", objc_msgSend(v4, "contentContainsInteractiveUIControls"));
  v15 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v16 = self->_collectionView;
  v46 = v9;
  v47 = 3221225472;
  v48 = __43__SBHAddWidgetSheetViewController_loadView__block_invoke_2;
  v49 = &unk_1E8D87080;
  v43 = &v50;
  objc_copyWeak(&v50, &location);
  v17 = (UICollectionViewDiffableDataSource *)objc_msgSend(v15, "initWithCollectionView:cellProvider:", v16, &v46);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  -[_SBHAddWidgetSheetCollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  v19 = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHAddWidgetSheetCollectionView setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[_SBHAddWidgetSheetCollectionView setKeyboardDismissMode:](self->_collectionView, "setKeyboardDismissMode:", 2);
  -[_SBHAddWidgetSheetCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kSBHAddWidgetSheetGalleryCellReuseIdentifier"));
  -[_SBHAddWidgetSheetCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kSBHAddWidgetSheetViewControllerCollectionViewReuseIdentifier"));
  -[_SBHAddWidgetSheetCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kSBHAddWidgetSheetViewControllerListCellReuseIdentifier"));
  objc_msgSend(v3, "addSubview:", self->_collectionView);
  v21 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle");
  if (v21 != 1)
  {
    objc_msgSend(v4, "searchPlaceholderText", &v50, &v52, v46, v47, v48, v49);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      SBHBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("WIDGET_ADD_SHEET_SEARCH_PLACEHOLDER"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = -[SBHWidgetSearchController initWithAddWidgetSheetStyle:placeholderText:]([SBHWidgetSearchController alloc], "initWithAddWidgetSheetStyle:placeholderText:", v21, v24);
    searchController = self->_searchController;
    self->_searchController = v26;

    -[SBHWidgetSearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[SBHWidgetSearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[SBHWidgetSearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
    -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_searchController, "setShouldInsetContentForGrabber:", self->_wantsBottomAttachedPresentation);
    -[SBHWidgetSearchController setApplicationCellIncludesGalleryListView:](self->_searchController, "setApplicationCellIncludesGalleryListView:", objc_msgSend(v4, "applicationCellIncludesGalleryListView"));
    v28 = self->_searchController;
    objc_msgSend(v4, "listLayoutProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetSearchController setListLayoutProvider:](v28, "setListLayoutProvider:", v29);

    v30 = self->_searchController;
    objc_msgSend(v4, "gridSizeClassForContentWidth");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetSearchController setWidthDefiningGridSizeClass:](v30, "setWidthDefiningGridSizeClass:", v31);

    -[SBHWidgetSearchController searchBar](self->_searchController, "searchBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewController _updateSearchBarContentInsets](self, "_updateSearchBarContentInsets");
    objc_msgSend(v32, "sizeToFit");
    objc_msgSend(v4, "searchTintColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v32, "setTintColor:", v33);
    -[SBHAddWidgetSheetViewController _updateSearchBarOverrideUserInterfaceStyle](self, "_updateSearchBarOverrideUserInterfaceStyle");
    objc_msgSend(v3, "addSubview:", v32);
    -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets");
    objc_msgSend(MEMORY[0x1E0DA9E00], "configureGradientMaskForFeatherBlurRecipe:onContentView:", 4, self->_collectionView);
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v34;

    -[SBHAddWidgetSheetViewController _layoutSearchBarGradientMaskLayers](self, "_layoutSearchBarGradientMaskLayers");
  }
  -[SBHAddWidgetSheetViewController _materialViewForVisualStyling](self, "_materialViewForVisualStyling", v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "visualStylingProviderForCategory:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetSearchController searchBarTextFieldBackgroundView](self->_searchController, "searchBarTextFieldBackgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "automaticallyUpdateView:withStyle:", v38, 2);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__backgroundTapped_);
  objc_msgSend(v39, "setCancelsTouchesInView:", 0);
  -[_SBHAddWidgetSheetCollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v39);
  objc_opt_self();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)-[SBHAddWidgetSheetViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v41, sel__updateSearchBarOverrideUserInterfaceStyle);

  -[SBHAddWidgetSheetViewController _addBarSwipeView](self, "_addBarSwipeView");
  objc_destroyWeak(v44);

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);

}

id __43__SBHAddWidgetSheetViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    v9 = v8;

    objc_msgSend(WeakRetained, "_generateLayoutSectionForSectionIdx:width:", a2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __43__SBHAddWidgetSheetViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "collectionView:cellForItemAtIndexPath:itemIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_newBackgroundView
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  -[SBHAddWidgetSheetViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "backgroundMaterial");
    if (v4 > 2)
      v5 = 0;
    else
      v5 = qword_1D0190DB8[v4];
  }
  else
  {
    v5 = 54;
  }
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackdropScaleAdjustment:", &__block_literal_global_18);
  objc_msgSend(v6, "setGroupNameBase:", CFSTR("Add-Sheet"));

  return v6;
}

double __53__SBHAddWidgetSheetViewController__newBackgroundView__block_invoke()
{
  return 0.25;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  _SBHAddWidgetSheetCollectionView *collectionView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  collectionView = self->_collectionView;
  v5 = a3;
  -[_SBHAddWidgetSheetCollectionView contentInset](collectionView, "contentInset");
  v7 = v6;
  -[_SBHAddWidgetSheetCollectionView contentOffset](self->_collectionView, "contentOffset");
  v9 = v8;
  -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_contentSizeCategoryDidChange:", v5);

  objc_msgSend(v11, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(v10, "layoutIfNeeded");
  -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets");
  -[_SBHAddWidgetSheetCollectionView contentInset](self->_collectionView, "contentInset");
  -[_SBHAddWidgetSheetCollectionView contentOffset](self->_collectionView, "contentOffset");
  if (v9 == -v7)
    -[_SBHAddWidgetSheetCollectionView setContentOffset:](self->_collectionView, "setContentOffset:");
  -[SBHAddWidgetSheetViewController _layoutSearchBarGradientMaskLayers](self, "_layoutSearchBarGradientMaskLayers");
  -[SBHAddWidgetSheetViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", self->_collectionView);

}

- ($A8FDFC956663B0B54E66E9982D7A2B15)sheetIconMetrics
{
  SBIconImageInfo *p_var1;
  $A8FDFC956663B0B54E66E9982D7A2B15 *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  CGFloat v14;

  p_var1 = &self[36].var1;
  if (self[36].var1.size.width == 0.0)
  {
    v5 = self;
    -[$A8FDFC956663B0B54E66E9982D7A2B15 traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = v7;

    -[$A8FDFC956663B0B54E66E9982D7A2B15 configuration](v5, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "applicationCellIncludesGalleryListView");

    if (v10)
    {
      SBHAddWidgetSheetListViewIconMetricsForScale((uint64_t)v13, v8);
LABEL_8:
      v11 = v13[1];
      p_var1->size = (CGSize)v13[0];
      *(_OWORD *)&p_var1->scale = v11;
      p_var1[1].size.width = v14;
      goto LABEL_9;
    }
    self = ($A8FDFC956663B0B54E66E9982D7A2B15 *)-[$A8FDFC956663B0B54E66E9982D7A2B15 addWidgetSheetStyle](v5, "addWidgetSheetStyle");
    if (self == ($A8FDFC956663B0B54E66E9982D7A2B15 *)1)
    {
      SBHAddWidgetSheetSplitViewIconMetricsForScale((uint64_t)v13, v8);
      goto LABEL_8;
    }
    if (!self)
    {
      SBHAddWidgetSheetCompactViewIconMetricsForScale((uint64_t)v13, v8);
      goto LABEL_8;
    }
  }
LABEL_9:
  v12 = *(_OWORD *)&p_var1->scale;
  *(CGSize *)&retstr->var0 = p_var1->size;
  *(_OWORD *)&retstr->var1.size.height = v12;
  retstr->var1.continuousCornerRadius = p_var1[1].size.width;
  return self;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *lastSelectedIndexPath;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerWillAppear:", self);

  -[SBHAddWidgetSheetViewController _suggestedItems](self, "_suggestedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHAddWidgetSheetViewController _shouldShowGallery](self, "_shouldShowGallery") && v5 && !self->_galleryItems)
    -[SBHAddWidgetSheetViewController _makeGalleryItemsFromHomeScreenItems:](self, "_makeGalleryItemsFromHomeScreenItems:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__keyboardWillDismiss_, *MEMORY[0x1E0DC4FE0], 0);

  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    -[SBHAddWidgetSheetViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNavigationBarHidden:", 1);

    if (!self->_performedInitialSelection)
    {
      self->_performedInitialSelection = 1;
      if (!-[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
      {
        -[SBHAddWidgetSheetViewController _selectFirstItem](self, "_selectFirstItem");
        if (!self->_lastSelectedIndexPath)
        {
          -[SBHAddWidgetSheetViewController _presentGalleryCell](self, "_presentGalleryCell");
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 2);
          v9 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
          lastSelectedIndexPath = self->_lastSelectedIndexPath;
          self->_lastSelectedIndexPath = v9;

        }
      }
    }
  }
  else if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidAppear:", self);

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6)
      goto LABEL_7;
LABEL_6:
    -[_SBHAddWidgetSheetCollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
    -[_SBHAddWidgetSheetCollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 34);
    goto LABEL_7;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_6;
LABEL_7:
  -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerWillDisappear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidDisappear:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSearchBarBackgroundForScrollDistance:forClient:", self, 2.22507386e-308);

  self->_sheetIconMetrics.horizontalSpacing = 0.0;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBHAddWidgetSheetViewController _layoutSearchBarGradientMaskLayers](self, "_layoutSearchBarGradientMaskLayers");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[SBHAddWidgetSheetViewController _updateSearchBarContentInsets](self, "_updateSearchBarContentInsets");
  -[SBHAddWidgetSheetViewController _layoutCollectionViewForScalingIfNeeded](self, "_layoutCollectionViewForScalingIfNeeded");
  -[SBHWidgetSearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  if (!-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle"))
  {
    -[SBHAddWidgetSheetViewController sheetPresentationController](self, "sheetPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetSearchController grabberTopSpacing](self->_searchController, "grabberTopSpacing");
    objc_msgSend(v4, "_setGrabberTopSpacing:");

  }
}

- (void)_layoutCollectionViewForScalingIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  _SBHAddWidgetSheetCollectionView *collectionView;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1
    && -[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
  {
    -[SBHAddWidgetSheetViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    -[SBHAddWidgetSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation");
    objc_msgSend(v3, "bounds");
    v21 = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v3, "bounds");
    UIRectGetCenter();
    v12 = v11;
    v14 = v13;
    -[_SBHAddWidgetSheetCollectionView contentOffset](self->_collectionView, "contentOffset");
    v16 = v15;
    v18 = v17;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v19;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if ((BSFloatIsOne() & 1) == 0)
    {
      CGAffineTransformMakeScale(&v23, *(CGFloat *)&v27, *(CGFloat *)&v27);
      v8 = *((double *)&v25 + 1) + *(double *)&v26 + (v8 - (*((double *)&v25 + 1) + *(double *)&v26)) / 0.0;
      v10 = v10 / 0.0;
    }
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      collectionView = self->_collectionView;
      v22 = v23;
      -[_SBHAddWidgetSheetCollectionView setTransform:](collectionView, "setTransform:", &v22);
      -[_SBHAddWidgetSheetCollectionView setCenter:](self->_collectionView, "setCenter:", v12, v14);
      -[_SBHAddWidgetSheetCollectionView setBounds:](self->_collectionView, "setBounds:", v21, v6, v8, v10);
      -[_SBHAddWidgetSheetCollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v16, v18);
      *(_QWORD *)&self->_widgetScaleFactor = v27;
    }

  }
}

- (void)_layoutSearchBarGradientMaskLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 4);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHWidgetSearchController searchBarBackgroundView](self->_searchController, "searchBarBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = self->_searchBarGradientMaskLayers;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = v19 - (v4 + v8);
    v24 = v17 - (v6 + v10);
    v25 = v4 + v15;
    v26 = v6 + v13;
    v27 = *(_QWORD *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v28++), "setFrame:", v26, v25, v24, v23, (_QWORD)v29);
      }
      while (v22 != v28);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v22);
  }

}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  _SBHAddWidgetSheetCollectionView *v5;
  _SBHAddWidgetSheetCollectionView *v6;
  _SBHAddWidgetSheetCollectionView *v7;
  BOOL v8;
  _SBHAddWidgetSheetCollectionView *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController didMoveToParentViewController:](&v10, sel_didMoveToParentViewController_, a3);
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1
    && -[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
  {
    -[SBHAddWidgetSheetViewController splitViewController](self, "splitViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (_SBHAddWidgetSheetCollectionView *)objc_claimAutoreleasedReturnValue();

    v6 = self->_collectionView;
    v7 = v6;
    if (v6)
      v8 = v6 == v5;
    else
      v8 = 1;
    if (!v8)
    {
      do
      {
        v9 = v7;
        -[_SBHAddWidgetSheetCollectionView setClipsToBounds:](v7, "setClipsToBounds:", 0);
        -[_SBHAddWidgetSheetCollectionView superview](v7, "superview");
        v7 = (_SBHAddWidgetSheetCollectionView *)objc_claimAutoreleasedReturnValue();

      }
      while (v7 && v7 != v5);
    }

  }
}

- (void)setGalleryItems:(id)a3
{
  NSArray *v4;
  NSMapTable *galleryIdentifierToGalleryItemLookupTable;
  NSMapTable *v6;
  NSMapTable *v7;
  _BOOL4 v8;
  NSArray *v9;
  NSArray *galleryItems;
  NSArray *v11;
  id v12;
  _QWORD v13[5];

  v4 = (NSArray *)a3;
  if (self->_galleryItems != v4)
  {
    v12 = v4;
    galleryIdentifierToGalleryItemLookupTable = self->_galleryIdentifierToGalleryItemLookupTable;
    if (galleryIdentifierToGalleryItemLookupTable)
    {
      -[NSMapTable removeAllObjects](galleryIdentifierToGalleryItemLookupTable, "removeAllObjects");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_galleryIdentifierToGalleryItemLookupTable;
      self->_galleryIdentifierToGalleryItemLookupTable = v6;

    }
    v8 = ((unint64_t)v12 | (unint64_t)self->_galleryItems) != 0;
    if (v12)
      v9 = (NSArray *)objc_msgSend(v12, "copy");
    else
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    galleryItems = self->_galleryItems;
    self->_galleryItems = v9;

    v11 = self->_galleryItems;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__SBHAddWidgetSheetViewController_setGalleryItems___block_invoke;
    v13[3] = &unk_1E8D870A8;
    v13[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v13);
    if (v8)
      -[SBHAddWidgetSheetViewController _refreshData:](self, "_refreshData:", -[SBHAddWidgetSheetViewController _shouldAnimateChanges](self, "_shouldAnimateChanges"));
    else
      -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");
    v4 = (NSArray *)v12;
  }

}

void __51__SBHAddWidgetSheetViewController_setGalleryItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1496);
  v3 = a2;
  objc_msgSend(v3, "galleryItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sbh_galleryItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)setBarSwipeViewController:(id)a3
{
  UIViewController *v5;
  int v6;
  UIViewController *v7;

  v5 = (UIViewController *)a3;
  if (self->_barSwipeViewController != v5)
  {
    v7 = v5;
    -[SBHAddWidgetSheetViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_storeStrong((id *)&self->_barSwipeViewController, a3);
    v6 = -[SBHAddWidgetSheetViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[SBHAddWidgetSheetViewController _addBarSwipeView](self, "_addBarSwipeView");
      v5 = v7;
    }
  }

}

- (void)_addBarSwipeView
{
  void *v3;
  id v4;

  -[SBHAddWidgetSheetViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_barSwipeViewController);
  -[UIViewController view](self->_barSwipeViewController, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "setAutoresizingMask:", 18);

}

- (void)setExternalSearchController:(id)a3
{
  SBHWidgetSearchController *v5;
  SBHWidgetSearchController *v6;

  v5 = (SBHWidgetSearchController *)a3;
  if (self->_externalSearchController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_externalSearchController, a3);
    -[SBHAddWidgetSheetViewController _updateSearchBarOverrideUserInterfaceStyle](self, "_updateSearchBarOverrideUserInterfaceStyle");
    v5 = v6;
  }

}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "addWidgetSheetViewControllerDidCancel:", self);

}

- (void)_backgroundTapped:(id)a3
{
  _SBHAddWidgetSheetCollectionView *collectionView;
  void *v5;
  void *v6;
  int v7;
  id v8;

  collectionView = self->_collectionView;
  objc_msgSend(a3, "locationInView:", collectionView);
  -[_SBHAddWidgetSheetCollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SBHAddWidgetSheetViewController searchController](self, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      -[SBHAddWidgetSheetViewController searchController](self, "searchController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActive:", 0);

    }
  }
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  id v27;
  CGRect v28;
  CGRect v29;

  objc_msgSend(a3, "userInfo");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SBHAddWidgetSheetViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromView:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v4, "bounds");
  v29.origin.x = v23;
  v29.origin.y = v24;
  v29.size.width = v25;
  v29.size.height = v26;
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  self->_keyboardFrameIntersect = CGRectIntersection(v28, v29);
  -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets");

}

- (void)_keyboardWillDismiss:(id)a3
{
  CGSize v3;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_keyboardFrameIntersect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_keyboardFrameIntersect.size = v3;
  -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock") & 1) == 0)
  {
    objc_msgSend(v9, "adjustedContentInset");
    v5 = v4;
    objc_msgSend(v9, "contentOffset");
    v7 = v6;
    -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSearchBarBackgroundForScrollDistance:forClient:", self, v5 + v7);

    -[SBHAddWidgetSheetViewController _layoutSearchBarGradientMaskLayers](self, "_layoutSearchBarGradientMaskLayers");
  }

}

- (id)_generateSnapshotDiffedFromSnapshot:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *, id);
  id v7;
  uint64_t i;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke;
  aBlock[3] = &unk_1E8D87138;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  for (i = 0; i != 4; ++i)
  {
    if (i)
    {
      if (!-[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
        __asm { BR              X8 }
    }
    else if (-[SBHAddWidgetSheetViewController _shouldShowGallery](self, "_shouldShowGallery"))
    {
      -[SBHAddWidgetSheetViewController galleryItems](self, "galleryItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v9, v7);

    }
  }

  return v7;
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionGallery"));

    if ((v8 & 1) == 0)
    {
      v16[0] = CFSTR("SBHAddSheetCollectionViewSectionGallery");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendSectionsWithIdentifiers:", v9);

    }
    objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_84);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:", v10);
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionGallery"));

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifiersInSectionWithIdentifier:", CFSTR("SBHAddSheetCollectionViewSectionGallery"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_3;
      v14[3] = &unk_1E8D87110;
      v15 = v6;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

    }
  }

}

id __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "galleryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sbh_galleryItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfItemIdentifier:", v3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 32);
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v5);

  }
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionApplications"));

  if ((v4 & 1) == 0)
  {
    v8[0] = CFSTR("SBHAddSheetCollectionViewSectionApplications");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendSectionsWithIdentifiers:", v5);

  }
  v7 = CFSTR("kSBHAddWidgetSheetGallerySuggestionsItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendItemsWithIdentifiers:", v6);

}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionCustomApplications"));

  if ((v7 & 1) == 0)
  {
    v10[0] = CFSTR("SBHAddSheetCollectionViewSectionCustomApplications");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v8);

  }
  objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_91);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItemsWithIdentifiers:", v9);

}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collectionIdentifier");
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "sectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionApplications"));

    if ((v7 & 1) == 0)
    {
      v10[0] = CFSTR("SBHAddSheetCollectionViewSectionApplications");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendSectionsWithIdentifiers:", v8);

    }
    objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_93);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendItemsWithIdentifiers:", v9);

  }
}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collectionIdentifier");
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionDisfavoredApplications"));

  if ((v4 & 1) == 0)
  {
    v8[0] = CFSTR("SBHAddSheetCollectionViewSectionDisfavoredApplications");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendSectionsWithIdentifiers:", v5);

  }
  v7 = CFSTR("kSBHAddWidgetSheetOtherItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendItemsWithIdentifiers:", v6);

}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("SBHAddSheetCollectionViewSectionDisfavoredApplications"));

  if ((v7 & 1) == 0)
  {
    v12[0] = CFSTR("SBHAddSheetCollectionViewSectionDisfavoredApplications");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v8);

  }
  v11 = CFSTR("kSBHAddWidgetSheetOtherDescriptionItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendItemsWithIdentifiers:", v9);

  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_96);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "appendItemsWithIdentifiers:", v10);

}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collectionIdentifier");
}

- (void)_refreshData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UICollectionViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController _generateSnapshotDiffedFromSnapshot:](self, "_generateSnapshotDiffedFromSnapshot:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v6, v3);
}

- (void)_reloadData
{
  -[SBHAddWidgetSheetViewController _reloadData:](self, "_reloadData:", 0);
}

- (void)_reloadData:(BOOL)a3
{
  void *v5;
  char v6;
  id v7;

  -[SBHAddWidgetSheetViewController _generateSnapshotDiffedFromSnapshot:](self, "_generateSnapshotDiffedFromSnapshot:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a3
    || (-[UICollectionViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v7, "isEqual:", v5),
        v5,
        (v6 & 1) == 0))
  {
    -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](self->_diffableDataSource, "applySnapshotUsingReloadData:", v7);
  }

}

- (unint64_t)_sectionIndexForSection:(unint64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;

  v5 = -[SBHAddWidgetSheetViewController _shouldShowGallery](self, "_shouldShowGallery");
  v6 = -[SBHAddWidgetSheetViewController _shouldShowCustomApplicationsSection](self, "_shouldShowCustomApplicationsSection");
  if (v5 && v6)
    return a3;
  if (!v5 && !v6)
  {
    a3 -= 2;
    return a3;
  }
  if (v6)
    return --a3;
  if (a3)
    return a3 - 1;
  else
    return 0;
}

- (unint64_t)_applicationWidgetCollectionIndexForItemIndex:(unint64_t)a3
{
  _BOOL4 v4;
  unint64_t v5;

  v4 = -[SBHAddWidgetSheetViewController _shouldShowSuggestionsListItem](self, "_shouldShowSuggestionsListItem");
  v5 = a3 - 1;
  if (!a3)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
    return v5;
  else
    return a3;
}

- (unint64_t)_itemIndexForApplicationWidgetCollectionIndex:(unint64_t)a3
{
  return a3 + -[SBHAddWidgetSheetViewController _shouldShowSuggestionsListItem](self, "_shouldShowSuggestionsListItem");
}

- (BOOL)_shouldAnimateChanges
{
  int v3;

  v3 = -[SBHAddWidgetSheetViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
    LOBYTE(v3) = -[SBHAddWidgetSheetViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBHAddWidgetSheetViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  double leading;
  double trailing;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  SBIconListView *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  int v57;
  SBHIconGridSizeClassSizeMap *v58;
  uint64_t v59;
  SBHIconGridSizeClassSizeMap *v60;
  SBIconListModel *v61;
  void *v62;
  void *v63;
  SBIconListView *v64;
  void *v65;
  void *v66;
  SBIconListView *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL8 v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v86;
  void *v87;
  id v88;
  id v89;
  SBIconListView *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  double v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "section");
  if (v11 != -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 0))
  {
    v21 = objc_msgSend(v9, "section");
    if (v21 != -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 2))
    {
      v22 = objc_msgSend(v9, "section");
      if (v22 != -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 3))
      {
        v23 = objc_msgSend(v9, "section");
        if (v23 != -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 1))
        {
          v12 = 0;
          goto LABEL_65;
        }
      }
    }
    v103 = 0.0;
    v101 = 0u;
    v102 = 0u;
    -[SBHAddWidgetSheetViewController sheetIconMetrics](self, "sheetIconMetrics");
    -[SBHAddWidgetSheetViewController configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "applicationCellIncludesGalleryListView"))
    {
      objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kSBHAddWidgetSheetViewControllerListCellReuseIdentifier"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIconImageInfo:", *((double *)&v101 + 1), v102, v103);
      v25 = objc_msgSend(v9, "section");
      if (v25 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 1))
      {
        -[NSMapTable objectForKey:](self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "objectForKey:", v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "displayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "length");

        if (!v28)
          objc_msgSend(v12, "setWantsHeaderView:", 0);
      }
      else
      {
        -[NSMapTable objectForKey:](self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, "objectForKey:", v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "customImage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = v24;
      if (v39)
      {
        objc_msgSend(v26, "customImage");
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "customImageBackgroundColor");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "traitCollection");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "icon");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "applicationBundleID");
        v49 = v26;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        SBHGetApplicationIconImageWithTraitCollection(v50, (uint64_t)v47, 0, *((double *)&v101 + 1), *(double *)&v102, *((double *)&v102 + 1));
        v40 = objc_claimAutoreleasedReturnValue();

        v26 = v49;
        v24 = v96;
        v41 = 0;
      }
      v93 = (void *)v40;
      objc_msgSend(v12, "setIconImage:", v40);
      v92 = (void *)v41;
      objc_msgSend(v12, "setIconBackgroundColor:", v41);
      objc_msgSend(v26, "displayName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v51);

      objc_msgSend(v12, "iconListView");
      v52 = (SBIconListView *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView model](v52, "model");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)v53;
      v94 = v10;
      if (v52)
      {
        v90 = v52;
        v91 = (void *)v53;
      }
      else
      {
        v86 = v26;
        -[SBHAddWidgetSheetViewController _listLayoutForWidgetSizing](self, "_listLayoutForWidgetSizing");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (unsigned __int16)objc_msgSend(v55, "numberOfColumnsForOrientation:", 1);
        v57 = objc_msgSend(v55, "numberOfRowsForOrientation:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v55, "iconGridSizeClassSizes");
          v58 = (SBHIconGridSizeClassSizeMap *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
        }
        v60 = v58;
        v88 = v8;
        v61 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithFolder:gridSize:gridSizeClassSizes:", 0, (v57 << 16) | (unint64_t)(unsigned __int16)v56, v58);

        -[SBIconListModel setIconLayoutBehavior:](v61, "setIconLayoutBehavior:", 3);
        objc_msgSend(v96, "gridSizeClassDomain");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListModel setGridSizeClassDomain:](v61, "setGridSizeClassDomain:", v62);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v55, "supportedIconGridSizeClasses");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconListModel setAllowedGridSizeClasses:](v61, "setAllowedGridSizeClasses:", v63);

        }
        v64 = [SBIconListView alloc];
        -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v61;
        v67 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](v64, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v61, v65, CFSTR("SBIconLocationRoot"), 1, v66);

        -[SBIconListView setIconViewConfigurationOptions:](v67, "setIconViewConfigurationOptions:", 82);
        -[SBIconListView setIconSpacing:](v67, "setIconSpacing:", SBHIconListLayoutListIconSpacingWithDefault(v55, 1, 12.0));
        v90 = v67;
        objc_msgSend(v12, "setIconListView:", v67);

        v26 = v86;
        v8 = v88;
        v24 = v96;
      }
      v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "filteredWidgetDescriptors");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v70, "count"))
        objc_msgSend(v26, "filteredWidgetDescriptors");
      else
        objc_msgSend(v26, "widgetDescriptors");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v87 = v26;
        v89 = v8;
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v71 = v95;
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v98;
          do
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v98 != v74)
                objc_enumerationMutation(v71);
              objc_msgSend(v69, "addWidgetSheetViewController:widgetIconForGalleryItem:", self, *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "bs_safeAddObject:", v76);

            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
          }
          while (v73);
        }

        v26 = v87;
        v8 = v89;
        v24 = v96;
      }
      objc_msgSend(v91, "setIcons:", v68);
      v77 = objc_msgSend(v8, "numberOfSections") - 1;
      v78 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v9, "section"));
      v79 = objc_msgSend(v9, "section") != v77 || objc_msgSend(v9, "item") != v78 - 1;
      objc_msgSend(v12, "setSeparatorVisible:", v79);

      v10 = v94;
LABEL_64:

      goto LABEL_65;
    }
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kSBHAddWidgetSheetViewControllerCollectionViewReuseIdentifier"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle");
    objc_msgSend(v12, "setAddWidgetSheetStyle:", v29);
    objc_msgSend(v12, "setSeparatorAlignedToLabels:", 1);
    leading = 12.0;
    trailing = 12.0;
    if (!v29)
    {
      leading = self->_contentInsets.leading;
      trailing = self->_contentInsets.trailing;
    }
    objc_msgSend(v12, "setContentInsets:", 12.0, leading, 12.0, trailing);
    objc_msgSend(v12, "setContentHorizontalSpacing:", *(double *)&v101);
    objc_msgSend(v12, "setSeparatorVisible:", objc_msgSend(v9, "item") != objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v9, "section")) - 1);
    objc_msgSend(v12, "setIconImageInfo:", *((double *)&v101 + 1), v102, v103);
    v32 = objc_msgSend(v9, "section");
    if (v32 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 2))
    {
      if (objc_msgSend(v10, "isEqual:", CFSTR("kSBHAddWidgetSheetGallerySuggestionsItemIdentifier")))
      {
        objc_msgSend(v12, "textLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        SBHBundle();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("ADD_WIDGET_SHEET_SUGGESTIONS_CELL_LABEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setText:", v35);

        objc_msgSend(v12, "imageView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0DC3870];
        v38 = CFSTR("rectangle.3.offgrid");
LABEL_27:
        objc_msgSend(v37, "systemImageNamed:", v38);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setImage:", v46);

        objc_msgSend(v12, "setImageViewRequiresVisualStyling:", 1);
        goto LABEL_60;
      }
      v59 = 1512;
    }
    else
    {
      v42 = objc_msgSend(v9, "section");
      if (v42 != -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 3))
        goto LABEL_60;
      if (objc_msgSend(v10, "isEqual:", CFSTR("kSBHAddWidgetSheetOtherItemIdentifier")))
      {
        objc_msgSend(v12, "textLabel");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        SBHBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("ADD_WIDGET_SHEET_OTHER_CELL_LABEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setText:", v45);

        objc_msgSend(v12, "imageView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0DC3870];
        v38 = CFSTR("ellipsis");
        goto LABEL_27;
      }
      if (objc_msgSend(v10, "isEqual:", CFSTR("kSBHAddWidgetSheetOtherDescriptionItemIdentifier")))
      {
        -[SBHAddWidgetSheetViewController _otherDescriptionLabel](self, "_otherDescriptionLabel");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDetailText:", v80);
        objc_msgSend(v12, "imageView");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setHidden:", 1);

        objc_msgSend(v12, "setUserInteractionEnabled:", 0);
LABEL_59:

LABEL_60:
        objc_msgSend(v12, "visualStylingProvider");
        v83 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v83;
        if (v29 == 1 && !v83)
        {
          -[SBHAddWidgetSheetViewController _materialViewForVisualStyling](self, "_materialViewForVisualStyling");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "visualStylingProviderForCategory:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setVisualStylingProvider:", v26);
        }
        objc_msgSend(v12, "setFocusEffect:", 0);
        goto LABEL_64;
      }
      v59 = 1520;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v59), "objectForKey:", v10);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewControllerBase appCellConfigurator](self, "appCellConfigurator");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "configureCell:withApplicationWidgetCollection:", v12, v80);

    objc_msgSend(v12, "setImageViewRequiresVisualStyling:", 0);
    goto LABEL_59;
  }
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kSBHAddWidgetSheetGalleryCellReuseIdentifier"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld/%@"), objc_msgSend(v9, "item"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[NSMapTable objectForKey:](self->_galleryIdentifierToGalleryItemLookupTable, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widgetWrapperViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v15)
  {
    objc_msgSend(v15, "parentViewController");
    v17 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();
    if (v17 == self)
    {
      objc_msgSend(v15, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperview");

      objc_msgSend(v15, "removeFromParentViewController");
      v17 = 0;
    }
    objc_msgSend(v12, "setWidgetWrapperViewController:", v15);
    if (v17 != self)
    {
      objc_msgSend(v12, "widgetWrapperViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetSheetViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v19, v20);

    }
  }

LABEL_65:
  return v12;
}

- (id)applicationWidgetCollectionsToUse
{
  NSArray *filteredApplicationWidgetCollections;

  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  if (!filteredApplicationWidgetCollections)
    filteredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
  return filteredApplicationWidgetCollections;
}

- (void)_splitApplicationWidgetCollections
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  SBHAddWidgetSheetViewController *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetSheetViewController applicationWidgetCollections](self, "applicationWidgetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  v4 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v5 = 0;
  if (v23)
  {
    v24 = 0;
    v22 = *(_QWORD *)v34;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v7, "widgetDescriptors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        v26 = v5;
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v27 = 0;
          v12 = 0;
          v13 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v8);
              v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              v16 = -[SBHAddWidgetSheetViewController addWidgetSheetLocation](v28, "addWidgetSheetLocation");
              if ((objc_msgSend(v15, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v16) & v4) == 0)
                goto LABEL_15;
              if (!v11)
                v11 = (void *)objc_msgSend(v7, "copy");
              objc_msgSend(v11, "setDisfavored:", 1);
              if ((objc_msgSend(v15, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v16) & v4) == 0)
              {
                v17 = v27;
                if (!v27)
                  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v27 = v17;
                objc_msgSend(v17, "addObject:", v15);
              }
              else
              {
LABEL_15:
                if (!v12)
                  v12 = (void *)objc_msgSend(v7, "copy");
                objc_msgSend(v12, "setDisfavored:", 0);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
          v27 = 0;
          v12 = 0;
        }

        objc_msgSend(v12, "widgetDescriptors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "removeObjectsInArray:", v27);
        objc_msgSend(v12, "setWidgetDescriptors:", v19);
        if (v12)
        {
          v20 = v24;
          v5 = v26;
          if (!v24)
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v24 = v20;
          objc_msgSend(v20, "addObject:", v12);
        }
        else
        {
          v5 = v26;
        }
        if (v11)
        {
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "addObject:", v11);
        }

        v6 = v25 + 1;
      }
      while (v25 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  -[SBHAddWidgetSheetViewController setFavoredApplicationWidgetCollections:](v28, "setFavoredApplicationWidgetCollections:", v24);
  -[SBHAddWidgetSheetViewController setDisfavoredApplicationWidgetCollections:](v28, "setDisfavoredApplicationWidgetCollections:", v5);

}

- (id)_otherDescriptionLabel
{
  unint64_t v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = -[SBHAddWidgetSheetViewController addWidgetSheetLocation](self, "addWidgetSheetLocation");
  if (v2 == 2)
  {
    v3 = CFSTR("ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_AMBIENT");
    goto LABEL_12;
  }
  if (v2 == 1)
  {
    v3 = CFSTR("ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPAD_LOCK_SCREEN");
    goto LABEL_12;
  }
  if (v2)
  {
    v3 = 0;
    goto LABEL_12;
  }
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
      goto LABEL_6;
LABEL_11:
    v3 = CFSTR("ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPHONE_HOME_SCREEN");
    goto LABEL_12;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_11;
LABEL_6:
  v3 = CFSTR("ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPAD_HOME_SCREEN");
LABEL_12:
  v6 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_WIDGET_SHEET_OTHER_DESCRIPTION_LABEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v3, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7 ^ 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a4);
  v7 = objc_msgSend(v6, "section");
  if (v7 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 0))
  {
    -[SBHAddWidgetSheetViewController _presentDetailSheetForGalleryCellAtIndexPath:](self, "_presentDetailSheetForGalleryCellAtIndexPath:", v6);
  }
  else
  {
    v8 = objc_msgSend(v6, "section");
    if (v8 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 2)
      || (v9 = objc_msgSend(v6, "section"),
          v9 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 1)))
    {
      v10 = -[SBHAddWidgetSheetViewController _applicationWidgetCollectionIndexForItemIndex:](self, "_applicationWidgetCollectionIndexForItemIndex:", objc_msgSend(v6, "item"));
      -[SBHAddWidgetSheetViewController configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "applicationCellIncludesGalleryListView");

      if ((v12 & 1) == 0)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[SBHAddWidgetSheetViewController _presentGalleryCell](self, "_presentGalleryCell");
        }
        else
        {
          -[SBHAddWidgetSheetViewController applicationWidgetCollectionsToUse](self, "applicationWidgetCollectionsToUse");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:](self, "_presentDetailSheetViewControllerForApplicationWidgetCollection:", v17);

        }
      }
    }
    else
    {
      v13 = objc_msgSend(v6, "section");
      if (v13 == -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 3))
      {
        v14 = objc_msgSend(v6, "item");
        v15 = v14 - 2;
        if (v14 >= 2)
        {
          -[NSArray objectAtIndex:](self->_disfavoredApplicationWidgetCollections, "objectAtIndex:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:](self, "_presentDetailSheetViewControllerForApplicationWidgetCollection:", v18);

        }
        else
        {
          -[SBHAddWidgetSheetViewController _toggleShowingDisfavoredApplicationWidgetCollections](self, "_toggleShowingDisfavoredApplicationWidgetCollections", v15);
          objc_msgSend(v19, "deselectItemAtIndexPath:animated:", v6, 1);
        }
      }
    }
  }

}

- (void)_presentGalleryCell
{
  void *v3;
  SBHAddWidgetSheetViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBHAddWidgetSheetViewController *v16;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "galleryViewControllerForAddWidgetSheetViewController:", self),
        (v16 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = [SBHAddWidgetSheetViewController alloc];
    -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
    v9 = v8;
    -[SBHAddWidgetSheetViewControllerBase appCellConfigurator](self, "appCellConfigurator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBHAddWidgetSheetViewController initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](v4, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v5, v6, v7, v9, v10, -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle"));

    -[SBHAddWidgetSheetViewController setAddWidgetSheetLocation:](v16, "setAddWidgetSheetLocation:", -[SBHAddWidgetSheetViewController addWidgetSheetLocation](self, "addWidgetSheetLocation"));
    -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](v16, "setAddWidgetSheetWidgetBackgroundType:", -[SBHAddWidgetSheetViewControllerBase addWidgetSheetWidgetBackgroundType](self, "addWidgetSheetWidgetBackgroundType"));
    -[SBHAddWidgetSheetViewControllerBase setAllowsFakeWidgets:](v16, "setAllowsFakeWidgets:", -[SBHAddWidgetSheetViewControllerBase allowsFakeWidgets](self, "allowsFakeWidgets"));
    -[SBHAddWidgetSheetViewController setShouldShowGalleryOnly:](v16, "setShouldShowGalleryOnly:", 1);
    -[SBHAddWidgetSheetViewControllerBase setExternalBackgroundView:](v16, "setExternalBackgroundView:", self->_backgroundView);
    -[SBHAddWidgetSheetViewController setApplicationWidgetCollections:](v16, "setApplicationWidgetCollections:", self->_favoredApplicationWidgetCollections);
    -[SBHAddWidgetSheetViewControllerBase setDelegate:](v16, "setDelegate:", self);
    -[SBHAddWidgetSheetViewController _suggestedItems](self, "_suggestedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewController setSuggestedItems:forGalleryLayoutSize:](v16, "setSuggestedItems:forGalleryLayoutSize:", v11, self->_galleryLayoutSize);

    -[SBHAddWidgetSheetViewController externalSearchController](self, "externalSearchController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewController setExternalSearchController:](v16, "setExternalSearchController:", v12);

    -[SBHAddWidgetSheetViewController view](v16, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    -[SBHAddWidgetSheetViewController navigationController](v16, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNavigationBarHidden:", 1);

    -[SBHAddWidgetSheetViewController setGalleryLayoutSize:](v16, "setGalleryLayoutSize:", self->_galleryLayoutSize);
  }
  -[SBHAddWidgetSheetViewController _presentDetailViewController:fromCell:](self, "_presentDetailViewController:fromCell:", v16, 0);

}

- (void)_toggleShowingDisfavoredApplicationWidgetCollections
{
  self->_isShowingDisfavoredApplicationWidgetCollections ^= 1u;
  -[SBHAddWidgetSheetViewController _refreshData:](self, "_refreshData:", -[SBHAddWidgetSheetViewController _shouldAnimateChanges](self, "_shouldAnimateChanges"));
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  -[SBHAddWidgetSheetViewController _collectionView:updateSeparatorVisibility:forHighlightAtIndexPath:](self, "_collectionView:updateSeparatorVisibility:forHighlightAtIndexPath:", a3, 0, a4);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  -[SBHAddWidgetSheetViewController _collectionView:updateSeparatorVisibility:forHighlightAtIndexPath:](self, "_collectionView:updateSeparatorVisibility:forHighlightAtIndexPath:", a3, 1, a4);
}

- (void)_collectionView:(id)a3 updateSeparatorVisibility:(BOOL)a4 forHighlightAtIndexPath:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v7 = a5;
  objc_opt_class();
  objc_msgSend(v14, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSeparatorVisible:", v6);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "row");

  if ((v11 & 0x8000000000000000) == 0)
  {
    objc_opt_class();
    objc_msgSend(v14, "cellForItemAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSeparatorVisible:", v6);
  }

}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3
{
  -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:](self, "_presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:", a3, 0, 0, 0, 0);
}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3 configuredWithGalleryItem:(id)a4 selectedSizeClass:(int64_t)a5 fromCell:(id)a6 atIndexPath:(id)a7
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  SBHAddWidgetSheetViewController *v13;
  SBHAddWidgetDetailSheetViewController *v14;
  unint64_t v15;
  SBHAddWidgetDetailSheetViewController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SBHAddWidgetSheetViewController *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _SBHAddWidgetSheetCollectionView *collectionView;
  id v28;
  _BYTE v29[120];

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "widgetDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
    v13 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[SBHAddWidgetSheetViewController addWidgetSheetViewController:detailViewControllerForWidgetCollection:](v13, "addWidgetSheetViewController:detailViewControllerForWidgetCollection:", self, v9), (v14 = (SBHAddWidgetDetailSheetViewController *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v15 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle");
      v16 = [SBHAddWidgetDetailSheetViewController alloc];
      -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
      v21 = v20;
      -[SBHAddWidgetSheetViewControllerBase appCellConfigurator](self, "appCellConfigurator");
      v28 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](v16, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v17, v18, v19, v21, v22, v15);

      -[SBHAddWidgetSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation");
      -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetMetrics:](v14, "setAddWidgetSheetMetrics:", v29);
      if (v15 == 1)
        v23 = v13;
      else
        v23 = self;
      -[SBHAddWidgetSheetViewControllerBase setDelegate:](v14, "setDelegate:", v23);
      -[SBHAddWidgetDetailSheetViewController setApplicationWidgetCollection:](v14, "setApplicationWidgetCollection:", v9);
      -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetLocation:](v14, "setAddWidgetSheetLocation:", -[SBHAddWidgetSheetViewController addWidgetSheetLocation](self, "addWidgetSheetLocation"));
      -[SBHAddWidgetSheetViewControllerBase externalBackgroundView](self, "externalBackgroundView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetSheetViewControllerBase setExternalBackgroundView:](v14, "setExternalBackgroundView:", v24);

      -[SBHAddWidgetDetailSheetViewController setExternalSearchController:](v14, "setExternalSearchController:", self->_externalSearchController);
      -[SBHAddWidgetSheetViewController presenter](self, "presenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetDetailSheetViewController setPresenter:](v14, "setPresenter:", v25);

      v10 = v28;
      -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](v14, "setAddWidgetSheetWidgetBackgroundType:", -[SBHAddWidgetSheetViewControllerBase addWidgetSheetWidgetBackgroundType](self, "addWidgetSheetWidgetBackgroundType"));
    }
    -[SBHAddWidgetSheetViewController _presentDetailViewController:fromCell:](self, "_presentDetailViewController:fromCell:", v14, v10);
  }
  else
  {
    SBLogAddWidgetSheet();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:].cold.1((uint64_t)v9, v26);

    collectionView = self->_collectionView;
    -[_SBHAddWidgetSheetCollectionView indexPathsForSelectedItems](collectionView, "indexPathsForSelectedItems");
    v14 = (SBHAddWidgetDetailSheetViewController *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetViewController firstObject](v14, "firstObject");
    v13 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();
    -[_SBHAddWidgetSheetCollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v13, 1);
  }

}

- (void)_presentDetailViewController:(id)a3 fromCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  SBHWidgetAddSheetTransitionContext *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    -[SBHAddWidgetSheetViewController splitViewController](self, "splitViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerForColumn:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v23 = v12;

    if (v23 || (objc_msgSend(v11, "navigationController"), (v23 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setViewControllers:", v24);

    }
    else
    {
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
      objc_msgSend(v23, "setNavigationBarHidden:", 1);
      -[SBHAddWidgetSheetViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v23, self);
    }

    if (v7)
    {
      objc_opt_self();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "widgetWrapperViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "galleryItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetWrapperViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "configureForGalleryItem:selectedSizeClass:", v28, objc_msgSend(v29, "selectedSizeClass"));

      }
    }
    -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "searchBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "resignFirstResponder");
    goto LABEL_24;
  }
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[SBHAddWidgetSheetViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v6, "setPreferredContentSize:");
  if (v7)
  {
    v13 = -[SBHWidgetAddSheetTransitionContext initWithSourceCell:]([SBHWidgetAddSheetTransitionContext alloc], "initWithSourceCell:", v7);
    objc_msgSend(v6, "setTransitioningDelegate:", v13);
    -[SBHAddWidgetSheetViewController setTransitionContext:](self, "setTransitionContext:", v13);

  }
  -[SBHAddWidgetSheetViewController sheetPresentationController](self, "sheetPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sheetPresentationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setShouldDismissWhenTappedOutside:", 1);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 != 1)
  {
LABEL_12:
    objc_msgSend(v11, "setPrefersGrabberVisible:", 1);
    objc_msgSend(v8, "_additionalMinimumTopInset");
    objc_msgSend(v11, "_setAdditionalMinimumTopInset:");
    objc_msgSend(v8, "_grabberTopSpacing");
    objc_msgSend(v11, "_setGrabberTopSpacing:");
  }
LABEL_13:
  objc_msgSend(v8, "preferredCornerRadius");
  objc_msgSend(v11, "setPreferredCornerRadius:");
  objc_msgSend(v11, "setDelegate:", self);
  -[SBHAddWidgetSheetViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v16);

  -[SBHAddWidgetSheetViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForTrait:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "traitOverrides");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forTrait:", v19, v21);

  }
  -[SBHAddWidgetSheetViewController _currentPresenter](self, "_currentPresenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v6, 1, 0);

LABEL_24:
}

- (void)_clearDetailViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetSheetViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForColumn:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  v10 = v9;
  if (v8)
  {
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setViewControllers:", v11);

  }
  else
  {
    -[SBHAddWidgetSheetViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v9, self);
  }
  objc_msgSend(v10, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNavigationBarHidden:", 1);

}

- (void)_presentDetailSheetForGalleryCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSArray **p_favoredApplicationWidgetCollections;
  NSArray *favoredApplicationWidgetCollections;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  -[_SBHAddWidgetSheetCollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v7)
  {
    objc_msgSend(v9, "widgetWrapperViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "galleryItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_favoredApplicationWidgetCollections = &self->_favoredApplicationWidgetCollections;
    favoredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__SBHAddWidgetSheetViewController__presentDetailSheetForGalleryCellAtIndexPath___block_invoke;
    v29[3] = &unk_1E8D87180;
    v14 = v11;
    v30 = v14;
    v15 = -[NSArray indexOfObjectPassingTest:](favoredApplicationWidgetCollections, "indexOfObjectPassingTest:", v29);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_17;
    v16 = v15;
    -[NSArray objectAtIndex:](*p_favoredApplicationWidgetCollections, "objectAtIndex:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
    {
      v28 = v14;
      -[SBHAddWidgetSheetViewController parentViewController](self, "parentViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "parentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v20 = v18;
      if (v19)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v22 = v21;

      objc_msgSend(v22, "viewControllerForColumn:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v23, "_itemIndexForApplicationWidgetCollectionIndex:", v16), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v25, 1, 2);

      p_favoredApplicationWidgetCollections = &self->_favoredApplicationWidgetCollections;
      v14 = v28;
    }
    if (!v17)
    {
LABEL_17:
      SBLogAddWidgetSheet();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBHAddWidgetSheetViewController _presentDetailSheetForGalleryCellAtIndexPath:].cold.1((uint64_t)v10, (uint64_t *)p_favoredApplicationWidgetCollections, v17);
    }
    else
    {
      objc_msgSend(v10, "galleryItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:](self, "_presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:", v17, v26, objc_msgSend(v10, "selectedSizeClass"), v9, v4);

    }
  }

}

uint64_t __80__SBHAddWidgetSheetViewController__presentDetailSheetForGalleryCellAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsWidgetDescriptorMatchingDescriptor:", *(_QWORD *)(a1 + 32));
}

- (id)_currentPresenter
{
  void *v3;
  SBHAddWidgetSheetViewController *v4;
  SBHAddWidgetSheetViewController *v5;
  SBHAddWidgetSheetViewController *v6;

  -[SBHAddWidgetSheetViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {
    -[SBHAddWidgetSheetViewController searchController](self, "searchController");
    v5 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (id)_presentedGalleryViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;

  -[SBHAddWidgetSheetViewController splitViewController](self, "splitViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "viewControllerForColumn:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    if (!v8)
    {
      v9 = objc_opt_class();
      v10 = v6;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v12, "topViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_opt_class();
      v15 = v13;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v8 = v16;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)didDismissSearchController:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *filteredApplicationWidgetCollections;
  void *v11;
  NSIndexPath *v12;
  NSIndexPath *lastSelectedIndexPath;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_filteredApplicationWidgetCollections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "setFilteredWidgetDescriptors:", v8, (_QWORD)v14);
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  self->_filteredApplicationWidgetCollections = 0;

  -[SBHAddWidgetSheetViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bringSubviewToFront:", self->_closeButton);

  -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1
    && !-[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly"))
  {
    -[SBHAddWidgetSheetViewController _selectFirstItem](self, "_selectFirstItem");
    -[SBHAddWidgetSheetViewController _presentGalleryCell](self, "_presentGalleryCell");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 2);
    v12 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = v12;

  }
}

- (void)willPresentSearchController:(id)a3
{
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle", a3) == 1)
    -[SBHAddWidgetSheetViewController _clearDetailViewController](self, "_clearDetailViewController");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSArray *v22;
  NSArray *filteredApplicationWidgetCollections;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetSheetViewController _searchTextForSearchController:](self, "_searchTextForSearchController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30[0] = v11;
        v30[1] = 3221225472;
        v30[2] = __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke;
        v30[3] = &unk_1E8D871D0;
        v30[4] = v13;
        v30[5] = self;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", &stru_1E8D8E958))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_filteredApplicationWidgetCollections;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      v20 = MEMORY[0x1E0C9AA60];
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "setFilteredWidgetDescriptors:", v20);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v18);
    }

    v22 = 0;
  }
  else
  {
    -[NSArray filteredArrayUsingPredicate:](self->_favoredApplicationWidgetCollections, "filteredArrayUsingPredicate:", v15);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  self->_filteredApplicationWidgetCollections = v22;

  -[SBHAddWidgetSheetViewController _reloadData](self, "_reloadData");
  if (-[SBHAddWidgetSheetViewController _canShowContentUnavailableConfiguration](self, "_canShowContentUnavailableConfiguration"))
  {
    -[SBHAddWidgetSheetViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
  }

}

BOOL __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = a2;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 129), v6))
  {
    objc_msgSend(v3, "setFilteredWidgetDescriptors:", MEMORY[0x1E0C9AA60]);
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "applicationCellIncludesGalleryListView");

    if ((v9 & 1) != 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke_2;
      v14[3] = &unk_1E8D871A8;
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "widgetDescriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setFilteredWidgetDescriptors:", v12);
      v7 = objc_msgSend(v12, "count") != 0;

    }
    else
    {
      objc_msgSend(v3, "setFilteredWidgetDescriptors:", MEMORY[0x1E0C9AA60]);
      v7 = 0;
    }
  }

  return v7;
}

BOOL __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;

  objc_msgSend(a2, "sbh_widgetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 129);
    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_searchTextForSearchController:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isSearchVisible
{
  return self->_filteredApplicationWidgetCollections != 0;
}

- (id)contentUnavailableConfigurationState
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetSheetViewController;
  -[SBHAddWidgetSheetViewController contentUnavailableConfigurationState](&v7, sel_contentUnavailableConfigurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController _searchTextForSearchController:](self, "_searchTextForSearchController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchText:", v5);

  return v3;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SBHAddWidgetSheetViewController _canShowContentUnavailableConfiguration](self, "_canShowContentUnavailableConfiguration"))
  {
    -[SBHAddWidgetSheetViewController _updatedContentUnavailableConfigurationUsingState:](self, "_updatedContentUnavailableConfigurationUsingState:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[SBHAddWidgetSheetViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);

}

- (id)_updatedContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v7 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v6 = -[NSArray count](self->_filteredApplicationWidgetCollections, "count");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatedConfigurationForState:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_canShowContentUnavailableConfiguration
{
  return -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 0;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  void *v2;
  void *v3;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetDragHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return -[SBHAddWidgetSheetViewController backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:](self, "backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:", self);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  _SBHAddWidgetSheetCollectionView *collectionView;
  void *v5;
  void *v6;

  collectionView = self->_collectionView;
  -[_SBHAddWidgetSheetCollectionView indexPathsForSelectedItems](collectionView, "indexPathsForSelectedItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHAddWidgetSheetCollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v6, 1);

  -[SBHWidgetAddSheetTransitionContext interruptAnimation](self->_transitionContext, "interruptAnimation");
  -[SBHAddWidgetSheetViewController setTransitionContext:](self, "setTransitionContext:", 0);
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  void *v4;
  _SBHAddWidgetSheetCollectionView *collectionView;
  void *v6;
  void *v7;

  -[SBHAddWidgetSheetViewController _currentPresenter](self, "_currentPresenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  collectionView = self->_collectionView;
  -[_SBHAddWidgetSheetCollectionView indexPathsForSelectedItems](collectionView, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHAddWidgetSheetCollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v7, 1);

  -[SBHWidgetAddSheetTransitionContext interruptAnimation](self->_transitionContext, "interruptAnimation");
  -[SBHAddWidgetSheetViewController setTransitionContext:](self, "setTransitionContext:", 0);
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "addWidgetSheetViewController:didSelectWidgetIconView:", self, v6);

}

- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3
{
  return -[SBHAddWidgetSheetViewController _newBackgroundView](self, "_newBackgroundView", a3);
}

- (void)_makeGalleryItemsFromHomeScreenItems:(id)a3
{
  id v4;
  char v5;
  __int16 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  SBHWidgetStackDescriptor *v50;
  int v51;
  char v52;
  _BOOL4 v53;
  char v54;
  int v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  SBHAddWidgetSheetViewController *v61;
  __int16 v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  char v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v63 = v5;
  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v62 = v6;
  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v87;
    v60 = v7;
    v61 = self;
    v59 = *(_QWORD *)v87;
    do
    {
      v11 = 0;
      v64 = v9;
      do
      {
        if (*(_QWORD *)v87 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v11), "suggestedSize");
        v13 = 1;
        v14 = 1;
        switch(v12)
        {
          case 0:
            break;
          case 1:
            v13 = 1;
            v14 = 2;
            break;
          case 2:
            v13 = 1;
            v14 = 3;
            break;
          case 3:
            v13 = 1;
            v14 = 6;
            break;
          case 4:
            v13 = 1;
            v14 = 4;
            break;
          default:
            v13 = 0;
            v14 = 0;
            break;
        }
        v69 = v13;
        if (CHSWidgetFamilyMaskContainsFamily())
        {
          v65 = v14;
          v67 = v11;
          objc_opt_class();
          SBFSafeCast();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "widgetKind");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsString:", CFSTR("SBHSpecialAvocadoDescriptor"));

          if (-[SBHAddWidgetSheetViewControllerBase allowsFakeWidgets](self, "allowsFakeWidgets") || !v16)
          {
            objc_opt_class();
            SBFSafeCast();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v17;
            if (v68 || !v17)
            {
              if (v68)
              {
                objc_msgSend(v68, "avocadoDescriptor");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "sanitizedDescriptor");
                v50 = (SBHWidgetStackDescriptor *)objc_claimAutoreleasedReturnValue();
                goto LABEL_56;
              }
              v50 = 0;
            }
            else
            {
              v18 = (void *)objc_opt_new();
              v82 = 0u;
              v83 = 0u;
              v84 = 0u;
              v85 = 0u;
              objc_msgSend(v17, "smallDefaultStack");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v83;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v83 != v22)
                      objc_enumerationMutation(v19);
                    objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "avocadoDescriptor");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "sanitizedDescriptor");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v25)
                      objc_msgSend(v18, "addObject:", v25);

                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
                }
                while (v21);
              }

              v26 = (void *)objc_opt_new();
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              objc_msgSend(v66, "mediumDefaultStack");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v79;
                do
                {
                  for (j = 0; j != v29; ++j)
                  {
                    if (*(_QWORD *)v79 != v30)
                      objc_enumerationMutation(v27);
                    objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "avocadoDescriptor");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "sanitizedDescriptor");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v33)
                      objc_msgSend(v26, "addObject:", v33);

                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
                }
                while (v29);
              }

              v34 = (void *)objc_opt_new();
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v77 = 0u;
              objc_msgSend(v66, "largeDefaultStack");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
              if (v36)
              {
                v37 = v36;
                v38 = *(_QWORD *)v75;
                do
                {
                  for (k = 0; k != v37; ++k)
                  {
                    if (*(_QWORD *)v75 != v38)
                      objc_enumerationMutation(v35);
                    objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "avocadoDescriptor");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "sanitizedDescriptor");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v41)
                      objc_msgSend(v34, "addObject:", v41);

                  }
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
                }
                while (v37);
              }

              v42 = (void *)objc_opt_new();
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              objc_msgSend(v66, "extraLargeDefaultStack");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v71;
                do
                {
                  for (m = 0; m != v45; ++m)
                  {
                    if (*(_QWORD *)v71 != v46)
                      objc_enumerationMutation(v43);
                    objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * m), "avocadoDescriptor");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "sanitizedDescriptor");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v49)
                      objc_msgSend(v42, "addObject:", v49);

                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
                }
                while (v45);
              }

              v50 = -[SBHWidgetStackDescriptor initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:]([SBHWidgetStackDescriptor alloc], "initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:", v18, v26, v34, v42);
              v7 = v60;
              self = v61;
              v10 = v59;
              v9 = v64;
LABEL_56:

            }
            v51 = (CHSWidgetFamilyIsAccessory() & 1) != 0
               || -[SBHWidgetStackDescriptor sbh_supportsRemovableBackground](v50, "sbh_supportsRemovableBackground");
            v52 = v69 ^ 1;
            if (!v50)
              v52 = 1;
            if ((v52 & 1) == 0)
            {
              if ((v63 & 1) == 0)
              {
                v53 = -[SBHWidgetStackDescriptor sbh_canBeAddedToStack](v50, "sbh_canBeAddedToStack");
                if ((v62 & 0x100) != 0)
                  v54 = v51;
                else
                  v54 = 1;
                if (!v53 || (v54 & 1) == 0)
                  goto LABEL_75;
LABEL_74:
                v56 = -[SBHAddWidgetSheetViewController _newWrapperViewControllerWithGalleryItem:sizeClass:](self, "_newWrapperViewControllerWithGalleryItem:sizeClass:", v50, v65);
                objc_msgSend(v58, "addObject:", v56);

                goto LABEL_75;
              }
              if ((v62 & 0x100) != 0)
                v55 = v51;
              else
                v55 = 1;
              if (v55 == 1)
                goto LABEL_74;
            }
LABEL_75:

          }
          v11 = v67;
        }
        ++v11;
      }
      while (v11 != v9);
      v57 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      v9 = v57;
    }
    while (v57);
  }

  -[SBHAddWidgetSheetViewController setGalleryItems:](self, "setGalleryItems:", v58);
}

- (void)_makeFakeGalleryItemsFromHomeScreenItems:(id)a3
{
  id v4;
  id v5;
  char v6;
  __int16 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  SBHWidgetStackDescriptor *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  int v57;
  int v58;
  int v59;
  char v60;
  SBHWidgetStackDescriptor *v61;
  SBHWidgetStackDescriptor *v62;
  unint64_t galleryLayoutSize;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  uint64_t v69;
  SBHWidgetStackDescriptor *v70;
  SBHWidgetStackDescriptor *v71;
  SBHWidgetStackDescriptor *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  SBHAddWidgetSheetViewController *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  char v83;
  int v84;
  int v85;
  void *v86;
  SBHWidgetStackDescriptor *v87;
  SBHWidgetStackDescriptor *v88;
  SBHWidgetStackDescriptor *v89;
  __int16 v90;
  char v91;
  SBHWidgetStackDescriptor *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v91 = v6;
  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v90 = v7;
  v8 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
  v77 = v9;
  if (!v10)
  {
    v88 = 0;
    v89 = 0;
    v87 = 0;
    v92 = 0;
    goto LABEL_87;
  }
  v11 = v10;
  v88 = 0;
  v89 = 0;
  v87 = 0;
  v92 = 0;
  v12 = *(_QWORD *)v114;
  v78 = self;
  v75 = v8;
  v76 = v5;
  v74 = *(_QWORD *)v114;
  do
  {
    v13 = 0;
    v80 = v11;
    do
    {
      if (*(_QWORD *)v114 != v12)
        objc_enumerationMutation(v9);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * v13), "suggestedSize", v74, v75, v76);
      v15 = 0;
      v16 = 1;
      v17 = 1;
      v18 = 1;
      switch(v14)
      {
        case 0:
          break;
        case 1:
          v16 = 0;
          v15 = 1;
          break;
        case 2:
          v17 = 0;
          v15 = 1;
          v16 = 1;
          break;
        case 3:
          v15 = 1;
          v16 = 1;
          break;
        case 4:
          v18 = 0;
          v15 = 1;
          v16 = 1;
          break;
        default:
          v15 = 1;
          v16 = 1;
          v17 = 1;
          v18 = 1;
          break;
      }
      v82 = v17;
      v83 = v18;
      v84 = v16;
      v85 = v15;
      if (!CHSWidgetFamilyMaskContainsFamily())
        goto LABEL_83;
      objc_opt_class();
      SBFSafeCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = v19;
      SBFSafeCast();
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
        v22 = v19 == 0;
      else
        v22 = 0;
      v81 = v13;
      v86 = (void *)v21;
      if (v22)
      {
        v25 = (void *)v21;
        v79 = v20;
        v23 = (void *)objc_opt_new();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        objc_msgSend(v25, "smallDefaultStack");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v110;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v110 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "avocadoDescriptor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "sanitizedDescriptor");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
                objc_msgSend(v23, "addObject:", v32);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
          }
          while (v28);
        }

        v33 = (void *)objc_opt_new();
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        objc_msgSend(v86, "mediumDefaultStack");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v106;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v106 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "avocadoDescriptor");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "sanitizedDescriptor");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
                objc_msgSend(v33, "addObject:", v40);

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
          }
          while (v36);
        }

        v41 = (void *)objc_opt_new();
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        objc_msgSend(v86, "largeDefaultStack");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v102;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              if (*(_QWORD *)v102 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * k), "avocadoDescriptor");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "sanitizedDescriptor");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
                objc_msgSend(v41, "addObject:", v48);

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
          }
          while (v44);
        }

        v49 = (void *)objc_opt_new();
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        objc_msgSend(v86, "extraLargeDefaultStack");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v98;
          do
          {
            for (m = 0; m != v52; ++m)
            {
              if (*(_QWORD *)v98 != v53)
                objc_enumerationMutation(v50);
              objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * m), "avocadoDescriptor");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "sanitizedDescriptor");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v56)
                objc_msgSend(v49, "addObject:", v56);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
          }
          while (v52);
        }

        v24 = -[SBHWidgetStackDescriptor initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:]([SBHWidgetStackDescriptor alloc], "initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:", v23, v33, v41, v49);
        v5 = v76;
        v9 = v77;
        v12 = v74;
        v20 = v79;
        goto LABEL_56;
      }
      if (v19)
      {
        objc_msgSend(v19, "avocadoDescriptor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sanitizedDescriptor");
        v24 = (SBHWidgetStackDescriptor *)objc_claimAutoreleasedReturnValue();
LABEL_56:

        self = v78;
        goto LABEL_57;
      }
      v24 = 0;
LABEL_57:
      v57 = v85;
      if (v92)
        v57 = 1;
      if (v57 != 1)
      {
        v92 = v24;
LABEL_76:
        v61 = v89;
LABEL_77:
        v62 = v24;
        v89 = v61;
        goto LABEL_78;
      }
      if (v88)
        v58 = 1;
      else
        v58 = v84;
      if (v58 != 1)
      {
        v88 = v24;
        goto LABEL_76;
      }
      v59 = v82;
      if (v87)
        v59 = 1;
      if (v59 != 1)
      {
        v87 = v24;
        goto LABEL_76;
      }
      if (v89)
        v60 = 1;
      else
        v60 = v83;
      v61 = v24;
      if ((v60 & 1) == 0)
        goto LABEL_77;
LABEL_78:

      if (v92)
      {
        v11 = v80;
        v13 = v81;
        if (v88 && v87)
          goto LABEL_87;
      }
      else
      {
        v11 = v80;
        v13 = v81;
      }
LABEL_83:
      ++v13;
    }
    while (v13 != v11);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
  }
  while (v11);
LABEL_87:

  galleryLayoutSize = self->_galleryLayoutSize;
  if (galleryLayoutSize > 4)
    v64 = &unk_1E8E17570;
  else
    v64 = (void *)qword_1E8D872E8[galleryLayoutSize];
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v94;
    do
    {
      for (n = 0; n != v66; ++n)
      {
        if (*(_QWORD *)v94 != v67)
          objc_enumerationMutation(v64);
        v69 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * n), "integerValue");
        v70 = v92;
        switch(v69)
        {
          case 1:
            goto LABEL_99;
          case 2:
            v70 = v88;
            goto LABEL_99;
          case 3:
            v70 = v87;
            goto LABEL_99;
          case 4:
            v70 = v89;
LABEL_99:
            v71 = v70;
            v72 = v71;
            if (v71
              && ((v91 & 1) != 0 || -[SBHWidgetStackDescriptor sbh_canBeAddedToStack](v71, "sbh_canBeAddedToStack"))
              && ((v90 & 0x100) == 0
               || -[SBHWidgetStackDescriptor sbh_supportsRemovableBackground](v72, "sbh_supportsRemovableBackground")))
            {
              v73 = -[SBHAddWidgetSheetViewController _newWrapperViewControllerWithGalleryItem:sizeClass:](self, "_newWrapperViewControllerWithGalleryItem:sizeClass:", v72, v69);
              objc_msgSend(v5, "addObject:", v73);

            }
            break;
          default:
            v72 = 0;
            break;
        }

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
    }
    while (v66);
  }
  -[SBHAddWidgetSheetViewController setGalleryItems:](self, "setGalleryItems:", v5);

}

- (id)_sizeClasses
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_galleryItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "selectedSizeClass", (_QWORD)v11));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_itemsArrayWithSizeClasses:(id)a3 nSmallsGroup:(id)a4 mediumAndSmallGroup:(id)a5 usesThreeColumnLayout:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  id v22;
  int v23;
  id v25;
  void *v26;
  id v27;

  v6 = a6;
  v9 = a3;
  v25 = a4;
  v27 = a5;
  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = !v6;
    if (v6)
      v16 = 2;
    else
      v16 = 1;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v13, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");
      v19 = v14 + 1;
      v20 = SBHItemAtIndexIsOfSize(v9, v14 + 1);
      v21 = v20;
      if (v18 != 1)
        break;
      v23 = SBHItemAtIndexIsOfSize(v9, v14 + 2);
      v22 = v25;
      if ((v21 & (v15 | v23)) == 1)
        goto LABEL_10;
LABEL_11:

      v14 += v16;
      v13 = v14;
      if (v12 <= v14)
        goto LABEL_12;
    }
    if (v18 != 2)
      goto LABEL_11;
    v22 = v27;
    v19 = v14;
    if (((v15 | v20) & 1) == 0)
      goto LABEL_11;
LABEL_10:
    objc_msgSend(v10, "addObject:", v22);
    v14 = v19;
    goto LABEL_11;
  }
LABEL_12:
  if (!objc_msgSend(v10, "count", v25))
    objc_msgSend(v10, "addObject:", v27);

  return v10;
}

- (id)_collectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4
{
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v48 = self->_galleryLayoutSize == 1;
  if (self->_galleryLayoutSize == 1)
    v6 = 3;
  else
    v6 = 2;
  v47 = a4;
  -[SBHAddWidgetSheetViewController _listLayoutForWidgetSizing](self, "_listLayoutForWidgetSizing");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SBHIconListLayoutIconImageInfoForGridSizeClass(v51, CFSTR("SBHIconGridSizeClassSmall"));
  v9 = v8;
  v10 = SBHIconListLayoutIconImageInfoForGridSizeClass(v51, CFSTR("SBHIconGridSizeClassMedium"));
  v12 = v11;
  -[SBHAddWidgetSheetViewController _horizontalSpacingForListLayout:](self, "_horizontalSpacingForListLayout:", v51);
  self->_horizontalSpacing = v13;
  v14 = (a3 - (v13 * (double)(v6 - 1) + (double)v6 * v7)) * 0.5;
  self->_contentInsets.top = 0.0;
  self->_contentInsets.leading = v14;
  self->_contentInsets.bottom = 0.0;
  self->_contentInsets.trailing = v14;
  v15 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithWidthDimension:heightDimension:", v16, v17);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v50);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeWithWidthDimension:heightDimension:", v20, v21);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v49);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v9 * 0.5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0DC3350];
  v46 = (void *)v18;
  v53[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "horizontalGroupWithLayoutSize:subitems:", v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", self->_horizontalSpacing);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInterItemSpacing:", v29);

  v30 = (void *)MEMORY[0x1E0DC3350];
  v52[0] = v45;
  v52[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "horizontalGroupWithLayoutSize:subitems:", v25, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", self->_horizontalSpacing);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setInterItemSpacing:", v33);

  v34 = v28;
  -[SBHAddWidgetSheetViewController _itemsArrayWithSizeClasses:nSmallsGroup:mediumAndSmallGroup:usesThreeColumnLayout:](self, "_itemsArrayWithSizeClasses:nSmallsGroup:mediumAndSmallGroup:usesThreeColumnLayout:", v47, v28, v32, v48);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v35, "count");
  v37 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", (double)(v36 - 1) * 16.0 + (double)v36 * (v9 + 30.0));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sizeWithWidthDimension:heightDimension:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitems:", v40, v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 16.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setInterItemSpacing:", v42);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setInterGroupSpacing:", 16.0);
  objc_msgSend(v43, "setContentInsets:", self->_searchBarHeightAdjustment, self->_contentInsets.leading, 8.0, self->_contentInsets.trailing);

  return v43;
}

- (id)_newPadCollectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4
{
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int (**v27)(void *, void *, uint64_t);
  unint64_t galleryLayoutSize;
  unint64_t v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  SBHAddWidgetSheetViewController *v35;
  void *v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  unint64_t v43;
  double v44;
  void *v45;
  double horizontalSpacing;
  void *v47;
  id v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSDirectionalEdgeInsets *p_contentInsets;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  double v72;
  void *v73;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  __int128 v80;
  double v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD v102[6];
  _QWORD v103[7];
  _QWORD v104[6];
  _QWORD v105[7];
  _QWORD v106[9];
  _QWORD v107[9];
  _QWORD aBlock[9];

  v68 = a4;
  -[SBHAddWidgetSheetViewController _listLayoutForWidgetSizing](self, "_listLayoutForWidgetSizing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassSmall"));
  v8 = v7;
  v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassMedium"));
  v11 = v10;
  v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassLarge"));
  v14 = v13;
  v15 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassExtraLarge"));
  v70 = v16;
  v72 = v15;
  v67 = v5;
  -[SBHAddWidgetSheetViewController _horizontalSpacingForListLayout:](self, "_horizontalSpacingForListLayout:", v5);
  v18 = v17;
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke;
  aBlock[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&aBlock[4] = v6;
  aBlock[5] = v8;
  *(double *)&aBlock[6] = v17;
  v20 = _Block_copy(aBlock);
  v107[0] = v19;
  v107[1] = 3221225472;
  v107[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_2;
  v107[3] = &__block_descriptor_72_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v107[4] = v6;
  v107[5] = v8;
  *(double *)&v107[6] = v18;
  *(double *)&v107[7] = v9;
  v107[8] = v11;
  v21 = _Block_copy(v107);
  v106[0] = v19;
  v106[1] = 3221225472;
  v106[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_3;
  v106[3] = &__block_descriptor_72_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v106[4] = v9;
  v106[5] = v11;
  *(double *)&v106[6] = v6;
  v106[7] = v8;
  *(double *)&v106[8] = v18;
  v22 = _Block_copy(v106);
  v105[0] = v19;
  v105[1] = 3221225472;
  v105[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_4;
  v105[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v105[4] = v9;
  v105[5] = v11;
  *(double *)&v105[6] = v18;
  v23 = _Block_copy(v105);
  v104[0] = v19;
  v104[1] = 3221225472;
  v104[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_5;
  v104[3] = &__block_descriptor_48_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v104[4] = v12;
  *(double *)&v104[5] = v14;
  v24 = _Block_copy(v104);
  v103[0] = v19;
  v103[1] = 3221225472;
  v103[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_6;
  v103[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v103[4] = v6;
  v103[5] = v8;
  *(double *)&v103[6] = v18;
  v25 = _Block_copy(v103);
  v102[0] = v19;
  v102[1] = 3221225472;
  v102[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_7;
  v102[3] = &__block_descriptor_48_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v102[4] = v72;
  v102[5] = v70;
  v26 = _Block_copy(v102);
  v94[0] = v19;
  v94[1] = 3221225472;
  v94[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_8;
  v94[3] = &unk_1E8D87258;
  v66 = v20;
  v95 = v66;
  v65 = v21;
  v96 = v65;
  v64 = v22;
  v97 = v64;
  v63 = v23;
  v98 = v63;
  v62 = v24;
  v99 = v62;
  v61 = v25;
  v100 = v61;
  v60 = v26;
  v101 = v60;
  v73 = _Block_copy(v94);
  v92[0] = v19;
  v92[1] = 3221225472;
  v92[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_10;
  v92[3] = &unk_1E8D872A0;
  v93 = &__block_literal_global_180_0;
  v27 = (unsigned int (**)(void *, void *, uint64_t))_Block_copy(v92);
  self->_horizontalSpacing = v18;
  galleryLayoutSize = self->_galleryLayoutSize;
  if (galleryLayoutSize == 2)
    v29 = 4;
  else
    v29 = 5;
  v30 = v18 * (double)(v29 - 1) + (double)v29 * v6;
  self->_contentInsets.top = 0.0;
  v31 = (a3 - v30) * 0.5;
  self->_contentInsets.leading = v31;
  self->_contentInsets.bottom = 0.0;
  self->_contentInsets.trailing = v31;
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    v91 = 0;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v86 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[SBHAddWidgetSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation");
    self->_contentInsets.leading = 0.0;
    self->_contentInsets.trailing = 0.0;
  }
  p_contentInsets = &self->_contentInsets;
  v32 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v30 + 100.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeWithWidthDimension:heightDimension:", v33, v34);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = self;
  -[SBHAddWidgetSheetViewController _podsArrayWithSizeClasses:columnCount:](self, "_podsArrayWithSizeClasses:columnCount:", v68, v29);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v36, "count"))
  {
    v38 = 0;
    if (galleryLayoutSize == 2)
      v39 = 2;
    else
      v39 = 3;
    v69 = *MEMORY[0x1E0C9D538];
    do
    {
      v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v36, "objectAtIndex:", v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v41);

      if (v27[2](v27, v36, v38) && v27[2](v27, v36, v38 + 1))
      {
        objc_msgSend(v36, "objectAtIndex:", v38 + 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v42);

        v43 = v38 + 2;
        if (galleryLayoutSize != 2)
        {
          if (v27[2](v27, v36, v38 + 2))
          {
            objc_msgSend(v36, "objectAtIndex:", v38 + 2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v45);

          }
          v43 = v38 + 3;
          v84 = *MEMORY[0x1E0C9D538];
LABEL_20:
          horizontalSpacing = v35->_horizontalSpacing;
          v44 = v6 + horizontalSpacing;
          v75 = COERCE_UNSIGNED_INT64(horizontalSpacing + v9 + v6 + horizontalSpacing);
          v38 = v43;
          goto LABEL_21;
        }
        v84 = *MEMORY[0x1E0C9D538];
      }
      else
      {
        v43 = v38 + v39;
        v84 = *MEMORY[0x1E0C9D538];
        if (galleryLayoutSize != 2)
          goto LABEL_20;
      }
      v44 = v12 + v35->_horizontalSpacing;
      v38 = v43;
      v75 = v69;
LABEL_21:
      v47 = (void *)MEMORY[0x1E0DC3350];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_11;
      v76[3] = &unk_1E8D872C8;
      v77 = v40;
      v78 = v73;
      v79 = &__block_literal_global_180_0;
      v80 = v84;
      v81 = v44;
      v82 = 0;
      v83 = v75;
      v48 = v40;
      objc_msgSend(v47, "customGroupWithLayoutSize:itemProvider:", v71, v76);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v49);

    }
    while (v38 < objc_msgSend(v36, "count"));
  }
  v50 = objc_msgSend(v37, "count");
  v51 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v30 + v35->_horizontalSpacing);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v35->_horizontalSpacing * (double)(v50 - 1) + (double)v50 * v14);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sizeWithWidthDimension:heightDimension:", v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitems:", v54, v37);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v35->_horizontalSpacing);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setInterItemSpacing:", v56);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setInterGroupSpacing:", v35->_horizontalSpacing);
  objc_msgSend(v57, "setContentInsets:", v35->_searchBarHeightAdjustment, p_contentInsets->leading, 8.0, p_contentInsets->trailing);

  return v57;
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke(double *a1, void *a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = (void *)MEMORY[0x1E0DC3358];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a2;
  objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3 + a1[4] + a1[6], a4, a1[4], a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3 + a1[4] + a1[6], a1[6] + a4 + a1[5]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_2(double *a1, void *a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x1E0DC3358];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a2;
  objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3 + a1[4] + a1[6], a4, a1[4], a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[7], a1[8]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_3(double *a1, void *a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x1E0DC3358];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a2;
  objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3, a4 + a1[7] + a1[8], a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3 + a1[6] + a1[8], a1[8] + a4 + a1[7]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_4(double *a1, void *a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0DC3358];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a2;
  objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0DC3358];
  v7 = *(double *)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  v9 = a2;
  objc_msgSend(v6, "customItemWithFrame:", a3, a4, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_6(double *a1, void *a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0DC3358];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a2;
  objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_7(uint64_t a1, void *a2, double a3, double a4)
{
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0DC3358];
  v7 = *(double *)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  v9 = a2;
  objc_msgSend(v6, "customItemWithFrame:", a3, a4, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v9 = a2;
  switch(a3)
  {
    case 0:
      v10 = a1 + 72;
      goto LABEL_9;
    case 1:
      v10 = a1 + 32;
      goto LABEL_9;
    case 2:
      v10 = a1 + 40;
      goto LABEL_9;
    case 3:
      v10 = a1 + 48;
      goto LABEL_9;
    case 4:
      v10 = a1 + 56;
      goto LABEL_9;
    case 5:
      v10 = a1 + 64;
      goto LABEL_9;
    case 6:
      v10 = a1 + 80;
LABEL_9:
      v11 = v9;
      (*(void (**)(double, double))(*(_QWORD *)v10 + 16))(a4, a5);
      v9 = v11;
      break;
    default:
      break;
  }

}

uint64_t __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectAtIndex:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

BOOL __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_10(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  _BOOL8 v6;

  v5 = a2;
  v6 = objc_msgSend(v5, "count") > a3 && (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() != 6;

  return v6;
}

id __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v3 + 16))(v3, v2, v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v5 + 16))(v5, v2, v6, *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 3)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v7 + 16))(v7, v2, v8, *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  return v2;
}

- (id)_podsArrayWithSizeClasses:(id)a3 columnCount:(int64_t)a4
{
  id v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v5 = a3;
  v6 = v5;
  if (a4 >= 0)
    v7 = a4;
  else
    v7 = a4 + 1;
  v8 = objc_msgSend(v5, "count");
  v9 = (void *)objc_opt_new();
  if (v8)
  {
    v10 = 0;
    v11 = (a4 & 1) + (v7 >> 1);
    do
    {
      v12 = objc_msgSend(v9, "count");
      if ((a4 & 1) != 0 && !(v12 % v11))
      {
        v20 = SBHSizeClassForItemAtIndex(v6, v10);
        v21 = SBHSizeClassForItemAtIndex(v6, v10 + 1);
        if (v20 == 1 && v21 <= 1)
        {
          objc_msgSend(v9, "addObject:", &unk_1E8E16A68);
          v10 += 2;
        }
      }
      else
      {
        v13 = SBHSizeClassForItemAtIndex(v6, v10);
        v14 = SBHSizeClassForItemAtIndex(v6, v10 + 1);
        v15 = SBHSizeClassForItemAtIndex(v6, v10 + 2);
        v16 = SBHSizeClassForItemAtIndex(v6, v10 + 3);
        v17 = v13 - 1;
        v18 = &unk_1E8E16A50;
        v19 = 1;
        switch(v17)
        {
          case 0:
            if (v14 > 1)
              goto LABEL_27;
            if (v15 <= 1 && v16 < 2)
            {
              v18 = &unk_1E8E169F0;
              v19 = 4;
              goto LABEL_26;
            }
            if (v14 != 1 || (v15 | 2) != 2)
              goto LABEL_27;
            v18 = &unk_1E8E16A08;
            goto LABEL_25;
          case 1:
            if (v14 >= 2)
            {
              if (v14 == 2)
              {
                v18 = &unk_1E8E16A38;
                v19 = 2;
LABEL_26:
                objc_msgSend(v9, "addObject:", v18);
                goto LABEL_28;
              }
            }
            else if (v15 < 2)
            {
              v18 = &unk_1E8E16A20;
LABEL_25:
              v19 = 3;
              goto LABEL_26;
            }
LABEL_27:
            v19 = 0;
LABEL_28:
            v10 += v19;
            break;
          case 2:
            goto LABEL_26;
          case 3:
            v18 = &unk_1E8E16A80;
            v19 = 1;
            goto LABEL_26;
          default:
            goto LABEL_27;
        }
      }
    }
    while (v10 < v8);
  }
  if (!objc_msgSend(v9, "count"))
    objc_msgSend(v9, "addObject:", &unk_1E8E169F0);

  return v9;
}

- (id)_collectionViewLayoutApplicationsSectionWithStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double top;
  CGFloat v22;

  v5 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 80.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 80.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeWithWidthDimension:heightDimension:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v13, v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[SBHAddWidgetSheetViewController _updateHorizontalSpacing](self, "_updateHorizontalSpacing");
    top = 0.0;
    objc_msgSend(v15, "setInterGroupSpacing:", 0.0);
    __asm { FMOV            V1.2D, #20.0 }
    *(_OWORD *)&self->_applicationsSectionInsets.top = xmmword_1D0190E00;
    *(_OWORD *)&self->_applicationsSectionInsets.bottom = _Q1;
    if (a3 == 1)
    {
      -[SBHAddWidgetSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation", 0);
      self->_applicationsSectionInsets.leading = 0.0;
      self->_applicationsSectionInsets.trailing = 0.0;
      top = self->_applicationsSectionInsets.top;
    }
  }
  else
  {
    v22 = self->_contentInsets.leading + -12.0;
    self->_applicationsSectionInsets.top = 0.0;
    self->_applicationsSectionInsets.leading = 0.0;
    self->_applicationsSectionInsets.bottom = v22;
    self->_applicationsSectionInsets.trailing = 0.0;
    top = 0.0;
  }
  objc_msgSend(v15, "setContentInsets:", top, self->_applicationsSectionInsets.leading, self->_applicationsSectionInsets.bottom, self->_applicationsSectionInsets.trailing);

  return v15;
}

- (BOOL)_shouldShowGallery
{
  int v3;
  void *v4;

  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1
    && !-[SBHAddWidgetSheetViewController shouldShowGalleryOnly](self, "shouldShowGalleryOnly")
    || -[SBHAddWidgetSheetViewController _isSearchVisible](self, "_isSearchVisible"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[SBHAddWidgetSheetViewController configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "applicationCellIncludesGalleryListView") ^ 1;

  }
  return v3;
}

- (BOOL)_shouldShowCustomApplicationsSection
{
  void *v3;
  int v4;
  NSUInteger v5;
  BOOL result;

  -[SBHAddWidgetSheetViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsCustomApplicationsSection");

  v5 = -[NSArray count](self->_customApplicationWidgetCollections, "count");
  result = 0;
  if (v4)
  {
    if (v5)
      return !-[SBHAddWidgetSheetViewController _isSearchVisible](self, "_isSearchVisible");
  }
  return result;
}

- (BOOL)_shouldShowSuggestionsListItem
{
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
    return !-[SBHAddWidgetSheetViewController _isSearchVisible](self, "_isSearchVisible");
  else
    return 0;
}

- (BOOL)_shouldShowDisfavoredSection
{
  if (self->_disfavoredApplicationWidgetCollections)
    return !-[SBHAddWidgetSheetViewController _isSearchVisible](self, "_isSearchVisible");
  else
    return 0;
}

- (id)_materialViewForVisualStyling
{
  void *backgroundView;
  void *v4;
  id v5;

  -[SBHAddWidgetSheetViewControllerBase externalBackgroundView](self, "externalBackgroundView");
  backgroundView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = backgroundView;
  if (!backgroundView)
    backgroundView = self->_backgroundView;
  v5 = backgroundView;

  return v5;
}

- (BOOL)_shouldShowTitleAndSubtitle
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  }
  return v2;
}

- (id)_newWrapperViewControllerWithGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  SBHWidgetWrapperViewController *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  SBHWidgetWrapperViewController *v11;

  v6 = a3;
  v7 = [SBHWidgetWrapperViewController alloc];
  v8 = -[SBHAddWidgetSheetViewController _shouldShowTitleAndSubtitle](self, "_shouldShowTitleAndSubtitle");
  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBHWidgetWrapperViewController initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:](v7, "initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:", v6, v8, v9, v10);

  if (-[SBHAddWidgetSheetViewController addWidgetSheetLocation](self, "addWidgetSheetLocation") == 2)
    -[SBHWidgetWrapperViewController setUsesAmbientScaleFactorForRemovableBackgroundItems:](v11, "setUsesAmbientScaleFactorForRemovableBackgroundItems:", 1);
  -[SBHWidgetWrapperViewController setDelegate:](v11, "setDelegate:", self);
  -[SBHWidgetWrapperViewController setSelectedSizeClass:](v11, "setSelectedSizeClass:", a4);
  -[SBHWidgetWrapperViewController setBackgroundType:](v11, "setBackgroundType:", -[SBHAddWidgetSheetViewController widgetWrapperViewControllerBackgroundType](self, "widgetWrapperViewControllerBackgroundType"));
  return v11;
}

- (int64_t)widgetWrapperViewControllerBackgroundType
{
  int64_t result;

  result = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetWidgetBackgroundType](self, "addWidgetSheetWidgetBackgroundType");
  if (result != 2)
    return result == 1;
  return result;
}

- (void)_updateSearchBarOverrideUserInterfaceStyle
{
  void *v3;
  id v4;

  -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));

}

- (void)_updateSearchBarContentInsets
{
  SBHWidgetSearchController *searchController;
  void *v4;
  double v5;

  searchController = self->_searchController;
  -[SBHAddWidgetSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](searchController, "updateSearchBarContentInsetsWithWidth:", v5);

  -[SBHAddWidgetSheetViewController _updateCollectionViewInsets](self, "_updateCollectionViewInsets");
}

- (void)_updateCollectionViewInsets
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double Height;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _SBHAddWidgetSheetCollectionView *collectionView;
  double v41;
  CGRect v42;

  -[SBHAddWidgetSheetViewController _listLayoutForWidgetSizing](self, "_listLayoutForWidgetSizing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClassForContentWidth");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("SBHIconGridSizeClassMedium");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, v8);
  -[SBHAddWidgetSheetViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = (v11 - v9) * -0.5;

  v13 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle");
  -[SBHAddWidgetSheetViewController searchController](self, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textFieldToWidgetsSpacing");
  v16 = v15;

  v17 = v16 + 12.0 + v12;
  if (v13 == 1)
    v17 = 0.0;
  self->_searchBarHeightAdjustment = v17;
  -[_SBHAddWidgetSheetCollectionView contentInset](self->_collectionView, "contentInset");
  v19 = v18;
  v21 = v20;
  if (v13 == 1)
  {
    -[SBHAddWidgetSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation", 0, 0, 0, 0, 0);
    -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "searchBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v25 = CGRectGetMaxY(v42) + 0.0;

    v26 = v25 / 0.0;
  }
  else
  {
    -[SBHAddWidgetSheetViewController _effectiveSearchController](self, "_effectiveSearchController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "searchBar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v30 = v29;

    v26 = v30 - self->_searchBarHeightAdjustment;
  }
  Height = CGRectGetHeight(self->_keyboardFrameIntersect);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      Height = Height - self->_applicationsSectionInsets.bottom;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "userInterfaceIdiom") != 1)
      Height = Height - self->_applicationsSectionInsets.bottom;

  }
  v33 = fmax(Height, 0.0);
  -[_SBHAddWidgetSheetCollectionView contentInset](self->_collectionView, "contentInset");
  if (v37 != v19 || v34 != v26 || v36 != v21 || v35 != v33)
  {
    -[_SBHAddWidgetSheetCollectionView setContentInset:](self->_collectionView, "setContentInset:", v26, v19, v33, v21);
    -[_SBHAddWidgetSheetCollectionView contentOffset](self->_collectionView, "contentOffset");
    if (v39 == *MEMORY[0x1E0C9D538] && v38 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      collectionView = self->_collectionView;
      -[_SBHAddWidgetSheetCollectionView contentInset](collectionView, "contentInset");
      -[_SBHAddWidgetSheetCollectionView setContentOffset:](collectionView, "setContentOffset:", 0.0, -v41);
    }
  }

}

- (void)_selectFirstItem
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_SBHAddWidgetSheetCollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v3, 0, 0);

}

- (id)_effectiveSearchController
{
  SBHWidgetSearchController *externalSearchController;

  externalSearchController = self->_externalSearchController;
  if (!externalSearchController)
    externalSearchController = self->_searchController;
  return externalSearchController;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3
{
  int *v4;
  char *v5;
  CGSize v6;
  __int128 v7;
  __int128 v8;

  if ((unint64_t)(a4 - 3) >= 2)
    v4 = &OBJC_IVAR___SBHAddWidgetSheetViewController__portraitMetrics;
  else
    v4 = &OBJC_IVAR___SBHAddWidgetSheetViewController__landscapeMetrics;
  v5 = (char *)self + *v4;
  v6 = (CGSize)*((_OWORD *)v5 + 5);
  *(_OWORD *)&retstr->scaledWidgetSize.height = *((_OWORD *)v5 + 4);
  retstr->detailWidgetPadding = v6;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *((_OWORD *)v5 + 6);
  retstr->detailPageControlTopSpacing = *((double *)v5 + 14);
  v7 = *((_OWORD *)v5 + 1);
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)v5;
  *(_OWORD *)&retstr->sidebarWidth = v7;
  v8 = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->trailingPadding = *((_OWORD *)v5 + 2);
  *(_OWORD *)&retstr->widgetScaleFactor = v8;
  return self;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation
{
  void *v4;
  SBHAddWidgetSheetViewController *v5;
  SBHPadAddWidgetSheetMetrics *result;
  SBHAddWidgetSheetViewController *v7;

  -[SBHAddWidgetSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v7 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v7)
    v5 = self;
  -[SBHAddWidgetSheetViewController _metricsForOrientation:](self, "_metricsForOrientation:", -[SBHAddWidgetSheetViewController interfaceOrientation](v5, "interfaceOrientation"));

  return result;
}

- (id)_generateLayoutSectionForSectionIdx:(unint64_t)a3 width:(double)a4
{
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;

  if (-[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 0) == a3)
  {
    v7 = -[SBHAddWidgetSheetViewController galleryLayoutSize](self, "galleryLayoutSize");
    -[SBHAddWidgetSheetViewController _sizeClasses](self, "_sizeClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 > 1)
    {
      v9 = -[SBHAddWidgetSheetViewController _newPadCollectionViewLayoutGallerySectionWithWidth:sizeClasses:](self, "_newPadCollectionViewLayoutGallerySectionWithWidth:sizeClasses:", v8, a4);
    }
    else
    {
      -[SBHAddWidgetSheetViewController _collectionViewLayoutGallerySectionWithWidth:sizeClasses:](self, "_collectionViewLayoutGallerySectionWithWidth:sizeClasses:", v8, a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else if (-[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 2) == a3
         || -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 3) == a3
         || -[SBHAddWidgetSheetViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 1) == a3)
  {
    -[SBHAddWidgetSheetViewController _collectionViewLayoutApplicationsSectionWithStyle:](self, "_collectionViewLayoutApplicationsSectionWithStyle:", -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_listLayoutForWidgetSizing
{
  void *v2;
  void *v3;

  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateHorizontalSpacing
{
  double v3;
  id v4;

  -[SBHAddWidgetSheetViewController _listLayoutForWidgetSizing](self, "_listLayoutForWidgetSizing");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController _horizontalSpacingForListLayout:](self, "_horizontalSpacingForListLayout:", v4);
  self->_horizontalSpacing = v3;

}

- (double)_horizontalSpacingForListLayout:(id)a3
{
  id v3;
  double v4;
  double v5;
  double result;

  v3 = a3;
  v4 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, CFSTR("SBHIconGridSizeClassSmall"));
  v5 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, CFSTR("SBHIconGridSizeClassMedium"));

  result = v5 + v4 * -2.0;
  if (v5 <= v4)
    return 20.0;
  return result;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize
{
  return self->_suggestedItemsByGalleryLayoutSize;
}

- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, a3);
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
}

- (NSArray)favoredApplicationWidgetCollections
{
  return self->_favoredApplicationWidgetCollections;
}

- (NSArray)disfavoredApplicationWidgetCollections
{
  return self->_disfavoredApplicationWidgetCollections;
}

- (NSArray)customApplicationWidgetCollections
{
  return self->_customApplicationWidgetCollections;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (unint64_t)galleryLayoutSize
{
  return self->_galleryLayoutSize;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (UIViewController)barSwipeViewController
{
  return self->_barSwipeViewController;
}

- (SBHWidgetSearchController)externalSearchController
{
  return self->_externalSearchController;
}

- (BOOL)shouldShowGalleryOnly
{
  return self->_shouldShowGalleryOnly;
}

- (void)setShouldShowGalleryOnly:(BOOL)a3
{
  self->_shouldShowGalleryOnly = a3;
}

- (BOOL)shouldCenterAppCells
{
  return self->_shouldCenterAppCells;
}

- (void)setShouldCenterAppCells:(BOOL)a3
{
  self->_shouldCenterAppCells = a3;
}

- (SBHAddWidgetSheetConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1624);
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (_SBHAddWidgetSheetCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (SBHWidgetSearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, a3);
}

- (NSArray)filteredApplicationWidgetCollections
{
  return self->_filteredApplicationWidgetCollections;
}

- (void)setFilteredApplicationWidgetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_filteredApplicationWidgetCollections, a3);
}

- (NSArray)galleryItems
{
  return self->_galleryItems;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_horizontalSpacing = a3;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSDirectionalEdgeInsets)applicationsSectionInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_applicationsSectionInsets.top;
  leading = self->_applicationsSectionInsets.leading;
  bottom = self->_applicationsSectionInsets.bottom;
  trailing = self->_applicationsSectionInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setApplicationsSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_applicationsSectionInsets = a3;
}

- (double)searchBarHeightAdjustment
{
  return self->_searchBarHeightAdjustment;
}

- (void)setSearchBarHeightAdjustment:(double)a3
{
  self->_searchBarHeightAdjustment = a3;
}

- (CGRect)keyboardFrameIntersect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrameIntersect.origin.x;
  y = self->_keyboardFrameIntersect.origin.y;
  width = self->_keyboardFrameIntersect.size.width;
  height = self->_keyboardFrameIntersect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrameIntersect:(CGRect)a3
{
  self->_keyboardFrameIntersect = a3;
}

- (SBHWidgetAddSheetTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (BOOL)isShowingDisfavoredApplicationWidgetCollections
{
  return self->_isShowingDisfavoredApplicationWidgetCollections;
}

- (void)setIsShowingDisfavoredApplicationWidgetCollections:(BOOL)a3
{
  self->_isShowingDisfavoredApplicationWidgetCollections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_galleryItems, 0);
  objc_storeStrong((id *)&self->_filteredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_externalSearchController, 0);
  objc_storeStrong((id *)&self->_barSwipeViewController, 0);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_galleryIdentifierToGalleryItemLookupTable, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(uint64_t)a1 configuredWithGalleryItem:(NSObject *)a2 selectedSizeClass:fromCell:atIndexPath:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Cannot present detail sheet for application collection with 0 descriptors: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_presentDetailSheetForGalleryCellAtIndexPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "widgetWrapperViewController: %{public}@ not found in known applicationWidgetCollections: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
