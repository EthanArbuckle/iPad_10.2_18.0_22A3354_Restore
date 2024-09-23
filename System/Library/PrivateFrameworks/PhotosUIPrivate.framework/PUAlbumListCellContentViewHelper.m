@implementation PUAlbumListCellContentViewHelper

- (PUAlbumListCellContentViewHelper)initWithConfiguration:(id)a3 dataSourceManager:(id)a4 mediaProvider:(id)a5 extendedTraitCollection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PUAlbumListCellContentViewHelper *v15;
  PUAlbumListCellContentViewHelper *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  PUFontManager *v21;
  PUFontManager *fontManager;
  PXAssetBadgeManager *v23;
  PXAssetBadgeManager *badgeManager;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PUAlbumListCellContentViewHelper;
  v15 = -[PUAlbumListCellContentViewHelper init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_dataSourceManager, a4);
    objc_storeStrong((id *)&v16->_mediaProvider, a5);
    objc_storeStrong((id *)&v16->_traitCollection, a6);
    objc_msgSend(v11, "previewInsets");
    v16->_previewInsets.top = v17;
    v16->_previewInsets.left = v18;
    v16->_previewInsets.bottom = v19;
    v16->_previewInsets.right = v20;
    v21 = objc_alloc_init(PUFontManager);
    fontManager = v16->_fontManager;
    v16->_fontManager = v21;

    v23 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E0D7B1D8]);
    badgeManager = v16->_badgeManager;
    v16->_badgeManager = v23;

    -[PUAlbumListCellContentViewHelper _invalidateAlbumCellSize](v16, "_invalidateAlbumCellSize");
    -[PUFontManager registerChangeObserver:context:](v16->_fontManager, "registerChangeObserver:context:", v16, PUFontManagerObservationContext);
  }

  return v16;
}

- (void)configureAlbumListCellContentView:(id)a3 forCollection:(id)a4 title:(id)a5 animated:(BOOL)a6 enabled:(BOOL)a7 editing:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _BOOL4 v43;
  id v44;

  v43 = a8;
  v8 = a7;
  v9 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(v14, "setEditCapabilities:animated:", 0, v9);
  objc_msgSend(v14, "setEnabled:animated:", v8, v9);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLayout:", objc_msgSend(v17, "cellContentViewLayout"));

  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldCenterTextHorizontally:", objc_msgSend(v18, "shouldCenterTextHorizontally"));

  objc_msgSend(v14, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  -[PUAlbumListCellContentViewHelper _visibleAssetsForCollection:correspondingCollections:](self, "_visibleAssetsForCollection:correspondingCollections:", v15, &v44);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v44;
  if (v20)
    v22 = objc_msgSend(v20, "count") == 0;
  else
    v22 = 1;
  if (objc_msgSend(v15, "px_isMacSyncedFacesFolder"))
  {
    -[PUAlbumListCellContentViewHelper _updateStackView:forFaces:inCollection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forFaces:inCollection:withCustomEmptyPlaceholderImage:", v19, v20, v15, 0);
  }
  else if (objc_msgSend(v15, "px_isPeopleVirtualCollection"))
  {
    v42 = v21;
    v23 = v15;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "px_descriptionForAssertionMessage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListCellContentViewHelper.m"), 171, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("collection"), v40, v39);

      }
    }
    v24 = (void *)MEMORY[0x1E0D7B970];
    objc_msgSend(v23, "photoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sharedLibraryStatusProviderWithPhotoLibrary:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListCellContentViewHelper _updateAlbumListCellContentViewForPeopleAlbum:sharedLibraryStatusProvider:](self, "_updateAlbumListCellContentViewForPeopleAlbum:sharedLibraryStatusProvider:", v14, v26);
    v21 = v42;
  }
  else if (objc_msgSend(v15, "px_isPlacesSmartAlbum"))
  {
    -[PUAlbumListCellContentViewHelper _updateAlbumListCellContentViewForPlacesAlbum:](self, "_updateAlbumListCellContentViewForPlacesAlbum:", v14);
  }
  else
  {
    if (v22)
    {
      v27 = v21;
      if (objc_msgSend(v15, "px_isSharedAlbum"))
        -[PUAlbumListCellContentViewHelper emptySharedAlbumPlaceholderImage](self, "emptySharedAlbumPlaceholderImage");
      else
        -[PUAlbumListCellContentViewHelper emptyAlbumPlaceholderImage](self, "emptyAlbumPlaceholderImage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v21;
      v28 = 0;
    }
    -[PUAlbumListCellContentViewHelper _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v19, v20, v15, v28);

    v21 = v27;
  }
  if (objc_msgSend(v15, "px_isSharedAlbum"))
  {
    v29 = v15;
    objc_msgSend(v14, "avatarView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSharedAlbumCollection:forceLayoutSubscriberAvatars:", v29, 1);

  }
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "showsDeleteButtonOnCellContentView");

  objc_msgSend(v14, "setShowsDeleteButtonWhenEditing:", v32);
  objc_msgSend(v14, "setEditing:animated:", v43, v9);
  objc_msgSend(v14, "setTitle:", v16);

  if ((objc_msgSend(v15, "px_isPlacesSmartAlbum") & 1) == 0
    && (objc_msgSend(v15, "px_isPeopleVirtualCollection") & 1) == 0)
  {
    -[PUAlbumListCellContentViewHelper subtitleForCollection:](self, "subtitleForCollection:", v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSubtitle:animated:", v33, v9);

  }
  -[PUAlbumListCellContentViewHelper fontManager](self, "fontManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "albumListTitleLabelFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleFont:", v35);

  -[PUAlbumListCellContentViewHelper fontManager](self, "fontManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "albumListSubtitleLabelFont");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSubtitleFont:", v37);

}

- (int64_t)estimatedIndexOfAssetForStackItemAtIndex:(int64_t)a3 inCollection:(id)a4 albumListCellContentView:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  -[PUAlbumListCellContentViewHelper _visibleAssetsForCollection:correspondingCollections:](self, "_visibleAssetsForCollection:correspondingCollections:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") <= (unint64_t)a3)
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uncachedFetchResultForSubCollection:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "indexOfObject:", v11);

    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return v12;
}

