@implementation PXPhotosViewModel

- (id)customExcludedActionTypesProvider
{
  PXPhotosViewModel *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  v2 = self;
  v3 = (char *)sub_1A6960F80();
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_customExcludedActionTypesProvider];
  v4 = *(_QWORD *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_customExcludedActionTypesProvider
                    + 8];
  sub_1A7ADBF34();

  v8[4] = v5;
  v8[5] = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1A6961488;
  v8[3] = &block_descriptor_35;
  v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (void)setCustomExcludedActionTypesProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  PXPhotosViewModel *v6;
  char *v7;
  char *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = (char *)sub_1A6960F80();
  v8 = &v7[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_customExcludedActionTypesProvider];
  *(_QWORD *)v8 = sub_1A69682A0;
  *((_QWORD *)v8 + 1) = v5;

  swift_release();
}

- (BOOL)supportsZooming
{
  PXPhotosViewModel *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = PXPhotosViewModel.supportsZooming.getter();

  return v3 & 1;
}

- (NSString)collectionKindPreviewHeaderDisabledUserDefaultsKey
{
  PXPhotosViewModel *v2;
  void *v3;

  v2 = self;
  PXPhotosViewModel.collectionKindPreviewHeaderDisabledUserDefaultsKey.getter();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)swift_collectionKindSupportsTogglingPreviewHeader
{
  PXPhotosViewModel *v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  v3 = (char *)sub_1A6960F80();
  v4 = *(_QWORD *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_collectionKind];
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_collectionKind
                    + 16];
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();

  if (v5)
  {

    swift_bridgeObjectRelease();
    return (v4 >> 8) & 1;
  }
  else
  {
    LOBYTE(v6) = sub_1A7AE4AFC();
    __break(1u);
  }
  return v6;
}

- (void)swift_initWithConfiguration:(id)a3
{
  PXPhotosViewConfiguration *v4;
  PXPhotosViewModel *v5;

  v4 = (PXPhotosViewConfiguration *)a3;
  v5 = self;
  PXPhotosViewModel.swift_init(configuration:)(v4);

}

- (void)swift_didPerformChanges
{
  PXPhotosViewModel *v3;

  swift_dynamicCastObjCProtocolUnconditional();
  swift_getObjectType();
  v3 = self;
  sub_1A6963350();

}

- (void)swift_actionMenuVisibilityChangedToVisible:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(_BOOL8);
  PXPhotosViewModel *v6;

  v3 = a3;
  v6 = self;
  v4 = (char *)sub_1A6960F80();
  v5 = *(void (**)(_BOOL8))&v4[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_customActionMenuVisibilityChangeHandler];
  sub_1A6855D70((uint64_t)v5);

  if (v5)
  {
    v5(v3);
    sub_1A686EE5C((uint64_t)v5);
  }

}

- (BOOL)handlePrimaryAction:(id)a3
{
  id v4;
  PXPhotosViewModel *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A6963FCC((uint64_t)v4);

  return self & 1;
}

- (PXBrowserSelectionSnapshot)browserSelectionSnapshot
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel+PXBrowserSnapshot.m"), 21, CFSTR("Expected data source to be same as selection snapshot datasource."));

  }
  objc_msgSend(v4, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PXPhotosViewModel_PXBrowserSnapshot__browserSelectionSnapshot__block_invoke;
  v13[3] = &unk_1E513F500;
  v14 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateAllIndexPathsUsingBlock:", v13);
  +[PXBrowserSelectionSnapshot selectionWithIndexPaths:dataSource:](PXBrowserSelectionSnapshot, "selectionWithIndexPaths:dataSource:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXBrowserSelectionSnapshot *)v10;
}

void __64__PXPhotosViewModel_PXBrowserSnapshot__browserSelectionSnapshot__block_invoke(uint64_t a1, __int128 *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;

  v4 = *a2;
  v5 = a2[1];
  PXIndexPathFromSimpleIndexPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3, v4, v5);

}

- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4
{
  return -[PXPhotosViewModel initWithConfiguration:specManager:inlinePlaybackController:](self, "initWithConfiguration:specManager:inlinePlaybackController:", a3, a4, 0);
}

- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4 inlinePlaybackController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosViewModel *v12;
  PXPhotosViewModel *v13;
  uint64_t v14;
  PXUpdater *updater;
  uint64_t v16;
  PXAssetsDataSourceManager *dataSourceManager;
  PXSharedLibraryStatusProvider *v18;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v20;
  PXMediaProvider *mediaProvider;
  uint64_t v22;
  PXContentPrivacyController *privacyController;
  uint64_t v24;
  PXAssetCollectionActionManager *assetCollectionActionManager;
  uint64_t v26;
  PXLoadingStatusManager *loadingStatusManager;
  uint64_t v28;
  PXPhotosCustomViewDecorationDataSource *decorationDataSource;
  uint64_t v30;
  PXTapbackStatusManager *tapbackStatusManager;
  uint64_t v32;
  PXAssetImportStatusManager *assetImportStatusManager;
  PXPhotosGridActionManager *v34;
  PXPhotosGridActionManager *gridActionManager;
  uint64_t v36;
  PXAssetActionManager *assetActionManager;
  uint64_t v38;
  NSArray *fullscreenOverlayControllers;
  uint64_t v40;
  id customAssetSelectionHandler;
  void *v42;
  void *v43;
  PXAssetsDataSourceManager *v44;
  PXAssetsDataSourceManager *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  BOOL v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  PXSectionedSelectionManager *selectionManager;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSString *initialScrollPositionDetentIdentifier;
  uint64_t v69;
  PXAssetsDataSource *currentDataSource;
  uint64_t v71;
  PXSelectionSnapshot *selectionSnapshot;
  NSMutableOrderedSet *v73;
  NSMutableOrderedSet *visibleAssetCollections;
  uint64_t v75;
  Class decorationViewClass;
  uint64_t v77;
  PXStatusViewModel *emptyPlaceholderStatusViewModel;
  uint64_t v79;
  id bannerControllerProvider;
  uint64_t v81;
  NSString *pickerClientBundleIdentifier;
  double v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  BOOL v88;
  void *v89;
  unint64_t v90;
  char v91;
  NSObject *v92;
  uint64_t v93;
  PXZoomablePhotosUserDefaults *customUserDefaults;
  void *v95;
  uint64_t v96;
  NSString *centerAccessoryActionType;
  void *v98;
  uint64_t v99;
  NSString *trailingAccessoryActionType;
  uint64_t v101;
  PXSectionedObjectReference *initialNavigationObjectReference;
  int v103;
  void *v104;
  uint64_t v105;
  NSNumber *userWantsAspectFitContent;
  id v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSString *title;
  void *v112;
  uint64_t v113;
  NSString *containerTitle;
  void *v115;
  uint64_t v116;
  NSString *footerSubtitle;
  void *v118;
  uint64_t v119;
  NSURL *footerLearnMoreURL;
  uint64_t v121;
  PXPhotosGridOptionsController *optionsController;
  uint64_t v123;
  id infoActionHandler;
  void *v125;
  int64_t navBarStyle;
  NSMutableSet *v127;
  NSMutableSet *enterSelectModePreventedForReasons;
  NSMutableSet *v129;
  NSMutableSet *oneUpPresentationPreventedForReasons;
  NSMutableSet *v131;
  NSMutableSet *aspectRatioTogglePreventedForReasons;
  NSMutableSet *v133;
  NSMutableSet *hideSurroundingContentForReasons;
  uint64_t v135;
  PXFooterViewModel *footerViewModel;
  uint64_t v137;
  PXPhotosViewOptionsModel *viewOptionsModel;
  void *v139;
  uint64_t v140;
  PXSearchQueryMatchInfo *searchQueryMatchInfo;
  uint64_t v142;
  id badgesModifier;
  uint64_t v144;
  PXPhotosHeaderCustomizationModel *headerCustomizationModel;
  uint64_t v146;
  PXLibraryFilterState *libraryFilterState;
  uint64_t v148;
  NSString *previewHeaderDisabledUserDefaultsKey;
  char v150;
  NSString *v151;
  NSObject *v152;
  _BOOL4 allowsPreviewHeader;
  NSString *v154;
  PXPhotosViewModel *v155;
  void *v156;
  void *v157;
  void *v158;
  NSString *v159;
  double v161;
  void *v162;
  void *v163;
  objc_class *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  SEL v169;
  void *v170;
  _QWORD v171[4];
  PXPhotosViewModel *v172;
  objc_super v173;
  uint8_t buf[4];
  _BOOL4 v175;
  __int16 v176;
  NSString *v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v173.receiver = self;
  v173.super_class = (Class)PXPhotosViewModel;
  v12 = -[PXPhotosViewModel init](&v173, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_70;
  v12->_isInitializing = 1;
  v14 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v12);
  updater = v13->_updater;
  v13->_updater = (PXUpdater *)v14;

  -[PXUpdater setNeedsUpdateSelector:](v13->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateContentPrivacyState);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateAvailableLenses);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateCurrentLens);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateAssetsDataSourceManager);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateWantsLensControlVisible);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateWantsContentFilterIndicatorVisible);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateUserWantsAspectFitContent);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateAspectFitContent);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateTopBarsStyles);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateChromeVisibility);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateDraggedAssetReferences);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateGridAppearance);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateFooterVisibility);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateSystemAuthenticationType);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateWantsContentUnavailableUnlockButtonVisible);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateEmptyPlaceholderState);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateCurrentDataSourceContainer);
  -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updatePersonContainerProperties);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v13->_specManager, a4);
  objc_storeWeak((id *)&v13->_inlinePlaybackController, v11);
  objc_msgSend(v9, "dataSourceManager");
  v16 = objc_claimAutoreleasedReturnValue();
  dataSourceManager = v13->_dataSourceManager;
  v13->_dataSourceManager = (PXAssetsDataSourceManager *)v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXAssetsDataSourceManager sharedLibraryStatusProvider](v13->_dataSourceManager, "sharedLibraryStatusProvider");
    v18 = (PXSharedLibraryStatusProvider *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = (objc_class *)objc_opt_class();
        NSStringFromClass(v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSharedLibraryStatusProvider px_descriptionForAssertionMessage](v18, "px_descriptionForAssertionMessage");
        v166 = v10;
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXPhotosViewModel.m"), 187, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[(id<_PXStatusProviderWorkaround>)_dataSourceManager sharedLibraryStatusProvider]"), v165, v167);

        v10 = v166;
      }
    }
    sharedLibraryStatusProvider = v13->_sharedLibraryStatusProvider;
    v13->_sharedLibraryStatusProvider = v18;

  }
  objc_msgSend(v9, "mediaProvider");
  v20 = objc_claimAutoreleasedReturnValue();
  mediaProvider = v13->_mediaProvider;
  v13->_mediaProvider = (PXMediaProvider *)v20;

  objc_msgSend(v9, "privacyController");
  v22 = objc_claimAutoreleasedReturnValue();
  privacyController = v13->_privacyController;
  v13->_privacyController = (PXContentPrivacyController *)v22;

  objc_msgSend(v9, "assetCollectionActionManager");
  v24 = objc_claimAutoreleasedReturnValue();
  assetCollectionActionManager = v13->_assetCollectionActionManager;
  v13->_assetCollectionActionManager = (PXAssetCollectionActionManager *)v24;

  objc_msgSend(v9, "loadingStatusManager");
  v26 = objc_claimAutoreleasedReturnValue();
  loadingStatusManager = v13->_loadingStatusManager;
  v13->_loadingStatusManager = (PXLoadingStatusManager *)v26;

  objc_msgSend(v9, "decorationDataSource");
  v28 = objc_claimAutoreleasedReturnValue();
  decorationDataSource = v13->_decorationDataSource;
  v13->_decorationDataSource = (PXPhotosCustomViewDecorationDataSource *)v28;

  objc_msgSend(v9, "tapbackStatusManager");
  v30 = objc_claimAutoreleasedReturnValue();
  tapbackStatusManager = v13->_tapbackStatusManager;
  v13->_tapbackStatusManager = (PXTapbackStatusManager *)v30;

  objc_msgSend(v9, "assetImportStatusManager");
  v32 = objc_claimAutoreleasedReturnValue();
  assetImportStatusManager = v13->_assetImportStatusManager;
  v13->_assetImportStatusManager = (PXAssetImportStatusManager *)v32;

  v34 = -[PXPhotosGridActionManager initWithViewModel:]([PXPhotosGridActionManager alloc], "initWithViewModel:", v13);
  gridActionManager = v13->_gridActionManager;
  v13->_gridActionManager = v34;

  objc_msgSend(v9, "assetActionManager");
  v36 = objc_claimAutoreleasedReturnValue();
  assetActionManager = v13->_assetActionManager;
  v13->_assetActionManager = (PXAssetActionManager *)v36;

  objc_msgSend(v9, "fullscreenOverlayControllers");
  v38 = objc_claimAutoreleasedReturnValue();
  fullscreenOverlayControllers = v13->_fullscreenOverlayControllers;
  v13->_fullscreenOverlayControllers = (NSArray *)v38;

  objc_msgSend(v9, "customAssetSelectionHandler");
  v40 = objc_claimAutoreleasedReturnValue();
  customAssetSelectionHandler = v13->_customAssetSelectionHandler;
  v13->_customAssetSelectionHandler = (id)v40;

  v13->_wantsTitleInNavigationBar = objc_msgSend(v9, "wantsTitleInNavigationBar");
  objc_msgSend(v9, "selectionManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v9, "selectionManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dataSourceManager");
    v44 = (PXAssetsDataSourceManager *)objc_claimAutoreleasedReturnValue();
    v45 = v13->_dataSourceManager;

    if (v44 != v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXPhotosViewModel.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.selectionManager.dataSourceManager == _dataSourceManager"));

    }
    objc_msgSend(v9, "assetActionManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "selectionManager");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = (void *)v47;
      v169 = a2;
      objc_msgSend(v9, "assetActionManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "selectionManager");
      v50 = v10;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = v51 == v52;
      v10 = v50;
      if (v53)
      {
LABEL_14:
        objc_msgSend(v9, "selectionManager");
        v54 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v169, v13, CFSTR("PXPhotosViewModel.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.assetActionManager.selectionManager == nil || configuration.assetActionManager.selectionManager == configuration.selectionManager"));
    }

    goto LABEL_14;
  }
  objc_msgSend(v9, "assetActionManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "selectionManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v9, "assetActionManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "selectionManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dataSourceManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSourceManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60 != v61)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXPhotosViewModel.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.assetActionManager.selectionManager.dataSourceManager == configuration.dataSourceManager"));

    }
    objc_msgSend(v9, "assetActionManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "selectionManager");
    v62 = objc_claimAutoreleasedReturnValue();
    selectionManager = v13->_selectionManager;
    v13->_selectionManager = (PXSectionedSelectionManager *)v62;

    goto LABEL_20;
  }
  v54 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v13->_dataSourceManager);
LABEL_15:
  v55 = v13->_selectionManager;
  v13->_selectionManager = (PXSectionedSelectionManager *)v54;
