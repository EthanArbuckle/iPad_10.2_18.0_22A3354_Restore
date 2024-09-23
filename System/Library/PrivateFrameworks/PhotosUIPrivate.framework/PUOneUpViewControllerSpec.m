@implementation PUOneUpViewControllerSpec

- (PUOneUpViewControllerSpec)initWithOptions:(unint64_t)a3
{
  PUOneUpViewControllerSpec *v4;
  PUOneUpViewControllerSpec *v5;
  PUOneUpViewControllerSpec *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUOneUpViewControllerSpec;
  v4 = -[PUViewControllerSpec init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = v4;
  }

  return v5;
}

- (id)newSpecChange
{
  return objc_alloc_init(PUOneUpViewControllerSpecChange);
}

- (PUOneUpViewControllerSpecChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpViewControllerSpec;
  -[PUViewControllerSpec currentChange](&v3, sel_currentChange);
  return (PUOneUpViewControllerSpecChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isAssetExplorerReviewScreen
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)allowAccessoryVisibility
{
  return (self->_options & 0x40) == 0;
}

- (BOOL)allowSuggestions
{
  return (self->_options & 0x80) == 0;
}

- (BOOL)allowProgrammaticNavBackButton
{
  return !-[PUOneUpViewControllerSpec _isAssetExplorerReviewScreen](self, "_isAssetExplorerReviewScreen");
}

- (BOOL)allowTapOnTitle
{
  return !-[PUOneUpViewControllerSpec _isAssetExplorerReviewScreen](self, "_isAssetExplorerReviewScreen");
}

- (BOOL)shouldShowTitleView
{
  return 1;
}

- (BOOL)shouldDisplaySelectionIndicators
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (CGSize)assetExplorerReviewScreenProgressIndicatorSize
{
  double v2;
  double v3;
  CGSize result;

  +[PUAssetExplorerReviewScreenProgressIndicatorTileViewController progressIndicatorTileSize](PUAssetExplorerReviewScreenProgressIndicatorTileViewController, "progressIndicatorTileSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldDisplayReviewScreenBars
{
  return (-[PUOneUpViewControllerSpec options](self, "options") >> 8) & 1;
}

- (BOOL)_shouldForceBlackBackground
{
  return (-[PUOneUpViewControllerSpec options](self, "options") >> 9) & 1;
}

- (BOOL)shouldUseSpotlightStyling
{
  return (-[PUOneUpViewControllerSpec options](self, "options") >> 16) & 1;
}

- (id)spotlightBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (BOOL)isInCompactLayoutStyle
{
  return (unint64_t)(-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") - 1) < 3;
}

- (BOOL)shouldShowCropButton
{
  int v3;

  if ((PLIsCamera() & 1) != 0 || (v3 = PLIsMobileSlideShow()) != 0)
  {
    if (-[PUOneUpViewControllerSpec isPresentedForPreview](self, "isPresentedForPreview"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PUViewControllerSpec isPresentedForSecondScreen](self, "isPresentedForSecondScreen");
  }
  return v3;
}

- (void)setChromeVisible:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_isChromeVisible != v3)
  {
    self->_isChromeVisible = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setChromeVisibilityChanged:", 1);

  }
}

- (void)setPresentedForPreview:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_isPresentedForPreview != v3)
  {
    self->_isPresentedForPreview = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPresentedForPreviewChanged:", 1);

  }
}

- (void)setShowingPlayPauseButtonInBars:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_isShowingPlayPauseButtonInBars != v3)
    self->_isShowingPlayPauseButtonInBars = v3;
}

- (void)setContentLocked:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_isContentLocked != v3)
  {
    self->_isContentLocked = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setContentLockingChanged:", 1);

  }
}

- (void)setShouldDisplayPeopleRow:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayPeopleRow != v3)
  {
    self->_shouldDisplayPeopleRow = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayPeopleRowChanged:", 1);

  }
}

