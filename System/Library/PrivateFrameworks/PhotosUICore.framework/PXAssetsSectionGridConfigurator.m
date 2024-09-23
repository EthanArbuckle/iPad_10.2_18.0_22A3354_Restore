@implementation PXAssetsSectionGridConfigurator

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return 0;
}

- (void)configureAssetSectionLayout:(id)a3
{
  void *v4;
  char isKindOfClass;
  PXGGridLayout *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "bodyContentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "bodyContentLayout");
    v6 = (PXGGridLayout *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(PXGGridLayout);
    -[PXGGridLayout setMediaKind:](v6, "setMediaKind:", 2);
    -[PXGGridLayout setPresentationType:](v6, "setPresentationType:", 0);
    -[PXGLayout setContentSource:](v6, "setContentSource:", v9);
    -[PXGItemsLayout setLazy:](v6, "setLazy:", 1);
    -[PXGItemsLayout setDelegate:](v6, "setDelegate:", v9);
    -[PXGItemsLayout setNumberOfItems:](v6, "setNumberOfItems:", objc_msgSend(v9, "numberOfAssets"));
    if (objc_msgSend(v9, "preferredInitialContentLayoutAxis"))
      -[PXGGridLayout setAxis:](v6, "setAxis:", objc_msgSend(v9, "preferredInitialContentLayoutAxis"));
    objc_msgSend(v9, "preferredInitialContentLayoutNumberOfRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v9, "preferredInitialContentLayoutNumberOfRows");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGGridLayout setNumberOfRows:](v6, "setNumberOfRows:", objc_msgSend(v8, "integerValue"));

    }
    -[PXGGridLayout setAccessoryMediaKind:](v6, "setAccessoryMediaKind:", 10);
    -[PXGGridLayout setAccessoryPresentationType:](v6, "setAccessoryPresentationType:", 1);
    -[PXGItemsLayout setAccessoryItemContentSource:](v6, "setAccessoryItemContentSource:", v9);
  }
  -[PXAssetsSectionGridConfigurator _configureGridLayout:inSectionLayout:](self, "_configureGridLayout:inSectionLayout:", v6, v9);
  objc_msgSend(v9, "setBodyContentLayout:wantsDecoration:", v6, 1);

}

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  double width;
  double v7;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  double v14;
  double v15;
  CGSize result;

  width = a6.width;
  v7 = a6.width;
  if (a5)
  {
    -[PXAssetsSectionConfigurator assetsSectionLayoutSpec](self, "assetsSectionLayoutSpec", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoomableSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "staticNumberOfColumns");
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v13 = a5 / v12;
    if ((unint64_t)(a5 / v12) <= 1)
      v13 = 1;
    v7 = width / (double)v12 * (double)v13;

  }
  v14 = width;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)_layoutHasIndividualItems:(id)a3 forSpec:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "numberOfColumns");
  v7 = objc_msgSend(v5, "maxColumnsForIndividualItems");

  return v6 <= v7;
}

