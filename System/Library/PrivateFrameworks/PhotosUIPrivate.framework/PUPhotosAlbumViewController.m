@implementation PUPhotosAlbumViewController

- (PUPhotosAlbumViewController)initWithSpec:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PUPhotosAlbumViewController *v7;

  v4 = (void *)MEMORY[0x1E0CD16F8];
  v5 = a3;
  objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotosAlbumViewController initWithSpec:photoLibrary:](self, "initWithSpec:photoLibrary:", v5, v6);

  return v7;
}

- (PUPhotosAlbumViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  return -[PUPhotosGridViewController initWithSpec:photoLibrary:](&v5, sel_initWithSpec_photoLibrary_, a3, a4);
}

- (PUPhotosAlbumViewController)initWithAlbumSpec:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PUPhotosAlbumViewController *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "gridSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUPhotosAlbumViewController initWithSpec:photoLibrary:](self, "initWithSpec:photoLibrary:", v8, v7);

  if (v9)
    -[PUPhotosAlbumViewController _setAlbumSpec:](v9, "_setAlbumSpec:", v6);

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PUPhotosAlbumViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoCollectionViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFullMomentsHeader"), CFSTR("PUFullMomentsHeader"));
}

- (id)filterPredicateForAlbum:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD1580], "pl_filterPredicateForAssetContainer:", a3);
}

- (void)setSessionInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController setSessionInfo:](&v4, sel_setSessionInfo_, a3);
  -[PUPhotosAlbumViewController _invalideSectionHeaders](self, "_invalideSectionHeaders");
  -[PUPhotosAlbumViewController _updateSectionHeadersIfNeeded](self, "_updateSectionHeadersIfNeeded");
}

- (void)setAlbum:(id)a3
{
  -[PUPhotosAlbumViewController setAlbum:existingFetchResult:](self, "setAlbum:existingFetchResult:", a3, 0);
}

- (void)setAlbum:(id)a3 existingFetchResult:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CD1580];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_fetchResultContainingAssetContainer:photoLibrary:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosAlbumViewController filterPredicateForAlbum:](self, "filterPredicateForAlbum:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_album, a3);
  v14 = 0;
  if (v8 && v13)
  {
    v15 = v13;
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:existingFetchResults:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:existingFetchResults:", v13, v11, v12, v14);

}

- (void)setAssetCollection:(id)a3
{
  PHAssetCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (PHAssetCollection *)a3;
  if (self->_assetCollection != v5)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PUPhotosAlbumViewController collectionView](self, "collectionView", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("PUFullMomentsHeader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[PUPhotosAlbumViewController collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUFullMomentsHeader"), v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUPhotosAlbumViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v14, CFSTR("PUFullMomentsHeader"), v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    -[PUPhotosAlbumViewController updateTitle](self, "updateTitle");
  }

}

- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5 existingFetchResults:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PHAssetCollection *v20;

  v20 = (PHAssetCollection *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_assetCollection != v20
    || (-[PUPhotosGridViewController photosDataSource](self, "photosDataSource"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "filterPredicate"),
        v15 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15 != v12))
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCollectionListFetchResult:", v11);

      -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilterPredicate:", v12);
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v11, 2);
      objc_msgSend(v18, "setExistingAssetCollectionFetchResults:", v13);
      objc_msgSend(v18, "setFilterPredicate:", v12);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v18);
      -[PUPhotosGridViewController setPhotosDataSource:](self, "setPhotosDataSource:", v19);

    }
    if (-[PUPhotosAlbumViewController isTrashBinViewController](self, "isTrashBinViewController"))
      -[PUPhotosGridViewController setAllowedActions:](self, "setAllowedActions:", 1);
    -[PUPhotosAlbumViewController updateTitle](self, "updateTitle");
    if (-[PHAssetCollection keyAssetsAtEnd](self->_assetCollection, "keyAssetsAtEnd"))
      -[PUPhotosGridViewController setInitiallyScrolledToBottom:](self, "setInitiallyScrolledToBottom:", 1);
    -[PUPhotosAlbumViewController _invalideSectionHeaders](self, "_invalideSectionHeaders");
    -[PUPhotosAlbumViewController _updateSectionHeadersIfNeeded](self, "_updateSectionHeadersIfNeeded");
  }

}

- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5
{
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:existingFetchResults:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:existingFetchResults:", a3, a4, a5, 0);
}

- (PHFetchResult)assetCollectionAssets
{
  void *v3;
  void *v4;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v4;
}

