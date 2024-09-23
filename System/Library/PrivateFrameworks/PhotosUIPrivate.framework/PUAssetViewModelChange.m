@implementation PUAssetViewModelChange

- (BOOL)hasChanges
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUAssetViewModelChange;
  if (-[PUViewModelChange hasChanges](&v7, sel_hasChanges))
    return 1;
  if (-[PUAssetViewModelChange assetChanged](self, "assetChanged"))
    return 1;
  if (-[PUAssetViewModelChange assetContentChanged](self, "assetContentChanged"))
    return 1;
  if (-[PUAssetViewModelChange modelTileTransformChanged](self, "modelTileTransformChanged"))
    return 1;
  if (-[PUAssetViewModelChange isUserTransformingTileDidChange](self, "isUserTransformingTileDidChange"))
    return 1;
  if (-[PUAssetViewModelChange focusValueChanged](self, "focusValueChanged"))
    return 1;
  if (-[PUAssetViewModelChange loadingStatusChanged](self, "loadingStatusChanged"))
    return 1;
  if (-[PUAssetViewModelChange saveProgressChanged](self, "saveProgressChanged"))
    return 1;
  if (-[PUAssetViewModelChange saveStateChanged](self, "saveStateChanged"))
    return 1;
  if (-[PUAssetViewModelChange importStateChanged](self, "importStateChanged"))
    return 1;
  if (-[PUAssetViewModelChange isUpdatingDisplayedContentChanged](self, "isUpdatingDisplayedContentChanged"))
    return 1;
  if (-[PUAssetViewModelChange isFavoriteChanged](self, "isFavoriteChanged"))
    return 1;
  if (-[PUAssetViewModelChange assetSyndicationStateChanged](self, "assetSyndicationStateChanged"))
    return 1;
  -[PUAssetViewModelChange videoPlayerChange](self, "videoPlayerChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  if (-[PUAssetViewModelChange forceBadgesVisibleChanged](self, "forceBadgesVisibleChanged"))
    return 1;
  -[PUAssetViewModelChange irisPlayerChange](self, "irisPlayerChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  if (-[PUAssetViewModelChange badgeInfoChanged](self, "badgeInfoChanged"))
    return 1;
  if (-[PUAssetViewModelChange accessoryViewVisibilityChanged](self, "accessoryViewVisibilityChanged"))
    return 1;
  if (-[PUAssetViewModelChange contentOffsetChanged](self, "contentOffsetChanged"))
    return 1;
  if (-[PUAssetViewModelChange isInEditModeChanged](self, "isInEditModeChanged"))
    return 1;
  -[PUAssetViewModelChange animatedImageChange](self, "animatedImageChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5
      || -[PUAssetViewModelChange revealsGainMapImageChanged](self, "revealsGainMapImageChanged")
      || -[PUAssetViewModelChange isPresentedForPreviewChanged](self, "isPresentedForPreviewChanged")
      || -[PUAssetViewModelChange visualImageAnalysisChanged](self, "visualImageAnalysisChanged")
      || -[PUAssetViewModelChange isBeingDismissedChanged](self, "isBeingDismissedChanged")
      || -[PUAssetViewModelChange isIrisPlayingChanged](self, "isIrisPlayingChanged")
      || -[PUAssetViewModelChange isVisualSearchCardShowingChanged](self, "isVisualSearchCardShowingChanged")
      || -[PUAssetViewModelChange statusCornerStateChanged](self, "statusCornerStateChanged")
      || -[PUAssetViewModelChange bestImageChanged](self, "bestImageChanged")
      || -[PUAssetViewModelChange videoPlayerDidChange](self, "videoPlayerDidChange")
      || -[PUAssetViewModelChange irisPlayerChanged](self, "irisPlayerChanged")
      || -[PUAssetViewModelChange highlightTimeRangesChanged](self, "highlightTimeRangesChanged")
      || -[PUAssetViewModelChange needsResetVisualImageInteractionChanged](self, "needsResetVisualImageInteractionChanged")|| -[PUAssetViewModelChange PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged](self, "PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged")|| -[PUAssetViewModelChange isDisplayingSearchQueryLabelChanged](self, "isDisplayingSearchQueryLabelChanged")|| -[PUAssetViewModelChange visualIntelligenceAnalyzeRequestIDChanged](self, "visualIntelligenceAnalyzeRequestIDChanged")|| -[PUAssetViewModelChange isFullyInFocusChanged](self, "isFullyInFocusChanged")|| -[PUAssetViewModelChange isZoomedInChanged](self, "isZoomedInChanged")|| -[PUAssetViewModelChange isFullyOutOfFocusChanged](self, "isFullyOutOfFocusChanged")|| -[PUAssetViewModelChange accessoryViewVisibilityFractionChanged](self, "accessoryViewVisibilityFractionChanged")|| -[PUAssetViewModelChange mainImageContentsRectChanged](self, "mainImageContentsRectChanged");
}

- (BOOL)assetChanged
{
  return self->_assetChanged;
}

- (void)_setAssetChanged:(BOOL)a3
{
  self->_assetChanged = a3;
}

- (BOOL)assetContentChanged
{
  return self->_assetContentChanged;
}

- (void)_setAssetContentChanged:(BOOL)a3
{
  self->_assetContentChanged = a3;
}

- (BOOL)modelTileTransformChanged
{
  return self->_modelTileTransformChanged;
}

- (void)_setModelTileTransformChanged:(BOOL)a3
{
  self->_modelTileTransformChanged = a3;
}

- (BOOL)isUserTransformingTileDidChange
{
  return self->_isUserTransformingTileDidChange;
}

- (void)_setUserTransformingTileDidChange:(BOOL)a3
{
  self->_isUserTransformingTileDidChange = a3;
}

- (BOOL)focusValueChanged
{
  return self->_focusValueChanged;
}

- (void)_setFocusValueChanged:(BOOL)a3
{
  self->_focusValueChanged = a3;
}

- (BOOL)loadingStatusChanged
{
  return self->_loadingStatusChanged;
}

- (void)_setLoadingStatusChanged:(BOOL)a3
{
  self->_loadingStatusChanged = a3;
}

- (BOOL)saveProgressChanged
{
  return self->_saveProgressChanged;
}

- (void)_setSaveProgressChanged:(BOOL)a3
{
  self->_saveProgressChanged = a3;
}

- (BOOL)saveStateChanged
{
  return self->_saveStateChanged;
}

- (void)_setSaveStateChanged:(BOOL)a3
{
  self->_saveStateChanged = a3;
}

- (BOOL)importStateChanged
{
  return self->_importStateChanged;
}

- (void)_setImportStateChanged:(BOOL)a3
{
  self->_importStateChanged = a3;
}

- (PUBrowsingVideoPlayerChange)videoPlayerChange
{
  return self->_videoPlayerChange;
}

- (void)_setVideoPlayerChange:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerChange, a3);
}