- (void)reconfigureImageInAlbumListCellContentView:(id)a3 withImage:(id)a4 isPlaceholder:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a4;
  objc_msgSend(a3, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v11)
    {
      v9 = v11;
    }
    else
    {
      -[PUAlbumListCellContentViewHelper emptyAlbumPlaceholderImage](self, "emptyAlbumPlaceholderImage");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[PUAlbumListCellContentViewHelper _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v8, 0, 0, v9);

  }
  else
  {
    -[PUAlbumListCellContentViewHelper _prepareStackView:forCollection:withStackCount:](self, "_prepareStackView:forCollection:withStackCount:", v8, 0, 0);
    objc_msgSend(v8, "setImage:forItemAtIndex:", v11, 0);
  }

}

- (void)_invalidateAlbumCellSize
{
  self->_albumCellSize = (CGSize)*MEMORY[0x1E0D7D110];
}

- (void)_recalculateAlbumCellSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelper fontManager](self, "fontManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stackSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "albumListTitleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dynamicTitleLeading");
  objc_msgSend(v8, "_scaledValueForValue:");
  v10 = v9;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v11 = *(double *)&PUMainScreenScale_screenScale;
  objc_msgSend(v3, "albumListSubtitleLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dynamicSubtitleleading");
  objc_msgSend(v12, "_scaledValueForValue:");
  v14 = v13;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v15 = round(*(double *)&PUMainScreenScale_screenScale * v14) / *(double *)&PUMainScreenScale_screenScale;
  objc_msgSend(v18, "stackOffset");
  self->_albumCellSize.width = v5 + v16;
  self->_albumCellSize.height = v7 + round(v11 * v10) / v11 + v15 + v17;

}

