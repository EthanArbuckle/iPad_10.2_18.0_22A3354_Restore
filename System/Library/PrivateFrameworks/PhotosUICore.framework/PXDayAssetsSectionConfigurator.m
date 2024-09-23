@implementation PXDayAssetsSectionConfigurator

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v16 = 0;
  v17 = 0;
  -[PXDayAssetsSectionConfigurator _getHeaderAndBodyStylesForAssetCollection:isCurated:zoomLevel:headerStyle:bodyStyle:](self, "_getHeaderAndBodyStylesForAssetCollection:isCurated:zoomLevel:headerStyle:bodyStyle:", a3, a4, 3, &v17, &v16);
  if (v16)
  {
    -[PXDayAssetsSectionConfigurator _bodySpecForBodyStyle:zoomLevel:](self, "_bodySpecForBodyStyle:zoomLevel:", v16, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXDayAssetsSectionBodyLayout estimatedSizeWithReferenceSize:spec:style:numberOfAssets:](PXDayAssetsSectionBodyLayout, "estimatedSizeWithReferenceSize:spec:style:numberOfAssets:", v10, v16, a5, width, height);
    width = v11;
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }
  v14 = width;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_getHeaderAndBodyStylesForAssetCollection:(id)a3 isCurated:(BOOL)a4 zoomLevel:(int64_t)a5 headerStyle:(int64_t *)a6 bodyStyle:(int64_t *)a7
{
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  _BOOL4 v15;
  int64_t v16;
  double v17;
  char v18;
  uint64_t v19;
  int64_t v20;
  id v21;

  v21 = a3;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  if ((objc_msgSend(v10, "showAllHighlights") & 1) == 0)
  {
    objc_msgSend(v10, "nonInterestingPromotionScore");
    v11 = v12;
  }
  objc_msgSend(v21, "promotionScore");
  if (a5 == 4)
  {
    v14 = 0;
    v15 = 1;
    v16 = 2;
  }
  else
  {
    v17 = v13;
    v18 = objc_msgSend(v21, "isRecent");
    v19 = 3;
    if (v17 < v11)
      v19 = 0;
    v15 = (v18 & 1) != 0 || v17 >= v11;
    if ((v18 & 1) != 0)
      v16 = 4;
    else
      v16 = v19;
    v14 = (v18 & 1) != 0 || v17 >= v11;
  }
  v20 = (v15 & objc_msgSend(v10, "forceFloatingHeaderVisible")) != 0 || v14;
  *a6 = v20;
  *a7 = v16;

}