- (BOOL)_layoutIsAspectFit:(id)a3 forSpec:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[PXAssetsSectionGridConfigurator aspectFitContent](self, "aspectFitContent"))
    v8 = -[PXAssetsSectionGridConfigurator _layoutHasIndividualItems:forSpec:](self, "_layoutHasIndividualItems:forSpec:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (CGSize)_interItemSpacingForLayout:(id)a3 forSpec:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  v8 = -[PXAssetsSectionGridConfigurator _layoutIsAspectFit:forSpec:](self, "_layoutIsAspectFit:forSpec:", v7, v6);
  v9 = -[PXAssetsSectionGridConfigurator _layoutHasIndividualItems:forSpec:](self, "_layoutHasIndividualItems:forSpec:", v7, v6);

  v10 = 0.0;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(v6, "aspectFitInteritemSpacing");
LABEL_6:
      v10 = v11;
    }
  }
  else if (v9)
  {
    objc_msgSend(v6, "interitemSpacing");
    goto LABEL_6;
  }

  v12 = v10;
  v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_configureGridLayout:(id)a3 inSectionLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  PXAssetsSectionGridConfigurator *v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  _BOOL4 v70;
  uint64_t v71;
  id v72;

  v72 = a3;
  v6 = a4;
  -[PXAssetsSectionConfigurator assetsSectionLayoutSpec](self, "assetsSectionLayoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomableSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PXAssetsSectionGridConfigurator _layoutHasIndividualItems:forSpec:](self, "_layoutHasIndividualItems:forSpec:", v72, v8);
  v71 = objc_msgSend(v8, "userInterfaceIdiom");
  v10 = objc_msgSend(v8, "userInterfaceIdiom");
  objc_msgSend(v6, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "px_isPanoramasSmartAlbum");

  v13 = objc_msgSend(v72, "numberOfColumns");
  v14 = objc_msgSend(v6, "isFaceModeEnabled");
  v70 = -[PXAssetsSectionGridConfigurator _layoutIsAspectFit:forSpec:](self, "_layoutIsAspectFit:forSpec:", v72, v8);
  if (!v70 || (v12 & 1) != 0)
  {
    v15 = ((v14 & 1) != 0 || objc_msgSend(v8, "useSaliency"))
       && v13 <= objc_msgSend(v8, "maxColumnsForSaliency");
    v27 = v71 != 4 || v9;
    if ((v27 & 1) != 0)
    {
      objc_msgSend(v6, "safeAreaInsets");
      PXEdgeInsetsForEdges();
      objc_msgSend(v8, "squareEdgeMargins");
      PXEdgeInsetsAdd();
      v17 = v28;
      v19 = v29;
      v21 = v30;
      v23 = v31;
      v26 = 0;
    }
    else
    {
      v26 = 0;
      v17 = *(double *)off_1E50B8020;
      v19 = *((double *)off_1E50B8020 + 1);
      v21 = *((double *)off_1E50B8020 + 2);
      v23 = *((double *)off_1E50B8020 + 3);
    }
    v25 = 0.0;
  }
  else
  {
    if (v14)
      v15 = v13 <= objc_msgSend(v8, "maxColumnsForSaliency");
    else
      v15 = 0;
    objc_msgSend(v8, "aspectFitEdgeMargins");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    if (objc_msgSend(v6, "itemCaptionsVisible"))
    {
      objc_msgSend(v8, "captionSpacing");
      v25 = v24;
    }
    else
    {
      v25 = 0.0;
    }
    v26 = 1;
  }
  if (objc_msgSend(v6, "numberOfAssets"))
  {
    if ((_DWORD)v12)
      goto LABEL_23;
LABEL_26:
    if (v71 == 4)
    {
      v69 = v10;
      v35 = (uint64_t)(double)-[PXAssetsSectionGridConfigurator zoomStep](self, "zoomStep");
      objc_msgSend(v8, "legacyMacSupportedColumns");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = self;
      v39 = v26;
      v40 = v15;
      v41 = objc_msgSend(v37, "integerValue");

      v10 = v69;
      v34 = v72;
      v33 = v41;
      v15 = v40;
      v26 = v39;
      self = v38;
    }
    else
    {
      v33 = objc_msgSend(v8, "staticNumberOfColumns");
      v34 = v72;
    }
    objc_msgSend(v34, "setNumberOfColumns:", v33);
    goto LABEL_30;
  }
  v17 = *(double *)off_1E50B8020;
  v19 = *((double *)off_1E50B8020 + 1);
  v21 = *((double *)off_1E50B8020 + 2);
  v23 = *((double *)off_1E50B8020 + 3);
  if (!(_DWORD)v12)
    goto LABEL_26;
LABEL_23:
  objc_msgSend(v72, "setNumberOfColumns:", 1);
  v25 = 0.0;
  if (objc_msgSend(v6, "itemCaptionsVisible"))
  {
    objc_msgSend(v8, "captionSpacing");
    v25 = v32;
  }
LABEL_30:
  if (v9)
  {
    objc_msgSend(v6, "burstStackEffect");
    v42 = v10;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNumberOfItemsStackedBehind:", 2);

    v10 = v42;
  }
  objc_msgSend(v72, "setContentMode:", v26);
  objc_msgSend(v72, "setHideIncompleteLastRowOrColumn:", v9 ^ 1);
  objc_msgSend(v72, "setEnableEffects:", v9);
  objc_msgSend(v72, "setEnableBestCropRect:", v15);
  if ((_DWORD)v12)
  {
    objc_msgSend(v8, "panoramaInteritemSpacing");
    v45 = v44;
    objc_msgSend(v8, "panoramaInteritemSpacing");
    v47 = v46;
  }
  else
  {
    -[PXAssetsSectionGridConfigurator _interItemSpacingForLayout:forSpec:](self, "_interItemSpacingForLayout:forSpec:", v72, v8);
    v45 = v48;
  }
  objc_msgSend(v72, "setInterItemSpacing:", v45, v47);
  objc_msgSend(v72, "setItemCaptionSpacing:", v25);
  objc_msgSend(v8, "itemCornerRadius");
  *(float *)&v49 = v49;
  LODWORD(v50) = LODWORD(v49);
  LODWORD(v51) = LODWORD(v49);
  LODWORD(v52) = LODWORD(v49);
  objc_msgSend(v72, "setItemCornerRadius:", v49, v50, v51, v52);
  objc_msgSend(v72, "setPadding:", v17, v19, v21, v23);
  objc_msgSend(v72, "setFillSafeAreaTopInset:", 0);
  if (v9)
    v53 = 2;
  else
    v53 = 0;
  objc_msgSend(v72, "setStyle:", v53);
  LODWORD(v54) = 0;
  objc_msgSend(v72, "setItemZPosition:", v54);
  v55 = 1.0;
  if ((_DWORD)v12)
    objc_msgSend(v8, "panoramaItemAspectRatio", 1.0);
  objc_msgSend(v72, "setItemAspectRatio:", v55);
  if (v71 == 4)
    v56 = 2;
  else
    v56 = 1;
  objc_msgSend(v72, "setDropTargetStyle:", v56);
  objc_msgSend(v72, "setSupportsAutomaticContentRotation:", v12);
  objc_msgSend(v6, "preferredCornerRadius");
  objc_msgSend(v72, "setEdgeCornerRadius:");
  if (v10 == 3)
  {
    +[PXFocusSettings sharedInstance](PXFocusSettings, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "focusAnimationStyle");
    objc_msgSend(v57, "focusAnimationPadding");
    v60 = v59;
    v61 = objc_msgSend(v57, "pressedAnimationStyle");
    objc_msgSend(v57, "pressedAnimationPadding");
    objc_msgSend(v72, "setAnimationParameters:forStylableType:", v61, v62, 2);
  }
  else
  {
    +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v63;
    if (v70)
    {
      v58 = objc_msgSend(v63, "allPhotosAspectFitFocusAnimationStyle");
      objc_msgSend(v57, "allPhotosAspectFitFocusPadding");
    }
    else
    {
      v58 = objc_msgSend(v63, "allPhotosAspectFillFocusAnimationStyle");
      objc_msgSend(v57, "allPhotosAspectFillFocusPadding");
    }
    v60 = v64;
  }

  objc_msgSend(v72, "setAnimationParameters:forStylableType:", v58, v60, 1);
  objc_msgSend(v72, "axGroup");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v71 == 4)
    v67 = 9;
  else
    v67 = 0;
  objc_msgSend(v65, "setLeafFeatures:", objc_msgSend(v65, "leafFeatures") | v67);

  objc_msgSend(v6, "addContentActionHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setNumberOfAccessoryItems:", v68 != 0);

}

- (int64_t)numberOfZoomStepsWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[PXAssetsSectionConfigurator assetsSectionLayoutSpec](self, "assetsSectionLayoutSpec", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomableSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyMacSupportedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (BOOL)supportsAspectRatioToggle
{
  return 1;
}

- (int64_t)zoomStep
{
  return self->_zoomStep;
}

- (void)setZoomStep:(int64_t)a3
{
  self->_zoomStep = a3;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (void)setAspectFitContent:(BOOL)a3
{
  self->_aspectFitContent = a3;
}

@end