LABEL_20:

  v13->_selectionContext = objc_msgSend(v9, "selectionContextOverride");
  -[PXAssetActionManager setSelectionManager:](v13->_assetActionManager, "setSelectionManager:", v13->_selectionManager);
  objc_msgSend(v9, "delegate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel setViewDelegate:](v13, "setViewDelegate:", v64);

  -[PXAssetsDataSourceManager registerChangeObserver:context:](v13->_dataSourceManager, "registerChangeObserver:context:", v13, DataSourceManagerObservationContext_60338);
  -[PXSectionedSelectionManager registerChangeObserver:context:](v13->_selectionManager, "registerChangeObserver:context:", v13, SelectionManagerObservationContext_60339);
  -[PXContentPrivacyController registerChangeObserver:context:](v13->_privacyController, "registerChangeObserver:context:", v13, PrivacyControllerObservationContext);
  -[PXSectionedSelectionManager snapshotValidator](v13->_selectionManager, "snapshotValidator");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v65)
    -[PXSectionedSelectionManager setSnapshotValidator:](v13->_selectionManager, "setSnapshotValidator:", v13);
  objc_msgSend(v9, "initialScrollPositionDetentIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "copy");
  initialScrollPositionDetentIdentifier = v13->_initialScrollPositionDetentIdentifier;
  v13->_initialScrollPositionDetentIdentifier = (NSString *)v67;

  -[PXAssetsDataSourceManager dataSource](v13->_dataSourceManager, "dataSource");
  v69 = objc_claimAutoreleasedReturnValue();
  currentDataSource = v13->_currentDataSource;
  v13->_currentDataSource = (PXAssetsDataSource *)v69;

  -[PXSectionedSelectionManager selectionSnapshot](v13->_selectionManager, "selectionSnapshot");
  v71 = objc_claimAutoreleasedReturnValue();
  selectionSnapshot = v13->_selectionSnapshot;
  v13->_selectionSnapshot = (PXSelectionSnapshot *)v71;

  v73 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  visibleAssetCollections = v13->_visibleAssetCollections;
  v13->_visibleAssetCollections = v73;

  v13->_contentStartingPosition = objc_msgSend(v9, "contentStartingPosition");
  objc_msgSend(v9, "decorationViewClass");
  v75 = objc_claimAutoreleasedReturnValue();
  decorationViewClass = v13->_decorationViewClass;
  v13->_decorationViewClass = (Class)v75;

  objc_msgSend(v9, "emptyPlaceholderStatusViewModel");
  v77 = objc_claimAutoreleasedReturnValue();
  emptyPlaceholderStatusViewModel = v13->_emptyPlaceholderStatusViewModel;
  v13->_emptyPlaceholderStatusViewModel = (PXStatusViewModel *)v77;

  v13->_wantsContentFilterVisible = objc_msgSend(v9, "wantsContentFilterVisible");
  v13->_footerVisibilityStyle = objc_msgSend(v9, "footerVisibilityStyle");
  v13->_wantsDimmedSelectionStyle = objc_msgSend(v9, "wantsDimmedSelectionStyle");
  v13->_wantsNumberedSelectionStyle = objc_msgSend(v9, "wantsNumberedSelectionStyle");
  v13->_wantsFileSizeBadge = objc_msgSend(v9, "wantsFileSizeBadge");
  v13->_wantsAssetIndexBadge = objc_msgSend(v9, "wantsAssetIndexBadge");
  v13->_noContentPlaceholderType = objc_msgSend(v9, "noContentPlaceholderType");
  v13->_wantsDynamicTitles = objc_msgSend(v9, "wantsDynamicTitles");
  v13->_wantsFooterMask = objc_msgSend(v9, "wantsFooterMask");
  v13->_hidesAssetCountInFooter = objc_msgSend(v9, "hidesAssetCountInFooter");
  v13->_wantsCPLStatus = objc_msgSend(v9, "wantsCPLStatus");
  v13->_wantsRenderingStatus = objc_msgSend(v9, "wantsRenderingStatus");
  v13->_alwaysIncludeSharedWithYouAssets = objc_msgSend(v9, "alwaysIncludeSharedWithYouAssets");
  v13->_wantsShareGridButtonVisible = objc_msgSend(v9, "wantsShareGridButtonVisible");
  v13->_isEmbedded = objc_msgSend(v9, "isEmbedded");
  objc_msgSend(v9, "bannerControllerProvider");
  v79 = objc_claimAutoreleasedReturnValue();
  bannerControllerProvider = v13->_bannerControllerProvider;
  v13->_bannerControllerProvider = (id)v79;

  v13->_gridStyle = objc_msgSend(v9, "gridStyle");
  v13->_preferredUserInterfaceStyle = objc_msgSend(v9, "preferredUserInterfaceStyle");
  v13->_configuredSectionHeaderStyle = objc_msgSend(v9, "sectionHeaderStyle");
  v13->_configuredSectionBodyStyle = objc_msgSend(v9, "sectionBodyStyle");
  v13->_wantsSingleRowScrollingLayout = objc_msgSend(v9, "wantsSingleRowScrollingLayout");
  objc_msgSend(v9, "pickerClientBundleIdentifier");
  v81 = objc_claimAutoreleasedReturnValue();
  pickerClientBundleIdentifier = v13->_pickerClientBundleIdentifier;
  v13->_pickerClientBundleIdentifier = (NSString *)v81;

  objc_msgSend(v9, "itemAspectRatio");
  v13->_itemAspectRatio = v83;
  v13->_showLoadingPlaceholderWhenEmpty = objc_msgSend(v9, "showLoadingPlaceholderWhenEmpty");
  objc_msgSend(v9, "preferredAssetCropDelegate");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v13->_preferredAssetCropDelegate, v84);

  objc_msgSend(v9, "preferredColumnCountsDelegate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v13->_preferredColumnCountsDelegate, v85);

  v13->_overrideDefaultNumberOfColumns = objc_msgSend(v9, "overrideDefaultNumberOfColumns");
  v13->_ignoreContentFilterStateWhenNotFiltering = objc_msgSend(v9, "ignoreContentFilterStateWhenNotFiltering");
  v13->_ignoreFilterPredicateAssert = objc_msgSend(v9, "ignoreFilterPredicateAssert");
  v13->_allowsOneUpPresentation = (objc_msgSend(v9, "allowedActions") & 0x80) != 0;
  if (_os_feature_enabled_impl())
    v86 = ((unint64_t)objc_msgSend(v9, "allowedBehaviors") >> 16) & 1;
  else
    LOBYTE(v86) = 0;
  v13->_allowsSearch = v86;
  v13->_allowsShowDetails = ((unsigned __int16)objc_msgSend(v9, "allowedActions") >> 8) & 1;
  v13->_allowsChromeManagementBehavior = objc_msgSend(v9, "allowedBehaviors") & 1;
  v13->_allowsInlineAddBehavior = (objc_msgSend(v9, "allowedBehaviors") & 2) != 0;
  v13->_allowsSelectionUserActivityBehavior = (objc_msgSend(v9, "allowedBehaviors") & 4) != 0;
  v13->_allowsPopOnContainerDeleteBehavior = (objc_msgSend(v9, "allowedBehaviors") & 8) != 0;
  v13->_allowsPopOnEmptyBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x800) != 0;
  v13->_allowsEmptyPlaceholderBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x10) != 0;
  v13->_allowsActionMenuBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x20) != 0;
  v13->_allowsDoubleTapBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x40) != 0;
  v13->_allowsHoverBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x400) != 0;
  v13->_allowsCaptionsInSquareBehavior = (objc_msgSend(v9, "allowedBehaviors") & 0x1000) != 0;
  v13->_allowsContextMenuCustomization = (objc_msgSend(v9, "allowedBehaviors") & 0x80) != 0;
  v13->_allowsAccessoriesContextMenuCustomization = (objc_msgSend(v9, "allowedBehaviors") & 0x200) != 0;
  v13->_allowsMacStyleSelection = ((unsigned __int16)objc_msgSend(v9, "allowedBehaviors") >> 8) & 1;
  v13->_allowsLensControl = (objc_msgSend(v9, "allowedBehaviors") & 0x4000) != 0;
  v13->_wantsSelectModeCaptionInContextMenu = objc_msgSend(v9, "wantsSelectModeCaptionInContextMenu");
  v13->_neverShowsLensControl = objc_msgSend(v9, "containerProvidesSecondaryToolbar");
  v13->_canShowSortButton = (objc_msgSend(v9, "allowedBehaviors") & 0x8000) != 0;
  v13->_wantsTopBadgesWithViewBasedDecorations = (objc_msgSend(v9, "allowedBehaviors") & 0x2000) != 0;
  v13->_allowsSelectModeToggle = (objc_msgSend(v9, "allowedActions") & 0x20) != 0;
  v13->_allowsSelectAllAction = objc_msgSend(v9, "allowedActions") & 1;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v87, "enableAspectFitToggle")
    && (unint64_t)(objc_msgSend(v9, "gridStyle") - 3) <= 0xFFFFFFFFFFFFFFFDLL
    && (objc_msgSend(v9, "allowedActions") & 0x200) != 0)
  {
    objc_msgSend(v9, "itemAspectRatio");
    v88 = v161 == 1.0;
  }
  else
  {
    v88 = 0;
  }
  v13->_allowsAspectFitToggle = v88;

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    v13->_allowsSlideshowAction = 0;
  else
    v13->_allowsSlideshowAction = (objc_msgSend(v9, "allowedActions") & 4) != 0;
  v13->_allowsAddAction = (objc_msgSend(v9, "allowedActions") & 8) != 0;
  v13->_allowsCopyAction = (objc_msgSend(v9, "allowedActions") & 0x40) != 0;
  v13->_allowsSelectSectionAction = (objc_msgSend(v9, "allowedActions") & 0x10) != 0;
  v13->_allowsGridAppearanceActions = objc_msgSend(v9, "allowsGridAppearanceActions");
  v13->_allowsShareAllAction = (objc_msgSend(v9, "allowedActions") & 0x400) != 0;
  v13->_allowsQuickLookAction = (objc_msgSend(v9, "allowedActions") & 0x800) != 0;
  v13->_allowsShowMapAction = (objc_msgSend(v9, "allowedActions") & 0x1000) != 0;
  v13->_allowsPickAssetAction = (objc_msgSend(v9, "allowedActions") & 2) != 0;
  v13->_allowsDismissAction = (objc_msgSend(v9, "allowedActions") & 0x2000) != 0;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v89, "canShowInternalUI"))
    v90 = ((unint64_t)objc_msgSend(v9, "allowedActions") >> 14) & 1;
  else
    LOBYTE(v90) = 0;
  v13->_allowsFileRadarAction = v90;

  v13->_allowsTrashAction = (objc_msgSend(v9, "allowedActions") & 0x8000) != 0;
  v13->_allowsShareAction = (objc_msgSend(v9, "allowedActions") & 0x20000000) != 0;
  v13->_allowsAddToLibraryAction = (objc_msgSend(v9, "allowedActions") >> 16) & 1;
  v13->_allowsSwitchLibraryAction = (objc_msgSend(v9, "allowedActions") >> 24) & 1;
  v13->_allowsMoveToLibraryAction = (objc_msgSend(v9, "allowedActions") & 0x2000000) != 0;
  v13->_allowsMoveToPersonalLibraryAction = (objc_msgSend(v9, "allowedActions") & 0x8000000) != 0;
  v13->_allowsMoveToSharedLibraryAction = (objc_msgSend(v9, "allowedActions") & 0x4000000) != 0;
  v13->_allowsInfoAction = (objc_msgSend(v9, "allowedActions") & 0x80000) != 0;
  v13->_allowsCMMActions = (objc_msgSend(v9, "allowedActions") & 0x20000) != 0;
  v13->_allowsSyndicatedContentFiltering = (objc_msgSend(v9, "allowedActions") & 0x200000) != 0;
  v13->_allowsContentSyndicationSaveAllAction = (objc_msgSend(v9, "allowedActions") & 0x40000) != 0;
  v13->_allowsReplyAction = (objc_msgSend(v9, "allowedActions") & 0x100000) != 0;
  v13->_allowsTapbackAction = (objc_msgSend(v9, "allowedActions") & 0x400000) != 0;
  v13->_allowsMergeDuplicatesAction = (objc_msgSend(v9, "allowedActions") & 0x800000) != 0;
  v13->_supportsPeopleActions = (objc_msgSend(v9, "allowedActions") & 0x10000000) != 0;
  v13->_supportsSocialGroupActions = (objc_msgSend(v9, "allowedActions") & 0x40000000) != 0;
  v13->_showsOnlyAssetsInSelectedItemSectionInOneUp = objc_msgSend(v9, "showsOnlyAssetsInSelectedItemSectionInOneUp");
  v13->_allowsSwipeToSelect = objc_msgSend(v9, "allowsSwipeToSelect");
  v13->_allowsDragIn = objc_msgSend(v9, "allowsDragIn");
  v91 = objc_msgSend(v9, "allowsDragOut");
  v13->_allowsDragOut = v91;
  if (v13->_allowsDragIn && (v91 & 1) == 0)
  {
    PXAssertGetLog();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v92, OS_LOG_TYPE_ERROR, "This drag-in / drag-out configuration is not yet implemented.", buf, 2u);
    }

  }
  v13->_allowsUserDefaults = objc_msgSend(v9, "allowsUserDefaults");
  objc_msgSend(v9, "customUserDefaults");
  v93 = objc_claimAutoreleasedReturnValue();
  customUserDefaults = v13->_customUserDefaults;
  v13->_customUserDefaults = (PXZoomablePhotosUserDefaults *)v93;

  v13->_allowsLinkInteractions = objc_msgSend(v9, "allowsLinkInteractions");
  v13->_allowsMultiSelectMenu = objc_msgSend(v9, "allowsMultiSelectMenu");
  v13->_lowMemoryMode = objc_msgSend(v9, "lowMemoryMode");
  v13->_oneUpPresentationOrigin = objc_msgSend(v9, "oneUpPresentationOrigin");
  v13->_preventShowInAllPhotosAction = objc_msgSend(v9, "preventShowInAllPhotosAction");
  v13->_wantsOneUpShowInLibraryButton = objc_msgSend(v9, "wantsOneUpShowInLibraryButton");
  v13->_wantsFooterVisibleImmediately = objc_msgSend(v9, "wantsFooterVisibleImmediately");
  v13->_wantsFooterVisibleWhenEmpty = objc_msgSend(v9, "wantsFooterVisibleWhenEmpty");
  objc_msgSend(v9, "centerAccessoryActionType");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "copy");
  centerAccessoryActionType = v13->_centerAccessoryActionType;
  v13->_centerAccessoryActionType = (NSString *)v96;

  objc_msgSend(v9, "trailingAccessoryActionType");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "copy");
  trailingAccessoryActionType = v13->_trailingAccessoryActionType;
  v13->_trailingAccessoryActionType = (NSString *)v99;

  v13->_dismissAffordance = objc_msgSend(v9, "dismissAffordance");
  objc_msgSend(v9, "initialNavigationObjectReference");
  v101 = objc_claimAutoreleasedReturnValue();
  initialNavigationObjectReference = v13->_initialNavigationObjectReference;
  v13->_initialNavigationObjectReference = (PXSectionedObjectReference *)v101;

  v13->_initialNavigationScrollPosition = objc_msgSend(v9, "initialNavigationScrollPosition");
  v13->_scrollingBehavior = objc_msgSend(v9, "scrollingBehavior");
  if (objc_msgSend(v9, "sectionBodyStyle") == 2)
    v103 = PLIsMobileSlideShow() ^ 1;
  else
    LOBYTE(v103) = 0;
  v13->__shouldMimicSystemChromelessUsingManualScrollEdgeAppearance = v103;
  v13->_contentMode = objc_msgSend(v9, "contentMode");
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "photosGridAspectFit");
  v105 = objc_claimAutoreleasedReturnValue();
  userWantsAspectFitContent = v13->_userWantsAspectFitContent;
  v13->_userWantsAspectFitContent = (NSNumber *)v105;

  if (v13->_allowsCopyAction || v13->_allowsQuickLookAction || v13->_allowsPickAssetAction)
  {
    v107 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v108 = v107;
    if (v13->_allowsCopyAction)
      objc_msgSend(v107, "addObject:", CFSTR("PXAssetActionTypeCopy"));
    if (v13->_allowsQuickLookAction)
      objc_msgSend(v108, "addObject:", CFSTR("PXAssetActionTypeQuickLook"));
    if (v13->_allowsPickAssetAction)
      objc_msgSend(v108, "addObject:", CFSTR("PXAssetActionTypePickAsset"));
    -[PXActionManager setAllowedActionTypes:](v13->_assetActionManager, "setAllowedActionTypes:", v108);

  }
  objc_msgSend(v9, "title");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "copy");
  title = v13->_title;
  v13->_title = (NSString *)v110;

  objc_msgSend(v9, "containerTitle");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "copy");
  containerTitle = v13->_containerTitle;
  v13->_containerTitle = (NSString *)v113;

  v13->_floatingTitleOpacity = 1.0;
  v13->_titleBackgroundOpacity = 1.0;
  v13->_wantsFloatingTitle = 1;
  objc_msgSend(v9, "footerSubtitle");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "copy");
  footerSubtitle = v13->_footerSubtitle;
  v13->_footerSubtitle = (NSString *)v116;

  objc_msgSend(v9, "footerLearnMoreURL");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "copy");
  footerLearnMoreURL = v13->_footerLearnMoreURL;
  v13->_footerLearnMoreURL = (NSURL *)v119;

  v13->_forbiddenBadges = objc_msgSend(v9, "forbiddenBadges");
  v13->_allowsInteractiveFavoriteBadges = objc_msgSend(v9, "allowsInteractiveFavoriteBadges");
  objc_msgSend(v9, "optionsController");
  v121 = objc_claimAutoreleasedReturnValue();
  optionsController = v13->_optionsController;
  v13->_optionsController = (PXPhotosGridOptionsController *)v121;

  objc_msgSend(v9, "infoActionHandler");
  v123 = objc_claimAutoreleasedReturnValue();
  infoActionHandler = v13->_infoActionHandler;
  v13->_infoActionHandler = (id)v123;

  v13->_navBarStyle = objc_msgSend(v9, "navBarStyle");
  v13->_toolbarStyle = objc_msgSend(v9, "toolbarStyle");
  v13->_shouldOptOutOfChromelessBars = objc_msgSend(v9, "shouldOptOutOfChromelessBars");
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v125, "enableTitleLegibilityDimmingFilter"))
  {
    navBarStyle = v13->_navBarStyle;

    if (navBarStyle == 1)
      v13->_navBarStyle = 2;
  }
  else
  {

  }
  v13->_wantsModernNavBarButtons = objc_msgSend(v9, "wantsModernNavBarButtons");
  v13->_chromeOpacity = 1.0;
  v13->_allowedChromeItems = -1;
  v13->_allowedGesturesKind = 0;
  v127 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  enterSelectModePreventedForReasons = v13->_enterSelectModePreventedForReasons;
  v13->_enterSelectModePreventedForReasons = v127;

  v129 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  oneUpPresentationPreventedForReasons = v13->_oneUpPresentationPreventedForReasons;
  v13->_oneUpPresentationPreventedForReasons = v129;

  v131 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  aspectRatioTogglePreventedForReasons = v13->_aspectRatioTogglePreventedForReasons;
  v13->_aspectRatioTogglePreventedForReasons = v131;

  v133 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  hideSurroundingContentForReasons = v13->_hideSurroundingContentForReasons;
  v13->_hideSurroundingContentForReasons = v133;

  v13->_prefersActionsInToolbar = objc_msgSend(v9, "prefersActionsInToolbar");
  v13->_topBarsAppearanceChangeAnimationDuration = 0.25;
  objc_msgSend(v9, "footerViewModel");
  v135 = objc_claimAutoreleasedReturnValue();
  footerViewModel = v13->_footerViewModel;
  v13->_footerViewModel = (PXFooterViewModel *)v135;

  objc_msgSend(v9, "viewOptionsModel");
  v137 = objc_claimAutoreleasedReturnValue();
  viewOptionsModel = v13->_viewOptionsModel;
  v13->_viewOptionsModel = (PXPhotosViewOptionsModel *)v137;

  v13->_hidesViewOptionsToolbar = objc_msgSend(v9, "hidesViewOptionsToolbar");
  -[PXPhotosViewOptionsModel sortOrderState](v13->_viewOptionsModel, "sortOrderState");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "registerChangeObserver:context:", v13, SortOrderStateObservationContext);

  -[PXPhotosViewModel _updateSortOrder](v13, "_updateSortOrder");
  objc_msgSend(v9, "searchQueryMatchInfo");
  v140 = objc_claimAutoreleasedReturnValue();
  searchQueryMatchInfo = v13->_searchQueryMatchInfo;
  v13->_searchQueryMatchInfo = (PXSearchQueryMatchInfo *)v140;

  objc_msgSend(v9, "badgesModifier");
  v142 = objc_claimAutoreleasedReturnValue();
  badgesModifier = v13->_badgesModifier;
  v13->_badgesModifier = (id)v142;

  objc_msgSend(v10, "headerCustomizationModel");
  v144 = objc_claimAutoreleasedReturnValue();
  headerCustomizationModel = v13->_headerCustomizationModel;
  v13->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v144;

  -[PXPhotosViewModel _initialLibraryFilterStateForConfiguration:](v13, "_initialLibraryFilterStateForConfiguration:", v9);
  v146 = objc_claimAutoreleasedReturnValue();
  libraryFilterState = v13->_libraryFilterState;
  v13->_libraryFilterState = (PXLibraryFilterState *)v146;

  v13->_useLowMemoryDecode = objc_msgSend(v9, "useLowMemoryDecode");
  v13->_contentShiftStrategy = objc_msgSend(v9, "contentShiftStrategy");
  v13->_startsInSelectMode = objc_msgSend(v9, "startsInSelectMode");
  -[PXPhotosViewModel swift_initWithConfiguration:](v13, "swift_initWithConfiguration:", v9);
  if (objc_msgSend(off_1E50B1430, "px_accessibilityIsReduceMotionEnabled"))
  {
    v13->_allowsPreviewHeader = 0;
  }
  else
  {
    if (-[PXPhotosViewModel swift_collectionKindSupportsTogglingPreviewHeader](v13, "swift_collectionKindSupportsTogglingPreviewHeader"))
    {
      -[PXPhotosViewModel collectionKindPreviewHeaderDisabledUserDefaultsKey](v13, "collectionKindPreviewHeaderDisabledUserDefaultsKey");
      v148 = objc_claimAutoreleasedReturnValue();
      previewHeaderDisabledUserDefaultsKey = v13->_previewHeaderDisabledUserDefaultsKey;
      v13->_previewHeaderDisabledUserDefaultsKey = (NSString *)v148;

      v150 = objc_msgSend(v170, "BOOLForKey:", v13->_previewHeaderDisabledUserDefaultsKey) ^ 1;
    }
    else
    {
      v151 = v13->_previewHeaderDisabledUserDefaultsKey;
      v13->_previewHeaderDisabledUserDefaultsKey = 0;

      v150 = 1;
    }
    v13->_allowsPreviewHeader = v150;
  }
  PLGridZeroGetLog();
  v152 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
  {
    allowsPreviewHeader = v13->_allowsPreviewHeader;
    v154 = v13->_previewHeaderDisabledUserDefaultsKey;
    *(_DWORD *)buf = 67109378;
    v175 = allowsPreviewHeader;
    v176 = 2112;
    v177 = v154;
    _os_log_impl(&dword_1A6789000, v152, OS_LOG_TYPE_DEBUG, "preview header allowed: %i key: %@", buf, 0x12u);
  }

  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = __80__PXPhotosViewModel_initWithConfiguration_specManager_inlinePlaybackController___block_invoke;
  v171[3] = &unk_1E51437F8;
  v155 = v13;
  v172 = v155;
  -[PXPhotosViewModel performChanges:](v155, "performChanges:", v171);
  -[PXPhotosViewModel dataSourceManager](v155, "dataSourceManager");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "dataSource");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "containerCollection");
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v159 = v155->_previewHeaderDisabledUserDefaultsKey;
  if (v159)
    objc_msgSend(v170, "addObserver:forKeyPath:options:context:", v155, v159, 0, UserDefaultsPreviewHeaderDisabledObservationContext);
  if ((objc_msgSend(v158, "px_isContentSyndicationAlbum") & 1) == 0)
    objc_msgSend(v170, "addObserver:forKeyPath:options:context:", v155, CFSTR("IncludeSharedWithYou"), 0, UserDefaultsIncludeSharedWithYouObservationContext);
  v13->_isInitializing = 0;