- (CGSize)albumCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_albumCellSize.width;
  height = self->_albumCellSize.height;
  if (width == *MEMORY[0x1E0D7D110] && height == *(double *)(MEMORY[0x1E0D7D110] + 8))
  {
    -[PUAlbumListCellContentViewHelper _recalculateAlbumCellSize](self, "_recalculateAlbumCellSize");
    width = self->_albumCellSize.width;
    height = self->_albumCellSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)_editCapabilitiesForAlbum:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;

  v4 = a3;
  -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canDeleteCollection:", v4);
  if (objc_msgSend(v5, "canRenameCollection:", v4))
    v7 = v6 | 2;
  else
    v7 = v6;
  v8 = objc_msgSend(v5, "canReorderCollection:", v4);

  if (v8)
    v9 = v7 | 4;
  else
    v9 = v7;

  return v9;
}

- (id)_visibleAssetsForCollection:(id)a3 correspondingCollections:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "px_isFolder");
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
    v10 = objc_msgSend(v8, "folderStackViewStyle");
  else
    v10 = objc_msgSend(v8, "stackViewStyle");
  v11 = v10;

  -[PUAlbumListCellContentViewHelper _visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:](self, "_visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:", v6, +[PUStackView maximumNumberOfVisibleImagesForStyle:](PUStackView, "maximumNumberOfVisibleImagesForStyle:", v11), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_visibleAssetsForCollection:(id)a3 maximumNumberOfVisibleAssets:(int64_t)a4 correspondingCollections:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v12;

  v8 = a3;
  if (!objc_msgSend(v8, "px_isMacSyncedFacesFolder"))
  {
    if ((objc_msgSend(v8, "px_isPeopleVirtualCollection") & 1) == 0
      && (objc_msgSend(v8, "px_isPlacesSmartAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isPrivacySensitiveAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isHiddenSmartAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isRecentlyDeletedSmartAlbum") & 1) == 0)
    {
      if (objc_msgSend(v8, "px_isFolder"))
      {
        -[PUAlbumListCellContentViewHelper _getDisplayableAssetsForFolder:maximumCount:useCache:correspondingCollections:](self, "_getDisplayableAssetsForFolder:maximumCount:useCache:correspondingCollections:", v8, a4, 1, a5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
        -[PUAlbumListCellContentViewHelper _getDisplayableAssets:indexes:forCollection:maximumCount:useCache:](self, "_getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", &v12, 0, v8, a4, 1);
        v9 = v12;
      }
      goto LABEL_4;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  -[PUAlbumListCellContentViewHelper _getDisplayableFacesForCollectionList:maximumCount:](self, "_getDisplayableFacesForCollectionList:maximumCount:", v8, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = v9;
LABEL_11:

  return v10;
}

- (void)_updateStackView:(id)a3 forFaces:(id)a4 inCollection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _OWORD v20[2];
  _QWORD v21[4];
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[PUAlbumListCellContentViewHelper _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v12, objc_msgSend(v13, "count"), v11);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__PUAlbumListCellContentViewHelper__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke;
  v21[3] = &unk_1E589BFD0;
  v22 = v10;
  v14 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);

  v15 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v20[0] = *MEMORY[0x1E0D7CE00];
  v20[1] = v15;
  objc_msgSend(v14, "setBadgeInfo:forItemAtIndex:", v20, 0);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasRoundedCorners");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "albumCornersBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHasRoundedCorners:withCornersBackgroundColor:", v17, v19);

}

- (void)_updateStackView:(id)a3 forAssets:(id)a4 collection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  PUAlbumListCellContentViewHelper *v33;
  uint64_t v34;
  uint64_t v35;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  -[PUAlbumListCellContentViewHelper _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v11, objc_msgSend(v13, "count"), v12);

  v14 = objc_msgSend(v10, "tag") + 1;
  objc_msgSend(v10, "setTag:", v14);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageContentMode");

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __106__PUAlbumListCellContentViewHelper__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke;
  v30[3] = &unk_1E589BD78;
  v31 = v10;
  v17 = v11;
  v32 = v17;
  v33 = self;
  v34 = v16;
  v35 = v14;
  v18 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v30);

  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldUseTableView");

  v28 = 0u;
  v29 = 0u;
  -[PUAlbumListCellContentViewHelper badgeManager](self, "badgeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "badgeInfoForCollection:options:", v17, 0);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }

  if (v20)
    v23 = 1;
  else
    v23 = 2;
  v27[0] = v28;
  v27[1] = v29;
  objc_msgSend(v18, "setBadgeInfo:style:forItemAtIndex:", v27, v23, 0);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "albumCornersBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHasRoundedCorners:withCornersBackgroundColor:", v20 ^ 1u, v25);

  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerOverlaysDisabled:", objc_msgSend(v26, "cornerOverlaysDisabled"));

}