- (id)localizedTitleForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotosAlbumViewController;
    -[PUPhotosGridViewController localizedTitleForAssets:](&v8, sel_localizedTitleForAssets_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)sessionInfoForTransferredAssets:(id)a3
{
  id v4;
  PUAlbumPickerSessionInfo *v5;
  void *v6;
  PUAlbumPickerSessionInfo *v7;

  v4 = a3;
  v5 = [PUAlbumPickerSessionInfo alloc];
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUAlbumPickerSessionInfo initWithSourceAlbum:transferredAssets:](v5, "initWithSourceAlbum:transferredAssets:", v6, v4);

  return v7;
}

- (BOOL)shouldShowSectionHeaders
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assetCollectionType");

  if (v4 == 2)
    return 0;
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assetCollectionSubtype");

  v5 = 0;
  if ((v7 > 6 || ((1 << v7) & 0x58) == 0) && v7 != 101)
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetAlbum");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v5 = 0;
      }
      else
      {
        -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "targetAlbumName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v12 == 0;

      }
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (BOOL)wantsGlobalFooter
{
  void *v3;
  int v4;
  _BOOL4 v5;
  BOOL v6;
  BOOL v7;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pendingItemsCount");
  v5 = -[PUPhotosAlbumViewController _hasAccurateCounts](self, "_hasAccurateCounts");
  v6 = v4 <= 0;
  v7 = v4 > 0;
  if (v6 && v5)
    v7 = -[PUPhotosGridViewController hasScrollableContent](self, "hasScrollableContent");

  return v7;
}

- (BOOL)canBeginStackCollapseTransition
{
  void *v2;
  char v3;

  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesStackPopTransition");

  return v3;
}

- (id)newGridLayout
{
  id v4;
  void *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotosAlbumViewController;
  v4 = -[PUPhotosGridViewController newGridLayout](&v8, sel_newGridLayout);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAlbumViewController.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[gridLayout isKindOfClass:[PUSectionedGridLayout class]]"));

  }
  objc_msgSend(v4, "setSectionHeaderElementKind:", CFSTR("PUFullMomentsHeader"));
  -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureCollectionViewGridLayout:", v4);

  return v4;
}

- (void)_invalideSectionHeaders
{
  self->_needsUpdateFlags.sectionHeadersEnabled = 1;
  -[PUPhotosAlbumViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSectionHeadersIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.sectionHeadersEnabled)
  {
    self->_needsUpdateFlags.sectionHeadersEnabled = 0;
    -[PUPhotosGridViewController gridLayout](self, "gridLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSectionHeadersEnabled:", -[PUPhotosAlbumViewController shouldShowSectionHeaders](self, "shouldShowSectionHeaders"));

  }
}

- (void)updateLayoutMetrics
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController updateLayoutMetrics](&v5, sel_updateLayoutMetrics);
  -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureCollectionViewGridLayout:", v4);

}

- (BOOL)updateSpec
{
  BOOL v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotosAlbumViewController;
  v3 = -[PUPhotosGridViewController updateSpec](&v9, sel_updateSpec);
  -[PUPhotosAlbumViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "horizontalSizeClass") && objc_msgSend(v4, "verticalSizeClass"))
  {
    +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v4);
    v5 = (objc_class *)objc_opt_class();
    v6 = objc_opt_class();
    if (v6 == objc_opt_class() || v6 == objc_opt_class())
      v5 = (objc_class *)objc_opt_class();
    if (v5 != (objc_class *)v6)
    {
      v7 = objc_alloc_init(v5);
      -[PUPhotosAlbumViewController _setAlbumSpec:](self, "_setAlbumSpec:", v7);

      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_setAlbumSpec:(id)a3
{
  PUPhotosAlbumViewControllerSpec *v5;
  PUPhotosAlbumViewControllerSpec *v6;

  v5 = (PUPhotosAlbumViewControllerSpec *)a3;
  if (self->__albumSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__albumSpec, a3);
    -[PUPhotosAlbumViewController updateLayoutMetrics](self, "updateLayoutMetrics");
    v5 = v6;
  }

}

- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 locations:(id *)a5 title:(id *)a6 startDate:(id *)a7 endDate:(id *)a8
{
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;

  -[PUPhotosGridViewController assetCollectionForSectionHeaderAtIndex:](self, "assetCollectionForSectionHeaderAtIndex:", a3);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedTitle");
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedLocationNames");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = 0;
  objc_msgSend(v25, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "endDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v14 || !v15)
  {
    -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "creationDate");
    v19 = objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "creationDate");
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v22;
    }

    v16 = (void *)v19;
  }
  v23 = objc_retainAutorelease(v14);
  *a7 = v23;
  v24 = objc_retainAutorelease(v16);
  *a8 = v24;

}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unsigned __int8 v31;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PUFullMomentsHeader")) & 1) != 0)
  {
    v11 = v8;
    v12 = objc_msgSend(v10, "section");

    v31 = 0;
    v29 = 0;
    v30 = 0;
    v27 = 0;
    v28 = 0;
    -[PUPhotosAlbumViewController _getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:](self, "_getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:", v12, &v31, &v30, &v29, &v28, &v27);
    v13 = v30;
    v14 = v29;
    v15 = v28;
    v16 = v27;
    -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStyle:", objc_msgSend(v17, "fullMomentsSectionHeaderStyle"));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__PUPhotosAlbumViewController_configureSupplementaryView_ofKind_forIndexPath___block_invoke;
    v22[3] = &unk_1E58A9AE0;
    v23 = v11;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v18 = v16;
    v19 = v15;
    v21 = v14;
    v10 = v11;
    objc_msgSend(v10, "performBatchUpdateOfDateDependentPropertiesWithBlock:", v22);
    objc_msgSend(v10, "setSectionIndex:", v12);
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionHeaderInsets");
    objc_msgSend(v10, "setContentInsets:");

    objc_msgSend(v17, "fullMomentsLevelSectionHeaderHighlightInset");
    objc_msgSend(v10, "setHighlightInsets:");
    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setShowsActionButton:", v31);
    objc_msgSend(v10, "setAllowsPhotosDetailsInteraction:", 1);
    objc_msgSend(v10, "setSectionLocations:", v13);

  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PUPhotosAlbumViewController;
    -[PUPhotosGridViewController configureSupplementaryView:ofKind:forIndexPath:](&v32, sel_configureSupplementaryView_ofKind_forIndexPath_, v8, v9, v10);
  }

}

- (id)_globalHeaderTitle
{
  void *v3;
  void *v4;

  if (-[PUPhotosAlbumViewController isTrashBinViewController](self, "isTrashBinViewController"))
  {
    -[PHAssetCollection photoLibrary](self->_assetCollection, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isCloudPhotoLibraryEnabled"))
      PXLocalizedStringWithCount();
    else
      PXLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)globalHeaderHeight
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = 0.0;
  if (-[PUPhotosAlbumViewController isTrashBinViewController](self, "isTrashBinViewController"))
  {
    -[PUPhotosAlbumViewController _globalHeaderTitle](self, "_globalHeaderTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAlbumViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0D7B7F0], "sizeThatFits:forTitle:", v4, v7, v9);
    v3 = v10;

  }
  return v3;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotosAlbumViewController _globalHeaderTitle](self, "_globalHeaderTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (NSString)globalFooterSubtitle
{
  return 0;
}

- (void)configureGlobalFooterView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D7B458]);
    objc_msgSend(v4, "setViewModel:", v6);

  }
  if (-[PUPhotosAlbumViewController wantsGlobalFooter](self, "wantsGlobalFooter"))
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "estimatedPhotosCount");
    v9 = objc_msgSend(v7, "estimatedVideosCount");
    v10 = objc_msgSend(v7, "estimatedOtherCount");
    v11 = v10;
    if (!v8 && !v9 && !v10)
    {
      if (-[PUPhotosAlbumViewController _hasAccurateCounts](self, "_hasAccurateCounts")
        && objc_msgSend(v7, "numberOfSections") >= 1)
      {
        v8 = 0;
        v9 = 0;
        v11 = 0;
        v12 = 0;
        do
        {
          objc_msgSend(v7, "assetsInSection:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countOfAssetsWithMediaType:", 1);
          v15 = objc_msgSend(v13, "countOfAssetsWithMediaType:", 2);
          v8 += v14;
          v9 += v15;
          v11 = v11 - (v14 + v15) + objc_msgSend(v13, "count");

          ++v12;
        }
        while (v12 < objc_msgSend(v7, "numberOfSections"));
      }
      else
      {
        v11 = 0;
        v9 = 0;
        v8 = 0;
      }
    }
    -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "pendingItemsCount"))
    {
      objc_msgSend(v18, "pendingItemsType");
      PLProgressDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else if (v8 || v9 || v11)
    {
      PLLocalizedCountDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosAlbumViewController globalFooterSubtitle](self, "globalFooterSubtitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }

  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(v4, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__PUPhotosAlbumViewController_configureGlobalFooterView___block_invoke;
  v22[3] = &unk_1E58A5AC0;
  v23 = v17;
  v24 = v16;
  v20 = v16;
  v21 = v17;
  objc_msgSend(v19, "performChanges:", v22);

}

- (void)updateTitle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PUPhotosAlbumViewController isEditing](self, "isEditing"))
  {
    -[PUPhotosAlbumViewController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleView:", 0);
  }
  else
  {
    -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "canPerformEditOperation:", 7)
      && (+[PUAlbumListSettings sharedInstance](PUAlbumListSettings, "sharedInstance"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "allowNavigationTitleEditing"),
          v4,
          v5))
    {
      -[PUPhotosAlbumViewController _ensureEditableTitleView](self, "_ensureEditableTitleView");
      -[PUPhotosAlbumViewController editableTitleView](self, "editableTitleView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v3);
    }
    else
    {
      v6 = 0;
    }
    -[PUPhotosAlbumViewController setTitle:](self, "setTitle:", v3);
    -[PUPhotosAlbumViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleView:", v6);

  }
}