LABEL_70:
  return v13;
}

- (PXPhotosViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel.m"), 486, CFSTR("%s is not available as initializer"), "-[PXPhotosViewModel init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *previewHeaderDisabledUserDefaultsKey;
  objc_super v9;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  previewHeaderDisabledUserDefaultsKey = self->_previewHeaderDisabledUserDefaultsKey;
  if (previewHeaderDisabledUserDefaultsKey)
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, previewHeaderDisabledUserDefaultsKey, UserDefaultsPreviewHeaderDisabledObservationContext);
  if ((objc_msgSend(v5, "px_isContentSyndicationAlbum") & 1) == 0)
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("IncludeSharedWithYou"), UserDefaultsIncludeSharedWithYouObservationContext);

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosViewModel;
  -[PXPhotosViewModel dealloc](&v9, sel_dealloc);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p currentDataSource:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewModel;
  -[PXPhotosViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)_updateDataSourceDependentProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "libraryFilter");
  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    -[PXPhotosViewModel libraryFilterState](self, "libraryFilterState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setViewMode:", v5);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PXPhotosViewModel__updateDataSourceDependentProperties__block_invoke;
    v11[3] = &unk_1E5135B78;
    v12 = v4;
    v13 = v7;
    -[PXPhotosViewModel performChanges:](self, "performChanges:", v11);

  }
}

- (id)_initialLibraryFilterStateForConfiguration:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  PXLibraryFilterState *v7;
  PXLibraryFilterState *v8;
  void *v9;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreSharedLibraryFilters");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(PXLibraryFilterState);
  }
  else
  {
    v8 = [PXLibraryFilterState alloc];
    -[PXPhotosViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:](v8, "initWithSharedLibraryStatusProvider:", v9);

  }
  return v7;
}

- (id)_initialContentFilterState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotosViewModel alwaysIncludeSharedWithYouAssets](self, "alwaysIncludeSharedWithYouAssets"))
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "includeSharedWithYou");
  objc_msgSend(v12, "setIncludeSharedWithYou:", v13);

  return v12;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosViewModel;
  -[PXPhotosViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXPhotosViewModel swift_didPerformChanges](self, "swift_didPerformChanges");
  -[PXPhotosViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateTopBarsStyles
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTopBarsStyles);

}

- (void)_updateTopBarsStyles
{
  _BOOL8 v3;

  v3 = (-[PXPhotosViewModel navBarStyle](self, "navBarStyle") == 1
     || -[PXPhotosViewModel navBarStyle](self, "navBarStyle") == 2
     || -[PXPhotosViewModel navBarStyle](self, "navBarStyle") == 3
     || -[PXPhotosViewModel navBarStyle](self, "navBarStyle") == 6)
    && (-[PXPhotosViewModel isContentBelowTitle](self, "isContentBelowTitle")
     || -[PXPhotosViewModel isEmbedded](self, "isEmbedded"))
    && !-[PXPhotosViewModel isShowingAlternateContent](self, "isShowingAlternateContent")
    && (!-[PXPhotosViewModel hidesNavbar](self, "hidesNavbar")
     || -[PXPhotosViewModel wantsModernNavBarButtons](self, "wantsModernNavBarButtons"))
    || -[PXPhotosViewModel alwaysRequiresLightChrome](self, "alwaysRequiresLightChrome");
  -[PXPhotosViewModel setRequiresLightTopBars:](self, "setRequiresLightTopBars:", v3);
}

- (void)_invalidateUserWantsAspectFitContent
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateUserWantsAspectFitContent);

}

- (void)_updateUserWantsAspectFitContent
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photosGridAspectFit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel specManager](self, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") != 2)
  {

    goto LABEL_5;
  }
  v6 = -[PXPhotosViewModel isInCompactMode](self, "isInCompactMode");

  if (v6)
  {
    objc_msgSend(v7, "photosGridAspectFitInCompact");
    v4 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  }
  -[PXPhotosViewModel setUserWantsAspectFitContent:](self, "setUserWantsAspectFitContent:", v3);

}

- (void)_invalidateAspectFitContent
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAspectFitContent);

}

- (void)_updateAspectFitContent
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_allowsAspectFitToggle && !-[NSMutableSet count](self->_aspectRatioTogglePreventedForReasons, "count"))
  {
    -[PXPhotosViewModel currentLens](self, "currentLens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (unint64_t)(objc_msgSend(v4, "defaultSectionBodyStyle") - 6) < 0xFFFFFFFFFFFFFFFCLL;

  }
  else
  {
    v3 = 0;
  }
  -[PXPhotosViewModel setSupportsAspectRatioToggle:](self, "setSupportsAspectRatioToggle:", v3);
  v5 = -[PXPhotosViewModel shouldAspectFitContentByDefault](self, "shouldAspectFitContentByDefault");
  if (self->_allowsAspectFitToggle)
  {
    -[PXPhotosViewModel userWantsAspectFitContent](self, "userWantsAspectFitContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXPhotosViewModel userWantsAspectFitContent](self, "userWantsAspectFitContent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "BOOLValue");

    }
  }
  -[PXPhotosViewModel setAspectFitContent:](self, "setAspectFitContent:", v5);
}

- (void)_invalidateChromeVisibility
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChromeVisibility);

}

- (void)_updateChromeVisibility
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;

  v3 = -[PXPhotosViewModel allowsChromeManagementBehavior](self, "allowsChromeManagementBehavior");
  v4 = -[PXPhotosViewModel isEmbedded](self, "isEmbedded");
  v5 = -[PXPhotosViewModel isInSelectMode](self, "isInSelectMode");
  v14 = -[PXPhotosViewModel isInCompactMode](self, "isInCompactMode");
  if (v3)
  {
    -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsAnyItems") ^ 1;

  }
  else
  {
    v7 = 0;
  }
  if (-[PXPhotosViewModel navBarStyle](self, "navBarStyle"))
    v8 = -[PXPhotosViewModel navBarStyle](self, "navBarStyle") != 7;
  else
    v8 = 0;
  v9 = !-[PXPhotosViewModel hidesNavbar](self, "hidesNavbar")
    && -[PXPhotosViewModel navBarStyle](self, "navBarStyle") != 7
    && -[PXPhotosViewModel navBarStyle](self, "navBarStyle") != 6;
  v10 = -[PXPhotosViewModel contentPrivacyState](self, "contentPrivacyState");
  if (!v3)
  {
    v11 = 0;
    if (!v5)
      goto LABEL_13;
LABEL_15:
    v12 = 1;
    goto LABEL_16;
  }
  v11 = (v7 | !v5) & ~-[PXPhotosViewModel keepsTabBarAlwaysHidden](self, "keepsTabBarAlwaysHidden");
  if (v5)
    goto LABEL_15;
LABEL_13:
  v12 = -[PXPhotosViewModel prefersActionsInToolbar](self, "prefersActionsInToolbar") & (v11 ^ 1);
LABEL_16:
  v13 = 0;
  if ((v3 & (v7 ^ 1)) == 1 && v12)
  {
    if (v14 || v8)
    {
      if (v10 == 1)
      {
        v13 = 0;
        goto LABEL_24;
      }
LABEL_23:
      v13 = -[PXPhotosViewModel hidesToolbar](self, "hidesToolbar") ^ 1;
      goto LABEL_24;
    }
    v13 = 0;
    if (-[PXPhotosViewModel prefersActionsInToolbar](self, "prefersActionsInToolbar") && v10 != 1)
      goto LABEL_23;
  }
LABEL_24:
  -[PXPhotosViewModel setWantsNavbarVisible:](self, "setWantsNavbarVisible:", (v5 | ~v4) & v9);
  -[PXPhotosViewModel setWantsTabBarVisible:](self, "setWantsTabBarVisible:", v11);
  -[PXPhotosViewModel setWantsToolbarVisible:](self, "setWantsToolbarVisible:", v13);
}

- (void)_invalidateDraggedAssetReferences
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDraggedAssetReferences);

}

- (void)_updateDraggedAssetReferences
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPhotosViewModel draggedAssetReferences](self, "draggedAssetReferences", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  -[PXPhotosViewModel setDraggedAssetReferences:](self, "setDraggedAssetReferences:", v11);

}

- (void)_invalidateGridAppearance
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateGridAppearance);

}

- (void)_updateGridAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  -[PXPhotosViewModel specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsSpec");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "disableConfigurators") & 1) == 0)
  {
    -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "numberOfGridZoomStepsWithDataSource:", v6);

    if (-[PXPhotosViewModel supportsAspectRatioToggle](self, "supportsAspectRatioToggle"))
      v8 = objc_msgSend(v9, "supportsGridAspectRatioToggle");
    else
      v8 = 0;
    -[PXPhotosViewModel setNumberOfZoomSteps:](self, "setNumberOfZoomSteps:", v7);
    -[PXPhotosViewModel setSupportsAspectRatioToggle:](self, "setSupportsAspectRatioToggle:", v8);
  }

}