- (void)updateIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  int v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  double v19;
  double v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  _BOOL8 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  unsigned int v35;
  char v36;
  unint64_t options;
  int v38;
  int v39;
  _BOOL4 v40;
  int v41;
  int v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL8 v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BOOL8 v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  int64_t v82;
  _BOOL4 v83;
  unsigned int v84;
  _BOOL4 v85;
  double v86;
  double v87;
  _BOOL4 v88;
  unsigned int v89;
  _BOOL4 v90;
  unsigned int v91;
  unsigned int v92;
  objc_super v93;
  CGRect v94;
  CGRect v95;

  v93.receiver = self;
  v93.super_class = (Class)PUOneUpViewControllerSpec;
  -[PUViewControllerSpec updateIfNeeded](&v93, sel_updateIfNeeded);
  if (!-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle"))
    return;
  -[PUViewControllerSpec layoutReferenceSize](self, "layoutReferenceSize");
  v4 = v3;
  v6 = v5;
  v7 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  if (v4 <= v6)
    v8 = 0;
  else
    v8 = !-[PUOneUpViewControllerSpec isPresentedForPreview](self, "isPresentedForPreview");
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11 = PURectWithAspectRatioFittingRect(0.75, *MEMORY[0x1E0C9D538], v10, v4, v6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v94.origin.x = v9;
  v94.origin.y = v10;
  v94.size.width = v4;
  v94.size.height = v6;
  MaxY = CGRectGetMaxY(v94);
  v95.origin.x = v11;
  v95.origin.y = v13;
  v95.size.width = v15;
  v95.size.height = v17;
  v19 = round(MaxY - CGRectGetMaxY(v95));
  if (v19 >= 84.0)
    v20 = v19;
  else
    v20 = 84.0;
  if ((unint64_t)(v7 - 1) >= 3)
  {
    if (v7 == 4)
      v21 = 2;
    else
      v21 = 0;
    v8 = 0;
    v22 = v7 == 4;
  }
  else
  {
    v21 = 1;
    v22 = v8;
  }
  v90 = v22;
  v91 = v8;
  v82 = v7;
  if (-[PUOneUpViewControllerSpec shouldDisplayReviewScreenBars](self, "shouldDisplayReviewScreenBars"))
  {
    v23 = PUReviewScreenSizeClassForReferenceSize(v4, v6);
    LODWORD(v78) = v23 != 7;
    HIDWORD(v78) = v23 == 7;
  }
  else
  {
    v78 = 0;
  }
  v24 = -[PUOneUpViewControllerSpec isPresentedForPreview](self, "isPresentedForPreview");
  v25 = -[PUOneUpViewControllerSpec isChromeVisible](self, "isChromeVisible");
  v26 = -[PUViewControllerSpec isPresentedForSecondScreen](self, "isPresentedForSecondScreen");
  v27 = -[PUOneUpViewControllerSpec _isAssetExplorerReviewScreen](self, "_isAssetExplorerReviewScreen");
  v28 = -[PUOneUpViewControllerSpec isShowingPlayPauseButtonInBars](self, "isShowingPlayPauseButtonInBars");
  v29 = -[PUOneUpViewControllerSpec isContentLocked](self, "isContentLocked");
  v30 = v25 && ~v24;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled");
  v92 = v30;
  v89 = v30 & (!v24 && !v26);
  if (v26)
  {
    v74 = 0;
    v76 = !v27;
    v77 = 0;
    v33 = v30;
    v34 = v31;
  }
  else
  {
    v35 = objc_msgSend(v31, "allowUserTransform");
    v36 = v30 ^ 1;
    v77 = v35;
    if (((v32 | v30 ^ 1 | v27) & 1) != 0)
    {
      LODWORD(v74) = 0;
    }
    else
    {
      LODWORD(v74) = objc_msgSend(v31, "allowBadges");
      v36 = 0;
    }
    v34 = v31;
    if ((v36 & 1) != 0 || !v27)
    {
      HIDWORD(v74) = 0;
      v76 = !v27;
    }
    else
    {
      options = self->_options;
      v38 = objc_msgSend(v31, "allowBadges");
      if ((options & 0x80000) != 0)
        v39 = 0;
      else
        v39 = v38;
      HIDWORD(v74) = v39;
      v76 = 0;
    }
    v33 = v92;
  }
  v40 = v32 | v26 | v24;
  v41 = objc_msgSend(v34, "allowPlayButtonInBars", v74);
  v42 = v40 | v28 & v33;
  if (!v41)
    v42 = v40;
  v84 = v42 ^ 1;
  v85 = -[PUOneUpViewControllerSpec shouldDisplayPeopleRow](self, "shouldDisplayPeopleRow");
  -[PUViewControllerSpec traitCollection](self, "traitCollection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileViewController tileSizeForTraitCollection:](PUPeopleTileViewController, "tileSizeForTraitCollection:", v43);
  v45 = v44;
  v47 = v46;

  v48 = !v26;
  objc_msgSend(v34, "minimumFullCommentTitleViewWidth");
  v50 = v49;
  v51 = v24 & !v29;
  v88 = v82 == 4;
  v86 = v47;
  v87 = v45;
  if (-[PUOneUpViewControllerSpec _shouldForceBlackBackground](self, "_shouldForceBlackBackground"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[PUOneUpViewControllerSpec shouldUseSpotlightStyling](self, "shouldUseSpotlightStyling"))
    {
      v53 = 0;
      goto LABEL_38;
    }
    -[PUOneUpViewControllerSpec spotlightBackgroundColor](self, "spotlightBackgroundColor");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v52;
LABEL_38:
  v54 = v82 != 4;
  v83 = v4 < v50;
  +[PUProgressIndicatorTileViewController progressIndicatorTileSizeForSizeClass:](PUProgressIndicatorTileViewController, "progressIndicatorTileSizeForSizeClass:", v21);
  v56 = v55;
  v58 = v57;
  +[PUProgressIndicatorTileViewController progressIndicatorIconInsetsForSizeClass:](PUProgressIndicatorTileViewController, "progressIndicatorIconInsetsForSizeClass:", v21);
  v80 = v60;
  v81 = v59;
  v79 = v61;
  v63 = v62;
  +[PUBufferingIndicatorTileViewController bufferingIndicatorTileSize](PUBufferingIndicatorTileViewController, "bufferingIndicatorTileSize");
  v65 = v64;
  v67 = v66;
  +[PURenderIndicatorTileViewController renderIndicatorTileSizeForSizeClass:](PURenderIndicatorTileViewController, "renderIndicatorTileSizeForSizeClass:", v21);
  v69 = v68;
  v71 = v70;
  v72 = 2;
  if (!v24)
    v72 = 0;
  if (v26)
    v73 = 1;
  else
    v73 = v72;
  -[PUOneUpViewControllerSpec _setShouldAutoplayOnAppear:](self, "_setShouldAutoplayOnAppear:", v51);
  -[PUOneUpViewControllerSpec _setShouldPlaceButtonsInNavigationBar:](self, "_setShouldPlaceButtonsInNavigationBar:", v90);
  -[PUOneUpViewControllerSpec _setShouldUseCompactTitleView:](self, "_setShouldUseCompactTitleView:", v91);
  -[PUOneUpViewControllerSpec _setMaximumToolbarHeight:](self, "_setMaximumToolbarHeight:", v20);
  -[PUOneUpViewControllerSpec _setMaximumAccessoryToolbarHeight:](self, "_setMaximumAccessoryToolbarHeight:", 44.0);
  -[PUOneUpViewControllerSpec _setShouldUseContentGuideInsets:](self, "_setShouldUseContentGuideInsets:", v89);
  -[PUOneUpViewControllerSpec _setShouldUseUserTransformTiles:](self, "_setShouldUseUserTransformTiles:", v77);
  -[PUOneUpViewControllerSpec _setShouldDisplayBadges:](self, "_setShouldDisplayBadges:", v75);
  -[PUOneUpViewControllerSpec _setShouldDisplayAssetExplorerReviewScreenBadges:](self, "_setShouldDisplayAssetExplorerReviewScreenBadges:", HIDWORD(v75));
  -[PUOneUpViewControllerSpec _setShouldDisplayPlayButtons:](self, "_setShouldDisplayPlayButtons:", v84);
  -[PUOneUpViewControllerSpec _setShouldDisplayProgressIndicators:](self, "_setShouldDisplayProgressIndicators:", v76);
  -[PUOneUpViewControllerSpec _setShouldDisplayPeopleRow:](self, "_setShouldDisplayPeopleRow:", v85);
  -[PUOneUpViewControllerSpec _setShouldDisplayBufferingIndicators:](self, "_setShouldDisplayBufferingIndicators:", 1);
  -[PUOneUpViewControllerSpec _setCanDisplayLoadingIndicators:](self, "_setCanDisplayLoadingIndicators:", v48);
  -[PUOneUpViewControllerSpec _setShouldDisplayEmptyPlaceholder:](self, "_setShouldDisplayEmptyPlaceholder:", v48);
  -[PUOneUpViewControllerSpec _setBackgroundColorOverride:](self, "_setBackgroundColorOverride:", v53);
  -[PUOneUpViewControllerSpec _setProgressIndicatorSize:](self, "_setProgressIndicatorSize:", v56, v58);
  -[PUOneUpViewControllerSpec _setPeopleRowSize:](self, "_setPeopleRowSize:", v87, v86);
  -[PUOneUpViewControllerSpec _setProgressIndicatorContentInsets:](self, "_setProgressIndicatorContentInsets:", v81, v80, v79, v63);
  -[PUOneUpViewControllerSpec _setBufferingIndicatorSize:](self, "_setBufferingIndicatorSize:", v65, v67);
  -[PUOneUpViewControllerSpec _setRenderIndicatorSize:](self, "_setRenderIndicatorSize:", v69, v71);
  -[PUOneUpViewControllerSpec _setShouldUseCompactCommentsTitle:](self, "_setShouldUseCompactCommentsTitle:", v83);
  -[PUOneUpViewControllerSpec _setTileInitialContentMode:](self, "_setTileInitialContentMode:", v73);
  -[PUOneUpViewControllerSpec _setShouldCounterrotateReviewScreenBars:](self, "_setShouldCounterrotateReviewScreenBars:", v78);
  -[PUOneUpViewControllerSpec _setShouldPinContentToTop:](self, "_setShouldPinContentToTop:", v24);
  -[PUOneUpViewControllerSpec _setShouldLayoutReviewScreenControlBarVertically:](self, "_setShouldLayoutReviewScreenControlBarVertically:", HIDWORD(v78));
  -[PUOneUpViewControllerSpec _setShouldPlaceScrubberInScrubberBar:](self, "_setShouldPlaceScrubberInScrubberBar:", HIDWORD(v78));
  -[PUOneUpViewControllerSpec setShouldDisplaySyndicationAttribution:](self, "setShouldDisplaySyndicationAttribution:", v92);
  -[PUOneUpViewControllerSpec setPrefersFloatingInfoPanel:](self, "setPrefersFloatingInfoPanel:", v88);
  -[PUOneUpViewControllerSpec setHideNavigationBarWhenShowingAccessoryView:](self, "setHideNavigationBarWhenShowingAccessoryView:", v54);
  -[PUOneUpViewControllerSpec setHideScrubberWhenShowingAccessoryView:](self, "setHideScrubberWhenShowingAccessoryView:", v54);
  -[PUOneUpViewControllerSpec setPrefersSquareImageInDetails:](self, "setPrefersSquareImageInDetails:", v54);
  -[PUOneUpViewControllerSpec setHideStatusBarWhenShowingAccessoryView:](self, "setHideStatusBarWhenShowingAccessoryView:", v54);
  -[PUOneUpViewControllerSpec setHideBadgesWhenShowingAccessoryView:](self, "setHideBadgesWhenShowingAccessoryView:", v54);

}

- (CGSize)playButtonSize
{
  double v2;
  double v3;
  CGSize result;

  +[PUPlayButtonTileViewController playButtonTileSize](PUPlayButtonTileViewController, "playButtonTileSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setShouldPlaceButtonsInNavigationBar:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldPlaceButtonsInNavigationBar != v3)
  {
    self->_shouldPlaceButtonsInNavigationBar = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldPlaceButtonsInNavigationBarChanged:", 1);

  }
}

- (void)_setShouldUseCompactTitleView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldUseCompactTitleView != v3)
  {
    self->_shouldUseCompactTitleView = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldUseCompactTitleViewChanged:", 1);

  }
}

- (void)_setShouldUseContentGuideInsets:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldUseContentGuideInsets != v3)
  {
    self->_shouldUseContentGuideInsets = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldUseContentGuideInsetsChanged:", 1);

  }
}