- (id)_bodySpecForBodyStyle:(int64_t)a3 zoomLevel:(int64_t)a4
{
  int *v4;

  v4 = &OBJC_IVAR___PXDayAssetsSectionConfigurator__daysBodySpec;
  if ((unint64_t)(a3 - 3) >= 6)
  {
    if ((unint64_t)(a3 - 1) > 1)
      return 0;
    if (a4 == 4)
      v4 = &OBJC_IVAR___PXDayAssetsSectionConfigurator__allPhotosGridBodySpec;
  }
  return *(id *)((char *)&self->super.super.isa + *v4);
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PXDayAssetsSectionBodyLayout *v11;
  PXDayAssetsSectionBodyLayout *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  PXDayAssetsSectionBodyLayout *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  __objc2_class **v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __objc2_class *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  PXDayAssetsSectionConfigurator *v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v48 = 0;
  v49 = 0;
  v5 = objc_msgSend(v4, "isCurated");
  v6 = objc_msgSend(v4, "zoomLevel");
  objc_msgSend(v4, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDayAssetsSectionConfigurator _getHeaderAndBodyStylesForAssetCollection:isCurated:zoomLevel:headerStyle:bodyStyle:](self, "_getHeaderAndBodyStylesForAssetCollection:isCurated:zoomLevel:headerStyle:bodyStyle:", v7, v5, v6, &v49, &v48);

  v8 = v49;
  PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryDaysZoomLevelButtonTitle"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxLocalizedBaseLabel:", v9);

  objc_msgSend(v4, "bodyContentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v11 = v10;
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = objc_alloc_init(PXDayAssetsSectionBodyLayout);

      -[PXGItemsLayout setDelegate:](v12, "setDelegate:", v4);
      -[PXGGeneratedLayout setMediaKind:](v12, "setMediaKind:", 2);
      -[PXGLayout setContentSource:](v12, "setContentSource:", v4);
    }
    -[PXDayAssetsSectionBodyLayout setStyle:](v12, "setStyle:", v48);
    v13 = -[PXGItemsLayout numberOfItems](v12, "numberOfItems");
    if (v13 != objc_msgSend(v4, "numberOfAssets"))
      -[PXGItemsLayout setNumberOfItems:](v12, "setNumberOfItems:", objc_msgSend(v4, "numberOfAssets"));
    -[PXDayAssetsSectionConfigurator _bodySpecForBodyStyle:zoomLevel:](self, "_bodySpecForBodyStyle:zoomLevel:", v48, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDayAssetsSectionBodyLayout setSpec:](v12, "setSpec:", v14);

    -[PXDayAssetsSectionBodyLayout setNumberOfPrecedingAssets:](v12, "setNumberOfPrecedingAssets:", objc_msgSend(v4, "numberOfPrecedingAssets"));
    if (v49)
      v15 = objc_msgSend(v4, "keyItemIndex");
    else
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXGGeneratedLayout setKeyItemIndex:](v12, "setKeyItemIndex:", v15);
    if (v4)
      objc_msgSend(v4, "sectionIndexPath");
    -[PXGGeneratedLayout setDefaultSpriteTag:](v12, "setDefaultSpriteTag:", PXGSectionedSpriteTagMake());
    -[PXGGeneratedLayout setKeyItemSpriteTag:](v12, "setKeyItemSpriteTag:", PXGSectionedSpriteTagMake());
    v16 = v12;

  }
  else
  {

    v16 = 0;
  }
  objc_msgSend(v4, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  if (v6 == 3)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interitemSpacingForDays");
  }
  else
  {
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interitemSpacing");
  }
  v19 = v18;

  objc_msgSend(v4, "headerLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionConfigurator updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:](self, "updatedHeaderLayout:withHeaderStyle:forAssetSectionLayout:", v20, v49, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v21;
  objc_msgSend(v4, "actionManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollectionReference");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ellipsisButtonActionPerformerWithAssetCollectionReference:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEllipsisButtonActionPerformer:", v25);

  if (v22)
  {
    v47 = self;
    v26 = 0x1E0C99000uLL;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v28 = off_1E50B2000;
    if (objc_msgSend(v23, "canPerformActionType:", CFSTR("PXCuratedLibraryActionEnterSelectMode")))
    {
      PXLocalizedStringFromTable(CFSTR("PXCuratedLibrarySelectButtonTitle"), CFSTR("PhotosUICore"));
      v29 = v8;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "spec");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v32);

      v28 = off_1E50B2000;
      v8 = v29;
      v26 = 0x1E0C99000;
    }
    if (objc_msgSend(v23, "canPerformActionType:", CFSTR("PXCuratedLibraryActionCancelSelectMode")))
    {
      v33 = v28[2];
      PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryCancelSelectionButtonTitle"), CFSTR("PhotosUICore"));
      v34 = v8;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "spec");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class configurationWithTitle:spec:](v33, "configurationWithTitle:spec:", v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v37);

      v8 = v34;
      v26 = 0x1E0C99000uLL;
    }
    objc_msgSend(v22, "setExternalLeadingButtonConfigurations:", v27);
    v38 = (void *)objc_msgSend(objc_alloc(*(Class *)(v26 + 3560)), "initWithCapacity:", 1);
    if (objc_msgSend(v23, "canPerformActionType:", CFSTR("PXCuratedLibraryActionShowSidebar")))
    {
      objc_msgSend(v22, "spec");
      v39 = v8;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "configurationForButton:spec:", 10, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v39;
      objc_msgSend(v38, "addObject:", v41);

    }
    objc_msgSend(v22, "setExternalTopButtonConfigurations:", v38);

    self = v47;
  }
  v42 = 3;
  if (v8 != 1)
    v42 = 4;
  if (v8)
    v43 = v42;
  else
    v43 = 0;
  objc_msgSend(v4, "setMode:", v43);
  objc_msgSend(v4, "setWantsShadow:", 0);
  objc_msgSend(v4, "setHeaderLayout:", v22);
  objc_msgSend(v4, "setBodyContentLayout:wantsDecoration:", v16, 1);
  objc_msgSend(v4, "setInterlayoutSpacing:", v19);
  objc_msgSend(v4, "setShowAllAffordanceStyle:", 1);
  objc_msgSend(v23, "showAllActionPerformerWithAssetCollectionReference:", v24);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAllActionPerformer:", v44);

  objc_msgSend(v23, "actionPerformerForActionType:withAssetCollectionReference:", CFSTR("PXCuratedLibraryActionSelectAllToggle"), v24);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectAllActionPerformer:", v45);

  -[PXDayAssetsSectionConfigurator _configureSelectAllButtonOfSectionLayout:](self, "_configureSelectAllButtonOfSectionLayout:", v4);
  -[PXGGeneratedLayout headerLayoutGuide](v16, "headerLayoutGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderLayoutGuide:", v46);

}