- (void)_invalidateFooterVisibility
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterVisibility);

}

- (void)_updateFooterVisibility
{
  int64_t footerVisibilityStyle;
  void *v4;
  uint64_t v5;

  footerVisibilityStyle = self->_footerVisibilityStyle;
  if (footerVisibilityStyle == 2
    || footerVisibilityStyle == 1 && -[PXPhotosViewModel hasScrollableContent](self, "hasScrollableContent"))
  {
    -[PXPhotosViewModel currentLens](self, "currentLens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsFooter");

  }
  else
  {
    v5 = 0;
  }
  -[PXPhotosViewModel setWantsFooterVisible:](self, "setWantsFooterVisible:", v5);
}

- (PXFooterViewModel)footerViewModel
{
  PXFooterViewModel *footerViewModel;
  PXFooterViewModel *v4;
  PXFooterViewModel *v5;

  footerViewModel = self->_footerViewModel;
  if (!footerViewModel)
  {
    v4 = objc_alloc_init(PXFooterViewModel);
    v5 = self->_footerViewModel;
    self->_footerViewModel = v4;

    -[PXFooterViewModel configureWithPhotosEnvironment:](self->_footerViewModel, "configureWithPhotosEnvironment:", self);
    footerViewModel = self->_footerViewModel;
  }
  return footerViewModel;
}

- (void)_invalidateAssetsDataSourceManager
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetsDataSourceManager);

}

- (void)_updateAssetsDataSourceManager
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  SEL v35;
  char v36;
  char v37;
  _QWORD v38[4];
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;

  -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFiltering") & 1) != 0)
  {

  }
  else
  {
    v5 = -[PXPhotosViewModel ignoreContentFilterStateWhenNotFiltering](self, "ignoreContentFilterStateWhenNotFiltering");

    if (v5)
      return;
  }
  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosViewModel visibleAssetCollections](self, "visibleAssetCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__60419;
  v41[4] = __Block_byref_object_dispose__60420;
  objc_msgSend(v8, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v9, "mutableCopy");

  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke;
  v38[3] = &unk_1E511E968;
  v40 = v41;
  v13 = v7;
  v39 = v13;
  objc_msgSend(v11, "enumerateItemIndexSetsUsingBlock:", v38);

  v14 = objc_msgSend(v13, "numberOfSections") > 1;
  objc_msgSend(v13, "containerCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "emulatesEmptyMomentShare");

  if (!v17)
  {
LABEL_8:
    -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateForUseCase:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(v13, "filterPredicate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  if (v20 == v21)
    v22 = 1;
  else
    v22 = objc_msgSend(v20, "isEqual:", v21);

  v23 = objc_msgSend(v13, "includeOthersInSocialGroupAssets");
  -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "includeOthersInSocialGroupAssets");

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke_2;
  v30[3] = &unk_1E511E990;
  v36 = v22 ^ 1;
  v37 = v23 ^ v25;
  v30[4] = self;
  v35 = a2;
  v27 = v13;
  v31 = v27;
  v28 = v21;
  v32 = v28;
  v29 = v8;
  v33 = v29;
  v34 = v41;
  objc_msgSend(v26, "performChanges:", v30);

  _Block_object_dispose(v41, 8);
}

- (void)_invalidateWantsContentFilterIndicatorVisible
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsContentFilterIndicatorVisible);

}

- (void)_updateWantsContentFilterIndicatorVisible
{
  void *v2;
  _BOOL4 v4;
  void *v5;
  id v6;

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXPhotosViewModel setWantsContentFilterIndicatorVisible:](self, "setWantsContentFilterIndicatorVisible:", 0);
    return;
  }
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "enableFilterIndicatorButton"))
  {
    v4 = -[PXPhotosViewModel wantsContentFilterVisible](self, "wantsContentFilterVisible");
    if (v4)
    {
      -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "isFiltering"))
      {
        -[PXPhotosViewModel setWantsContentFilterIndicatorVisible:](self, "setWantsContentFilterIndicatorVisible:", 1);
LABEL_9:

        goto LABEL_10;
      }
    }
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewModel setWantsContentFilterIndicatorVisible:](self, "setWantsContentFilterIndicatorVisible:", objc_msgSend(v5, "alwaysShowFilterIndicatorButton"));

    if (v4)
      goto LABEL_9;
  }
  else
  {
    -[PXPhotosViewModel setWantsContentFilterIndicatorVisible:](self, "setWantsContentFilterIndicatorVisible:", 0);
  }
LABEL_10:

}

- (void)_updateFilteringTimeoutObserver
{
  void *v3;
  NSObject *filterTimeoutObserver;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
  {
    filterTimeoutObserver = self->_filterTimeoutObserver;

    if (!filterTimeoutObserver)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__PXPhotosViewModel__updateFilteringTimeoutObserver__block_invoke;
      v12[3] = &unk_1E51441D8;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("PXPhotosResetViewNotificationName"), 0, 0, v12);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = self->_filterTimeoutObserver;
      self->_filterTimeoutObserver = v6;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isFiltering") & 1) != 0)
  {

  }
  else
  {
    v8 = self->_filterTimeoutObserver;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:", self->_filterTimeoutObserver);

      v10 = self->_filterTimeoutObserver;
      self->_filterTimeoutObserver = 0;

    }
  }
}

- (void)_invalidateEmptyPlaceholderState
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateEmptyPlaceholderState);

}

- (void)_updateEmptyPlaceholderState
{
  int64_t v3;
  void *v4;
  int v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPhotosViewModel contentPrivacyState](self, "contentPrivacyState");
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsAnyItems");

  v6 = objc_msgSend(v11, "isLoadingInitialDataSource");
  if ((v6 & 1) != 0 || (v5 & 1) != 0)
  {
    v7 = v3 == 1;
    v8 = 3;
    if (v5)
      v8 = 0;
    if (v6)
      goto LABEL_10;
  }
  else
  {
    if (objc_msgSend(v11, "isBackgroundFetching"))
    {
      v7 = v3 == 1;
LABEL_10:
      v8 = 2;
      goto LABEL_11;
    }
    v9 = -[PXPhotosViewModel showLoadingPlaceholderWhenEmpty](self, "showLoadingPlaceholderWhenEmpty");
    v7 = v3 == 1;
    if (v9)
      goto LABEL_10;
    v8 = 3;
  }
LABEL_11:
  if (v7)
    v10 = 1;
  else
    v10 = v8;
  -[PXPhotosViewModel setEmptyPlaceholderState:](self, "setEmptyPlaceholderState:", v10);

}

- (void)_invalidateContentPrivacyState
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentPrivacyState);

}

- (void)_updateContentPrivacyState
{
  void *v3;
  unsigned int v4;

  -[PXPhotosViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  -[PXPhotosViewModel setContentPrivacyState:](self, "setContentPrivacyState:", v4);
}

- (void)_invalidateSystemAuthenticationType
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSystemAuthenticationType);

}

- (void)_updateSystemAuthenticationType
{
  void *v3;
  uint64_t v4;

  -[PXPhotosViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authenticationType");

  -[PXPhotosViewModel setSystemAuthenticationType:](self, "setSystemAuthenticationType:", v4);
}

- (void)_invalidateWantsContentUnavailableUnlockButtonVisible
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsContentUnavailableUnlockButtonVisible);

}

- (void)_updateWantsContentUnavailableUnlockButtonVisible
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unsigned int v7;

  -[PXPhotosViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "willPerformAuthenticationAutomatically");

  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldAlwaysShowUnlockButtonInContentUnavailableViews");

  -[PXPhotosViewModel setWantsContentUnavailableUnlockButtonVisible:](self, "setWantsContentUnavailableUnlockButtonVisible:", v4 ^ 1 | v7);
}

- (void)_invalidateAvailableLenses
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAvailableLenses);

}

- (void)_updateAvailableLenses
{
  id v3;
  void *v4;
  void *v5;
  PXPhotosViewLens *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[PXPhotosViewModel allowsLensControl](self, "allowsLensControl"))
  {
    v3 = 0;
  }
  else
  {
    -[PXPhotosViewModel availableLenses](self, "availableLenses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v3 = v4;
    }
    else
    {
      v6 = -[PXPhotosViewLens initWithTitle:symbolName:defaultSectionBodyStyle:]([PXPhotosViewLens alloc], "initWithTitle:symbolName:defaultSectionBodyStyle:", CFSTR("Configured"), 0, self->_configuredSectionBodyStyle);
      v7[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[PXPhotosViewModel setAvailableLenses:](self, "setAvailableLenses:", v3);

}

- (void)_invalidateCurrentLens
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentLens);

}

- (void)_updateCurrentLens
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[PXPhotosViewModel availableLenses](self, "availableLenses");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel currentLens](self, "currentLens");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[PXPhotosViewModel currentLens](self, "currentLens"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v8, "containsObject:", v5),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewModel setCurrentLens:](self, "setCurrentLens:", v7);

  }
}

- (void)_invalidateWantsLensControlVisible
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsLensControlVisible);

}

- (void)_updateWantsLensControlVisible
{
  int64_t v3;
  uint64_t v4;

  if (-[PXPhotosViewModel allowsLensControl](self, "allowsLensControl")
    && (v3 = -[PXPhotosViewModel contentPrivacyState](self, "contentPrivacyState"),
        !-[PXPhotosViewModel neverShowsLensControl](self, "neverShowsLensControl")))
  {
    v4 = (v3 != 1) & ~-[PXPhotosViewModel isInSelectMode](self, "isInSelectMode");
  }
  else
  {
    v4 = 0;
  }
  -[PXPhotosViewModel setWantsLensControlVisible:](self, "setWantsLensControlVisible:", v4);
}

- (void)_updateSortOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[PXPhotosViewModel viewOptionsModel](self, "viewOptionsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sortOrderState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXFetchSortOrderStandardAssetSortDescriptors(objc_msgSend(v5, "sortOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__PXPhotosViewModel__updateSortOrder__block_invoke;
    v9[3] = &unk_1E5145F88;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "performChanges:", v9);

  }
}

- (void)_invalidateCurrentDataSourceContainer
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentDataSourceContainer);

}

- (void)_updateCurrentDataSourceContainer
{
  void *v3;
  id v4;

  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel setCurrentDataSourceContainer:](self, "setCurrentDataSourceContainer:", v3);

}

- (void)setCurrentDataSourceContainer:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_currentDataSourceContainer != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_currentDataSourceContainer, a3);
    -[PXPhotosViewModel _invalidatePersonContainerProperties](self, "_invalidatePersonContainerProperties");
    v5 = v6;
  }

}

- (void)_invalidatePersonContainerProperties
{
  id v2;

  -[PXPhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersonContainerProperties);

}

- (void)_updatePersonContainerProperties
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[PXPhotosViewModel assetCollectionActionManager](self, "assetCollectionActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel.m"), 890, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("container"), v19, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel.m"), 890, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("container"), v19);
    }

LABEL_4:
    v25[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:photoLibrary:](PXPeopleUtilities, "peopleFetchResultFromFastEnumeration:photoLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPeople:", v10);

    -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", objc_msgSend(v7, "assetSortOrder"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortDescriptors");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 == v12)
    {

      v16 = v12;
    }
    else
    {
      v14 = v13;
      v15 = objc_msgSend(v13, "isEqual:", v12);

      if ((v15 & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke;
      block[3] = &unk_1E5148D08;
      v23 = v11;
      v24 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v16 = v23;
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (int64_t)selectionContext
{
  int64_t selectionContext;
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  selectionContext = self->_selectionContext;
  if (!selectionContext)
  {
    -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "px_isSmartAlbum"))
    {
      if ((objc_msgSend(v4, "px_isRecentlyDeletedSmartAlbum") & 1) != 0)
      {
        selectionContext = 21;
LABEL_14:

        return selectionContext;
      }
      v5 = objc_msgSend(v4, "px_isRecoveredSmartAlbum") == 0;
      v6 = 27;
      v7 = 22;
    }
    else
    {
      if ((objc_msgSend(v4, "px_isMoment") & 1) != 0)
      {
        selectionContext = 14;
        goto LABEL_14;
      }
      if ((objc_msgSend(v4, "px_isImportSessionCollection") & 1) != 0
        || (objc_msgSend(v4, "px_isImportHistoryCollection") & 1) != 0)
      {
        selectionContext = 6;
        goto LABEL_14;
      }
      if ((objc_msgSend(v4, "px_isContentSyndicationAlbum") & 1) != 0)
      {
        selectionContext = 29;
        goto LABEL_14;
      }
      v5 = objc_msgSend(v4, "px_isSharedAlbum") == 0;
      v6 = 28;
      v7 = 24;
    }
    if (v5)
      selectionContext = v6;
    else
      selectionContext = v7;
    goto LABEL_14;
  }
  return selectionContext;
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  void *v7;
  __int128 v8;
  char v9;
  void *v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  char v15;
  BOOL v16;
  _OWORD v17[2];

  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v8;
  v9 = objc_msgSend(v7, "isIndexPathSelected:", v17);

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PXPhotosViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke;
  v12[3] = &__block_descriptor_66_e37_v16__0___PXMutableSelectionManager__8l;
  v15 = v9;
  v11 = *(_OWORD *)&a3->item;
  v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  v14 = v11;
  v16 = a4;
  objc_msgSend(v10, "performChanges:", v12);

}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v4[2];

  v3 = *(_OWORD *)&a3->item;
  v4[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[1] = v3;
  -[PXPhotosViewModel toggleSelectionForIndexPath:updateCursorIndexPath:](self, "toggleSelectionForIndexPath:updateCursorIndexPath:", v4, 0);
}

- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _BYTE buf[32];
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPathForAssetReference:", v6);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  if ((_QWORD)v11 == *(_QWORD *)off_1E50B7E98)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "can't toggle selection for %@ because it's not in %@", buf, 0x16u);

    }
  }
  else
  {
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v12;
    -[PXPhotosViewModel toggleSelectionForIndexPath:updateCursorIndexPath:](self, "toggleSelectionForIndexPath:updateCursorIndexPath:", buf, v4);
  }

}

- (void)toggleSelectionForAssetReference:(id)a3
{
  -[PXPhotosViewModel toggleSelectionForAssetReference:updateCursorIndexPath:](self, "toggleSelectionForAssetReference:updateCursorIndexPath:", a3, 0);
}

- (void)toggleSelectionForAssetCollectionReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;

  -[PXPhotosViewModel _indexPathsForAssetCollectionReference:](self, "_indexPathsForAssetCollectionReference:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isSubsetOfSet:", v6);

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PXPhotosViewModel_toggleSelectionForAssetCollectionReference___block_invoke;
  v10[3] = &unk_1E5144348;
  v12 = v7;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performChanges:", v10);

}

- (void)clickSelectIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  __int128 v8;
  char v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];

  v4 = a4;
  -[PXPhotosViewModel selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->item;
  v27[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v27[1] = v8;
  v9 = objc_msgSend(v7, "isIndexPathSelected:", v27);

  if ((v9 & 1) != 0)
  {
    if (!v4)
      return;
    -[PXPhotosViewModel selectionManager](self, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke_2;
    v18 = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v12 = *(_OWORD *)&a3->item;
    v19 = *(_OWORD *)&a3->dataSourceIdentifier;
    v20 = v12;
    v13 = &v15;
  }
  else
  {
    -[PXPhotosViewModel selectionManager](self, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke;
    v24 = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v14 = *(_OWORD *)&a3->item;
    v25 = *(_OWORD *)&a3->dataSourceIdentifier;
    v26 = v14;
    v13 = &v21;
  }
  objc_msgSend(v10, "performChanges:", v13, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);

}

- (void)clickSelectAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _BYTE buf[32];
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPathForAssetReference:", v6);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  if ((_QWORD)v11 == *(_QWORD *)off_1E50B7E98)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "can't toggle selection for %@ because it's not in %@", buf, 0x16u);

    }
  }
  else
  {
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v12;
    -[PXPhotosViewModel clickSelectIndexPath:updateCursorIndexPath:](self, "clickSelectIndexPath:updateCursorIndexPath:", buf, v4);
  }

}