- (BOOL)forceBadgesVisibleChanged
{
  return self->_forceBadgesVisibleChanged;
}

- (void)_setForceBadgesVisibleChanged:(BOOL)a3
{
  self->_forceBadgesVisibleChanged = a3;
}

- (PUBrowsingIrisPlayerChange)irisPlayerChange
{
  return self->_irisPlayerChange;
}

- (void)_setIrisPlayerChange:(id)a3
{
  objc_storeStrong((id *)&self->_irisPlayerChange, a3);
}

- (BOOL)badgeInfoChanged
{
  return self->_badgeInfoChanged;
}

- (void)_setBadgeInfoChanged:(BOOL)a3
{
  self->_badgeInfoChanged = a3;
}

- (PUBrowsingAnimatedImagePlayerChange)animatedImageChange
{
  return self->_animatedImageChange;
}

- (void)_setAnimatedImageChange:(id)a3
{
  objc_storeStrong((id *)&self->_animatedImageChange, a3);
}

- (BOOL)isUpdatingDisplayedContentChanged
{
  return self->_isUpdatingDisplayedContentChanged;
}

- (void)_setIsUpdatingDisplayedContentChanged:(BOOL)a3
{
  self->_isUpdatingDisplayedContentChanged = a3;
}

- (BOOL)isFavoriteChanged
{
  return self->_isFavoriteChanged;
}

- (void)_setIsFavoriteChanged:(BOOL)a3
{
  self->_isFavoriteChanged = a3;
}

- (BOOL)assetSyndicationStateChanged
{
  return self->_assetSyndicationStateChanged;
}

- (void)setAssetSyndicationStateChanged:(BOOL)a3
{
  self->_assetSyndicationStateChanged = a3;
}

- (BOOL)accessoryViewVisibilityChanged
{
  return self->_accessoryViewVisibilityChanged;
}

- (void)_setAccessoryViewVisibilityChanged:(BOOL)a3
{
  self->_accessoryViewVisibilityChanged = a3;
}

- (BOOL)contentOffsetChanged
{
  return self->_contentOffsetChanged;
}

- (void)_setContentOffsetChanged:(BOOL)a3
{
  self->_contentOffsetChanged = a3;
}

- (BOOL)isInEditModeChanged
{
  return self->_isInEditModeChanged;
}

- (void)_setIsInEditModeChanged:(BOOL)a3
{
  self->_isInEditModeChanged = a3;
}

- (BOOL)revealsGainMapImageChanged
{
  return self->_revealsGainMapImageChanged;
}

- (void)setRevealsGainMapImageChanged:(BOOL)a3
{
  self->_revealsGainMapImageChanged = a3;
}

- (BOOL)isPresentedForPreviewChanged
{
  return self->_isPresentedForPreviewChanged;
}