- (void)_setShouldUseUserTransformTiles:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldUseUserTransformTiles != v3)
  {
    self->_shouldUseUserTransformTiles = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldUseUserTransformTilesChanged:", 1);

  }
}

- (void)_setShouldAutoplayOnAppear:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldAutoplayOnAppear != v3)
  {
    self->_shouldAutoplayOnAppear = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldAutoplayOnAppearChanged:", 1);

  }
}

- (void)_setShouldDisplayBadges:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayBadges != v3)
  {
    self->_shouldDisplayBadges = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayBadgesChanged:", 1);

  }
}

- (void)_setShouldDisplayAssetExplorerReviewScreenBadges:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayAssetExplorerReviewScreenBadges != v3)
  {
    self->_shouldDisplayAssetExplorerReviewScreenBadges = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayAssetExplorerReviewScreenBadgesChanged:", 1);

  }
}

- (void)_setShouldDisplayPlayButtons:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayPlayButtons != v3)
  {
    self->_shouldDisplayPlayButtons = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayPlayButtonsChanged:", 1);

  }
}

- (void)_setShouldDisplayProgressIndicators:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayProgressIndicators != v3)
  {
    self->_shouldDisplayProgressIndicators = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayProgressIndicatorsChanged:", 1);

  }
}