- (id)_indexPathsForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "indexPathForAssetCollectionReference:", v4);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(v7, "indexPathSetForItemsInIndexPath:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setKeepsTabBarAlwaysHidden:(BOOL)a3
{
  if (self->_keepsTabBarAlwaysHidden != a3)
  {
    self->_keepsTabBarAlwaysHidden = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
    -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
  }
}

- (void)setHidesNavbar:(BOOL)a3
{
  if (self->_hidesNavbar != a3)
  {
    self->_hidesNavbar = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
    -[PXPhotosViewModel _invalidateTopBarsStyles](self, "_invalidateTopBarsStyles");
    -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
  }
}

- (void)setHidesToolbar:(BOOL)a3
{
  if (self->_hidesToolbar != a3)
  {
    self->_hidesToolbar = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
    -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
  }
}

- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3
{
  if (self->_showLoadingPlaceholderWhenEmpty != a3)
  {
    self->_showLoadingPlaceholderWhenEmpty = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
    -[PXPhotosViewModel _invalidateEmptyPlaceholderState](self, "_invalidateEmptyPlaceholderState");
  }
}

- (void)setAllowsEmptyPlaceholderBehavior:(BOOL)a3
{
  if (self->_allowsEmptyPlaceholderBehavior != a3)
  {
    self->_allowsEmptyPlaceholderBehavior = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0);
    -[PXPhotosViewModel _invalidateEmptyPlaceholderState](self, "_invalidateEmptyPlaceholderState");
  }
}

- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3
{
  if (self->_shouldAlwaysRespectToolbarActionPlacementPreference != a3)
  {
    self->_shouldAlwaysRespectToolbarActionPlacementPreference = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x2000000000);
  }
}

- (void)noteFullscreenOverlayControllersChanged
{
  -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x400000000000);
}

- (void)markContentAsViewed
{
  id v2;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markContentAsViewed");

}

- (void)setCurrentDataSource:(id)a3
{
  PXAssetsDataSource *v5;
  PXAssetsDataSource *v6;
  char v7;
  PXAssetsDataSource *v8;

  v8 = (PXAssetsDataSource *)a3;
  v5 = self->_currentDataSource;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetsDataSource isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentDataSource, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 1);
      -[PXPhotosViewModel _invalidateDraggedAssetReferences](self, "_invalidateDraggedAssetReferences");
      -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
      -[PXPhotosViewModel _invalidateEmptyPlaceholderState](self, "_invalidateEmptyPlaceholderState");
      -[PXPhotosViewModel _invalidateCurrentDataSourceContainer](self, "_invalidateCurrentDataSourceContainer");
    }
  }

}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  PXSelectionSnapshot *v6;
  char v7;
  PXSelectionSnapshot *v8;

  v8 = (PXSelectionSnapshot *)a3;
  v5 = self->_selectionSnapshot;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXSelectionSnapshot isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setIsInSelectMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_isInSelectMode != a3)
  {
    v3 = a3;
    self->_isInSelectMode = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 4);
    if (!v3)
    {
      -[PXPhotosViewModel selectionManager](self, "selectionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performChanges:", &__block_literal_global_251_60384);

    }
    -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
    -[PXPhotosViewModel _invalidateWantsLensControlVisible](self, "_invalidateWantsLensControlVisible");
    -[PXPhotosViewModel setScrollDisabled:axis:forReason:](self, "setScrollDisabled:axis:forReason:", v3, 2, CFSTR("selectMode"));
    -[PXPhotosViewModel setModalInPresentation:forReason:](self, "setModalInPresentation:forReason:", v3, CFSTR("selectMode"));
  }
}

- (BOOL)attemptSetInSelectMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!-[PXPhotosViewModel canExitSelectMode](self, "canExitSelectMode"))
      goto LABEL_3;
LABEL_6:
    -[PXPhotosViewModel setIsInSelectMode:](self, "setIsInSelectMode:", v3);
    return 1;
  }
  if (-[PXPhotosViewModel canEnterSelectMode](self, "canEnterSelectMode"))
    goto LABEL_6;
LABEL_3:
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v9 = 138412290;
    v10 = v8;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Attempted to change selection mode to:%@, but it isn't allowed.", (uint8_t *)&v9, 0xCu);

  }
  return 0;
}

- (void)setEnterSelectModeAllowed:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  NSMutableSet *enterSelectModePreventedForReasons;

  v4 = a3;
  v6 = a4;
  v7 = -[PXPhotosViewModel canEnterSelectMode](self, "canEnterSelectMode");
  enterSelectModePreventedForReasons = self->_enterSelectModePreventedForReasons;
  if (v4)
    -[NSMutableSet removeObject:](enterSelectModePreventedForReasons, "removeObject:", v6);
  else
    -[NSMutableSet addObject:](enterSelectModePreventedForReasons, "addObject:", v6);

  if (v7 != -[PXPhotosViewModel canEnterSelectMode](self, "canEnterSelectMode"))
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x200000);
}

- (BOOL)canEnterSelectMode
{
  _BOOL4 v3;

  v3 = -[PXPhotosViewModel allowsSelectModeToggle](self, "allowsSelectModeToggle");
  if (v3)
    LOBYTE(v3) = -[NSMutableSet count](self->_enterSelectModePreventedForReasons, "count") == 0;
  return v3;
}

- (BOOL)canSwipeSelect
{
  _BOOL4 v3;

  v3 = -[PXPhotosViewModel isInSelectMode](self, "isInSelectMode");
  if (v3)
    LOBYTE(v3) = -[NSMutableSet count](self->_enterSelectModePreventedForReasons, "count") == 0;
  return v3;
}

- (void)selectAll
{
  id v2;

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_254);

}

- (void)deselectAll
{
  id v2;

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_255);

}

- (BOOL)canFilterContent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsFiltering"))
  {
    -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isFiltering") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "containsAnyItems");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setOneUpPresentationAllowed:(BOOL)a3 forReason:(id)a4
{
  NSMutableSet *oneUpPresentationPreventedForReasons;

  oneUpPresentationPreventedForReasons = self->_oneUpPresentationPreventedForReasons;
  if (a3)
    -[NSMutableSet removeObject:](oneUpPresentationPreventedForReasons, "removeObject:", a4);
  else
    -[NSMutableSet addObject:](oneUpPresentationPreventedForReasons, "addObject:", a4);
}

- (void)setAspectRatioToggleAllowed:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *aspectRatioTogglePreventedForReasons;
  id v7;
  uint64_t v8;
  NSMutableSet *v9;

  v4 = a3;
  aspectRatioTogglePreventedForReasons = self->_aspectRatioTogglePreventedForReasons;
  v7 = a4;
  v8 = -[NSMutableSet count](aspectRatioTogglePreventedForReasons, "count");
  v9 = self->_aspectRatioTogglePreventedForReasons;
  if (v4)
    -[NSMutableSet removeObject:](v9, "removeObject:", v7);
  else
    -[NSMutableSet addObject:](v9, "addObject:", v7);

  if ((v8 == 0) == (-[NSMutableSet count](self->_aspectRatioTogglePreventedForReasons, "count") != 0))
    -[PXPhotosViewModel _invalidateAspectFitContent](self, "_invalidateAspectFitContent");
}

- (void)setHideSurroundingContent:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  NSMutableSet *hideSurroundingContentForReasons;

  v4 = a3;
  v6 = a4;
  v7 = -[PXPhotosViewModel hideSurroundingContent](self, "hideSurroundingContent");
  hideSurroundingContentForReasons = self->_hideSurroundingContentForReasons;
  if (v4)
    -[NSMutableSet addObject:](hideSurroundingContentForReasons, "addObject:", v6);
  else
    -[NSMutableSet removeObject:](hideSurroundingContentForReasons, "removeObject:", v6);

  if (v7 != -[PXPhotosViewModel hideSurroundingContent](self, "hideSurroundingContent"))
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x20000000);
}

- (BOOL)hideSurroundingContent
{
  return -[NSMutableSet count](self->_hideSurroundingContentForReasons, "count") != 0;
}

- (void)setScrollDisabled:(BOOL)a3 axis:(int64_t)a4 forReason:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v8;
  NSMutableDictionary *scrollDisabledReasonsByAxis;
  void *v10;
  void *v11;
  BOOL v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v6 = a3;
  v17 = a5;
  v8 = -[PXPhotosViewModel isScrollDisabledForAxis:](self, "isScrollDisabledForAxis:", a4);
  scrollDisabledReasonsByAxis = self->_scrollDisabledReasonsByAxis;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scrollDisabledReasonsByAxis, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = 1;
  else
    v12 = !v6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_scrollDisabledReasonsByAxis;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_scrollDisabledReasonsByAxis;
      self->_scrollDisabledReasonsByAxis = v14;

      v13 = self->_scrollDisabledReasonsByAxis;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, v16);

  }
  if (v6)
    objc_msgSend(v11, "addObject:", v17);
  else
    objc_msgSend(v11, "removeObject:", v17);
  if (v8 != -[PXPhotosViewModel isScrollDisabledForAxis:](self, "isScrollDisabledForAxis:", a4))
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x200000000000000);

}

- (BOOL)isScrollDisabledForAxis:(int64_t)a3
{
  NSMutableDictionary *scrollDisabledReasonsByAxis;
  void *v4;
  void *v5;
  BOOL v6;

  scrollDisabledReasonsByAxis = self->_scrollDisabledReasonsByAxis;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scrollDisabledReasonsByAxis, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)setModalInPresentation:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  NSMutableSet *modalInPresentationReasons;
  BOOL v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v6 = -[PXPhotosViewModel isModalInPresentation](self, "isModalInPresentation");
  modalInPresentationReasons = self->_modalInPresentationReasons;
  if (modalInPresentationReasons)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v10 = self->_modalInPresentationReasons;
    self->_modalInPresentationReasons = v9;

    modalInPresentationReasons = self->_modalInPresentationReasons;
  }
  if (v4)
    -[NSMutableSet addObject:](modalInPresentationReasons, "addObject:", v11);
  else
    -[NSMutableSet removeObject:](modalInPresentationReasons, "removeObject:", v11);
  if (v6 != -[PXPhotosViewModel isModalInPresentation](self, "isModalInPresentation"))
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x1000000000000000);

}

- (BOOL)isModalInPresentation
{
  return -[NSMutableSet count](self->_modalInPresentationReasons, "count") != 0;
}

- (BOOL)canPresentOneUp
{
  return self->_allowsOneUpPresentation
      && -[NSMutableSet count](self->_oneUpPresentationPreventedForReasons, "count") == 0;
}

- (void)setIsInCompactMode:(BOOL)a3
{
  if (self->_isInCompactMode != a3)
  {
    self->_isInCompactMode = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x2000);
    -[PXPhotosViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
    -[PXPhotosViewModel _invalidateUserWantsAspectFitContent](self, "_invalidateUserWantsAspectFitContent");
    -[PXPhotosViewModel _invalidateAspectFitContent](self, "_invalidateAspectFitContent");
  }
}

- (void)setAppearState:(int64_t)a3
{
  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 4096);
    -[PXPhotosViewModel setIsAppearing:](self, "setIsAppearing:", a3 == 1);
  }
}

- (void)setIsAppearing:(BOOL)a3
{
  if (self->_isAppearing != a3)
  {
    self->_isAppearing = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setDismissRequested:(BOOL)a3
{
  if (self->_dismissRequested != a3)
  {
    self->_dismissRequested = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x40000000);
  }
}

- (void)setHasScrollableContent:(BOOL)a3
{
  if (self->_hasScrollableContent != a3)
  {
    self->_hasScrollableContent = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000);
    -[PXPhotosViewModel _invalidateFooterVisibility](self, "_invalidateFooterVisibility");
  }
}

- (void)setScrolledToTop:(BOOL)a3
{
  if (self->_scrolledToTop != a3)
  {
    self->_scrolledToTop = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x80000000);
  }
}

- (void)setScrolledToBottom:(BOOL)a3
{
  if (self->_scrolledToBottom != a3)
  {
    self->_scrolledToBottom = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000000000000);
  }
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *headerTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_headerTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      headerTitle = self->_headerTitle;
      self->_headerTitle = v6;

      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x80000000000000);
    }
  }

}

- (void)setHeaderSubtitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *headerSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_headerSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      headerSubtitle = self->_headerSubtitle;
      self->_headerSubtitle = v6;

      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x80000000000000);
    }
  }

}

- (void)setHeaderTitleTopInset:(double)a3
{
  if (self->_headerTitleTopInset != a3)
  {
    self->_headerTitleTopInset = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x10000000);
  }
}

- (void)setAllowsPreviewHeader:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_allowsPreviewHeader != a3)
  {
    v3 = a3;
    self->_allowsPreviewHeader = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x800000000000);
    -[PXPhotosViewModel previewHeaderDisabledUserDefaultsKey](self, "previewHeaderDisabledUserDefaultsKey");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBool:forKey:", !v3, v6);

    }
  }
}

- (void)setCustomLeadingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customLeadingAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customLeadingAccessoryView, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
    v5 = v6;
  }

}

- (void)setCustomTrailingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customTrailingAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customTrailingAccessoryView, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
    v5 = v6;
  }

}

- (void)setCustomBannerView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customBannerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customBannerView, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
    v5 = v6;
  }

}

- (void)setCplActionManagerClass:(Class)a3
{
  Class *p_cplActionManagerClass;

  p_cplActionManagerClass = &self->_cplActionManagerClass;
  if (*p_cplActionManagerClass != a3)
  {
    objc_storeStrong((id *)p_cplActionManagerClass, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000000000);
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v5 = self->_draggedAssetReferences;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setDropTargetAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 512);
    }
  }

}

- (void)setTapbackStatusManager:(id)a3
{
  PXTapbackStatusManager *v5;
  PXTapbackStatusManager *v6;

  v5 = (PXTapbackStatusManager *)a3;
  if (self->_tapbackStatusManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x4000000000);
    v5 = v6;
  }

}

- (PXAssetReference)singleSelectedAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[PXPhotosViewModel firstSelectedAssetReference](self, "firstSelectedAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (PXAssetReference *)v6;
}

- (PXAssetReference)firstSelectedAssetReference
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  -[PXPhotosViewModel selectionManager](self, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  if (v4
    && ((objc_msgSend(v4, "firstSelectedIndexPath"), (_QWORD)v11 != *(_QWORD *)off_1E50B7E98)
      ? (v5 = (_QWORD)v12 == 0x7FFFFFFFFFFFFFFFLL)
      : (v5 = 1),
        !v5 ? (v6 = *((_QWORD *)&v12 + 1) == 0x7FFFFFFFFFFFFFFFLL) : (v6 = 0),
        v6))
  {
    -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v11;
    v10[1] = v12;
    objc_msgSend(v8, "assetReferenceAtItemIndexPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (PXAssetReference *)v7;
}

- (void)setAspectFitContent:(BOOL)a3
{
  if (self->_aspectFitContent != a3)
  {
    self->_aspectFitContent = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_additionalAspectFitEdgeMargins;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_additionalAspectFitEdgeMargins = &self->_additionalAspectFitEdgeMargins;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_additionalAspectFitEdgeMargins->top = top;
    p_additionalAspectFitEdgeMargins->left = left;
    p_additionalAspectFitEdgeMargins->bottom = bottom;
    p_additionalAspectFitEdgeMargins->right = right;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x4000000000000);
  }
}

- (void)setChromeOpacity:(double)a3
{
  if (self->_chromeOpacity != a3)
  {
    self->_chromeOpacity = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x2000000000000000);
  }
}

- (void)setAlwaysRequiresLightChrome:(BOOL)a3
{
  if (self->_alwaysRequiresLightChrome != a3)
  {
    self->_alwaysRequiresLightChrome = a3;
    -[PXPhotosViewModel _invalidateTopBarsStyles](self, "_invalidateTopBarsStyles");
  }
}