- (void)_setIsPresentedForPreviewChanged:(BOOL)a3
{
  self->_isPresentedForPreviewChanged = a3;
}

- (BOOL)visualImageAnalysisChanged
{
  return self->_visualImageAnalysisChanged;
}

- (void)_setVisualImageAnalysisChanged:(BOOL)a3
{
  self->_visualImageAnalysisChanged = a3;
}

- (BOOL)isBeingDismissedChanged
{
  return self->_isBeingDismissedChanged;
}

- (void)_setIsBeingDismissedChanged:(BOOL)a3
{
  self->_isBeingDismissedChanged = a3;
}

- (BOOL)isIrisPlayingChanged
{
  return self->_isIrisPlayingChanged;
}

- (void)_setIsIrisPlayingChanged:(BOOL)a3
{
  self->_isIrisPlayingChanged = a3;
}

- (BOOL)isVisualSearchCardShowingChanged
{
  return self->_isVisualSearchCardShowingChanged;
}

- (void)_setIsVisualSearchCardShowingChanged:(BOOL)a3
{
  self->_isVisualSearchCardShowingChanged = a3;
}

- (BOOL)statusCornerStateChanged
{
  return self->_statusCornerStateChanged;
}

- (void)setStatusCornerStateChanged:(BOOL)a3
{
  self->_statusCornerStateChanged = a3;
}

- (BOOL)bestImageChanged
{
  return self->_bestImageChanged;
}

- (void)_setBestImageChanged:(BOOL)a3
{
  self->_bestImageChanged = a3;
}

- (BOOL)videoPlayerDidChange
{
  return self->_videoPlayerDidChange;
}

- (void)setVideoPlayerDidChange:(BOOL)a3
{
  self->_videoPlayerDidChange = a3;
}

- (BOOL)irisPlayerChanged
{
  return self->_irisPlayerChanged;
}

- (void)setIrisPlayerChanged:(BOOL)a3
{
  self->_irisPlayerChanged = a3;
}

- (BOOL)highlightTimeRangesChanged
{
  return self->_highlightTimeRangesChanged;
}

- (void)setHighlightTimeRangesChanged:(BOOL)a3
{
  self->_highlightTimeRangesChanged = a3;
}

- (BOOL)shouldShowHighlightTimeRangesChanged
{
  return self->_shouldShowHighlightTimeRangesChanged;
}

- (void)setShouldShowHighlightTimeRangesChanged:(BOOL)a3
{
  self->_shouldShowHighlightTimeRangesChanged = a3;
}

- (BOOL)needsResetVisualImageInteractionChanged
{
  return self->_needsResetVisualImageInteractionChanged;
}

- (void)setNeedsResetVisualImageInteractionChanged:(BOOL)a3
{
  self->_needsResetVisualImageInteractionChanged = a3;
}

- (BOOL)isDisplayingSearchQueryLabelChanged
{
  return self->_isDisplayingSearchQueryLabelChanged;
}

- (void)setIsDisplayingSearchQueryLabelChanged:(BOOL)a3
{
  self->_isDisplayingSearchQueryLabelChanged = a3;
}

- (BOOL)visualIntelligenceAnalyzeRequestIDChanged
{
  return self->_visualIntelligenceAnalyzeRequestIDChanged;
}

- (void)setVisualIntelligenceAnalyzeRequestIDChanged:(BOOL)a3
{
  self->_visualIntelligenceAnalyzeRequestIDChanged = a3;
}

- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged
{
  return self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged;
}

- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged:(BOOL)a3
{
  self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged = a3;
}

- (BOOL)isFullyInFocusChanged
{
  return self->_isFullyInFocusChanged;
}

- (void)setIsFullyInFocusChanged:(BOOL)a3
{
  self->_isFullyInFocusChanged = a3;
}

- (BOOL)isFullyOutOfFocusChanged
{
  return self->_isFullyOutOfFocusChanged;
}

- (void)setIsFullyOutOfFocusChanged:(BOOL)a3
{
  self->_isFullyOutOfFocusChanged = a3;
}

- (BOOL)isZoomedInChanged
{
  return self->_isZoomedInChanged;
}

- (void)setIsZoomedInChanged:(BOOL)a3
{
  self->_isZoomedInChanged = a3;
}

- (BOOL)accessoryViewVisibilityFractionChanged
{
  return self->_accessoryViewVisibilityFractionChanged;
}

- (void)setAccessoryViewVisibilityFractionChanged:(BOOL)a3
{
  self->_accessoryViewVisibilityFractionChanged = a3;
}

- (BOOL)mainImageContentsRectChanged
{
  return self->_mainImageContentsRectChanged;
}

- (void)setMainImageContentsRectChanged:(BOOL)a3
{
  self->_mainImageContentsRectChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageChange, 0);
  objc_storeStrong((id *)&self->_irisPlayerChange, 0);
  objc_storeStrong((id *)&self->_videoPlayerChange, 0);
}

@end