- (void)_ensureEditableTitleView
{
  PXEditableNavigationTitleView *v3;
  PXEditableNavigationTitleView *editableTitleView;

  if (!self->_editableTitleView)
  {
    v3 = (PXEditableNavigationTitleView *)objc_alloc_init(MEMORY[0x1E0D7B3B8]);
    editableTitleView = self->_editableTitleView;
    self->_editableTitleView = v3;

    -[PXEditableNavigationTitleView setDelegate:](self->_editableTitleView, "setDelegate:", self);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController setEditing:animated:](&v5, sel_setEditing_animated_, a3, a4);
  -[PUPhotosAlbumViewController updateTitle](self, "updateTitle");
}

- (CGPoint)contentOffsetForPreheating
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "transitionEndContentOffset");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUPhotosAlbumViewController;
    -[PUPhotosGridViewController contentOffsetForPreheating](&v12, sel_contentOffsetForPreheating);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)isTrashBinViewController
{
  void *v2;
  BOOL v3;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetCollectionSubtype") == 1000000201;

  return v3;
}

- (BOOL)isCameraRoll
{
  void *v2;
  uint64_t v3;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetCollectionSubtype");

  return v3 == 209;
}

- (BOOL)allowSelectAllButton
{
  if (-[PUPhotosAlbumViewController isCameraRoll](self, "isCameraRoll"))
    return 0;
  else
    return !-[PUPhotosAlbumViewController isTrashBinViewController](self, "isTrashBinViewController");
}

- (int64_t)cellFillMode
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAlbumViewController;
  v3 = -[PUPhotosGridViewController cellFillMode](&v7, sel_cellFillMode);
  -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = (id)objc_msgSend(v4, "cellFillMode");

  return (int64_t)v3;
}

- (unint64_t)userEventSourceType
{
  objc_super v4;

  if (-[PUPhotosAlbumViewController isCameraRoll](self, "isCameraRoll"))
    return 12;
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  return -[PUPhotosGridViewController userEventSourceType](&v4, sel_userEventSourceType);
}

- (unint64_t)additionalOneUpViewControllerOptions
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAlbumViewController;
  v3 = -[PUPhotosGridViewController additionalOneUpViewControllerOptions](&v7, sel_additionalOneUpViewControllerOptions);
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetCollectionSubtype");

  if (v5 == 1000000201 || v5 == 205)
    v3 |= 0x2000uLL;
  return v3;
}

- (int64_t)oneUpPresentationOrigin
{
  void *v3;
  int64_t v4;
  objc_super v6;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXOneUpPresentationOriginForAssetCollection();

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUPhotosAlbumViewController;
    return -[PUPhotosGridViewController oneUpPresentationOrigin](&v6, sel_oneUpPresentationOrigin);
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PUPhotosAlbumViewController editableTitleView](self, "editableTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  -[PUPhotosGridViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUPhotosAlbumViewController _countAssetTypesIfNeeded](self, "_countAssetTypesIfNeeded");
}