- (void)setAllowedChromeItems:(unint64_t)a3
{
  if (self->_allowedChromeItems != a3)
  {
    self->_allowedChromeItems = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setChromeItemsToBeConsideredVisibleForLayoutPurpose:(unint64_t)a3
{
  if (self->_chromeItemsToBeConsideredVisibleForLayoutPurpose != a3)
  {
    self->_chromeItemsToBeConsideredVisibleForLayoutPurpose = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x2000000000000000);
  }
}

- (BOOL)wantsSelectButton
{
  _BOOL8 v3;

  LODWORD(v3) = -[PXPhotosViewModel canEnterSelectMode](self, "canEnterSelectMode");
  if (v3)
    return (-[PXPhotosViewModel allowedChromeItems](self, "allowedChromeItems") >> 2) & 1;
  return v3;
}

- (int64_t)searchActionLocation
{
  void *v4;
  void *v5;
  int64_t v6;

  if (!-[PXPhotosViewModel allowsSearch](self, "allowsSearch")
    || (-[PXPhotosViewModel allowedChromeItems](self, "allowedChromeItems") & 8) == 0)
  {
    return 0;
  }
  -[PXPhotosViewModel specManager](self, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "searchActionLocation");

  return v6;
}

- (void)setAllowedGesturesKind:(int64_t)a3
{
  self->_allowedGesturesKind = a3;
}

- (void)setTopDismissAreaHeight:(id)a3
{
  NSNumber *v4;
  NSNumber *topDismissAreaHeight;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  topDismissAreaHeight = self->_topDismissAreaHeight;
  self->_topDismissAreaHeight = v4;

}

- (BOOL)shouldAspectFitContentByDefault
{
  int64_t contentMode;
  BOOL v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  contentMode = self->_contentMode;
  if (contentMode)
    return contentMode == 2;
  -[PXPhotosViewModel specManager](self, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "userInterfaceIdiom") == 4 || !-[PXPhotosViewModel isInCompactMode](self, "isInCompactMode"))
    && (unint64_t)(-[PXPhotosViewModel gridStyle](self, "gridStyle") - 3) <= 0xFFFFFFFFFFFFFFFDLL
    && (-[PXPhotosViewModel itemAspectRatio](self, "itemAspectRatio"), v7 == 1.0))
  {
    -[PXPhotosViewModel specManager](self, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v9, "userInterfaceIdiom") != 5;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setUserWantsAspectFitContent:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  char v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *userWantsAspectFitContent;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSNumber *v14;

  v14 = (NSNumber *)a3;
  v4 = self->_userWantsAspectFitContent;
  if (v4 == v14)
  {

LABEL_10:
    v7 = v14;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSNumber isEqual:](v4, "isEqual:", v14);

  v7 = v14;
  if ((v6 & 1) == 0)
  {
    v8 = (NSNumber *)-[NSNumber copy](v14, "copy");
    userWantsAspectFitContent = self->_userWantsAspectFitContent;
    self->_userWantsAspectFitContent = v8;

    -[PXPhotosViewModel specManager](self, "specManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceIdiom") == 2)
    {
      v12 = -[PXPhotosViewModel isInCompactMode](self, "isInCompactMode");

      if (v12)
      {
        +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPhotosGridAspectFitInCompact:", v14);
LABEL_9:

        -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x4000000);
        -[PXPhotosViewModel _invalidateAspectFitContent](self, "_invalidateAspectFitContent");
        goto LABEL_10;
      }
    }
    else
    {

    }
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPhotosGridAspectFit:", v14);
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setZoomStep:(double)a3
{
  if (self->_zoomStep != a3)
  {
    self->_zoomStep = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x10000);
    -[PXPhotosViewModel _invalidateGridAppearance](self, "_invalidateGridAppearance");
  }
}

- (void)setNumberOfZoomSteps:(int64_t)a3
{
  if (self->_numberOfZoomSteps != a3)
  {
    self->_numberOfZoomSteps = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setYearsMonthsZoomStepRange:(_NSRange)a3
{
  if (self->_yearsMonthsZoomStepRange.location != a3.location || self->_yearsMonthsZoomStepRange.length != a3.length)
  {
    self->_yearsMonthsZoomStepRange = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setIsInteractiveZooming:(BOOL)a3
{
  if (self->_isInteractiveZooming != a3)
  {
    self->_isInteractiveZooming = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)setShouldAnimateZooming:(BOOL)a3
{
  if (self->_shouldAnimateZooming != a3)
    self->_shouldAnimateZooming = a3;
}

- (void)setZoomAnchorAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;

  v5 = (PXAssetReference *)a3;
  if (self->_zoomAnchorAssetReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_zoomAnchorAssetReference, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x20000);
    v5 = v6;
  }

}

- (void)setZoomStep:(double)a3 isInteractive:(BOOL)a4 shouldAnimate:(BOOL)a5 anchorAssetReference:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  -[PXPhotosViewModel setZoomStep:](self, "setZoomStep:", a3);
  -[PXPhotosViewModel setIsInteractiveZooming:](self, "setIsInteractiveZooming:", v7);
  -[PXPhotosViewModel setShouldAnimateZooming:](self, "setShouldAnimateZooming:", v6);
  -[PXPhotosViewModel setZoomAnchorAssetReference:](self, "setZoomAnchorAssetReference:", v10);

}

- (void)setSupportsAspectRatioToggle:(BOOL)a3
{
  if (self->_supportsAspectRatioToggle != a3)
  {
    self->_supportsAspectRatioToggle = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x40000000000);
  }
}

- (void)setWantsTabBarVisible:(BOOL)a3
{
  if (self->_wantsTabBarVisible != a3)
  {
    self->_wantsTabBarVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setWantsNavbarVisible:(BOOL)a3
{
  if (self->_wantsNavbarVisible != a3)
  {
    self->_wantsNavbarVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setWantsToolbarVisible:(BOOL)a3
{
  if (self->_wantsToolbarVisible != a3)
  {
    self->_wantsToolbarVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setContentBelowTitle:(BOOL)a3
{
  if (self->_contentBelowTitle != a3)
  {
    self->_contentBelowTitle = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x400000);
    -[PXPhotosViewModel _invalidateTopBarsStyles](self, "_invalidateTopBarsStyles");
  }
}

- (void)setShowingAlternateContent:(BOOL)a3
{
  if (self->_showingAlternateContent != a3)
  {
    self->_showingAlternateContent = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x800000);
    -[PXPhotosViewModel _invalidateTopBarsStyles](self, "_invalidateTopBarsStyles");
  }
}

- (void)setRequiresLightTopBars:(BOOL)a3
{
  if (self->_requiresLightTopBars != a3)
  {
    self->_requiresLightTopBars = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x1000000);
  }
}

- (void)setContentPrivacyState:(int64_t)a3
{
  if (self->_contentPrivacyState != a3)
  {
    self->_contentPrivacyState = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x400000000);
  }
}

- (void)setSystemAuthenticationType:(int64_t)a3
{
  if (self->_systemAuthenticationType != a3)
  {
    self->_systemAuthenticationType = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x10000000000);
  }
}

- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3
{
  if (self->_wantsContentUnavailableUnlockButtonVisible != a3)
  {
    self->_wantsContentUnavailableUnlockButtonVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x20000000000);
  }
}

- (void)setCurrentLens:(id)a3
{
  PXPhotosViewLens *v5;
  PXPhotosViewLens *v6;
  BOOL v7;
  PXPhotosViewLens *v8;

  v8 = (PXPhotosViewLens *)a3;
  v5 = self->_currentLens;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXPhotosViewLens isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLens, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000000000);
      -[PXPhotosViewModel _invalidateAssetsDataSourceManager](self, "_invalidateAssetsDataSourceManager");
      -[PXPhotosViewModel _invalidateFooterVisibility](self, "_invalidateFooterVisibility");
      -[PXPhotosViewModel _invalidateAspectFitContent](self, "_invalidateAspectFitContent");
    }
  }

}

- (void)setAvailableLenses:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *availableLenses;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_availableLenses;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      availableLenses = self->_availableLenses;
      self->_availableLenses = v6;

      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000000000);
      -[PXPhotosViewModel _invalidateCurrentLens](self, "_invalidateCurrentLens");
    }
  }

}

- (void)setWantsLensControlVisible:(BOOL)a3
{
  if (self->_wantsLensControlVisible != a3)
  {
    self->_wantsLensControlVisible = a3;
    -[PXPhotosViewModel _invalidateFooterVisibility](self, "_invalidateFooterVisibility");
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x80000000000);
  }
}

- (void)setDesiredCurationLength:(int64_t)a3
{
  if (self->_desiredCurationLength != a3)
  {
    self->_desiredCurationLength = a3;
    -[PXPhotosViewModel _invalidateAssetsDataSourceManager](self, "_invalidateAssetsDataSourceManager");
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x200000000000);
  }
}

- (void)setLastPreferredScrollDetent:(id)a3
{
  PXScrollDetent *v5;
  PXScrollDetent *v6;
  BOOL v7;
  PXScrollDetent *v8;

  v8 = (PXScrollDetent *)a3;
  v5 = self->_lastPreferredScrollDetent;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXScrollDetent isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_lastPreferredScrollDetent, a3);
      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x800000000000000);
    }
  }

}

- (void)setWantsContentFilterVisible:(BOOL)a3
{
  if (self->_wantsContentFilterVisible != a3)
  {
    self->_wantsContentFilterVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 16);
    -[PXPhotosViewModel _invalidateWantsContentFilterIndicatorVisible](self, "_invalidateWantsContentFilterIndicatorVisible");
  }
}

- (void)setWantsContentFilterIndicatorVisible:(BOOL)a3
{
  if (self->_wantsContentFilterIndicatorVisible != a3)
  {
    self->_wantsContentFilterIndicatorVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000000);
  }
}

- (void)setWantsFooterVisible:(BOOL)a3
{
  if (self->_wantsFooterVisible != a3)
  {
    self->_wantsFooterVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setFooterHasImportantInformation:(BOOL)a3
{
  if (self->_footerHasImportantInformation != a3)
  {
    self->_footerHasImportantInformation = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setFooterVisibilityStyle:(int64_t)a3
{
  if (self->_footerVisibilityStyle != a3)
  {
    self->_footerVisibilityStyle = a3;
    -[PXPhotosViewModel _updateFooterVisibility](self, "_updateFooterVisibility");
  }
}

- (void)setEmptyPlaceholderState:(int64_t)a3
{
  if (self->_emptyPlaceholderState != a3)
  {
    self->_emptyPlaceholderState = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x200000000);
  }
}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setCaptionsVisible:(BOOL)a3
{
  if (self->_captionsVisible != a3)
  {
    self->_captionsVisible = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  BOOL v5;
  PXContentFilterState *v6;
  PXContentFilterState *contentFilterState;
  PXContentFilterState *v8;

  v8 = (PXContentFilterState *)a3;
  v4 = self->_contentFilterState;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXContentFilterState isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXContentFilterState *)-[PXContentFilterState copy](v8, "copy");
      contentFilterState = self->_contentFilterState;
      self->_contentFilterState = v6;

      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x2000000);
      -[PXPhotosViewModel _invalidateAssetsDataSourceManager](self, "_invalidateAssetsDataSourceManager");
      -[PXPhotosViewModel _invalidateWantsContentFilterIndicatorVisible](self, "_invalidateWantsContentFilterIndicatorVisible");
      -[PXPhotosViewModel _invalidateWantsLensControlVisible](self, "_invalidateWantsLensControlVisible");
      -[PXPhotosViewModel _updateFilteringTimeoutObserver](self, "_updateFilteringTimeoutObserver");
    }
  }

}

- (void)setHeaderFloatingThresholdOffset:(double)a3
{
  if (self->_headerFloatingThresholdOffset != a3)
  {
    self->_headerFloatingThresholdOffset = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000000);
  }
}

- (void)setFloatingTitleOpacity:(double)a3
{
  if (self->_floatingTitleOpacity != a3)
  {
    self->_floatingTitleOpacity = a3;
    self->_wantsFloatingTitle = PXFloatEqualToFloatWithTolerance() ^ 1;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x100000000);
  }
}

- (NSOrderedSet)visibleAssetCollections
{
  return (NSOrderedSet *)self->_visibleAssetCollections;
}

- (void)setTitleBackgroundOpacity:(double)a3
{
  if (self->_titleBackgroundOpacity != a3)
  {
    self->_titleBackgroundOpacity = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x800000000);
  }
}

- (void)setContentBackgroundOpacity:(double)a3
{
  if (self->_contentBackgroundOpacity != a3)
  {
    self->_contentBackgroundOpacity = a3;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x20000000000000);
  }
}

- (void)setContentBackgroundInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_contentBackgroundInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_contentBackgroundInsets = &self->_contentBackgroundInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_contentBackgroundInsets->top = top;
    p_contentBackgroundInsets->left = left;
    p_contentBackgroundInsets->bottom = bottom;
    p_contentBackgroundInsets->right = right;
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x40000000000000);
  }
}

- (void)setEffectProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id effectProvider;
  id aBlock;

  aBlock = a3;
  v4 = _Block_copy(self->_effectProvider);
  v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = _Block_copy(aBlock);
      effectProvider = self->_effectProvider;
      self->_effectProvider = v8;

      -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x1000000000);
    }
  }

}

- (void)setNoContentPlaceholderFallbackTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_noContentPlaceholderFallbackTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_noContentPlaceholderFallbackTitle, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000000000000);
    v5 = v6;
  }

}

- (void)setNoContentPlaceholderFallbackMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_noContentPlaceholderFallbackMessage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_noContentPlaceholderFallbackMessage, a3);
    -[PXPhotosViewModel signalChange:](self, "signalChange:", 0x8000000000000);
    v5 = v6;
  }

}

- (void)setSearchQueryMatchInfo:(id)a3
{
  PXSearchQueryMatchInfo *v5;
  PXSearchQueryMatchInfo *v6;

  v5 = (PXSearchQueryMatchInfo *)a3;
  if (self->_searchQueryMatchInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchQueryMatchInfo, a3);
    v5 = v6;
  }

}