- (void)_updateAlbumListCellContentViewForPlacesAlbum:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _OWORD v13[2];

  objc_msgSend(a3, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackSize");
  objc_msgSend(v4, "setStackSize:");
  objc_msgSend(v5, "posterSquareCornerRadius");
  objc_msgSend(v4, "setPosterSquareCornerRadius:");
  objc_msgSend(v5, "posterSubitemCornerRadius");
  objc_msgSend(v4, "setPosterSubitemCornerRadius:");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "folderCellBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridBackgroundColor:", v7);

  v8 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v13[0] = *MEMORY[0x1E0D7CE00];
  v13[1] = v8;
  objc_msgSend(v4, "setBadgeInfo:forItemAtIndex:", v13, 0);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasRoundedCorners");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "albumCornersBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasRoundedCorners:withCornersBackgroundColor:", v10, v12);

}

- (void)_updateAlbumListCellContentViewForPeopleAlbum:(id)a3 sharedLibraryStatusProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _OWORD v32[2];
  _QWORD v33[4];
  id v34;
  PUAlbumListCellContentViewHelper *v35;
  id v36;
  uint64_t v37;
  int64_t v38;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setCustomImageView:", 0);
  objc_msgSend(v7, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v9);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stackSize");
  v12 = v11 * 0.5;
  v14 = v13 * 0.5;

  if (v14 >= v12)
    v15 = v12;
  else
    v15 = v14;
  v16 = v15 * 0.5;
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyle:", 3);
  objc_msgSend(v17, "stackSize");
  objc_msgSend(v8, "setStackSize:");
  objc_msgSend(v17, "gridMargin");
  objc_msgSend(v8, "setGridMargin:");
  objc_msgSend(v17, "gridItemSpacing");
  objc_msgSend(v8, "setGridItemSpacing:");
  objc_msgSend(v8, "setContinuousCorners:", 0);
  objc_msgSend(v8, "setPosterSquareCornerRadius:", v16);
  objc_msgSend(v8, "setPosterSubitemCornerRadius:", v16);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "folderCellBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGridBackgroundColor:", v19);

  v20 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", 3);
  objc_msgSend(v8, "setNumberOfVisibleItems:", v20);
  objc_msgSend(v8, "setEmptyPlaceholderImage:", 0);
  objc_msgSend(MEMORY[0x1E0D7B668], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "displayScale");
  v24 = v23;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __110__PUAlbumListCellContentViewHelper__updateAlbumListCellContentViewForPeopleAlbum_sharedLibraryStatusProvider___block_invoke;
  v33[3] = &unk_1E589BDC8;
  v34 = v8;
  v35 = self;
  v37 = v9;
  v38 = v20;
  v36 = v6;
  v25 = v6;
  v26 = v8;
  objc_msgSend(v21, "requestAlbumImagesWithSize:displayScale:completion:", v33, v12, v14, v24);

  v27 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v32[0] = *MEMORY[0x1E0D7CE00];
  v32[1] = v27;
  objc_msgSend(v26, "setBadgeInfo:forItemAtIndex:", v32, 0);
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hasRoundedCorners");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "albumCornersBackgroundColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHasRoundedCorners:withCornersBackgroundColor:", v29, v31);

}