- (void)_countAssetTypesIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  if (!-[PUPhotosAlbumViewController _isCountingAssetTypes](self, "_isCountingAssetTypes")
    && !-[PUPhotosAlbumViewController _hasAccurateCounts](self, "_hasAccurateCounts"))
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "estimatedPhotosCount") || objc_msgSend(v3, "estimatedVideosCount"))
    {
      -[PUPhotosAlbumViewController _setHasAccurateCounts:](self, "_setHasAccurateCounts:", 1);
      if (-[PUPhotosGridViewController isContentViewInSyncWithModel](self, "isContentViewInSyncWithModel"))
        -[PUPhotosGridViewController updateGlobalFooter](self, "updateGlobalFooter");
    }
    else
    {
      -[PUPhotosAlbumViewController _setCountingAssetTypes:](self, "_setCountingAssetTypes:", 1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "numberOfSections") >= 1)
      {
        v5 = 0;
        do
        {
          objc_msgSend(v3, "assetsInSection:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v6);

          ++v5;
        }
        while (v5 < objc_msgSend(v3, "numberOfSections"));
      }
      objc_initWeak(&location, self);
      dispatch_get_global_queue(17, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke;
      block[3] = &unk_1E58AB210;
      v10 = v4;
      v8 = v4;
      objc_copyWeak(&v11, &location);
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

- (void)handleAddToAlbum:(id)a3 pickedAssets:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "canPerformEditOperation:", 3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAlbumViewController.m"), 611, CFSTR("Attempting to edit a non-editable album: %@"), v7);

  }
  if (objc_msgSend(v8, "count"))
  {
    -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PUPhotosAlbumViewController_handleAddToAlbum_pickedAssets___block_invoke;
    v13[3] = &unk_1E58AB790;
    v14 = v8;
    v15 = v7;
    v16 = v9;
    v11 = v9;
    objc_msgSend(v10, "performChanges:completionHandler:", v13, 0);

  }
}

- (void)handleAddFromAction
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAlbumViewController.m"), 628, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  return -[PUPhotosGridViewController prepareForDismissingForced:](&v4, sel_prepareForDismissingForced_, a3);
}

- (void)handleTransitionFade:(BOOL)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  void *v47;
  double v48;
  _QWORD aBlock[4];
  id v50;
  _QWORD v51[4];
  id v52;
  double v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  double v58;

  v4 = a4;
  v5 = a3;
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "assetCollectionSubtype") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForAsset:inCollection:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosAlbumViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v15 = 1.0;
    else
      v15 = 0.0;
    if (v5)
      v16 = 0.0;
    else
      v16 = 1.0;
    objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", v7);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTemporaryPhotoContentView");
    objc_msgSend(v14, "setTemporaryPhotoImage:with:", v17, 1);
    objc_msgSend(v14, "temporaryPhotoContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v15);

    v19 = (void *)MEMORY[0x1E0DC3F10];
    if (v4)
      v20 = 0.3;
    else
      v20 = 0.0;
    v21 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke;
    v56[3] = &unk_1E58AACF0;
    v57 = v14;
    v58 = v16;
    v54[0] = v21;
    v54[1] = 3221225472;
    v54[2] = __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_2;
    v54[3] = &unk_1E58A9910;
    v55 = v57;
    v22 = v57;
    objc_msgSend(v19, "pu_animateWithDuration:animations:completion:", v56, v54, v20);

  }
  else
  {
    -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAlbumViewController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyItemIndexPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cellForItemAtIndexPath:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "photoContentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentHelper");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "photoContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentHelper");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentCornerRadius");
    v32 = v31;

    if (v5)
      v33 = 0.0;
    else
      v33 = v32;
    v34 = MEMORY[0x1E0C809B0];
    v35 = (_QWORD *)&unk_1AB0EE000;
    if (v4)
    {
      if (!v5)
        v32 = 0.0;
      objc_msgSend(v29, "setAnimatingRoundedCorners:", 1);
      v36 = (void *)MEMORY[0x1E0DC3F10];
      v51[0] = v34;
      v51[1] = 3221225472;
      v51[2] = __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_3;
      v51[3] = &unk_1E58AACF0;
      v37 = v29;
      v52 = v37;
      v53 = v32;
      objc_msgSend(v36, "performWithoutAnimation:", v51);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFromValue:", v39);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setToValue:", v40);

      UIAnimationDragCoefficient();
      objc_msgSend(v38, "setDuration:", v41 * 0.05);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTimingFunction:", v42);

      objc_msgSend(v38, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v38, "setRemovedOnCompletion:", 1);
      aBlock[0] = v34;
      aBlock[1] = 3221225472;
      aBlock[2] = __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_4;
      aBlock[3] = &unk_1E58A9910;
      v50 = v37;
      v43 = _Block_copy(aBlock);
      v44 = objc_alloc_init(MEMORY[0x1E0D714A0]);
      objc_msgSend(v44, "setCompletion:", v43);
      objc_msgSend(v38, "setDelegate:", v44);
      objc_msgSend(v13, "addAnimation:forKey:", v38, CFSTR("cornerRadius"));

      v35 = &unk_1AB0EE000;
    }
    v45 = (void *)MEMORY[0x1E0DC3F10];
    v46[0] = v34;
    v46[1] = v35[283];
    v46[2] = __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_5;
    v46[3] = &unk_1E58AACF0;
    v47 = v29;
    v48 = v33;
    v17 = v29;
    objc_msgSend(v45, "performWithoutAnimation:", v46);
    v22 = v47;
  }

}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  double v17;
  double v18;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;

  -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fullMomentsSectionHeaderStyle");
  v24 = 0;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  -[PUPhotosAlbumViewController _getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:](self, "_getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:", a4, &v24, &v23, &v22, &v21, &v20);
  v8 = v23;
  v9 = v22;
  v10 = v21;
  v11 = v20;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  v14 = !v13;
  v15 = objc_msgSend(v8, "count") != 0;
  objc_msgSend(MEMORY[0x1E0D7B800], "sharedMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionHeaderHeightForStyle:hasTitle:hasDates:hasLocation:", v7, v9 != 0, v14, v15);
  v18 = v17;

  return v18;
}

- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  CGRect v31;

  v6 = a3;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
  {
    -[PUPhotosAlbumViewController _albumSpec](self, "_albumSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gridSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionHeaderInsets");
    v12 = v11;
    v14 = v13;

    v15 = objc_msgSend(v9, "fullMomentsSectionHeaderStyle");
    v30 = 0;
    v28 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    -[PUPhotosAlbumViewController _getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:](self, "_getDataForVisualSection:hasActionButton:locations:title:startDate:endDate:", a4, &v30, &v29, &v28, &v27, &v26);
    v16 = v29;
    v17 = v28;
    v18 = v27;
    v19 = v26;
    objc_msgSend(MEMORY[0x1E0D7B800], "sharedMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v20, "accessibilitySectionHeaderHeightForStyle:width:actionButton:disclosure:title:startDate:endDate:locations:actionButtonSpec:", v15, CGRectGetWidth(v31) - v12 - v14, v16, 0);
    v23 = v22;

  }
  else
  {
    -[PUPhotosAlbumViewController sectionedGridLayout:sectionHeaderHeightForVisualSection:](self, "sectionedGridLayout:sectionHeaderHeightForVisualSection:", v6, a4);
    v23 = v24;
  }

  return v23;
}

- (void)didTapHeaderView:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "sectionIndex");
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController navigateToPhotosDetailsForAssetCollection:](self, "navigateToPhotosDetailsForAssetCollection:", v6);
}

- (void)photosDataSource:(id)a3 didReceivePhotoLibraryChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAfterChanges");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[PUPhotosAlbumViewController setAssetCollection:](self, "setAssetCollection:", v9);
    v8 = v9;
  }

}

- (id)editableNavigationTitleView:(id)a3 validateNewText:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", a4, 0);
}

- (void)editableNavigationTitleViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B8A0]), "initWithCollection:title:", v5, v4);
  -[PUPhotosAlbumViewController undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PUPhotosAlbumViewController_editableNavigationTitleViewDidEndEditing___block_invoke;
  v9[3] = &unk_1E58AB060;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "executeWithUndoManager:completionHandler:", v7, v9);

}

- (BOOL)canDragOut
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysAllowDragsWithinUserAlbums");

  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSelectingAssets");

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canPerformEditOperation:", 5);

  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "dragOutEnabled") | v4 & v8;

  return v10 & ~-[PUPhotosAlbumViewController isTrashBinViewController](self, "isTrashBinViewController") & (v6 ^ 1);
}

- (BOOL)canDragIn
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  v3 = -[PUPhotosGridViewController canDragIn](&v5, sel_canDragIn);
  return -[PUPhotosAlbumViewController isCameraRoll](self, "isCameraRoll") | v3;
}

- (BOOL)canHandleDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PUPhotosAlbumViewController isCameraRoll](self, "isCameraRoll"))
  {
    objc_msgSend(v4, "localDragSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v4, "items", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "localObject");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "needsImport"))
            {

              LOBYTE(v7) = 1;
              goto LABEL_17;
            }

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            continue;
          break;
        }
      }
      goto LABEL_17;
    }
  }
  if (-[PUPhotosAlbumViewController canDragIn](self, "canDragIn"))
  {
    objc_msgSend(MEMORY[0x1E0D7B528], "supportedTypeIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v6);
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v7) = 0;
LABEL_18:

  return v7;
}

