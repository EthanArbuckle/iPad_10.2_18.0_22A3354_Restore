@implementation PXPhotosViewConfiguration

- (int64_t)preferredBackgroundStyle
{
  PXPhotosViewConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = PXPhotosViewConfiguration.preferredBackgroundStyle.getter();

  return v3;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  PXPhotosViewConfiguration *v3;

  v3 = self;
  PXPhotosViewConfiguration.preferredBackgroundStyle.setter();

}

- (id)adjustedExtendedTraitCollection:(id)a3
{
  id v5;
  PXPhotosViewConfiguration *v6;

  sub_1A68763C4(&qword_1EE8D8DA8, &qword_1EE8D8DB0, (uint64_t)off_1E50B43D0, (uint64_t)&protocol conformance descriptor for PXPhotosViewConfiguration);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2838);
  sub_1A68763C4(&qword_1EE8C2830, (unint64_t *)&qword_1EE8C2838, (uint64_t)off_1E50B2478, (uint64_t)&protocol conformance descriptor for PXExtendedTraitCollection);
  v5 = a3;
  v6 = self;
  sub_1A7ADF588();

  return v5;
}

- (void)copySwiftPropertiesFromConfiguration:(id)a3
{
  id v4;
  PXPhotosViewConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1A6BF3F54();

}

- (PXPhotosViewConfiguration)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5 assetActionManager:(id)a6 assetCollectionActionManager:(id)a7
{
  id v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  PXPhotosViewConfiguration *v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  PXPhotosViewConfiguration *v35;
  PXPhotosViewConfiguration *v36;
  PXAssetActionManager *v37;
  PXAssetActionManager *assetActionManager;
  id v40;
  id obj;
  id v42;
  id v43;
  objc_super v44;

  v11 = a3;
  v14 = a3;
  v43 = a4;
  v15 = a5;
  v16 = a6;
  obj = a7;
  v42 = a7;
  if (v15)
  {
    objc_msgSend(v15, "dataSourceManager");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 != v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewConfiguration.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectionManager == nil || selectionManager.dataSourceManager == dataSourceManager"));

    }
  }
  objc_msgSend(v16, "selectionManager");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v16, "selectionManager");
    v40 = v16;
    v21 = v15;
    v22 = self;
    v23 = v11;
    v24 = a4;
    v25 = a5;
    v26 = a2;
    v27 = v14;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dataSourceManager");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v27;
    a2 = v26;
    a5 = v25;
    a4 = v24;
    v11 = v23;
    self = v22;
    v15 = v21;
    v16 = v40;

    if (v29 != v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewConfiguration.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetActionManager.selectionManager == nil || assetActionManager.selectionManager.dataSourceManager == dataSourceManager"));

    }
  }
  if (v15)
  {
    objc_msgSend(v16, "selectionManager");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      objc_msgSend(v16, "selectionManager");
      v33 = (id)objc_claimAutoreleasedReturnValue();

      if (v33 != v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewConfiguration.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectionManager == nil || assetActionManager.selectionManager == nil || assetActionManager.selectionManager == selectionManager"));

      }
    }
  }
  v44.receiver = self;
  v44.super_class = (Class)PXPhotosViewConfiguration;
  v35 = -[PXPhotosViewConfiguration init](&v44, sel_init);
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_dataSourceManager, v11);
    objc_storeStrong((id *)&v36->_mediaProvider, a4);
    objc_storeStrong((id *)&v36->_selectionManager, a5);
    if (v16)
      v37 = (PXAssetActionManager *)v16;
    else
      v37 = -[PXAssetActionManager initWithSelectionManager:]([PXAssetActionManager alloc], "initWithSelectionManager:", 0);
    assetActionManager = v36->_assetActionManager;
    v36->_assetActionManager = v37;

    objc_storeStrong((id *)&v36->_assetCollectionActionManager, obj);
    v36->_allowsInteractiveFavoriteBadges = 1;
    *(_WORD *)&v36->_allowsDragOut = 257;
    v36->_allowsSwipeToSelect = 1;
    v36->_isEmbedded = 1;
    v36->_itemAspectRatio = 1.0;
    v36->_allowedActions = 536903840;
    v36->_allowedBehaviors = 65585;
    v36->_contentStartingPosition = 0;
    v36->_allowsUserDefaults = PLIsPhotoPicker() ^ 1;
    v36->_allowsMultiSelectMenu = PLIsMobileSlideShow();
    v36->_dismissAffordance = 0;
    v36->_initialNavigationScrollPosition = 0;
    v36->_gridPresentationType = 0;
    v36->_scrollIndicatorStyle = 0;
  }

  return v36;
}