- (void)resetToInitialSelectionAndFilteringState
{
  id v3;

  if (-[PXPhotosViewModel allowsSelectModeToggle](self, "allowsSelectModeToggle"))
    -[PXPhotosViewModel attemptSetInSelectMode:](self, "attemptSetInSelectMode:", -[PXPhotosViewModel startsInSelectMode](self, "startsInSelectMode"));
  -[PXPhotosViewModel _initialContentFilterState](self, "_initialContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel setContentFilterState:](self, "setContentFilterState:", v3);

}

- (BOOL)contentStartsAtEnd
{
  int64_t contentStartingPosition;
  void *v3;
  char v4;

  contentStartingPosition = self->_contentStartingPosition;
  if (contentStartingPosition == 1)
    return 1;
  if (contentStartingPosition)
    return 0;
  -[PXPhotosViewModel currentDataSource](self, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startsAtEnd");

  return v4;
}

- (NSArray)internalMenuProducers
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSHashTable allObjects](self->_internalMenuProducers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void)registerInternalMenuProducer:(id)a3
{
  id v4;
  NSHashTable *internalMenuProducers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  internalMenuProducers = self->_internalMenuProducers;
  v8 = v4;
  if (!internalMenuProducers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_internalMenuProducers;
    self->_internalMenuProducers = v6;

    v4 = v8;
    internalMenuProducers = self->_internalMenuProducers;
  }
  -[NSHashTable addObject:](internalMenuProducers, "addObject:", v4);

}

- (void)unregisterInternalMenuProducer:(id)a3
{
  -[NSHashTable removeObject:](self->_internalMenuProducers, "removeObject:", a3);
}

- (BOOL)viewDelegateRespondsTo:(unint64_t)a3
{
  return (a3 & ~self->_viewDelegateRespondsTo) == 0;
}

- (void)setViewDelegate:(id)a3
{
  PXPhotosViewDelegate **p_viewDelegate;
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;

  p_viewDelegate = &self->_viewDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_viewDelegate, v5);
  self->_viewDelegateRespondsTo = 0;
  self->_viewDelegateRespondsTo |= objc_opt_respondsToSelector() & 1;
  v6 = objc_opt_respondsToSelector();
  v7 = 2;
  if ((v6 & 1) == 0)
    v7 = 0;
  self->_viewDelegateRespondsTo |= v7;
  v8 = objc_opt_respondsToSelector();
  v9 = 0x8000;
  if ((v8 & 1) == 0)
    v9 = 0;
  self->_viewDelegateRespondsTo |= v9;
  v10 = objc_opt_respondsToSelector();
  v11 = 4;
  if ((v10 & 1) == 0)
    v11 = 0;
  self->_viewDelegateRespondsTo |= v11;
  v12 = objc_opt_respondsToSelector();
  v13 = 8;
  if ((v12 & 1) == 0)
    v13 = 0;
  self->_viewDelegateRespondsTo |= v13;
  v14 = objc_opt_respondsToSelector();
  v15 = 16;
  if ((v14 & 1) == 0)
    v15 = 0;
  self->_viewDelegateRespondsTo |= v15;
  v16 = objc_opt_respondsToSelector();
  v17 = 4096;
  if ((v16 & 1) == 0)
    v17 = 0;
  self->_viewDelegateRespondsTo |= v17;
  v18 = objc_opt_respondsToSelector();
  v19 = 0x2000;
  if ((v18 & 1) == 0)
    v19 = 0;
  self->_viewDelegateRespondsTo |= v19;
  v20 = objc_opt_respondsToSelector();
  v21 = 0x10000;
  if ((v20 & 1) == 0)
    v21 = 0;
  self->_viewDelegateRespondsTo |= v21;
  v22 = objc_opt_respondsToSelector();
  v23 = 0x4000;
  if ((v22 & 1) == 0)
    v23 = 0;
  self->_viewDelegateRespondsTo |= v23;
  v24 = objc_opt_respondsToSelector();
  v25 = 32;
  if ((v24 & 1) == 0)
    v25 = 0;
  self->_viewDelegateRespondsTo |= v25;
  v26 = objc_opt_respondsToSelector();
  v27 = 0x100000;
  if ((v26 & 1) == 0)
    v27 = 0;
  self->_viewDelegateRespondsTo |= v27;
  v28 = objc_opt_respondsToSelector();
  v29 = 64;
  if ((v28 & 1) == 0)
    v29 = 0;
  self->_viewDelegateRespondsTo |= v29;
  v30 = objc_opt_respondsToSelector();
  v31 = 128;
  if ((v30 & 1) == 0)
    v31 = 0;
  self->_viewDelegateRespondsTo |= v31;
  v32 = objc_opt_respondsToSelector();
  v33 = 256;
  if ((v32 & 1) == 0)
    v33 = 0;
  self->_viewDelegateRespondsTo |= v33;
  v34 = objc_opt_respondsToSelector();
  v35 = 512;
  if ((v34 & 1) == 0)
    v35 = 0;
  self->_viewDelegateRespondsTo |= v35;
  v36 = objc_opt_respondsToSelector();
  v37 = 1024;
  if ((v36 & 1) == 0)
    v37 = 0;
  self->_viewDelegateRespondsTo |= v37;
  v38 = objc_opt_respondsToSelector();
  v39 = 2048;
  if ((v38 & 1) == 0)
    v39 = 0;
  self->_viewDelegateRespondsTo |= v39;
  v40 = objc_opt_respondsToSelector();
  v41 = 0x20000;
  if ((v40 & 1) == 0)
    v41 = 0;
  self->_viewDelegateRespondsTo |= v41;
  v42 = objc_opt_respondsToSelector();
  v43 = 0x40000;
  if ((v42 & 1) == 0)
    v43 = 0;
  self->_viewDelegateRespondsTo |= v43;
  v44 = objc_opt_respondsToSelector();

  v45 = 0x80000;
  if ((v44 & 1) == 0)
    v45 = 0;
  self->_viewDelegateRespondsTo |= v45;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosViewModel viewDelegate](self, "viewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXPhotosViewModel viewDelegate](self, "viewDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memoryAssetsActionFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)DataSourceManagerObservationContext_60338 != a5 && (void *)SelectionManagerObservationContext_60339 != a5)
  {
    if ((void *)PrivacyControllerObservationContext != a5)
    {
      if ((void *)SortOrderStateObservationContext != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel.m"), 1988, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      if ((v6 & 1) != 0)
      {
        v11 = v9;
        -[PXPhotosViewModel _updateSortOrder](self, "_updateSortOrder");
LABEL_9:
        v9 = v11;
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    v11 = v9;
    if ((v6 & 1) != 0)
    {
      -[PXPhotosViewModel performChanges:](self, "performChanges:", &__block_literal_global_303);
      v9 = v11;
      if ((v6 & 4) == 0)
      {
LABEL_13:
        if ((v6 & 8) == 0)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_13;
    }
    -[PXPhotosViewModel performChanges:](self, "performChanges:", &__block_literal_global_304);
    v9 = v11;
    if ((v6 & 8) == 0)
      goto LABEL_10;
LABEL_17:
    -[PXPhotosViewModel performChanges:](self, "performChanges:", &__block_literal_global_305);
    goto LABEL_9;
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXPhotosViewModel _updateDataSourceDependentProperties](self, "_updateDataSourceDependentProperties");
    goto LABEL_9;
  }
LABEL_10:

}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PXPhotosViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E51437F8;
  v3[4] = self;
  -[PXPhotosViewModel performChanges:](self, "performChanges:", v3);
}

- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__PXPhotosViewModel_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke;
  v3[3] = &unk_1E51437F8;
  v3[4] = self;
  -[PXPhotosViewModel performChanges:](self, "performChanges:", v3);
}