- (void)_performAddDropWithSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PUPhotosAlbumViewController *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLDragAndDropGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "_performAddDropWithCoordinator: %@", buf, 0xCu);
  }

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0D7B528], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke;
  v10[3] = &unk_1E58A5B10;
  objc_copyWeak(&v14, (id *)buf);
  v8 = v6;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  v13 = self;
  objc_msgSend(v7, "fetchAssetsFromDrop:importIfNeeded:completion:", v9, 1, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)_performMoveDropWithCoordinator:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  PUPhotosAlbumViewController *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[6];
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLDragAndDropGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v84 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "_performMoveDropWithCoordinator: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", 0, v10, v12);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke;
  v80[3] = &unk_1E58A5B38;
  v80[4] = self;
  v80[5] = a2;
  objc_msgSend(v13, "_pl_map:", v80);
  v14 = objc_claimAutoreleasedReturnValue();

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E20];
  v53 = v16;
  objc_msgSend(v16, "fetchedObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intersectSet:", v20);

  v21 = (void *)objc_opt_new();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v19;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v77 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
        -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "indexPathForAsset:inCollection:", v26, v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "addObject:", v28);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v23);
  }
  v56 = v21;
  v51 = self;

  v29 = objc_msgSend(v60, "item");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v29, objc_msgSend(v57, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v52, objc_msgSend(v60, "section"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v5, "items");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  v59 = v5;
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v73 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v29 + j, objc_msgSend(v60, "section", v51));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dragItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v5, "dropItem:toItemAtIndexPath:", v37, v36);

      }
      v29 += j;
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_2;
  v66[3] = &unk_1E58A9328;
  v41 = v15;
  v67 = v41;
  v54 = v53;
  v68 = v54;
  v42 = obj;
  v69 = v42;
  v43 = v57;
  v70 = v43;
  v44 = v52;
  v71 = v44;
  v65 = 0;
  v45 = objc_msgSend(v39, "performChangesAndWait:error:", v66, &v65);
  v46 = v65;

  if ((v45 & 1) != 0)
  {
    -[PUPhotosGridViewController photosDataSource](v51, "photosDataSource");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "refetchResultsForAssetCollection:", v41);

    -[PUPhotosAlbumViewController collectionView](v51, "collectionView");
    v61[0] = v40;
    v61[1] = 3221225472;
    v61[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_230;
    v61[3] = &unk_1E58AB790;
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v48 = v56;
    v63 = v56;
    v49 = v55;
    v64 = v55;
    v50 = v62;
    -[NSObject performBatchUpdates:completion:](v50, "performBatchUpdates:completion:", v61, 0);

  }
  else
  {
    PLDragAndDropGetLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v49 = v55;
    v48 = v56;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v46;
      _os_log_impl(&dword_1AAB61000, v50, OS_LOG_TYPE_ERROR, "Failed to perform changes during album reorder drop: %@", buf, 0xCu);
    }
  }

}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v28 = 138412802;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v28, 0x20u);
  }

  -[PUPhotosAlbumViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v12);
  v14 = v13;
  v16 = v15;

  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", 0, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "canPerformEditOperation:", 5);

  if (v19
    && objc_msgSend(v8, "hasActiveDrag")
    && (objc_msgSend(v9, "items"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "count"),
        v20,
        v21 == 1)
    && v17)
  {
    v22 = objc_alloc(MEMORY[0x1E0DC3608]);
    v23 = 3;
    v24 = 0;
  }
  else
  {
    v25 = objc_msgSend(v8, "hasActiveDrag");
    v22 = objc_alloc(MEMORY[0x1E0DC3608]);
    if (v25)
      v23 = 0;
    else
      v23 = 2;
    v24 = 2;
  }
  v26 = (void *)objc_msgSend(v22, "initWithDropOperation:dropLocation:", v23, v24);

  return v26;
}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v7, "proposal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "operation");

  if (v10 == 3)
  {
    -[PUPhotosAlbumViewController _performMoveDropWithCoordinator:](self, "_performMoveDropWithCoordinator:", v7);
  }
  else
  {
    objc_msgSend(v7, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAlbumViewController _performAddDropWithSession:](self, "_performAddDropWithSession:", v11);

  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ performDrop: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PUPhotosAlbumViewController _performAddDropWithSession:](self, "_performAddDropWithSession:", v7);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 7)
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForLastAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForAssetWithUUID:orBurstIdentifier:hintIndexPath:hintCollection:", v6, 0, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v11, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") == 7)
  {
    v10 = objc_msgSend(v11, "revealMode");
    -[PUPhotosAlbumViewController setEditing:](self, "setEditing:", 0);
    -[PUPhotosGridViewController navigateToRevealPhoto:inAssetContainer:animated:](self, "navigateToRevealPhoto:inAssetContainer:animated:", v8, v9, 0);
    if (v10 == 2)
      goto LABEL_6;
  }
  else
  {
    -[PUPhotosAlbumViewController setEditing:](self, "setEditing:", 0);
    -[PUPhotosGridViewController navigateToRevealPhoto:inAssetContainer:animated:](self, "navigateToRevealPhoto:inAssetContainer:animated:", v8, v9, 0);
  }
  -[PUPhotosGridViewController navigateToPhoto:inAssetContainer:animated:](self, "navigateToPhoto:inAssetContainer:animated:", v8, v9, 0);