- (void)_prepareStackView:(id)a3 forCollection:(id)a4 withStackCount:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  id v39;

  v39 = a3;
  v8 = a4;
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v8, "px_isFolder");

  if ((_DWORD)self)
    v10 = objc_msgSend(v9, "folderStackViewStyle");
  else
    v10 = objc_msgSend(v9, "stackViewStyle");
  v11 = v10;
  objc_msgSend(v39, "setStyle:", v10);
  if ((unint64_t)(v11 - 3) < 2)
  {
LABEL_7:
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "folderCellBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setGridBackgroundColor:", v13);

    objc_msgSend(v9, "gridMargin");
    objc_msgSend(v39, "setGridMargin:");
    objc_msgSend(v9, "gridItemSpacing");
    objc_msgSend(v39, "setGridItemSpacing:");
    goto LABEL_9;
  }
  if (v11 != 5)
  {
    if (v11 != 6)
      goto LABEL_9;
    goto LABEL_7;
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "placeholderCellBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setGridBackgroundColor:", v15);

LABEL_9:
  objc_msgSend(v9, "photoDecoration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackOffset");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "stackPerspectiveInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v9, "stackPerspectiveOffset");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v39, "setPhotoDecoration:", v16);
  objc_msgSend(v39, "setStackOffset:", v18, v20);
  objc_msgSend(v39, "setStackPerspectiveInsets:", v22, v24, v26, v28);
  objc_msgSend(v39, "setStackPerspectiveOffset:", v30, v32);
  if (objc_msgSend(v9, "hasClearBackgroundColor"))
  {
    objc_msgSend(v9, "posterSquareCornerRadius");
    v34 = v33;
    objc_msgSend(v39, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCornerRadius:", v34);

    objc_msgSend(v39, "setClipsToBounds:", 1);
  }
  objc_msgSend(v9, "stackSize");
  objc_msgSend(v39, "setStackSize:");
  objc_msgSend(v9, "posterSquareCornerRadius");
  objc_msgSend(v39, "setPosterSquareCornerRadius:");
  objc_msgSend(v9, "posterSubitemCornerRadius");
  objc_msgSend(v39, "setPosterSubitemCornerRadius:");
  v36 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", v11);
  if (v36 >= a5)
    v37 = a5;
  else
    v37 = v36;
  if (v37 <= 1)
    v37 = 1;
  if (v11 == 3)
    v38 = v36;
  else
    v38 = v37;
  objc_msgSend(v39, "setNumberOfVisibleItems:", v38);

}

- (void)_prepareStackView:(id)a3 forCollection:(id)a4 withStackCount:(int64_t)a5 withCustomEmptyPlaceHolderImage:(id)a6
{
  unint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = (unint64_t)a6;
  v11 = a4;
  -[PUAlbumListCellContentViewHelper _prepareStackView:forCollection:withStackCount:](self, "_prepareStackView:forCollection:withStackCount:", v16, v11, a5);
  objc_msgSend(v16, "setEmpty:", (a5 | v10) == 0);
  LOBYTE(a5) = objc_msgSend(v11, "px_isFolder");

  if ((a5 & 1) != 0)
  {
    objc_msgSend(v16, "setBackgroundColor:", 0);
    v12 = 0;
  }
  else
  {
    -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hasClearBackgroundColor"))
    {
      objc_msgSend(v16, "setBackgroundColor:", 0);
    }
    else
    {
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "placeholderCellBackgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v15);

    }
    v12 = v10;
  }
  objc_msgSend(v16, "setEmptyPlaceholderImage:", v12);

}

- (UIImage)emptyPeopleAlbumPlaceholderImage
{
  UIImage *emptyPeopleAlbumPlaceholderImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  emptyPeopleAlbumPlaceholderImage = self->_emptyPeopleAlbumPlaceholderImage;
  if (!emptyPeopleAlbumPlaceholderImage)
  {
    -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameOfEmptyPeopleAlbumPlaceholderImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:scale:](PUAlbumListViewControllerSpec, "emptyPlaceholderImageForSystemImageNamed:scale:", v5, 2);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emptyPeopleAlbumPlaceholderImage;
    self->_emptyPeopleAlbumPlaceholderImage = v6;

    emptyPeopleAlbumPlaceholderImage = self->_emptyPeopleAlbumPlaceholderImage;
  }
  return emptyPeopleAlbumPlaceholderImage;
}