- (PXDayAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6;
  id v7;
  PXDayAssetsSectionConfigurator *v8;
  PXDayAssetsSectionHeaderLayoutSpec *v9;
  PXDayAssetsSectionHeaderLayoutSpec *floatingHeaderSpec;
  PXAssetsSectionBodyAllPhotosGridLayoutSpec *v11;
  PXAssetsSectionBodyAllPhotosGridLayoutSpec *allPhotosGridBodySpec;
  PXDayAssetsSectionBodyLayoutSpec *v13;
  PXDayAssetsSectionBodyLayoutSpec *daysBodySpec;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXDayAssetsSectionConfigurator;
  v8 = -[PXAssetsSectionConfigurator initWithExtendedTraitCollection:assetsSectionLayoutSpec:](&v16, sel_initWithExtendedTraitCollection_assetsSectionLayoutSpec_, v6, v7);
  if (v8)
  {
    v9 = -[PXDayAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:]([PXDayAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:variant:", v6, 0, objc_msgSend(v7, "variant"));
    floatingHeaderSpec = v8->_floatingHeaderSpec;
    v8->_floatingHeaderSpec = v9;

    v11 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXAssetsSectionBodyAllPhotosGridLayoutSpec alloc], "initWithExtendedTraitCollection:", v6);
    allPhotosGridBodySpec = v8->_allPhotosGridBodySpec;
    v8->_allPhotosGridBodySpec = v11;

    v13 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXDayAssetsSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:", v6);
    daysBodySpec = v8->_daysBodySpec;
    v8->_daysBodySpec = v13;

  }
  return v8;
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  if ((unint64_t)(a3 - 1) > 1)
    return 0;
  else
    return self->_floatingHeaderSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysBodySpec, 0);
  objc_storeStrong((id *)&self->_allPhotosGridBodySpec, 0);
  objc_storeStrong((id *)&self->_floatingHeaderSpec, 0);
}

- (void)_configureSelectAllButtonOfSectionLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;

  v3 = a3;
  objc_msgSend(v3, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "isSelecting"))
  {
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "indexPathForAssetCollectionReference:", v4);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }

    objc_msgSend(v3, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v15;
    v14[1] = v16;
    objc_msgSend(v8, "indexPathSetForItemsInIndexPath:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "selectionSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedIndexPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isSubsetOfSet:", v11);

    if (v12)
      v13 = CFSTR("PXCuratedLibraryDeselectAllButtonTitle");
    else
      v13 = CFSTR("PXCuratedLibrarySelectAllButtonTitle");
    PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E5149688;
  }
  objc_msgSend(v3, "setSelectAllButtonTitle:", v7);

}

@end