LABEL_6:
  v7[2](v7, 1, 0);

}

- (id)px_navigationDestination
{
  void *v2;
  void *v3;

  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PLAlbumProtocol)album
{
  return self->_album;
}

- (BOOL)_isCountingAssetTypes
{
  return self->__isCountingAssetTypes;
}

- (void)_setCountingAssetTypes:(BOOL)a3
{
  self->__isCountingAssetTypes = a3;
}

- (BOOL)_hasAccurateCounts
{
  return self->__hasAccurateCounts;
}

- (void)_setHasAccurateCounts:(BOOL)a3
{
  self->__hasAccurateCounts = a3;
}

- (PUPhotosAlbumViewControllerSpec)_albumSpec
{
  return self->__albumSpec;
}

- (PXEditableNavigationTitleView)editableTitleView
{
  return self->_editableTitleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTitleView, 0);
  objc_storeStrong((id *)&self->__albumSpec, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

id __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;

  objc_msgSend(a2, "dragItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PUPhotosAlbumViewController.m"), 891, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("draggingItemLocalObject.assetReference.asset"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PUPhotosAlbumViewController.m"), 891, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("draggingItemLocalObject.assetReference.asset"), v12, v16);

    goto LABEL_6;
  }
LABEL_3:

  return v6;
}

void __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAssets:", a1[6]);
  objc_msgSend(v2, "insertAssets:atIndexes:", a1[7], a1[8]);

}

uint64_t __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_230(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 48));
}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;

  v3 = a2;
  if (objc_msgSend(v3, "count") >= 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_2;
    aBlock[3] = &unk_1E58A65D0;
    objc_copyWeak(&v27, a1 + 7);
    v6 = v4;
    v26 = v6;
    v7 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    v9 = objc_msgSend(WeakRetained, "isCameraRoll");

    if (v9)
    {
      v10 = objc_loadWeakRetained(a1 + 7);
      objc_msgSend(v10, "setPendingProcessDataSourceUpdateBlock:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_3;
      v22[3] = &unk_1E58ABCA8;
      v23 = v3;
      v24 = a1[4];
      v16 = v5;
      v17 = 3221225472;
      v18 = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_4;
      v19 = &unk_1E58A5AE8;
      objc_copyWeak(&v21, a1 + 7);
      v20 = v7;
      objc_msgSend(v11, "performChanges:completionHandler:", v22, &v16);

      objc_destroyWeak(&v21);
      v10 = v23;
    }

    objc_destroyWeak(&v27);
  }
  v12 = objc_msgSend(v3, "count", v16, v17, v18, v19);
  objc_msgSend(a1[5], "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 != v14)
  {
    objc_msgSend(MEMORY[0x1E0D7B330], "dropImportErrorAlertControllerWithHandler:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "presentViewController:animated:completion:", v15, 1, 0);

  }
}

BOOL __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForAsset:hintIndexPath:hintCollection:", *(_QWORD *)(a1 + 32), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 2, 1);

  }
  return v5 != 0;
}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD1390];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAssets:", v6);

}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  id WeakRetained;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setPendingProcessDataSourceUpdateBlock:", v2);

  }
}

void __72__PUPhotosAlbumViewController_editableNavigationTitleViewDidEndEditing___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed to rename %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "temporaryPhotoContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

uint64_t __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTemporaryPhotoContentView");
}

uint64_t __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", *(double *)(a1 + 40));
}

uint64_t __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimatingRoundedCorners:", 0);
}

uint64_t __60__PUPhotosAlbumViewController_handleTransitionFade_animate___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", *(double *)(a1 + 40));
}

void __61__PUPhotosAlbumViewController_handleAddToAlbum_pickedAssets___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD1390];
  v3 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", a1[5], a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAssets:", v6);

}

void __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "countOfAssetsWithMediaType:", 1);
        objc_msgSend(v7, "countOfAssetsWithMediaType:", 2);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke_2;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v9);
}

void __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setCountingAssetTypes:", 0);
  objc_msgSend(WeakRetained, "_setHasAccurateCounts:", 1);
  if (objc_msgSend(WeakRetained, "isContentViewInSyncWithModel"))
    objc_msgSend(WeakRetained, "updateGlobalFooter");

}

void __57__PUPhotosAlbumViewController_configureGlobalFooterView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle1:", *(_QWORD *)(a1 + 40));

}

uint64_t __78__PUPhotosAlbumViewController_configureSupplementaryView_ofKind_forIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSectionTitle:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setSectionStartDate:endDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