- (UIImage)emptyAlbumPlaceholderImage
{
  UIImage *emptyAlbumPlaceholderImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  if (!emptyAlbumPlaceholderImage)
  {
    -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameOfEmptyAlbumPlaceholderImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:scale:](PUAlbumListViewControllerSpec, "emptyPlaceholderImageForSystemImageNamed:scale:", v5, 3);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emptyAlbumPlaceholderImage;
    self->_emptyAlbumPlaceholderImage = v6;

    emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  }
  return emptyAlbumPlaceholderImage;
}

- (UIImage)emptySharedAlbumPlaceholderImage
{
  UIImage *emptySharedAlbumPlaceholderImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  if (!emptySharedAlbumPlaceholderImage)
  {
    -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameOfEmptySharedAlbumPlaceholderImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:scale:](PUAlbumListViewControllerSpec, "emptyPlaceholderImageForSystemImageNamed:scale:", v5, 3);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emptySharedAlbumPlaceholderImage;
    self->_emptySharedAlbumPlaceholderImage = v6;

    emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  }
  return emptySharedAlbumPlaceholderImage;
}

- (id)subtitleForCollection:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (!objc_msgSend(v4, "px_isSharedAlbum"))
  {
    if ((objc_msgSend(v4, "px_isMacSyncedFacesFolder") & 1) != 0
      || objc_msgSend(v4, "px_isMacSyncedEventsFolder"))
    {
      PULocalizedString(CFSTR("FROM_MY_MAC"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countForCollection:", v4);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = CFSTR(" ");
      v10 = CFSTR(" ");
      goto LABEL_3;
    }
    -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "albumSubtitleFormat");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(v4, "px_isMacSyncedAlbum");

      if (v14)
      {
        -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "albumSubtitleFormat");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PULocalizedString(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PULocalizedStringWithValidatedFormat(v17, CFSTR("%ld"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        goto LABEL_3;
      }
    }
    else
    {

    }
    PLSharedCountFormatter();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromNumber:", v18);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  -[PUAlbumListCellContentViewHelper configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSharedByLabelAllowsEmail:", objc_msgSend(v5, "allowsEmailInSubtitle"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:

LABEL_7:
  return v6;
}

- (id)_getDisplayableFacesForCollectionList:(id)a3 maximumCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsFetchResultForCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") <= (unint64_t)a4)
    a4 = objc_msgSend(v8, "count");
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (a4 != v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;

  v7 = a7;
  v12 = a5;
  -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", a3, a4, v12, a6, v7);

}

- (id)_getDisplayableAssetsForFolder:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  v10 = a3;
  -[PUAlbumListCellContentViewHelper dataSourceManager](self, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayableAssetsForCollectionList:maximumCount:useCache:correspondingCollections:", v10, a4, v7, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSpecManagerObservationContext == a5)
  {
    v13 = v9;
    -[PUAlbumListCellContentViewHelper featureSpecManager](self, "featureSpecManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListCellContentViewHelper setFeatureSpec:](self, "setFeatureSpec:", v11);

    goto LABEL_6;
  }
  if ((void *)PUFontManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListCellContentViewHelper.m"), 583, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v13 = v9;
    -[PUAlbumListCellContentViewHelper _invalidateAlbumCellSize](self, "_invalidateAlbumCellSize");
LABEL_6:
    v9 = v13;
  }

}

- (PXImageRequestOptions)imageRequestOptions
{
  PXImageRequestOptions *imageRequestOptions;
  id v4;
  PXImageRequestOptions *v5;

  imageRequestOptions = self->_imageRequestOptions;
  if (!imageRequestOptions)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D7CD08]);
    objc_msgSend(v4, "setAllowPlaceholder:", 1);
    objc_msgSend(v4, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v4, "setDeliveryMode:", 0);
    v5 = self->_imageRequestOptions;
    self->_imageRequestOptions = (PXImageRequestOptions *)v4;

    imageRequestOptions = self->_imageRequestOptions;
  }
  return imageRequestOptions;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setAlbumCellSize:(CGSize)a3
{
  self->_albumCellSize = a3;
}

- (UIEdgeInsets)previewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_previewInsets.top;
  left = self->_previewInsets.left;
  bottom = self->_previewInsets.bottom;
  right = self->_previewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUAlbumListCellContentViewHelperConfiguration)configuration
{
  return self->_configuration;
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUFontManager)fontManager
{
  return self->_fontManager;
}

- (void)setFontManager:(id)a3
{
  objc_storeStrong((id *)&self->_fontManager, a3);
}

- (void)setEmptyPeopleAlbumPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPeopleAlbumPlaceholderImage, a3);
}