- (void)_setShouldDisplayPeopleRow:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayPeopleRow != v3)
  {
    self->_shouldDisplayPeopleRow = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayPeopleRowChanged:", 1);

  }
}

- (void)_setShouldDisplayBufferingIndicators:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayBufferingIndicators != v3)
  {
    self->_shouldDisplayBufferingIndicators = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayBufferingIndicatorsChanged:", 1);

  }
}

- (void)_setCanDisplayLoadingIndicators:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_canDisplayLoadingIndicators != v3)
  {
    self->_canDisplayLoadingIndicators = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setCanDisplayLoadingIndicatorsChanged:", 1);

  }
}

- (void)_setShouldDisplayEmptyPlaceholder:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplayEmptyPlaceholder != v3)
  {
    self->_shouldDisplayEmptyPlaceholder = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplayEmptyPlaceholderChanged:", 1);

  }
}

- (void)_setBackgroundColorOverride:(id)a3
{
  UIColor *v5;
  char v6;
  void *v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  v5 = v8;
  if (self->_backgroundColorOverride != v8)
  {
    v6 = -[UIColor isEqual:](v8, "isEqual:");
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColorOverride, a3);
      -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setBackgroundColorOverrideChanged:", 1);

      v5 = v8;
    }
  }

}

- (void)_setProgressIndicatorSize:(CGSize)a3
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_progressIndicatorSize.width || height != self->_progressIndicatorSize.height)
  {
    self->_progressIndicatorSize.width = width;
    self->_progressIndicatorSize.height = height;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setProgressIndicatorSizeChanged:", 1);

  }
}