- (id)_updatedContentFilterState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXPhotosViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewModel contentFilterState](self, "contentFilterState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setIncludeScreenshots:", 1);
  if (objc_msgSend(v5, "px_isContentSyndicationAlbum"))
  {
    objc_msgSend(v8, "setIncludeSharedWithYou:", 1);
  }
  else
  {
    objc_msgSend(v6, "includeSharedWithYou");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludeSharedWithYou:", objc_msgSend(v9, "BOOLValue"));

  }
  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id location[6];
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((void *)UserDefaultsPreviewHeaderDisabledObservationContext == a6)
  {
    -[PXPhotosViewModel previewHeaderDisabledUserDefaultsKey](self, "previewHeaderDisabledUserDefaultsKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      location[1] = (id)MEMORY[0x1E0C809B0];
      location[2] = (id)3221225472;
      location[3] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke;
      location[4] = &unk_1E5148D08;
      location[5] = self;
      v23 = v16;
      v17 = v16;
      px_dispatch_on_main_queue();

    }
  }
  else
  {
    if ((void *)UserDefaultsIncludeSharedWithYouObservationContext != a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewModel.m"), 2041, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPhotosViewModel _updatedContentFilterState](self, "_updatedContentFilterState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v21, location);
    v20 = v14;
    v15 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }

}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = v5;
  if (-[PXPhotosViewModel viewDelegateRespondsTo:](self, "viewDelegateRespondsTo:", 0x100000))
  {
    -[PXPhotosViewModel viewDelegate](self, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosViewController:validateSelectionSnapshot:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  if (-[PXPhotosViewModel isInSelectMode](self, "isInSelectMode", a3))
    return 0;
  else
    return !-[PXPhotosViewModel wantsDimmedSelectionStyle](self, "wantsDimmedSelectionStyle");
}

- (BOOL)keepsTabBarAlwaysHidden
{
  return self->_keepsTabBarAlwaysHidden;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXPhotosGridActionManager)gridActionManager
{
  return self->_gridActionManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (NSArray)fullscreenOverlayControllers
{
  return self->_fullscreenOverlayControllers;
}

- (BOOL)wantsDynamicTitles
{
  return self->_wantsDynamicTitles;
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (BOOL)hidesAssetCountInFooter
{
  return self->_hidesAssetCountInFooter;
}

- (BOOL)wantsCPLStatus
{
  return self->_wantsCPLStatus;
}

- (BOOL)wantsRenderingStatus
{
  return self->_wantsRenderingStatus;
}

- (BOOL)isEmbedded
{
  return self->_isEmbedded;
}

- (BOOL)wantsSingleRowScrollingLayout
{
  return self->_wantsSingleRowScrollingLayout;
}

- (BOOL)wantsShareGridButtonVisible
{
  return self->_wantsShareGridButtonVisible;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (BOOL)hidesViewOptionsToolbar
{
  return self->_hidesViewOptionsToolbar;
}

- (PXPhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (Class)cplActionManagerClass
{
  return self->_cplActionManagerClass;
}

- (id)customAssetSelectionHandler
{
  return self->_customAssetSelectionHandler;
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (BOOL)isInCompactMode
{
  return self->_isInCompactMode;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (int64_t)appearState
{
  return self->_appearState;
}

- (BOOL)dismissRequested
{
  return self->_dismissRequested;
}

- (BOOL)hasScrollableContent
{
  return self->_hasScrollableContent;
}

- (BOOL)isScrolledToTop
{
  return self->_scrolledToTop;
}

- (BOOL)isScrolledToBottom
{
  return self->_scrolledToBottom;
}

- (double)headerTitleTopInset
{
  return self->_headerTitleTopInset;
}

- (BOOL)allowsPreviewHeader
{
  return self->_allowsPreviewHeader;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (BOOL)supportsAspectRatioToggle
{
  return self->_supportsAspectRatioToggle;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (UIEdgeInsets)additionalAspectFitEdgeMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalAspectFitEdgeMargins.top;
  left = self->_additionalAspectFitEdgeMargins.left;
  bottom = self->_additionalAspectFitEdgeMargins.bottom;
  right = self->_additionalAspectFitEdgeMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)bannerControllerProvider
{
  return self->_bannerControllerProvider;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (BOOL)showLoadingPlaceholderWhenEmpty
{
  return self->_showLoadingPlaceholderWhenEmpty;
}

- (BOOL)allowsEmptyPlaceholderBehavior
{
  return self->_allowsEmptyPlaceholderBehavior;
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  return (PXPhotosPreferredAssetCropDelegate *)objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  return (PXPhotosPreferredColumnCountsDelegate *)objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
}

- (BOOL)ignoreContentFilterStateWhenNotFiltering
{
  return self->_ignoreContentFilterStateWhenNotFiltering;
}

- (BOOL)supportsPeopleActions
{
  return self->_supportsPeopleActions;
}

- (BOOL)supportsSocialGroupActions
{
  return self->_supportsSocialGroupActions;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (double)chromeOpacity
{
  return self->_chromeOpacity;
}

- (BOOL)alwaysRequiresLightChrome
{
  return self->_alwaysRequiresLightChrome;
}

- (unint64_t)allowedChromeItems
{
  return self->_allowedChromeItems;
}

- (unint64_t)chromeItemsToBeConsideredVisibleForLayoutPurpose
{
  return self->_chromeItemsToBeConsideredVisibleForLayoutPurpose;
}

- (int64_t)allowedGesturesKind
{
  return self->_allowedGesturesKind;
}

- (NSNumber)topDismissAreaHeight
{
  return self->_topDismissAreaHeight;
}

- (NSNumber)userWantsAspectFitContent
{
  return self->_userWantsAspectFitContent;
}

- (int64_t)numberOfZoomSteps
{
  return self->_numberOfZoomSteps;
}

- (double)zoomStep
{
  return self->_zoomStep;
}

- (int64_t)defaultZoomStep
{
  return self->_defaultZoomStep;
}

- (void)setDefaultZoomStep:(int64_t)a3
{
  self->_defaultZoomStep = a3;
}

- (PXAssetReference)zoomAnchorAssetReference
{
  return self->_zoomAnchorAssetReference;
}

- (BOOL)isInteractiveZooming
{
  return self->_isInteractiveZooming;
}

- (BOOL)shouldAnimateZooming
{
  return self->_shouldAnimateZooming;
}

- (_NSRange)yearsMonthsZoomStepRange
{
  _NSRange *p_yearsMonthsZoomStepRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_yearsMonthsZoomStepRange = &self->_yearsMonthsZoomStepRange;
  location = self->_yearsMonthsZoomStepRange.location;
  length = p_yearsMonthsZoomStepRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)wantsContentFilterVisible
{
  return self->_wantsContentFilterVisible;
}

- (BOOL)wantsContentFilterIndicatorVisible
{
  return self->_wantsContentFilterIndicatorVisible;
}

- (BOOL)wantsLensControlVisible
{
  return self->_wantsLensControlVisible;
}

- (PXPhotosViewLens)currentLens
{
  return self->_currentLens;
}

- (NSArray)availableLenses
{
  return self->_availableLenses;
}

- (int64_t)desiredCurationLength
{
  return self->_desiredCurationLength;
}

- (NSString)initialScrollPositionDetentIdentifier
{
  return self->_initialScrollPositionDetentIdentifier;
}

- (PXScrollDetent)lastPreferredScrollDetent
{
  return self->_lastPreferredScrollDetent;
}

- (int64_t)footerVisibilityStyle
{
  return self->_footerVisibilityStyle;
}

- (BOOL)wantsFooterVisible
{
  return self->_wantsFooterVisible;
}

- (BOOL)footerHasImportantInformation
{
  return self->_footerHasImportantInformation;
}

- (int64_t)emptyPlaceholderState
{
  return self->_emptyPlaceholderState;
}

- (int64_t)contentPrivacyState
{
  return self->_contentPrivacyState;
}

- (int64_t)systemAuthenticationType
{
  return self->_systemAuthenticationType;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisible
{
  return self->_wantsContentUnavailableUnlockButtonVisible;
}

- (BOOL)wantsTabBarVisible
{
  return self->_wantsTabBarVisible;
}

- (BOOL)wantsNavbarVisible
{
  return self->_wantsNavbarVisible;
}

- (BOOL)wantsToolbarVisible
{
  return self->_wantsToolbarVisible;
}

- (BOOL)hidesNavbar
{
  return self->_hidesNavbar;
}

- (BOOL)hidesToolbar
{
  return self->_hidesToolbar;
}

- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference
{
  return self->_shouldAlwaysRespectToolbarActionPlacementPreference;
}

- (BOOL)prefersActionsInToolbar
{
  return self->_prefersActionsInToolbar;
}

- (BOOL)wantsTitleInNavigationBar
{
  return self->_wantsTitleInNavigationBar;
}

- (BOOL)isContentBelowTitle
{
  return self->_contentBelowTitle;
}

- (BOOL)isShowingAlternateContent
{
  return self->_showingAlternateContent;
}

- (BOOL)requiresLightTopBars
{
  return self->_requiresLightTopBars;
}

- (double)topBarsAppearanceChangeAnimationDuration
{
  return self->_topBarsAppearanceChangeAnimationDuration;
}

- (double)titleBackgroundOpacity
{
  return self->_titleBackgroundOpacity;
}

- (double)contentBackgroundOpacity
{
  return self->_contentBackgroundOpacity;
}

- (UIEdgeInsets)contentBackgroundInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentBackgroundInsets.top;
  left = self->_contentBackgroundInsets.left;
  bottom = self->_contentBackgroundInsets.bottom;
  right = self->_contentBackgroundInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (BOOL)captionsVisible
{
  return self->_captionsVisible;
}

- (BOOL)wantsTopBadgesWithViewBasedDecorations
{
  return self->_wantsTopBadgesWithViewBasedDecorations;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)allowsSearch
{
  return self->_allowsSearch;
}

- (BOOL)allowsShowDetails
{
  return self->_allowsShowDetails;
}

- (BOOL)allowsChromeManagementBehavior
{
  return self->_allowsChromeManagementBehavior;
}

- (BOOL)allowsInlineAddBehavior
{
  return self->_allowsInlineAddBehavior;
}

- (BOOL)allowsSelectionUserActivityBehavior
{
  return self->_allowsSelectionUserActivityBehavior;
}

- (BOOL)allowsPopOnContainerDeleteBehavior
{
  return self->_allowsPopOnContainerDeleteBehavior;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return self->_allowsPopOnEmptyBehavior;
}

- (BOOL)allowsActionMenuBehavior
{
  return self->_allowsActionMenuBehavior;
}

- (BOOL)allowsDoubleTapBehavior
{
  return self->_allowsDoubleTapBehavior;
}

- (BOOL)allowsHoverBehavior
{
  return self->_allowsHoverBehavior;
}

- (BOOL)allowsCaptionsInSquareBehavior
{
  return self->_allowsCaptionsInSquareBehavior;
}

- (BOOL)allowsContextMenuCustomization
{
  return self->_allowsContextMenuCustomization;
}

- (BOOL)allowsAccessoriesContextMenuCustomization
{
  return self->_allowsAccessoriesContextMenuCustomization;
}

- (BOOL)allowsMacStyleSelection
{
  return self->_allowsMacStyleSelection;
}

- (BOOL)allowsSelectModeToggle
{
  return self->_allowsSelectModeToggle;
}

- (BOOL)allowsSelectAllAction
{
  return self->_allowsSelectAllAction;
}

- (BOOL)allowsSlideshowAction
{
  return self->_allowsSlideshowAction;
}

- (BOOL)allowsAddAction
{
  return self->_allowsAddAction;
}

- (BOOL)allowsCopyAction
{
  return self->_allowsCopyAction;
}

- (BOOL)allowsSelectSectionAction
{
  return self->_allowsSelectSectionAction;
}

- (BOOL)allowsGridAppearanceActions
{
  return self->_allowsGridAppearanceActions;
}

- (BOOL)allowsShareAllAction
{
  return self->_allowsShareAllAction;
}

- (BOOL)allowsQuickLookAction
{
  return self->_allowsQuickLookAction;
}

- (BOOL)allowsShowMapAction
{
  return self->_allowsShowMapAction;
}

- (BOOL)allowsPickAssetAction
{
  return self->_allowsPickAssetAction;
}

- (BOOL)allowsOneUpPresentation
{
  return self->_allowsOneUpPresentation;
}

- (BOOL)allowsDismissAction
{
  return self->_allowsDismissAction;
}

- (BOOL)allowsFileRadarAction
{
  return self->_allowsFileRadarAction;
}

- (BOOL)allowsTrashAction
{
  return self->_allowsTrashAction;
}

- (BOOL)allowsShareAction
{
  return self->_allowsShareAction;
}

- (BOOL)allowsAddToLibraryAction
{
  return self->_allowsAddToLibraryAction;
}

- (BOOL)allowsSwitchLibraryAction
{
  return self->_allowsSwitchLibraryAction;
}

- (BOOL)allowsMoveToLibraryAction
{
  return self->_allowsMoveToLibraryAction;
}

- (BOOL)allowsMoveToPersonalLibraryAction
{
  return self->_allowsMoveToPersonalLibraryAction;
}

- (BOOL)allowsMoveToSharedLibraryAction
{
  return self->_allowsMoveToSharedLibraryAction;
}

- (BOOL)allowsInfoAction
{
  return self->_allowsInfoAction;
}

- (BOOL)allowsCMMActions
{
  return self->_allowsCMMActions;
}

- (BOOL)allowsSyndicatedContentFiltering
{
  return self->_allowsSyndicatedContentFiltering;
}

- (BOOL)allowsContentSyndicationSaveAllAction
{
  return self->_allowsContentSyndicationSaveAllAction;
}

- (BOOL)allowsReplyAction
{
  return self->_allowsReplyAction;
}

- (BOOL)allowsTapbackAction
{
  return self->_allowsTapbackAction;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (BOOL)allowsDragIn
{
  return self->_allowsDragIn;
}

- (BOOL)allowsDragOut
{
  return self->_allowsDragOut;
}

- (BOOL)allowsUserDefaults
{
  return self->_allowsUserDefaults;
}

- (PXZoomablePhotosUserDefaults)customUserDefaults
{
  return self->_customUserDefaults;
}

- (BOOL)allowsLinkInteractions
{
  return self->_allowsLinkInteractions;
}

- (BOOL)allowsMultiSelectMenu
{
  return self->_allowsMultiSelectMenu;
}

- (BOOL)allowsLensControl
{
  return self->_allowsLensControl;
}

- (BOOL)showsPlayAsMemoryButton
{
  return self->_showsPlayAsMemoryButton;
}

- (BOOL)wantsSelectModeCaptionInContextMenu
{
  return self->_wantsSelectModeCaptionInContextMenu;
}

- (int64_t)dismissAffordance
{
  return self->_dismissAffordance;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (NSString)footerSubtitle
{
  return self->_footerSubtitle;
}

- (NSURL)footerLearnMoreURL
{
  return self->_footerLearnMoreURL;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (BOOL)allowsInteractiveFavoriteBadges
{
  return self->_allowsInteractiveFavoriteBadges;
}

- (PXPhotosGridOptionsController)optionsController
{
  return self->_optionsController;
}

- (id)infoActionHandler
{
  return self->_infoActionHandler;
}

- (void)setInfoActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (int64_t)navBarStyle
{
  return self->_navBarStyle;
}

- (BOOL)shouldOptOutOfChromelessBars
{
  return self->_shouldOptOutOfChromelessBars;
}

- (BOOL)wantsModernNavBarButtons
{
  return self->_wantsModernNavBarButtons;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)hideFooterInSelectMode
{
  return self->_hideFooterInSelectMode;
}

- (double)headerFloatingThresholdOffset
{
  return self->_headerFloatingThresholdOffset;
}

- (double)floatingTitleOpacity
{
  return self->_floatingTitleOpacity;
}

- (BOOL)wantsFloatingTitle
{
  return self->_wantsFloatingTitle;
}

- (int64_t)oneUpPresentationOrigin
{
  return self->_oneUpPresentationOrigin;
}

- (BOOL)preventShowInAllPhotosAction
{
  return self->_preventShowInAllPhotosAction;
}

- (BOOL)wantsOneUpShowInLibraryButton
{
  return self->_wantsOneUpShowInLibraryButton;
}

- (NSString)centerAccessoryActionType
{
  return self->_centerAccessoryActionType;
}

- (NSString)trailingAccessoryActionType
{
  return self->_trailingAccessoryActionType;
}

- (UIView)customLeadingAccessoryView
{
  return self->_customLeadingAccessoryView;
}

- (UIView)customTrailingAccessoryView
{
  return self->_customTrailingAccessoryView;
}

- (UIView)customBannerView
{
  return self->_customBannerView;
}

- (BOOL)allowsMergeDuplicatesAction
{
  return self->_allowsMergeDuplicatesAction;
}

- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp
{
  return self->_showsOnlyAssetsInSelectedItemSectionInOneUp;
}

- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3
{
  self->_showsOnlyAssetsInSelectedItemSectionInOneUp = a3;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXSectionedObjectReference)initialNavigationObjectReference
{
  return self->_initialNavigationObjectReference;
}

- (int64_t)initialNavigationScrollPosition
{
  return self->_initialNavigationScrollPosition;
}

- (int64_t)scrollingBehavior
{
  return self->_scrollingBehavior;
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (void)setDecorationViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_decorationViewClass, a3);
}

- (PXStatusViewModel)emptyPlaceholderStatusViewModel
{
  return self->_emptyPlaceholderStatusViewModel;
}

- (void)setEmptyPlaceholderStatusViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, a3);
}

- (PXPhotosViewDelegate)viewDelegate
{
  return (PXPhotosViewDelegate *)objc_loadWeakRetained((id *)&self->_viewDelegate);
}

- (id)effectProvider
{
  return self->_effectProvider;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (NSString)noContentPlaceholderFallbackTitle
{
  return self->_noContentPlaceholderFallbackTitle;
}

- (NSString)noContentPlaceholderFallbackMessage
{
  return self->_noContentPlaceholderFallbackMessage;
}

- (BOOL)wantsFooterVisibleImmediately
{
  return self->_wantsFooterVisibleImmediately;
}

- (BOOL)wantsFooterVisibleWhenEmpty
{
  return self->_wantsFooterVisibleWhenEmpty;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return (PXGDisplayAssetPixelBufferSourcesProvider *)objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)currentDataSourceContainer
{
  return self->_currentDataSourceContainer;
}

- (unint64_t)viewDelegateRespondsTo
{
  return self->_viewDelegateRespondsTo;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (BOOL)alwaysIncludeSharedWithYouAssets
{
  return self->_alwaysIncludeSharedWithYouAssets;
}

- (BOOL)canShowSortButton
{
  return self->_canShowSortButton;
}

- (NSString)previewHeaderDisabledUserDefaultsKey
{
  return self->_previewHeaderDisabledUserDefaultsKey;
}

- (int64_t)configuredSectionHeaderStyle
{
  return self->_configuredSectionHeaderStyle;
}

- (int64_t)configuredSectionBodyStyle
{
  return self->_configuredSectionBodyStyle;
}

- (BOOL)neverShowsLensControl
{
  return self->_neverShowsLensControl;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (void)setWantsCuration:(BOOL)a3
{
  self->_wantsCuration = a3;
}

- (BOOL)startsInSelectMode
{
  return self->_startsInSelectMode;
}

- (BOOL)_shouldMimicSystemChromelessUsingManualScrollEdgeAppearance
{
  return self->__shouldMimicSystemChromelessUsingManualScrollEdgeAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewHeaderDisabledUserDefaultsKey, 0);
  objc_storeStrong(&self->_currentDataSourceContainer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_inlinePlaybackController);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_noContentPlaceholderFallbackMessage, 0);
  objc_storeStrong((id *)&self->_noContentPlaceholderFallbackTitle, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_initialNavigationObjectReference, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_customBannerView, 0);
  objc_storeStrong((id *)&self->_customTrailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_customLeadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryActionType, 0);
  objc_storeStrong((id *)&self->_centerAccessoryActionType, 0);
  objc_storeStrong(&self->_infoActionHandler, 0);
  objc_storeStrong((id *)&self->_optionsController, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footerLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_footerSubtitle, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customUserDefaults, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_lastPreferredScrollDetent, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionDetentIdentifier, 0);
  objc_storeStrong((id *)&self->_availableLenses, 0);
  objc_storeStrong((id *)&self->_currentLens, 0);
  objc_storeStrong((id *)&self->_zoomAnchorAssetReference, 0);
  objc_storeStrong((id *)&self->_userWantsAspectFitContent, 0);
  objc_storeStrong((id *)&self->_topDismissAreaHeight, 0);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong(&self->_bannerControllerProvider, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong(&self->_customAssetSelectionHandler, 0);
  objc_storeStrong((id *)&self->_cplActionManagerClass, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlayControllers, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_gridActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_internalMenuProducers, 0);
  objc_storeStrong((id *)&self->_visibleAssetCollections, 0);
  objc_storeStrong((id *)&self->_filterTimeoutObserver, 0);
  objc_storeStrong((id *)&self->_scrollDisabledReasonsByAxis, 0);
  objc_storeStrong((id *)&self->_modalInPresentationReasons, 0);
  objc_storeStrong((id *)&self->_hideSurroundingContentForReasons, 0);
  objc_storeStrong((id *)&self->_aspectRatioTogglePreventedForReasons, 0);
  objc_storeStrong((id *)&self->_oneUpPresentationPreventedForReasons, 0);
  objc_storeStrong((id *)&self->_enterSelectModePreventedForReasons, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v2[3] = &unk_1E51437F8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performChanges:", v2);

}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
  v3[3] = &unk_1E51437F8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "performChanges:", v3);

}

uint64_t __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentFilterState:", *(_QWORD *)(a1 + 32));
}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a2;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsPreviewHeader:", objc_msgSend(v5, "BOOLForKey:", *(_QWORD *)(a1 + 32)) ^ 1);

}

uint64_t __78__PXPhotosViewModel_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateEmptyPlaceholderState");
}

uint64_t __72__PXPhotosViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateEmptyPlaceholderState");
}

uint64_t __50__PXPhotosViewModel_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateWantsContentUnavailableUnlockButtonVisible");
}

void __50__PXPhotosViewModel_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateSystemAuthenticationType");
  objc_msgSend(v2, "_updateWantsContentUnavailableUnlockButtonVisible");

}

void __50__PXPhotosViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateContentPrivacyState");
  objc_msgSend(v2, "_invalidateEmptyPlaceholderState");
  objc_msgSend(v2, "_invalidateChromeVisibility");
  objc_msgSend(v2, "_invalidateWantsLensControlVisible");

}

uint64_t __32__PXPhotosViewModel_deselectAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __30__PXPhotosViewModel_selectAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

uint64_t __39__PXPhotosViewModel_setIsInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setCursorIndexPath:", v4);
}

uint64_t __64__PXPhotosViewModel_toggleSelectionForAssetCollectionReference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedState:forIndexPathSet:", *(_BYTE *)(a1 + 40) == 0, *(_QWORD *)(a1 + 32));
}

uint64_t __71__PXPhotosViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];

  v2 = *(_BYTE *)(a1 + 64) == 0;
  v3 = *(unsigned __int8 *)(a1 + 65);
  v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return objc_msgSend(a2, "setSelectedState:forIndexPath:andUpdateCursorIndexPath:", v2, v6, v3);
}

void __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke_2;
  v2[3] = &unk_1E511E9D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performChanges:", v2);

}

uint64_t __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSortDescriptors:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__PXPhotosViewModel__updateSortOrder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSortDescriptors:", *(_QWORD *)(a1 + 32));
}

void __52__PXPhotosViewModel__updateFilteringTimeoutObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performChanges:", &__block_literal_global_60415);

}

uint64_t __52__PXPhotosViewModel__updateFilteringTimeoutObserver__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentFilterState:", 0);
}

void __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  int64x2_t v11;

  if (objc_msgSend(a4, "count"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10[0] = a2;
    v10[1] = a3;
    v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

void __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[200] && objc_msgSend(v4, "isInitializing") && (*(_BYTE *)(a1 + 80) || *(_BYTE *)(a1 + 81)))
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "filterPredicate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 48);
      LODWORD(v18[0]) = 138412546;
      *(_QWORD *)((char *)v18 + 4) = v16;
      WORD6(v18[0]) = 2112;
      *(_QWORD *)((char *)v18 + 14) = v17;
      _os_log_fault_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "filterPredicate or includeOthersInSocialGroupAssets option change during initialization, %@ != %@. this is very inefficient and will lead to a full refetch. Ensure the data source passed in to PXPhotosViewConfiguration has a filterPredicate or includeOthersInSocialGroupAssets option that matches +[PXContentFilterState defaultFilterStateForContainerCollection:]", (uint8_t *)v18, 0x16u);

    }
  }
  if ((*(_BYTE *)(a1 + 80) || *(_BYTE *)(a1 + 81)) && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc((Class)off_1E50B1668);
    v8 = *((_OWORD *)off_1E50B8778 + 1);
    v18[0] = *(_OWORD *)off_1E50B8778;
    v18[1] = v8;
    v9 = (void *)objc_msgSend(v7, "initWithAssetCollection:keyAssetReference:indexPath:", v6, 0, v18);
    memset(v18, 0, sizeof(v18));
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      objc_msgSend(v10, "indexPathForAssetCollectionReference:", v9);
      if (*(_QWORD *)&v18[0] != *(_QWORD *)off_1E50B7E98
        && *((_QWORD *)&v18[0] + 1) != 0x7FFFFFFFFFFFFFFFLL
        && *(_QWORD *)&v18[1] == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v3, "setBackgroundFetchOriginSection:");
      }
    }

  }
  objc_msgSend(v3, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)&v18[0]);
  objc_msgSend(*(id *)(a1 + 32), "contentFilterState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:", objc_msgSend(v11, "includeOthersInSocialGroupAssets"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "currentLens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsCurationToggling") && v12)
  {
    if (objc_msgSend(v12, "wantsCuration"))
    {
      +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shouldCurateEditorialLens");

    }
    else
    {
      v14 = 0;
    }
    if ((objc_msgSend(v12, "isDefaultCurationLength") & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v12, "curationLength");
    objc_msgSend(v3, "setCurationEnabledForAllCollections:curationLength:collectionsToDiff:", v14, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

void __57__PXPhotosViewModel__updateDataSourceDependentProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCurrentDataSource:", v3);
  objc_msgSend(v4, "setSelectionSnapshot:", *(_QWORD *)(a1 + 40));

}

uint64_t __80__PXPhotosViewModel_initWithConfiguration_specManager_inlinePlaybackController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 336);
  v4 = a2;
  objc_msgSend(v4, "setIsInSelectMode:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_initialContentFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentFilterState:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentPrivacyState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSystemAuthenticationType");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsContentUnavailableUnlockButtonVisible");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTopBarsStyles");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUserWantsAspectFitContent");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAspectFitContent");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibility");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateGridAppearance");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateFooterVisibility");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsContentFilterIndicatorVisible");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateEmptyPlaceholderState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAvailableLenses");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentLens");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsLensControlVisible");
}

@end