- (PXPhotosViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewConfiguration.m"), 61, CFSTR("%s is not available as initializer"), "-[PXPhotosViewConfiguration init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosViewConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPhotosViewConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = [PXPhotosViewConfiguration alloc];
  -[PXPhotosViewConfiguration dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration selectionManager](self, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration assetActionManager](self, "assetActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration assetCollectionActionManager](self, "assetCollectionActionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:](v4, "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v5, v6, v7, v8, v9);

  -[PXPhotosViewConfiguration title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setTitle:](v10, "setTitle:", v11);

  -[PXPhotosViewConfiguration containerTitle](self, "containerTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setContainerTitle:](v10, "setContainerTitle:", v12);

  -[PXPhotosViewConfiguration setWantsTabBarHidden:](v10, "setWantsTabBarHidden:", -[PXPhotosViewConfiguration wantsTabBarHidden](self, "wantsTabBarHidden"));
  -[PXPhotosViewConfiguration setWantsDynamicTitles:](v10, "setWantsDynamicTitles:", -[PXPhotosViewConfiguration wantsDynamicTitles](self, "wantsDynamicTitles"));
  -[PXPhotosViewConfiguration setToolbarStyle:](v10, "setToolbarStyle:", -[PXPhotosViewConfiguration toolbarStyle](self, "toolbarStyle"));
  -[PXPhotosViewConfiguration setWantsExternallyRenderedSecondaryToolbar:](v10, "setWantsExternallyRenderedSecondaryToolbar:", -[PXPhotosViewConfiguration wantsExternallyRenderedSecondaryToolbar](self, "wantsExternallyRenderedSecondaryToolbar"));
  -[PXPhotosViewConfiguration setContainerProvidesSecondaryToolbar:](v10, "setContainerProvidesSecondaryToolbar:", -[PXPhotosViewConfiguration containerProvidesSecondaryToolbar](self, "containerProvidesSecondaryToolbar"));
  -[PXPhotosViewConfiguration setPrefersActionsInToolbar:](v10, "setPrefersActionsInToolbar:", -[PXPhotosViewConfiguration prefersActionsInToolbar](self, "prefersActionsInToolbar"));
  -[PXPhotosViewConfiguration setWantsContentFilterVisible:](v10, "setWantsContentFilterVisible:", -[PXPhotosViewConfiguration wantsContentFilterVisible](self, "wantsContentFilterVisible"));
  -[PXPhotosViewConfiguration setFooterVisibilityStyle:](v10, "setFooterVisibilityStyle:", -[PXPhotosViewConfiguration footerVisibilityStyle](self, "footerVisibilityStyle"));
  -[PXPhotosViewConfiguration footerSubtitle](self, "footerSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setFooterSubtitle:](v10, "setFooterSubtitle:", v13);

  -[PXPhotosViewConfiguration footerLearnMoreURL](self, "footerLearnMoreURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setFooterLearnMoreURL:](v10, "setFooterLearnMoreURL:", v14);

  -[PXPhotosViewConfiguration footerViewModel](self, "footerViewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setFooterViewModel:](v10, "setFooterViewModel:", v15);

  -[PXPhotosViewConfiguration viewOptionsModel](self, "viewOptionsModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setViewOptionsModel:](v10, "setViewOptionsModel:", v16);

  -[PXPhotosViewConfiguration setHidesViewOptionsToolbar:](v10, "setHidesViewOptionsToolbar:", -[PXPhotosViewConfiguration hidesViewOptionsToolbar](self, "hidesViewOptionsToolbar"));
  -[PXPhotosViewConfiguration setWantsFooterMask:](v10, "setWantsFooterMask:", -[PXPhotosViewConfiguration wantsFooterMask](self, "wantsFooterMask"));
  -[PXPhotosViewConfiguration setHidesAssetCountInFooter:](v10, "setHidesAssetCountInFooter:", -[PXPhotosViewConfiguration hidesAssetCountInFooter](self, "hidesAssetCountInFooter"));
  -[PXPhotosViewConfiguration setWantsCPLStatus:](v10, "setWantsCPLStatus:", -[PXPhotosViewConfiguration wantsCPLStatus](self, "wantsCPLStatus"));
  -[PXPhotosViewConfiguration setWantsRenderingStatus:](v10, "setWantsRenderingStatus:", -[PXPhotosViewConfiguration wantsRenderingStatus](self, "wantsRenderingStatus"));
  -[PXPhotosViewConfiguration setNavBarStyle:](v10, "setNavBarStyle:", -[PXPhotosViewConfiguration navBarStyle](self, "navBarStyle"));
  -[PXPhotosViewConfiguration setScrollIndicatorStyle:](v10, "setScrollIndicatorStyle:", -[PXPhotosViewConfiguration scrollIndicatorStyle](self, "scrollIndicatorStyle"));
  -[PXPhotosViewConfiguration setShouldOptOutOfChromelessBars:](v10, "setShouldOptOutOfChromelessBars:", -[PXPhotosViewConfiguration shouldOptOutOfChromelessBars](self, "shouldOptOutOfChromelessBars"));
  -[PXPhotosViewConfiguration setWantsModernNavBarButtons:](v10, "setWantsModernNavBarButtons:", -[PXPhotosViewConfiguration wantsModernNavBarButtons](self, "wantsModernNavBarButtons"));
  -[PXPhotosViewConfiguration setSectionHeaderStyle:](v10, "setSectionHeaderStyle:", -[PXPhotosViewConfiguration sectionHeaderStyle](self, "sectionHeaderStyle"));
  -[PXPhotosViewConfiguration sectionHeaderLayoutProvider](self, "sectionHeaderLayoutProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setSectionHeaderLayoutProvider:](v10, "setSectionHeaderLayoutProvider:", v17);

  -[PXPhotosViewConfiguration setSectionBodyStyle:](v10, "setSectionBodyStyle:", -[PXPhotosViewConfiguration sectionBodyStyle](self, "sectionBodyStyle"));
  -[PXPhotosViewConfiguration sectionBodyLayoutProvider](self, "sectionBodyLayoutProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setSectionBodyLayoutProvider:](v10, "setSectionBodyLayoutProvider:", v18);

  -[PXPhotosViewConfiguration globalHeaderLayoutProvider](self, "globalHeaderLayoutProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setGlobalHeaderLayoutProvider:](v10, "setGlobalHeaderLayoutProvider:", v19);

  -[PXPhotosViewConfiguration bannerProvider](self, "bannerProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setBannerProvider:](v10, "setBannerProvider:", v20);

  -[PXPhotosViewConfiguration bannerControllerProvider](self, "bannerControllerProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setBannerControllerProvider:](v10, "setBannerControllerProvider:", v21);

  -[PXPhotosViewConfiguration setGridStyle:](v10, "setGridStyle:", -[PXPhotosViewConfiguration gridStyle](self, "gridStyle"));
  -[PXPhotosViewConfiguration setGridPresentationType:](v10, "setGridPresentationType:", -[PXPhotosViewConfiguration gridPresentationType](self, "gridPresentationType"));
  -[PXPhotosViewConfiguration setPreferredUserInterfaceStyle:](v10, "setPreferredUserInterfaceStyle:", -[PXPhotosViewConfiguration preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
  -[PXPhotosViewConfiguration itemAspectRatio](self, "itemAspectRatio");
  -[PXPhotosViewConfiguration setItemAspectRatio:](v10, "setItemAspectRatio:");
  -[PXPhotosViewConfiguration setShowLoadingPlaceholderWhenEmpty:](v10, "setShowLoadingPlaceholderWhenEmpty:", -[PXPhotosViewConfiguration showLoadingPlaceholderWhenEmpty](self, "showLoadingPlaceholderWhenEmpty"));
  -[PXPhotosViewConfiguration preferredAssetCropDelegate](self, "preferredAssetCropDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setPreferredAssetCropDelegate:](v10, "setPreferredAssetCropDelegate:", v22);

  -[PXPhotosViewConfiguration preferredColumnCountsDelegate](self, "preferredColumnCountsDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setPreferredColumnCountsDelegate:](v10, "setPreferredColumnCountsDelegate:", v23);

  -[PXPhotosViewConfiguration setIgnoreContentFilterStateWhenNotFiltering:](v10, "setIgnoreContentFilterStateWhenNotFiltering:", -[PXPhotosViewConfiguration ignoreContentFilterStateWhenNotFiltering](self, "ignoreContentFilterStateWhenNotFiltering"));
  -[PXPhotosViewConfiguration setIgnoreFilterPredicateAssert:](v10, "setIgnoreFilterPredicateAssert:", -[PXPhotosViewConfiguration ignoreFilterPredicateAssert](self, "ignoreFilterPredicateAssert"));
  -[PXPhotosViewConfiguration setAllowsCaptions:](v10, "setAllowsCaptions:", -[PXPhotosViewConfiguration allowsCaptions](self, "allowsCaptions"));
  -[PXPhotosViewConfiguration setAllowsGridAppearanceActions:](v10, "setAllowsGridAppearanceActions:", -[PXPhotosViewConfiguration allowsGridAppearanceActions](self, "allowsGridAppearanceActions"));
  -[PXPhotosViewConfiguration setAllowedActions:](v10, "setAllowedActions:", -[PXPhotosViewConfiguration allowedActions](self, "allowedActions"));
  -[PXPhotosViewConfiguration setAllowedBehaviors:](v10, "setAllowedBehaviors:", -[PXPhotosViewConfiguration allowedBehaviors](self, "allowedBehaviors"));
  -[PXPhotosViewConfiguration setWantsDimmedSelectionStyle:](v10, "setWantsDimmedSelectionStyle:", -[PXPhotosViewConfiguration wantsDimmedSelectionStyle](self, "wantsDimmedSelectionStyle"));
  -[PXPhotosViewConfiguration setWantsNumberedSelectionStyle:](v10, "setWantsNumberedSelectionStyle:", -[PXPhotosViewConfiguration wantsNumberedSelectionStyle](self, "wantsNumberedSelectionStyle"));
  -[PXPhotosViewConfiguration setSelectionContextOverride:](v10, "setSelectionContextOverride:", -[PXPhotosViewConfiguration selectionContextOverride](self, "selectionContextOverride"));
  -[PXPhotosViewConfiguration setWantsFileSizeBadge:](v10, "setWantsFileSizeBadge:", -[PXPhotosViewConfiguration wantsFileSizeBadge](self, "wantsFileSizeBadge"));
  -[PXPhotosViewConfiguration setWantsAssetIndexBadge:](v10, "setWantsAssetIndexBadge:", -[PXPhotosViewConfiguration wantsAssetIndexBadge](self, "wantsAssetIndexBadge"));
  -[PXPhotosViewConfiguration setNoContentPlaceholderType:](v10, "setNoContentPlaceholderType:", -[PXPhotosViewConfiguration noContentPlaceholderType](self, "noContentPlaceholderType"));
  -[PXPhotosViewConfiguration setForbiddenBadges:](v10, "setForbiddenBadges:", -[PXPhotosViewConfiguration forbiddenBadges](self, "forbiddenBadges"));
  -[PXPhotosViewConfiguration setAllowsInteractiveFavoriteBadges:](v10, "setAllowsInteractiveFavoriteBadges:", -[PXPhotosViewConfiguration allowsInteractiveFavoriteBadges](self, "allowsInteractiveFavoriteBadges"));
  -[PXPhotosViewConfiguration setAllowsDragIn:](v10, "setAllowsDragIn:", -[PXPhotosViewConfiguration allowsDragIn](self, "allowsDragIn"));
  -[PXPhotosViewConfiguration setAllowsDragOut:](v10, "setAllowsDragOut:", -[PXPhotosViewConfiguration allowsDragOut](self, "allowsDragOut"));
  -[PXPhotosViewConfiguration setAllowsSwipeToSelect:](v10, "setAllowsSwipeToSelect:", -[PXPhotosViewConfiguration allowsSwipeToSelect](self, "allowsSwipeToSelect"));
  -[PXPhotosViewConfiguration setOneUpPresentationOrigin:](v10, "setOneUpPresentationOrigin:", -[PXPhotosViewConfiguration oneUpPresentationOrigin](self, "oneUpPresentationOrigin"));
  -[PXPhotosViewConfiguration setPreventShowInAllPhotosAction:](v10, "setPreventShowInAllPhotosAction:", -[PXPhotosViewConfiguration preventShowInAllPhotosAction](self, "preventShowInAllPhotosAction"));
  -[PXPhotosViewConfiguration setWantsOneUpShowInLibraryButton:](v10, "setWantsOneUpShowInLibraryButton:", -[PXPhotosViewConfiguration wantsOneUpShowInLibraryButton](self, "wantsOneUpShowInLibraryButton"));
  -[PXPhotosViewConfiguration setAllowsMergeDuplicatesAction:](v10, "setAllowsMergeDuplicatesAction:", -[PXPhotosViewConfiguration allowsMergeDuplicatesAction](self, "allowsMergeDuplicatesAction"));
  -[PXPhotosViewConfiguration setAlwaysIncludeSharedWithYouAssets:](v10, "setAlwaysIncludeSharedWithYouAssets:", -[PXPhotosViewConfiguration alwaysIncludeSharedWithYouAssets](self, "alwaysIncludeSharedWithYouAssets"));
  -[PXPhotosViewConfiguration optionsController](self, "optionsController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setOptionsController:](v10, "setOptionsController:", v24);

  -[PXPhotosViewConfiguration infoActionHandler](self, "infoActionHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setInfoActionHandler:](v10, "setInfoActionHandler:", v25);

  -[PXPhotosViewConfiguration centerAccessoryActionType](self, "centerAccessoryActionType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setCenterAccessoryActionType:](v10, "setCenterAccessoryActionType:", v26);

  -[PXPhotosViewConfiguration trailingAccessoryActionType](self, "trailingAccessoryActionType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setTrailingAccessoryActionType:](v10, "setTrailingAccessoryActionType:", v27);

  -[PXPhotosViewConfiguration loadingStatusManager](self, "loadingStatusManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setLoadingStatusManager:](v10, "setLoadingStatusManager:", v28);

  -[PXPhotosViewConfiguration assetImportStatusManager](self, "assetImportStatusManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setAssetImportStatusManager:](v10, "setAssetImportStatusManager:", v29);

  -[PXPhotosViewConfiguration delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setDelegate:](v10, "setDelegate:", v30);

  -[PXPhotosViewConfiguration setStartsInSelectMode:](v10, "setStartsInSelectMode:", -[PXPhotosViewConfiguration startsInSelectMode](self, "startsInSelectMode"));
  -[PXPhotosViewConfiguration setWantsSelectModeCaptionInContextMenu:](v10, "setWantsSelectModeCaptionInContextMenu:", -[PXPhotosViewConfiguration wantsSelectModeCaptionInContextMenu](self, "wantsSelectModeCaptionInContextMenu"));
  -[PXPhotosViewConfiguration setLowMemoryMode:](v10, "setLowMemoryMode:", -[PXPhotosViewConfiguration lowMemoryMode](self, "lowMemoryMode"));
  -[PXPhotosViewConfiguration setContentMode:](v10, "setContentMode:", -[PXPhotosViewConfiguration contentMode](self, "contentMode"));
  -[PXPhotosViewConfiguration setContentStartingPosition:](v10, "setContentStartingPosition:", -[PXPhotosViewConfiguration contentStartingPosition](self, "contentStartingPosition"));
  -[PXPhotosViewConfiguration setDecorationViewClass:](v10, "setDecorationViewClass:", -[PXPhotosViewConfiguration decorationViewClass](self, "decorationViewClass"));
  -[PXPhotosViewConfiguration setBackgroundStyle:](v10, "setBackgroundStyle:", -[PXPhotosViewConfiguration backgroundStyle](self, "backgroundStyle"));
  -[PXPhotosViewConfiguration setLightModeBackgroundStyle:](v10, "setLightModeBackgroundStyle:", -[PXPhotosViewConfiguration lightModeBackgroundStyle](self, "lightModeBackgroundStyle"));
  -[PXPhotosViewConfiguration setDarkModeBackgroundStyle:](v10, "setDarkModeBackgroundStyle:", -[PXPhotosViewConfiguration darkModeBackgroundStyle](self, "darkModeBackgroundStyle"));
  -[PXPhotosViewConfiguration tapbackStatusManager](self, "tapbackStatusManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setTapbackStatusManager:](v10, "setTapbackStatusManager:", v31);

  -[PXPhotosViewConfiguration decorationDataSource](self, "decorationDataSource");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setDecorationDataSource:](v10, "setDecorationDataSource:", v32);

  -[PXPhotosViewConfiguration setIsEmbedded:](v10, "setIsEmbedded:", -[PXPhotosViewConfiguration isEmbedded](self, "isEmbedded"));
  -[PXPhotosViewConfiguration setAllowsUserDefaults:](v10, "setAllowsUserDefaults:", -[PXPhotosViewConfiguration allowsUserDefaults](self, "allowsUserDefaults"));
  -[PXPhotosViewConfiguration customUserDefaults](self, "customUserDefaults");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setCustomUserDefaults:](v10, "setCustomUserDefaults:", v33);

  -[PXPhotosViewConfiguration setAllowsLinkInteractions:](v10, "setAllowsLinkInteractions:", -[PXPhotosViewConfiguration allowsLinkInteractions](self, "allowsLinkInteractions"));
  -[PXPhotosViewConfiguration setAllowsMultiSelectMenu:](v10, "setAllowsMultiSelectMenu:", -[PXPhotosViewConfiguration allowsMultiSelectMenu](self, "allowsMultiSelectMenu"));
  -[PXPhotosViewConfiguration emptyPlaceholderStatusViewModel](self, "emptyPlaceholderStatusViewModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setEmptyPlaceholderStatusViewModel:](v10, "setEmptyPlaceholderStatusViewModel:", v34);

  -[PXPhotosViewConfiguration privacyController](self, "privacyController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setPrivacyController:](v10, "setPrivacyController:", v35);

  -[PXPhotosViewConfiguration searchQueryMatchInfo](self, "searchQueryMatchInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setSearchQueryMatchInfo:](v10, "setSearchQueryMatchInfo:", v36);

  -[PXPhotosViewConfiguration badgesModifier](self, "badgesModifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setBadgesModifier:](v10, "setBadgesModifier:", v37);

  -[PXPhotosViewConfiguration setWantsFooterVisibleImmediately:](v10, "setWantsFooterVisibleImmediately:", -[PXPhotosViewConfiguration wantsFooterVisibleImmediately](self, "wantsFooterVisibleImmediately"));
  -[PXPhotosViewConfiguration setWantsFooterVisibleWhenEmpty:](v10, "setWantsFooterVisibleWhenEmpty:", -[PXPhotosViewConfiguration wantsFooterVisibleWhenEmpty](self, "wantsFooterVisibleWhenEmpty"));
  -[PXPhotosViewConfiguration setWantsSingleRowScrollingLayout:](v10, "setWantsSingleRowScrollingLayout:", -[PXPhotosViewConfiguration wantsSingleRowScrollingLayout](self, "wantsSingleRowScrollingLayout"));
  -[PXPhotosViewConfiguration setDismissAffordance:](v10, "setDismissAffordance:", -[PXPhotosViewConfiguration dismissAffordance](self, "dismissAffordance"));
  -[PXPhotosViewConfiguration setAllowedInteractiveDismissBehaviors:](v10, "setAllowedInteractiveDismissBehaviors:", -[PXPhotosViewConfiguration allowedInteractiveDismissBehaviors](self, "allowedInteractiveDismissBehaviors"));
  -[PXPhotosViewConfiguration initialNavigationObjectReference](self, "initialNavigationObjectReference");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setInitialNavigationObjectReference:](v10, "setInitialNavigationObjectReference:", v38);

  -[PXPhotosViewConfiguration setInitialNavigationScrollPosition:](v10, "setInitialNavigationScrollPosition:", -[PXPhotosViewConfiguration initialNavigationScrollPosition](self, "initialNavigationScrollPosition"));
  -[PXPhotosViewConfiguration setScrollingBehavior:](v10, "setScrollingBehavior:", -[PXPhotosViewConfiguration scrollingBehavior](self, "scrollingBehavior"));
  -[PXPhotosViewConfiguration setWantsShareGridButtonVisible:](v10, "setWantsShareGridButtonVisible:", -[PXPhotosViewConfiguration wantsShareGridButtonVisible](self, "wantsShareGridButtonVisible"));
  -[PXPhotosViewConfiguration setOverrideDefaultNumberOfColumns:](v10, "setOverrideDefaultNumberOfColumns:", -[PXPhotosViewConfiguration overrideDefaultNumberOfColumns](self, "overrideDefaultNumberOfColumns"));
  -[PXPhotosViewConfiguration setContentShiftStrategy:](v10, "setContentShiftStrategy:", -[PXPhotosViewConfiguration contentShiftStrategy](self, "contentShiftStrategy"));
  -[PXPhotosViewConfiguration pickerClientBundleIdentifier](self, "pickerClientBundleIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setPickerClientBundleIdentifier:](v10, "setPickerClientBundleIdentifier:", v39);

  -[PXPhotosViewConfiguration setUseLowMemoryDecode:](v10, "setUseLowMemoryDecode:", -[PXPhotosViewConfiguration useLowMemoryDecode](self, "useLowMemoryDecode"));
  -[PXPhotosViewConfiguration setEnableSupportForTungstenUnderlay:](v10, "setEnableSupportForTungstenUnderlay:", -[PXPhotosViewConfiguration enableSupportForTungstenUnderlay](self, "enableSupportForTungstenUnderlay"));
  -[PXPhotosViewConfiguration overlayController](self, "overlayController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setOverlayController:](v10, "setOverlayController:", v40);

  -[PXPhotosViewConfiguration fullscreenOverlayControllers](self, "fullscreenOverlayControllers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setFullscreenOverlayControllers:](v10, "setFullscreenOverlayControllers:", v41);

  -[PXPhotosViewConfiguration customAssetSelectionHandler](self, "customAssetSelectionHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setCustomAssetSelectionHandler:](v10, "setCustomAssetSelectionHandler:", v42);

  -[PXPhotosViewConfiguration customDismissHandler](self, "customDismissHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setCustomDismissHandler:](v10, "setCustomDismissHandler:", v43);

  -[PXPhotosViewConfiguration setShowsOnlyAssetsInSelectedItemSectionInOneUp:](v10, "setShowsOnlyAssetsInSelectedItemSectionInOneUp:", -[PXPhotosViewConfiguration showsOnlyAssetsInSelectedItemSectionInOneUp](self, "showsOnlyAssetsInSelectedItemSectionInOneUp"));
  -[PXPhotosViewConfiguration setWantsTitleInNavigationBar:](v10, "setWantsTitleInNavigationBar:", -[PXPhotosViewConfiguration wantsTitleInNavigationBar](self, "wantsTitleInNavigationBar"));
  -[PXPhotosViewConfiguration setScrollDetentsProviderClass:](v10, "setScrollDetentsProviderClass:", -[PXPhotosViewConfiguration scrollDetentsProviderClass](self, "scrollDetentsProviderClass"));
  -[PXPhotosViewConfiguration initialScrollPositionDetentIdentifier](self, "initialScrollPositionDetentIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setInitialScrollPositionDetentIdentifier:](v10, "setInitialScrollPositionDetentIdentifier:", v44);

  -[PXPhotosViewConfiguration copySwiftPropertiesFromConfiguration:](v10, "copySwiftPropertiesFromConfiguration:", self);
  return v10;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
  self->_lightModeBackgroundStyle = a3;
  self->_darkModeBackgroundStyle = a3;
}

- (BOOL)allowsDragAndDrop
{
  _BOOL4 v3;

  v3 = -[PXPhotosViewConfiguration allowsDragIn](self, "allowsDragIn");
  if (v3)
    LOBYTE(v3) = -[PXPhotosViewConfiguration allowsDragOut](self, "allowsDragOut");
  return v3;
}

- (void)setAllowsDragAndDrop:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PXPhotosViewConfiguration setAllowsDragIn:](self, "setAllowsDragIn:");
  -[PXPhotosViewConfiguration setAllowsDragOut:](self, "setAllowsDragOut:", v3);
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (PXPhotosViewDelegate)delegate
{
  return (PXPhotosViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wantsTabBarHidden
{
  return self->_wantsTabBarHidden;
}

- (void)setWantsTabBarHidden:(BOOL)a3
{
  self->_wantsTabBarHidden = a3;
}

- (BOOL)wantsTitleInNavigationBar
{
  return self->_wantsTitleInNavigationBar;
}

- (void)setWantsTitleInNavigationBar:(BOOL)a3
{
  self->_wantsTitleInNavigationBar = a3;
}

- (id)customAssetSelectionHandler
{
  return self->_customAssetSelectionHandler;
}

- (void)setCustomAssetSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)customDismissHandler
{
  return self->_customDismissHandler;
}

- (void)setCustomDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)prefersActionsInToolbar
{
  return self->_prefersActionsInToolbar;
}

- (void)setPrefersActionsInToolbar:(BOOL)a3
{
  self->_prefersActionsInToolbar = a3;
}

- (int64_t)footerVisibilityStyle
{
  return self->_footerVisibilityStyle;
}

- (void)setFooterVisibilityStyle:(int64_t)a3
{
  self->_footerVisibilityStyle = a3;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (void)setViewOptionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewOptionsModel, a3);
}

- (BOOL)hidesViewOptionsToolbar
{
  return self->_hidesViewOptionsToolbar;
}

- (void)setHidesViewOptionsToolbar:(BOOL)a3
{
  self->_hidesViewOptionsToolbar = a3;
}

- (PXFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (void)setFooterViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewModel, a3);
}

- (NSString)footerSubtitle
{
  return self->_footerSubtitle;
}

- (void)setFooterSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)footerLearnMoreURL
{
  return self->_footerLearnMoreURL;
}

- (void)setFooterLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (void)setWantsFooterMask:(BOOL)a3
{
  self->_wantsFooterMask = a3;
}

- (BOOL)hidesAssetCountInFooter
{
  return self->_hidesAssetCountInFooter;
}

- (void)setHidesAssetCountInFooter:(BOOL)a3
{
  self->_hidesAssetCountInFooter = a3;
}

- (BOOL)wantsCPLStatus
{
  return self->_wantsCPLStatus;
}

- (void)setWantsCPLStatus:(BOOL)a3
{
  self->_wantsCPLStatus = a3;
}

- (BOOL)wantsRenderingStatus
{
  return self->_wantsRenderingStatus;
}

- (void)setWantsRenderingStatus:(BOOL)a3
{
  self->_wantsRenderingStatus = a3;
}

- (BOOL)wantsContentFilterVisible
{
  return self->_wantsContentFilterVisible;
}

- (void)setWantsContentFilterVisible:(BOOL)a3
{
  self->_wantsContentFilterVisible = a3;
}

- (BOOL)wantsShareGridButtonVisible
{
  return self->_wantsShareGridButtonVisible;
}

- (void)setWantsShareGridButtonVisible:(BOOL)a3
{
  self->_wantsShareGridButtonVisible = a3;
}

- (BOOL)wantsDynamicTitles
{
  return self->_wantsDynamicTitles;
}

- (void)setWantsDynamicTitles:(BOOL)a3
{
  self->_wantsDynamicTitles = a3;
}

- (BOOL)wantsExternallyRenderedSecondaryToolbar
{
  return self->_wantsExternallyRenderedSecondaryToolbar;
}

- (void)setWantsExternallyRenderedSecondaryToolbar:(BOOL)a3
{
  self->_wantsExternallyRenderedSecondaryToolbar = a3;
}

- (BOOL)containerProvidesSecondaryToolbar
{
  return self->_containerProvidesSecondaryToolbar;
}

- (void)setContainerProvidesSecondaryToolbar:(BOOL)a3
{
  self->_containerProvidesSecondaryToolbar = a3;
}

- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp
{
  return self->_showsOnlyAssetsInSelectedItemSectionInOneUp;
}

- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3
{
  self->_showsOnlyAssetsInSelectedItemSectionInOneUp = a3;
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_toolbarStyle = a3;
}

- (int64_t)navBarStyle
{
  return self->_navBarStyle;
}

- (void)setNavBarStyle:(int64_t)a3
{
  self->_navBarStyle = a3;
}

- (int64_t)scrollIndicatorStyle
{
  return self->_scrollIndicatorStyle;
}

- (void)setScrollIndicatorStyle:(int64_t)a3
{
  self->_scrollIndicatorStyle = a3;
}

- (BOOL)shouldOptOutOfChromelessBars
{
  return self->_shouldOptOutOfChromelessBars;
}

- (void)setShouldOptOutOfChromelessBars:(BOOL)a3
{
  self->_shouldOptOutOfChromelessBars = a3;
}

- (BOOL)wantsModernNavBarButtons
{
  return self->_wantsModernNavBarButtons;
}

- (void)setWantsModernNavBarButtons:(BOOL)a3
{
  self->_wantsModernNavBarButtons = a3;
}

- (int64_t)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setSectionHeaderStyle:(int64_t)a3
{
  self->_sectionHeaderStyle = a3;
}

- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderLayoutProvider
{
  return self->_sectionHeaderLayoutProvider;
}

- (void)setSectionHeaderLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderLayoutProvider, a3);
}

- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderLayoutProvider
{
  return self->_globalHeaderLayoutProvider;
}

- (void)setGlobalHeaderLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_globalHeaderLayoutProvider, a3);
}

- (int64_t)sectionBodyStyle
{
  return self->_sectionBodyStyle;
}

- (void)setSectionBodyStyle:(int64_t)a3
{
  self->_sectionBodyStyle = a3;
}

- (PXPhotosCustomSectionBodyLayoutProvider)sectionBodyLayoutProvider
{
  return self->_sectionBodyLayoutProvider;
}

- (void)setSectionBodyLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBodyLayoutProvider, a3);
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setBannerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bannerProvider, a3);
}

- (id)bannerControllerProvider
{
  return self->_bannerControllerProvider;
}

- (void)setBannerControllerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int64_t)summaryStyle
{
  return self->_summaryStyle;
}

- (void)setSummaryStyle:(int64_t)a3
{
  self->_summaryStyle = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (unsigned)gridPresentationType
{
  return self->_gridPresentationType;
}

- (void)setGridPresentationType:(unsigned __int8)a3
{
  self->_gridPresentationType = a3;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (void)setItemAspectRatio:(double)a3
{
  self->_itemAspectRatio = a3;
}

- (BOOL)showLoadingPlaceholderWhenEmpty
{
  return self->_showLoadingPlaceholderWhenEmpty;
}

- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3
{
  self->_showLoadingPlaceholderWhenEmpty = a3;
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  return (PXPhotosPreferredAssetCropDelegate *)objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
}

- (void)setPreferredAssetCropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_preferredAssetCropDelegate, a3);
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  return (PXPhotosPreferredColumnCountsDelegate *)objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
}

- (void)setPreferredColumnCountsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_preferredColumnCountsDelegate, a3);
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)setOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayController, a3);
}

- (NSArray)fullscreenOverlayControllers
{
  return self->_fullscreenOverlayControllers;
}

- (void)setFullscreenOverlayControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)ignoreContentFilterStateWhenNotFiltering
{
  return self->_ignoreContentFilterStateWhenNotFiltering;
}

- (void)setIgnoreContentFilterStateWhenNotFiltering:(BOOL)a3
{
  self->_ignoreContentFilterStateWhenNotFiltering = a3;
}

- (BOOL)ignoreFilterPredicateAssert
{
  return self->_ignoreFilterPredicateAssert;
}

- (void)setIgnoreFilterPredicateAssert:(BOOL)a3
{
  self->_ignoreFilterPredicateAssert = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (int64_t)lightModeBackgroundStyle
{
  return self->_lightModeBackgroundStyle;
}

- (void)setLightModeBackgroundStyle:(int64_t)a3
{
  self->_lightModeBackgroundStyle = a3;
}

- (int64_t)darkModeBackgroundStyle
{
  return self->_darkModeBackgroundStyle;
}

- (void)setDarkModeBackgroundStyle:(int64_t)a3
{
  self->_darkModeBackgroundStyle = a3;
}

- (BOOL)allowsCaptions
{
  return self->_allowsCaptions;
}

- (void)setAllowsCaptions:(BOOL)a3
{
  self->_allowsCaptions = a3;
}

- (BOOL)startsInSelectMode
{
  return self->_startsInSelectMode;
}

- (void)setStartsInSelectMode:(BOOL)a3
{
  self->_startsInSelectMode = a3;
}

- (BOOL)wantsSelectModeCaptionInContextMenu
{
  return self->_wantsSelectModeCaptionInContextMenu;
}

- (void)setWantsSelectModeCaptionInContextMenu:(BOOL)a3
{
  self->_wantsSelectModeCaptionInContextMenu = a3;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  self->_wantsDimmedSelectionStyle = a3;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (int64_t)selectionContextOverride
{
  return self->_selectionContextOverride;
}

- (void)setSelectionContextOverride:(int64_t)a3
{
  self->_selectionContextOverride = a3;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  self->_wantsFileSizeBadge = a3;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (void)setNoContentPlaceholderType:(int64_t)a3
{
  self->_noContentPlaceholderType = a3;
}

- (unint64_t)allowedActions
{
  return self->_allowedActions;
}

- (void)setAllowedActions:(unint64_t)a3
{
  self->_allowedActions = a3;
}

- (unint64_t)allowedBehaviors
{
  return self->_allowedBehaviors;
}

- (void)setAllowedBehaviors:(unint64_t)a3
{
  self->_allowedBehaviors = a3;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (void)setForbiddenBadges:(unint64_t)a3
{
  self->_forbiddenBadges = a3;
}

- (BOOL)allowsInteractiveFavoriteBadges
{
  return self->_allowsInteractiveFavoriteBadges;
}

- (void)setAllowsInteractiveFavoriteBadges:(BOOL)a3
{
  self->_allowsInteractiveFavoriteBadges = a3;
}

- (BOOL)allowsGridAppearanceActions
{
  return self->_allowsGridAppearanceActions;
}

- (void)setAllowsGridAppearanceActions:(BOOL)a3
{
  self->_allowsGridAppearanceActions = a3;
}

- (BOOL)allowsDragOut
{
  return self->_allowsDragOut;
}

- (void)setAllowsDragOut:(BOOL)a3
{
  self->_allowsDragOut = a3;
}

- (BOOL)allowsDragIn
{
  return self->_allowsDragIn;
}

- (void)setAllowsDragIn:(BOOL)a3
{
  self->_allowsDragIn = a3;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (void)setAllowsSwipeToSelect:(BOOL)a3
{
  self->_allowsSwipeToSelect = a3;
}

- (BOOL)allowsUserDefaults
{
  return self->_allowsUserDefaults;
}

- (void)setAllowsUserDefaults:(BOOL)a3
{
  self->_allowsUserDefaults = a3;
}

- (PXZoomablePhotosUserDefaults)customUserDefaults
{
  return self->_customUserDefaults;
}

- (void)setCustomUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_customUserDefaults, a3);
}

- (BOOL)allowsLinkInteractions
{
  return self->_allowsLinkInteractions;
}

- (void)setAllowsLinkInteractions:(BOOL)a3
{
  self->_allowsLinkInteractions = a3;
}

- (BOOL)allowsMultiSelectMenu
{
  return self->_allowsMultiSelectMenu;
}

- (void)setAllowsMultiSelectMenu:(BOOL)a3
{
  self->_allowsMultiSelectMenu = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (void)setContainerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)oneUpPresentationOrigin
{
  return self->_oneUpPresentationOrigin;
}

- (void)setOneUpPresentationOrigin:(int64_t)a3
{
  self->_oneUpPresentationOrigin = a3;
}

- (BOOL)preventShowInAllPhotosAction
{
  return self->_preventShowInAllPhotosAction;
}

- (void)setPreventShowInAllPhotosAction:(BOOL)a3
{
  self->_preventShowInAllPhotosAction = a3;
}

- (BOOL)wantsOneUpShowInLibraryButton
{
  return self->_wantsOneUpShowInLibraryButton;
}

- (void)setWantsOneUpShowInLibraryButton:(BOOL)a3
{
  self->_wantsOneUpShowInLibraryButton = a3;
}

- (BOOL)alwaysIncludeSharedWithYouAssets
{
  return self->_alwaysIncludeSharedWithYouAssets;
}

- (void)setAlwaysIncludeSharedWithYouAssets:(BOOL)a3
{
  self->_alwaysIncludeSharedWithYouAssets = a3;
}

- (BOOL)allowsMergeDuplicatesAction
{
  return self->_allowsMergeDuplicatesAction;
}

- (void)setAllowsMergeDuplicatesAction:(BOOL)a3
{
  self->_allowsMergeDuplicatesAction = a3;
}

- (PXPhotosGridOptionsController)optionsController
{
  return self->_optionsController;
}

- (void)setOptionsController:(id)a3
{
  objc_storeStrong((id *)&self->_optionsController, a3);
}

- (id)infoActionHandler
{
  return self->_infoActionHandler;
}

- (void)setInfoActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)centerAccessoryActionType
{
  return self->_centerAccessoryActionType;
}

- (void)setCenterAccessoryActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)trailingAccessoryActionType
{
  return self->_trailingAccessoryActionType;
}

- (void)setTrailingAccessoryActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (void)setAssetImportStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetImportStatusManager, a3);
}

- (int64_t)contentStartingPosition
{
  return self->_contentStartingPosition;
}

- (void)setContentStartingPosition:(int64_t)a3
{
  self->_contentStartingPosition = a3;
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (void)setDecorationViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_decorationViewClass, a3);
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (void)setDecorationDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_decorationDataSource, a3);
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (void)setTapbackStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
}

- (BOOL)isEmbedded
{
  return self->_isEmbedded;
}

- (void)setIsEmbedded:(BOOL)a3
{
  self->_isEmbedded = a3;
}

- (PXStatusViewModel)emptyPlaceholderStatusViewModel
{
  return self->_emptyPlaceholderStatusViewModel;
}

- (void)setEmptyPlaceholderStatusViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, a3);
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyController, a3);
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (void)setBadgesModifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (BOOL)wantsFooterVisibleImmediately
{
  return self->_wantsFooterVisibleImmediately;
}

- (void)setWantsFooterVisibleImmediately:(BOOL)a3
{
  self->_wantsFooterVisibleImmediately = a3;
}

- (BOOL)wantsFooterVisibleWhenEmpty
{
  return self->_wantsFooterVisibleWhenEmpty;
}

- (void)setWantsFooterVisibleWhenEmpty:(BOOL)a3
{
  self->_wantsFooterVisibleWhenEmpty = a3;
}

- (BOOL)wantsSingleRowScrollingLayout
{
  return self->_wantsSingleRowScrollingLayout;
}

- (void)setWantsSingleRowScrollingLayout:(BOOL)a3
{
  self->_wantsSingleRowScrollingLayout = a3;
}

- (int64_t)dismissAffordance
{
  return self->_dismissAffordance;
}

- (void)setDismissAffordance:(int64_t)a3
{
  self->_dismissAffordance = a3;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3
{
  self->_allowedInteractiveDismissBehaviors = a3;
}

- (PXSectionedObjectReference)initialNavigationObjectReference
{
  return self->_initialNavigationObjectReference;
}

- (void)setInitialNavigationObjectReference:(id)a3
{
  objc_storeStrong((id *)&self->_initialNavigationObjectReference, a3);
}

- (int64_t)initialNavigationScrollPosition
{
  return self->_initialNavigationScrollPosition;
}

- (void)setInitialNavigationScrollPosition:(int64_t)a3
{
  self->_initialNavigationScrollPosition = a3;
}

- (int64_t)scrollingBehavior
{
  return self->_scrollingBehavior;
}

- (void)setScrollingBehavior:(int64_t)a3
{
  self->_scrollingBehavior = a3;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (void)setContentShiftStrategy:(int64_t)a3
{
  self->_contentShiftStrategy = a3;
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (void)setPickerClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (void)setUseLowMemoryDecode:(BOOL)a3
{
  self->_useLowMemoryDecode = a3;
}

- (BOOL)enableSupportForTungstenUnderlay
{
  return self->_enableSupportForTungstenUnderlay;
}

- (void)setEnableSupportForTungstenUnderlay:(BOOL)a3
{
  self->_enableSupportForTungstenUnderlay = a3;
}

- (NSString)initialScrollPositionDetentIdentifier
{
  return self->_initialScrollPositionDetentIdentifier;
}

- (void)setInitialScrollPositionDetentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (Class)scrollDetentsProviderClass
{
  return self->_scrollDetentsProviderClass;
}

- (void)setScrollDetentsProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_scrollDetentsProviderClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollDetentsProviderClass, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionDetentIdentifier, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_initialNavigationObjectReference, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryActionType, 0);
  objc_storeStrong((id *)&self->_centerAccessoryActionType, 0);
  objc_storeStrong(&self->_infoActionHandler, 0);
  objc_storeStrong((id *)&self->_optionsController, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customUserDefaults, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlayControllers, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong(&self->_bannerControllerProvider, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_sectionBodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_globalHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_footerLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_footerSubtitle, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong(&self->_customDismissHandler, 0);
  objc_storeStrong(&self->_customAssetSelectionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

@end