- (void)_setPeopleRowSize:(CGSize)a3
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_peopleRowSize.width || height != self->_peopleRowSize.height)
  {
    self->_peopleRowSize.width = width;
    self->_peopleRowSize.height = height;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setPeopleRowSizeChanged:", 1);

  }
}

- (void)_setProgressIndicatorContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (left != self->_progressIndicatorContentInsets.left
    || top != self->_progressIndicatorContentInsets.top
    || right != self->_progressIndicatorContentInsets.right
    || bottom != self->_progressIndicatorContentInsets.bottom)
  {
    self->_progressIndicatorContentInsets.top = top;
    self->_progressIndicatorContentInsets.left = left;
    self->_progressIndicatorContentInsets.bottom = bottom;
    self->_progressIndicatorContentInsets.right = right;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setProgressIndicatorContentInsetsChanged:", 1);

  }
}

- (void)_setRenderIndicatorSize:(CGSize)a3
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_renderIndicatorSize.width || height != self->_renderIndicatorSize.height)
  {
    self->_renderIndicatorSize.width = width;
    self->_renderIndicatorSize.height = height;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setRenderIndicatorSizeChanged:", 1);

  }
}

- (void)_setBufferingIndicatorSize:(CGSize)a3
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_bufferingIndicatorSize.width || height != self->_bufferingIndicatorSize.height)
  {
    self->_bufferingIndicatorSize.width = width;
    self->_bufferingIndicatorSize.height = height;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBufferingIndicatorSizeChanged:", 1);

  }
}