- (void)setEmptyAlbumPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, a3);
}

- (void)setEmptySharedAlbumPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptySharedAlbumPlaceholderImage, a3);
}

- (void)setImageRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_imageRequestOptions, a3);
}

- (PXFeatureSpecManager)featureSpecManager
{
  return self->_featureSpecManager;
}

- (void)setFeatureSpecManager:(id)a3
{
  objc_storeStrong((id *)&self->_featureSpecManager, a3);
}

- (PXFeatureSpec)featureSpec
{
  return self->_featureSpec;
}

- (void)setFeatureSpec:(id)a3
{
  objc_storeStrong((id *)&self->_featureSpec, a3);
}

- (PXAssetBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (void)setBadgeManager:(id)a3
{
  objc_storeStrong((id *)&self->_badgeManager, a3);
}

- (PXCollectionTileLayoutTemplate)collectionTileLayoutTemplate
{
  return self->_collectionTileLayoutTemplate;
}

- (void)setCollectionTileLayoutTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_featureSpec, 0);
  objc_storeStrong((id *)&self->_featureSpecManager, 0);
  objc_storeStrong((id *)&self->_imageRequestOptions, 0);
  objc_storeStrong((id *)&self->_emptySharedAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_emptyPeopleAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_fontManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

void __110__PUAlbumListCellContentViewHelper__updateAlbumListCellContentViewForPeopleAlbum_sharedLibraryStatusProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  px_dispatch_on_main_queue();

}

void __110__PUAlbumListCellContentViewHelper__updateAlbumListCellContentViewForPeopleAlbum_sharedLibraryStatusProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 64))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "emptyPeopleAlbumPlaceholderImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEmptyPlaceholderImage:", v3);

    if (*(_QWORD *)(a1 + 72))
    {
      v4 = 0;
      do
      {
        v5 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 56), "hasSharedLibraryOrPreview"))
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B578]), "initWithSharedLibraryStatusProvider:", *(_QWORD *)(a1 + 56));
          if (objc_msgSend(v8, "viewMode"))
          {

            v7 = 0;
          }

        }
        if (v7)
        {
          objc_msgSend(v7, "size");
          objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", v4);
          objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v7, v4);
        }

        ++v4;
      }
      while (v4 < *(_QWORD *)(a1 + 72));
    }
  }
}

void __106__PUAlbumListCellContentViewHelper__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(v5, "pixelHeight"));
  if (objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EED79DC8)
    && (v6 = objc_msgSend(*(id *)(a1 + 40), "px_isMacSyncedFacesAlbum"), !a3)
    && v6)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "size");
      objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v8, 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "imageRequestOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mediaProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pixelSize");
    v13 = v12;
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 56);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __106__PUAlbumListCellContentViewHelper__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2;
    v19[3] = &unk_1E589EFE8;
    v17 = *(id *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 64);
    v20 = v17;
    v21 = v18;
    v22 = a3;
    objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, v16, v9, v19, v13, v15);

  }
}

void __106__PUAlbumListCellContentViewHelper__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v6, *(_QWORD *)(a1 + 48));

}

void __107__PUAlbumListCellContentViewHelper__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(v5, "size");
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v5, a3);

}

@end