- (void)_setShouldUseCompactCommentsTitle:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldUseCompactCommentsTitle != v3)
  {
    self->_shouldUseCompactCommentsTitle = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldUseCompactCommentsTitleChanged:", 1);

  }
}

- (void)_setTileInitialContentMode:(int64_t)a3
{
  id v5;

  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_tileInitialContentMode != a3)
  {
    self->_tileInitialContentMode = a3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setTileInitialContentModeChanged:", 1);

  }
}

- (void)_setShouldCounterrotateReviewScreenBars:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldCounterrotateReviewScreenBars != v3)
  {
    self->_shouldCounterrotateReviewScreenBars = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldCounterrotateReviewScreenBarsChanged:", 1);

  }
}

- (void)_setShouldPinContentToTop:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldPinContentToTop != v3)
  {
    self->_shouldPinContentToTop = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldPinContentToTopChanged:", 1);

  }
}

- (void)_setShouldLayoutReviewScreenControlBarVertically:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldLayoutReviewScreenControlBarVertically != v3)
  {
    self->_shouldLayoutReviewScreenControlBarVertically = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldLayoutReviewScreenControlBarVerticallyChanged:", 1);

  }
}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldPlaceScrubberInScrubberBar != v3)
  {
    self->_shouldPlaceScrubberInScrubberBar = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldPlaceScrubberInScrubberBarChanged:", 1);

  }
}

- (void)setShouldDisplaySyndicationAttribution:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_shouldDisplaySyndicationAttribution != v3)
  {
    self->_shouldDisplaySyndicationAttribution = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShouldDisplaySyndicationAttribution:", 1);

  }
}

- (void)setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_hideNavigationBarWhenShowingAccessoryView != v3)
  {
    self->_hideNavigationBarWhenShowingAccessoryView = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHideNavigationBarWhenShowingAccessoryView:", 1);

  }
}

- (void)setHideScrubberWhenShowingAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_hideScrubberWhenShowingAccessoryView != v3)
  {
    self->_hideScrubberWhenShowingAccessoryView = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHideScrubberWhenShowingAccessoryView:", 1);

  }
}

- (void)_setPrefersSquareImageInDetails:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_prefersSquareImageInDetails != v3)
  {
    self->_prefersSquareImageInDetails = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPrefersSquareImageInDetails:", 1);

  }
}

- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_hideStatusBarWhenShowingAccessoryView != v3)
  {
    self->_hideStatusBarWhenShowingAccessoryView = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHideStatusBarWhenShowingAccessoryView:", 1);

  }
}

- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_hideBadgesWhenShowingAccessoryView != v3)
  {
    self->_hideBadgesWhenShowingAccessoryView = v3;
    -[PUOneUpViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHideBadgesWhenShowingAccessoryView:", 1);

  }
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (BOOL)isContentLocked
{
  return self->_isContentLocked;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (BOOL)isShowingPlayPauseButtonInBars
{
  return self->_isShowingPlayPauseButtonInBars;
}

- (BOOL)shouldDisplayPeopleRow
{
  return self->_shouldDisplayPeopleRow;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)shouldPlaceButtonsInNavigationBar
{
  return self->_shouldPlaceButtonsInNavigationBar;
}

- (BOOL)shouldUseCompactTitleView
{
  return self->_shouldUseCompactTitleView;
}

- (double)maximumToolbarHeight
{
  return self->_maximumToolbarHeight;
}

- (void)_setMaximumToolbarHeight:(double)a3
{
  self->_maximumToolbarHeight = a3;
}

- (double)maximumAccessoryToolbarHeight
{
  return self->_maximumAccessoryToolbarHeight;
}

- (void)_setMaximumAccessoryToolbarHeight:(double)a3
{
  self->_maximumAccessoryToolbarHeight = a3;
}

- (BOOL)shouldUseContentGuideInsets
{
  return self->_shouldUseContentGuideInsets;
}

- (BOOL)shouldUseUserTransformTiles
{
  return self->_shouldUseUserTransformTiles;
}

- (BOOL)shouldDisplayBadges
{
  return self->_shouldDisplayBadges;
}

- (BOOL)shouldDisplayAssetExplorerReviewScreenBadges
{
  return self->_shouldDisplayAssetExplorerReviewScreenBadges;
}

- (BOOL)shouldDisplayPlayButtons
{
  return self->_shouldDisplayPlayButtons;
}

- (BOOL)shouldDisplayProgressIndicators
{
  return self->_shouldDisplayProgressIndicators;
}

- (BOOL)shouldAutoplayOnAppear
{
  return self->_shouldAutoplayOnAppear;
}

- (BOOL)shouldDisplayBufferingIndicators
{
  return self->_shouldDisplayBufferingIndicators;
}

- (BOOL)canDisplayLoadingIndicators
{
  return self->_canDisplayLoadingIndicators;
}

- (BOOL)shouldDisplayEmptyPlaceholder
{
  return self->_shouldDisplayEmptyPlaceholder;
}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (CGSize)progressIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_progressIndicatorSize.width;
  height = self->_progressIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)peopleRowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_peopleRowSize.width;
  height = self->_peopleRowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)progressIndicatorContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_progressIndicatorContentInsets.top;
  left = self->_progressIndicatorContentInsets.left;
  bottom = self->_progressIndicatorContentInsets.bottom;
  right = self->_progressIndicatorContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)bufferingIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bufferingIndicatorSize.width;
  height = self->_bufferingIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)renderIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderIndicatorSize.width;
  height = self->_renderIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldUseCompactCommentsTitle
{
  return self->_shouldUseCompactCommentsTitle;
}

- (int64_t)tileInitialContentMode
{
  return self->_tileInitialContentMode;
}

- (BOOL)shouldCounterrotateReviewScreenBars
{
  return self->_shouldCounterrotateReviewScreenBars;
}

- (BOOL)shouldPinContentToTop
{
  return self->_shouldPinContentToTop;
}

- (BOOL)shouldLayoutReviewScreenControlBarVertically
{
  return self->_shouldLayoutReviewScreenControlBarVertically;
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (void)_setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  self->_shouldPlaceScrubberInScrubberBar = a3;
}

- (BOOL)shouldDisplaySyndicationAttribution
{
  return self->_shouldDisplaySyndicationAttribution;
}

- (BOOL)prefersFloatingInfoPanel
{
  return self->_prefersFloatingInfoPanel;
}

- (void)setPrefersFloatingInfoPanel:(BOOL)a3
{
  self->_prefersFloatingInfoPanel = a3;
}

- (BOOL)hideNavigationBarWhenShowingAccessoryView
{
  return self->_hideNavigationBarWhenShowingAccessoryView;
}

- (BOOL)hideScrubberWhenShowingAccessoryView
{
  return self->_hideScrubberWhenShowingAccessoryView;
}

- (BOOL)prefersSquareImageInDetails
{
  return self->_prefersSquareImageInDetails;
}

- (void)setPrefersSquareImageInDetails:(BOOL)a3
{
  self->_prefersSquareImageInDetails = a3;
}

- (BOOL)hideStatusBarWhenShowingAccessoryView
{
  return self->_hideStatusBarWhenShowingAccessoryView;
}

- (void)setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideStatusBarWhenShowingAccessoryView = a3;
}

- (BOOL)hideBadgesWhenShowingAccessoryView
{
  return self->_hideBadgesWhenShowingAccessoryView;
}

- (void)setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideBadgesWhenShowingAccessoryView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorOverride, 0);
}

@end
