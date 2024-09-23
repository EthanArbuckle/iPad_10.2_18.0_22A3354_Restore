@implementation PUOneUpSettings

- (void)setDefaultValues
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUOneUpSettings;
  -[PTSettings setDefaultValues](&v10, sel_setDefaultValues);
  -[PUOneUpSettings setFullQualityCrossfadeDuration:](self, "setFullQualityCrossfadeDuration:", 0.8);
  -[PUOneUpSettings setFullQualityCrossfadeBehavior:](self, "setFullQualityCrossfadeBehavior:", 2);
  v3 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  -[PUOneUpSettings setTitleTapAction:](self, "setTitleTapAction:", 0);
  v6 = 1;
  -[PUOneUpSettings setAllowUserTransform:](self, "setAllowUserTransform:", 1);
  -[PUOneUpSettings setAllowBadges:](self, "setAllowBadges:", 1);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = v3 ^ 1u;
  -[PUOneUpSettings setAllowScrubber:](self, "setAllowScrubber:", v7);
  -[PUOneUpSettings setAllowChromeHiding:](self, "setAllowChromeHiding:", 1);
  -[PUOneUpSettings setAllowDoubleTapZoom:](self, "setAllowDoubleTapZoom:", 1);
  -[PUOneUpSettings setAllowFullsizeJPEGDisplay:](self, "setAllowFullsizeJPEGDisplay:", 1);
  -[PUOneUpSettings setUserNavigationMaximumDistance:](self, "setUserNavigationMaximumDistance:", 2);
  -[PUOneUpSettings setShowSaliencyRects:](self, "setShowSaliencyRects:", 0);
  -[PUOneUpSettings setShowFacesRect:](self, "setShowFacesRect:", 0);
  -[PUOneUpSettings setShowPaddedFacesRect:](self, "setShowPaddedFacesRect:", 0);
  -[PUOneUpSettings setShowBestSquareRect:](self, "setShowBestSquareRect:", 0);
  -[PUOneUpSettings setShowFacesTorsosRects:](self, "setShowFacesTorsosRects:", 0);
  -[PUOneUpSettings setShowGazeRects:](self, "setShowGazeRects:", 0);
  -[PUOneUpSettings setShowWallpaperCropRect:](self, "setShowWallpaperCropRect:", 0);
  -[PUOneUpSettings setEnableFigPhotoTiledLayer:](self, "setEnableFigPhotoTiledLayer:", 1);
  -[PUOneUpSettings setUseURLForLargePhotosWithFigPhotoTiledLayer:](self, "setUseURLForLargePhotosWithFigPhotoTiledLayer:", 1);
  -[PUOneUpSettings setForceURLWithFigPhotoTiledLayer:](self, "setForceURLWithFigPhotoTiledLayer:", 0);
  -[PUOneUpSettings setEnableFigPhotoBackgroundSizeBasedDisplay:](self, "setEnableFigPhotoBackgroundSizeBasedDisplay:", 0);
  -[PUOneUpSettings setSimulateWorstCaseFigPhotoBackgroundSize:](self, "setSimulateWorstCaseFigPhotoBackgroundSize:", 0);
  -[PUOneUpSettings setUseHDRVideoThumbnails:](self, "setUseHDRVideoThumbnails:", 0);
  -[PUOneUpSettings setEnableHDRImages:](self, "setEnableHDRImages:", _os_feature_enabled_impl());
  -[PUOneUpSettings setEnableImageDecodeToHDR:](self, "setEnableImageDecodeToHDR:", _os_feature_enabled_impl());
  -[PUOneUpSettings setEnableFlexGTC:](self, "setEnableFlexGTC:", 1);
  -[PUOneUpSettings setEnablePreferredImageDynamicRangeAnimation:](self, "setEnablePreferredImageDynamicRangeAnimation:", 1);
  -[PUOneUpSettings setPreferredImageDynamicRangeAnimationDuration:](self, "setPreferredImageDynamicRangeAnimationDuration:", 2.0);
  -[PUOneUpSettings setHdrSuppressionAnimationDuration:](self, "setHdrSuppressionAnimationDuration:", 2.0);
  -[PUOneUpSettings setShowGainMapButton:](self, "setShowGainMapButton:", 0);
  -[PUOneUpSettings setAccessoryViewType:](self, "setAccessoryViewType:", 1);
  -[PUOneUpSettings setAccessoryInitialTopPosition:](self, "setAccessoryInitialTopPosition:", 0.300000012);
  -[PUOneUpSettings setMinimumVisibleContentHeight:](self, "setMinimumVisibleContentHeight:", -180.0);
  -[PUOneUpSettings setMinimumVisibleCommentedContentHeight:](self, "setMinimumVisibleCommentedContentHeight:", 100.0);
  -[PUOneUpSettings setMinimumFullCommentTitleViewWidth:](self, "setMinimumFullCommentTitleViewWidth:", 375.0);
  -[PUOneUpSettings setAllowsDetailsToggleButtonInBars:](self, "setAllowsDetailsToggleButtonInBars:", 1);
  -[PUOneUpSettings setSquareImageCapToHalfHeight:](self, "setSquareImageCapToHalfHeight:", 1);
  -[PUOneUpSettings setHideFloatingInfoPanelWhenHidingChrome:](self, "setHideFloatingInfoPanelWhenHidingChrome:", 0);
  -[PUOneUpSettings setHideToolbarWhenShowingAccessoryView:](self, "setHideToolbarWhenShowingAccessoryView:", 0);
  -[PUOneUpSettings setShouldFadeAccessoryView:](self, "setShouldFadeAccessoryView:", 1);
  -[PUOneUpSettings setChromeDefaultAnimationDuration:](self, "setChromeDefaultAnimationDuration:", *MEMORY[0x1E0DC51A0]);
  -[PUOneUpSettings setChromeAutoHideBehaviorOnLivePhoto:](self, "setChromeAutoHideBehaviorOnLivePhoto:", 0);
  -[PUOneUpSettings setChromeAutoHideBehaviorOnPlayButton:](self, "setChromeAutoHideBehaviorOnPlayButton:", 2);
  -[PUOneUpSettings setChromeAutoHideBehaviorOnSwipe:](self, "setChromeAutoHideBehaviorOnSwipe:", 0);
  -[PUOneUpSettings setChromeAutoHideBehaviorOnZoom:](self, "setChromeAutoHideBehaviorOnZoom:", 2);
  -[PUOneUpSettings setChromeAutoHideDelay:](self, "setChromeAutoHideDelay:", 0.0);
  -[PUOneUpSettings setPersistChromeVisibility:](self, "setPersistChromeVisibility:", PLIsCamera());
  -[PUOneUpSettings setChromeTimedAutoHideAnimationDuration:](self, "setChromeTimedAutoHideAnimationDuration:", 1.0);
  -[PUOneUpSettings setChromeAnimationType:](self, "setChromeAnimationType:", 1);
  -[PUOneUpSettings setChromeBackgroundAnimationType:](self, "setChromeBackgroundAnimationType:", 1);
  -[PUOneUpSettings setAllowParallax:](self, "setAllowParallax:", 1);
  -[PUOneUpSettings setInterpageSpacing:](self, "setInterpageSpacing:", 40.0);
  -[PUOneUpSettings setPagingSpringPullAdjustment:](self, "setPagingSpringPullAdjustment:", 0.0);
  -[PUOneUpSettings setPagingFrictionAdjustment:](self, "setPagingFrictionAdjustment:", 2.0);
  -[PUOneUpSettings setParallaxModel:](self, "setParallaxModel:", 1);
  -[PUOneUpSettings setParallaxFactor:](self, "setParallaxFactor:", 12.5);
  -[PUOneUpSettings setItemContentCornerRadius:](self, "setItemContentCornerRadius:", 0.0);
  -[PUOneUpSettings setAllowStatusBar:](self, "setAllowStatusBar:", 1);
  -[PUOneUpSettings setBarsAreaVerticalOutset:](self, "setBarsAreaVerticalOutset:", 10.0);
  -[PUOneUpSettings setVisualLookupGlyphAnimationFadeOutDelay:](self, "setVisualLookupGlyphAnimationFadeOutDelay:", 3.0);
  -[PUOneUpSettings setScaleToFitBehavior:](self, "setScaleToFitBehavior:", 1);
  -[PUOneUpSettings setMinimumContentInset:](self, "setMinimumContentInset:", 0.0);
  -[PUOneUpSettings setDefaultZoomInFactor:](self, "setDefaultZoomInFactor:", 6.0);
  -[PUOneUpSettings setDoubleTapZoomFactor:](self, "setDoubleTapZoomFactor:", 2.5);
  -[PUOneUpSettings setDoubleTapZoomAreaExcludesBars:](self, "setDoubleTapZoomAreaExcludesBars:", 1);
  -[PUOneUpSettings setDoubleTapZoomAreaExcludesBackground:](self, "setDoubleTapZoomAreaExcludesBackground:", 1);
  if ((PLIsMobileSlideShow() & 1) == 0)
  {
    if ((PLIsCamera() & 1) != 0)
      v6 = 1;
    else
      v6 = PLIsSpotlight();
  }
  -[PUOneUpSettings setAutoplayVideo:](self, "setAutoplayVideo:", v6);
  -[PUOneUpSettings setVideoAutoplayThreshold:](self, "setVideoAutoplayThreshold:", 0.800000012);
  -[PUOneUpSettings setVideoPauseThreshold:](self, "setVideoPauseThreshold:", 1.0);
  if ((PLIsMobileSlideShow() & 1) != 0 || (PLIsCamera() & 1) != 0 || (PLIsSpotlight() & 1) != 0)
    v8 = 1;
  else
    v8 = PLIsPreferences();
  -[PUOneUpSettings setAllowPlayButtonInBars:](self, "setAllowPlayButtonInBars:", v8);
  -[PUOneUpSettings setAutoplayScrubberWidth:](self, "setAutoplayScrubberWidth:", 100.0);
  -[PUOneUpSettings setVideoShowDebugBorders:](self, "setVideoShowDebugBorders:", 0);
  -[PUOneUpSettings setVideoShowLiveEffectsRenderingIndicator:](self, "setVideoShowLiveEffectsRenderingIndicator:", 0);
  v9 = 1;
  -[PUOneUpSettings setLivePhotoSRLCompensationEnabled:](self, "setLivePhotoSRLCompensationEnabled:", 1);
  -[PUOneUpSettings setLivePhotoSRLCompensationManualMode:](self, "setLivePhotoSRLCompensationManualMode:", 0);
  -[PUOneUpSettings setLivePhotoSRLCompensationManualValue:](self, "setLivePhotoSRLCompensationManualValue:", 0.0);
  -[PUOneUpSettings setLivePhotoSRLCompensationFilterName:](self, "setLivePhotoSRLCompensationFilterName:", CFSTR("srl"));
  -[PUOneUpSettings setLivePhotoInteractionThreshold:](self, "setLivePhotoInteractionThreshold:", 0.5);
  -[PUOneUpSettings setVitalityMaxAllowedInsetPoints:](self, "setVitalityMaxAllowedInsetPoints:", 25.0);
  -[PUOneUpSettings setVitalityMaxAllowedLargeInsetPoints:](self, "setVitalityMaxAllowedLargeInsetPoints:", 40.0);
  -[PUOneUpSettings setVitalityUseInsetLimiting:](self, "setVitalityUseInsetLimiting:", 1);
  -[PUOneUpSettings setApplyPerspectiveTransformDuringVitality:](self, "setApplyPerspectiveTransformDuringVitality:", 1);
  -[PUOneUpSettings setLockScrollDuringLivePhotoPlayback:](self, "setLockScrollDuringLivePhotoPlayback:", 1);
  -[PUOneUpSettings setLivePhotoScrubberShowForPlayback:](self, "setLivePhotoScrubberShowForPlayback:", 0);
  if ((PLIsMobileSlideShow() & 1) == 0)
    v9 = PLIsCamera();
  -[PUOneUpSettings setShouldMergeOverlappingLivePhotos:](self, "setShouldMergeOverlappingLivePhotos:", v9);
  -[PUOneUpSettings setLivePhotoMinimumOverlappingDuration:](self, "setLivePhotoMinimumOverlappingDuration:", 0.0);
  -[PUOneUpSettings setOverlappingLivePhotosCountLimit:](self, "setOverlappingLivePhotosCountLimit:", 16);
  -[PUOneUpSettings setVitalityMaskBlur:](self, "setVitalityMaskBlur:", 4.0);
  -[PUOneUpSettings setVitalityFeatherScale:](self, "setVitalityFeatherScale:", 0.005);
  -[PUOneUpSettings setShowReframedBadge:](self, "setShowReframedBadge:", 1);
  -[PUOneUpSettings setShowVideoSearchHighlightLabel:](self, "setShowVideoSearchHighlightLabel:", 1);
  -[PUOneUpSettings setVideoStartAtFirstHighlight:](self, "setVideoStartAtFirstHighlight:", 1);
  -[PUOneUpSettings setVideoHighlightColorName:](self, "setVideoHighlightColorName:", 0);
  -[PUOneUpSettings setVideoHighlightPreroll:](self, "setVideoHighlightPreroll:", 0.25);
  -[PUOneUpSettings setViewModelCacheCountLimit:](self, "setViewModelCacheCountLimit:", 100);
  -[PUOneUpSettings setVisibilityDurationForEnteringQuickPagingRegime:](self, "setVisibilityDurationForEnteringQuickPagingRegime:", 0.5);
  -[PUOneUpSettings setVisibilityDurationForExitingQuickPagingRegime:](self, "setVisibilityDurationForExitingQuickPagingRegime:", 0.55);
  -[PUOneUpSettings setMinNavigationDistanceForQuickPagingRegime:](self, "setMinNavigationDistanceForQuickPagingRegime:", 3);
  -[PUOneUpSettings setVisibilityDurationForEnteringFastRegime:](self, "setVisibilityDurationForEnteringFastRegime:", 0.07);
  -[PUOneUpSettings setVisibilityDurationForExitingFastRegime:](self, "setVisibilityDurationForExitingFastRegime:", 0.11);
  -[PUOneUpSettings setMinNavigationDistanceForFastRegime:](self, "setMinNavigationDistanceForFastRegime:", 10);
  -[PUOneUpSettings setBounceDuration:](self, "setBounceDuration:", 0.5);
  -[PUOneUpSettings setBounceDelay:](self, "setBounceDelay:", 0.0);
  -[PUOneUpSettings setBounceInitialVelocity:](self, "setBounceInitialVelocity:", 100.0);
  -[PUOneUpSettings setBounceSpringDamping:](self, "setBounceSpringDamping:", 1.0);
  -[PUOneUpSettings setAllowGIFPlayback:](self, "setAllowGIFPlayback:", 1);
  -[PUOneUpSettings setShowGIFLoadingDelays:](self, "setShowGIFLoadingDelays:", 0);
  -[PUOneUpSettings setPlayGIFSettledThreshold:](self, "setPlayGIFSettledThreshold:", 0.25);
  -[PUOneUpSettings setPlayGIFEnterThreshold:](self, "setPlayGIFEnterThreshold:", 0.899999976);
  -[PUOneUpSettings setPlayGIFMoveOutThreshold:](self, "setPlayGIFMoveOutThreshold:", 0.25);
  -[PUOneUpSettings setUserAllowsVisualIntelligence:](self, "setUserAllowsVisualIntelligence:", 1);
  -[PUOneUpSettings setUserAllowsVisualIntelligenceV2:](self, "setUserAllowsVisualIntelligenceV2:", 1);
  -[PUOneUpSettings setUserAllowsVisualIntelligenceInVideoFrame:](self, "setUserAllowsVisualIntelligenceInVideoFrame:", 1);
  -[PUOneUpSettings setUserAllowsVisualIntelligenceRemoveBackground:](self, "setUserAllowsVisualIntelligenceRemoveBackground:", 1);
  -[PUOneUpSettings setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:](self, "setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:", 1);
  -[PUOneUpSettings setSimulateAssetContentLoading:](self, "setSimulateAssetContentLoading:", 0);
  -[PUOneUpSettings setSimulatedAssetContentLoadingDuration:](self, "setSimulatedAssetContentLoadingDuration:", 5.0);
  -[PUOneUpSettings setSimulateLoadingError:](self, "setSimulateLoadingError:", 0);
  -[PUOneUpSettings setSimulatedLoadingErrorType:](self, "setSimulatedLoadingErrorType:", 0);
  -[PUOneUpSettings setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:](self, "setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:", 1);
  -[PUOneUpSettings setQuickCropEnabled:](self, "setQuickCropEnabled:", 1);
  -[PUOneUpSettings setQuickCropInvisibilityTimer:](self, "setQuickCropInvisibilityTimer:", 3.5);
  -[PUOneUpSettings setQuickCropFadeIn:](self, "setQuickCropFadeIn:", 0.5);
  -[PUOneUpSettings setQuickCropFadeOut:](self, "setQuickCropFadeOut:", 0.2);
  -[PUOneUpSettings setQuickCropBackgroundBrightness:](self, "setQuickCropBackgroundBrightness:", -0.13);
  -[PUOneUpSettings setQuickCropHideOtherToolsInEdit:](self, "setQuickCropHideOtherToolsInEdit:", 0);
  -[PUOneUpSettings setQuickCropUseSymbol:](self, "setQuickCropUseSymbol:", 0);
  -[PUOneUpSettings setUseDebuggingColors:](self, "setUseDebuggingColors:", 0);
  -[PUOneUpSettings setDebuggingTitleType:](self, "setDebuggingTitleType:", 0);
  -[PUOneUpSettings setDebuggingBadges:](self, "setDebuggingBadges:", 0);
  -[PUOneUpSettings setDebuggingBadgesWhenFavorite:](self, "setDebuggingBadgesWhenFavorite:", 0);
  -[PUOneUpSettings setUseDebuggingProgressLabel:](self, "setUseDebuggingProgressLabel:", 0);
  -[PUOneUpSettings setShowBufferingIndicatorDuringPlay:](self, "setShowBufferingIndicatorDuringPlay:", 0);
  -[PUOneUpSettings setShowLoadingIndicatorDuringDownload:](self, "setShowLoadingIndicatorDuringDownload:", 0);
  -[PUOneUpSettings setAlwaysShowRenderIndicator:](self, "setAlwaysShowRenderIndicator:", 0);
  -[PUOneUpSettings setSimulatedRenderProgress:](self, "setSimulatedRenderProgress:", 0.33);
  -[PUOneUpSettings setAlwaysShowAirPlayButton:](self, "setAlwaysShowAirPlayButton:", 0);
  -[PUOneUpSettings setFinalFadeOutDuration:](self, "setFinalFadeOutDuration:", 0.2);
}

- (BOOL)allowsVisualIntelligenceV2
{
  _BOOL8 v2;

  LODWORD(v2) = -[PUOneUpSettings userAllowsVisualIntelligenceV2](self, "userAllowsVisualIntelligenceV2");
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1)
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1654);
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 8) & 1;
  }
  return v2;
}

- (BOOL)allowVisualIntelligence
{
  _BOOL4 v2;

  v2 = -[PUOneUpSettings userAllowsVisualIntelligence](self, "userAllowsVisualIntelligence");
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1)
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1654);
    LOBYTE(v2) = _visualIntelligenceSupport_sharedSupport & 1;
  }
  return v2;
}

- (void)setVitalityUseInsetLimiting:(BOOL)a3
{
  self->_vitalityUseInsetLimiting = a3;
}

- (void)setVitalityMaxAllowedLargeInsetPoints:(double)a3
{
  self->_vitalityMaxAllowedLargeInsetPoints = a3;
}

- (void)setVitalityMaxAllowedInsetPoints:(double)a3
{
  self->_vitalityMaxAllowedInsetPoints = a3;
}

- (void)setVitalityMaskBlur:(double)a3
{
  self->_vitalityMaskBlur = a3;
}

- (void)setVitalityFeatherScale:(double)a3
{
  self->_vitalityFeatherScale = a3;
}

- (void)setVisualLookupGlyphAnimationFadeOutDelay:(double)a3
{
  self->_visualLookupGlyphAnimationFadeOutDelay = a3;
}

- (void)setVisibilityDurationForExitingQuickPagingRegime:(double)a3
{
  self->_visibilityDurationForExitingQuickPagingRegime = a3;
}

- (void)setVisibilityDurationForExitingFastRegime:(double)a3
{
  self->_visibilityDurationForExitingFastRegime = a3;
}

- (void)setVisibilityDurationForEnteringQuickPagingRegime:(double)a3
{
  self->_visibilityDurationForEnteringQuickPagingRegime = a3;
}

- (void)setVisibilityDurationForEnteringFastRegime:(double)a3
{
  self->_visibilityDurationForEnteringFastRegime = a3;
}

- (void)setViewModelCacheCountLimit:(unint64_t)a3
{
  self->_viewModelCacheCountLimit = a3;
}

- (void)setVideoStartAtFirstHighlight:(BOOL)a3
{
  self->_videoStartAtFirstHighlight = a3;
}

- (void)setVideoShowLiveEffectsRenderingIndicator:(BOOL)a3
{
  self->_videoShowLiveEffectsRenderingIndicator = a3;
}

- (void)setVideoShowDebugBorders:(BOOL)a3
{
  self->_videoShowDebugBorders = a3;
}

- (void)setVideoPauseThreshold:(double)a3
{
  self->_videoPauseThreshold = a3;
}

- (void)setVideoHighlightPreroll:(double)a3
{
  self->_videoHighlightPreroll = a3;
}

- (void)setVideoHighlightColorName:(unint64_t)a3
{
  self->_videoHighlightColorName = a3;
}

- (void)setVideoAutoplayThreshold:(double)a3
{
  self->_videoAutoplayThreshold = a3;
}

- (void)setUserNavigationMaximumDistance:(int64_t)a3
{
  self->_userNavigationMaximumDistance = a3;
}

- (void)setUseURLForLargePhotosWithFigPhotoTiledLayer:(BOOL)a3
{
  self->_useURLForLargePhotosWithFigPhotoTiledLayer = a3;
}

- (void)setUseHDRVideoThumbnails:(BOOL)a3
{
  self->_useHDRVideoThumbnails = a3;
}

- (void)setUseDebuggingProgressLabel:(BOOL)a3
{
  self->_useDebuggingProgressLabel = a3;
}

- (void)setUseDebuggingColors:(BOOL)a3
{
  self->_useDebuggingColors = a3;
}

- (void)setTitleTapAction:(int64_t)a3
{
  self->_titleTapAction = a3;
}

- (void)setSquareImageCapToHalfHeight:(BOOL)a3
{
  self->_squareImageCapToHalfHeight = a3;
}

- (void)setSimulatedRenderProgress:(double)a3
{
  self->_simulatedRenderProgress = a3;
}

- (void)setSimulatedLoadingErrorType:(int64_t)a3
{
  self->_simulatedLoadingErrorType = a3;
}

- (void)setSimulatedAssetContentLoadingDuration:(double)a3
{
  self->_simulatedAssetContentLoadingDuration = a3;
}

- (void)setSimulateWorstCaseFigPhotoBackgroundSize:(BOOL)a3
{
  self->_simulateWorstCaseFigPhotoBackgroundSize = a3;
}

- (void)setSimulateLoadingError:(BOOL)a3
{
  self->_simulateLoadingError = a3;
}

- (void)setSimulateAssetContentLoading:(BOOL)a3
{
  self->_simulateAssetContentLoading = a3;
}

- (void)setShowWallpaperCropRect:(BOOL)a3
{
  self->_showWallpaperCropRect = a3;
}

- (void)setShowVideoSearchHighlightLabel:(BOOL)a3
{
  self->_showVideoSearchHighlightLabel = a3;
}

- (void)setShowSaliencyRects:(BOOL)a3
{
  self->_showSaliencyRects = a3;
}

- (void)setShowReframedBadge:(BOOL)a3
{
  self->_showReframedBadge = a3;
}

- (void)setShowPaddedFacesRect:(BOOL)a3
{
  self->_showPaddedFacesRect = a3;
}

- (void)setShowLoadingIndicatorDuringDownload:(BOOL)a3
{
  self->_showLoadingIndicatorDuringDownload = a3;
}

- (void)setShowGazeRects:(BOOL)a3
{
  self->_showGazeRects = a3;
}

- (void)setShowGainMapButton:(BOOL)a3
{
  self->_showGainMapButton = a3;
}

- (void)setShowGIFLoadingDelays:(BOOL)a3
{
  self->_showGIFLoadingDelays = a3;
}

- (void)setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls = a3;
}

- (void)setShowFacesTorsosRects:(BOOL)a3
{
  self->_showFacesTorsosRects = a3;
}

- (void)setShowFacesRect:(BOOL)a3
{
  self->_showFacesRect = a3;
}

- (void)setShowBufferingIndicatorDuringPlay:(BOOL)a3
{
  self->_showBufferingIndicatorDuringPlay = a3;
}

- (void)setShowBestSquareRect:(BOOL)a3
{
  self->_showBestSquareRect = a3;
}

- (void)setShouldMergeOverlappingLivePhotos:(BOOL)a3
{
  self->_shouldMergeOverlappingLivePhotos = a3;
}

- (void)setShouldFadeAccessoryView:(BOOL)a3
{
  self->_shouldFadeAccessoryView = a3;
}

- (void)setScaleToFitBehavior:(unint64_t)a3
{
  self->_scaleToFitBehavior = a3;
}

- (void)setQuickCropUseSymbol:(BOOL)a3
{
  self->_quickCropUseSymbol = a3;
}

- (void)setQuickCropInvisibilityTimer:(double)a3
{
  self->_quickCropInvisibilityTimer = a3;
}

- (void)setQuickCropHideOtherToolsInEdit:(BOOL)a3
{
  self->_quickCropHideOtherToolsInEdit = a3;
}

- (void)setQuickCropFadeOut:(double)a3
{
  self->_quickCropFadeOut = a3;
}

- (void)setQuickCropFadeIn:(double)a3
{
  self->_quickCropFadeIn = a3;
}

- (void)setQuickCropEnabled:(BOOL)a3
{
  self->_quickCropEnabled = a3;
}

- (void)setQuickCropBackgroundBrightness:(double)a3
{
  self->_quickCropBackgroundBrightness = a3;
}

- (void)setPlayGIFSettledThreshold:(double)a3
{
  self->_playGIFSettledThreshold = a3;
}

- (void)setPlayGIFMoveOutThreshold:(double)a3
{
  self->_playGIFMoveOutThreshold = a3;
}

- (void)setPlayGIFEnterThreshold:(double)a3
{
  self->_playGIFEnterThreshold = a3;
}

- (void)setPersistChromeVisibility:(BOOL)a3
{
  self->_persistChromeVisibility = a3;
}

- (void)setParallaxModel:(int64_t)a3
{
  self->_parallaxModel = a3;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void)setPagingSpringPullAdjustment:(double)a3
{
  self->_pagingSpringPullAdjustment = a3;
}

- (void)setPagingFrictionAdjustment:(double)a3
{
  self->_pagingFrictionAdjustment = a3;
}

- (void)setOverlappingLivePhotosCountLimit:(unint64_t)a3
{
  self->_overlappingLivePhotosCountLimit = a3;
}

- (void)setMinimumVisibleContentHeight:(double)a3
{
  self->_minimumVisibleContentHeight = a3;
}

- (void)setMinimumVisibleCommentedContentHeight:(double)a3
{
  self->_minimumVisibleCommentedContentHeight = a3;
}

- (void)setMinimumFullCommentTitleViewWidth:(double)a3
{
  self->_minimumFullCommentTitleViewWidth = a3;
}

- (void)setMinimumContentInset:(double)a3
{
  self->_minimumContentInset = a3;
}

- (void)setMinNavigationDistanceForQuickPagingRegime:(int64_t)a3
{
  self->_minNavigationDistanceForQuickPagingRegime = a3;
}

- (void)setMinNavigationDistanceForFastRegime:(int64_t)a3
{
  self->_minNavigationDistanceForFastRegime = a3;
}

- (void)setLockScrollDuringLivePhotoPlayback:(BOOL)a3
{
  self->_lockScrollDuringLivePhotoPlayback = a3;
}

- (void)setLivePhotoScrubberShowForPlayback:(BOOL)a3
{
  self->_livePhotoScrubberShowForPlayback = a3;
}

- (void)setLivePhotoSRLCompensationManualValue:(double)a3
{
  self->_livePhotoSRLCompensationManualValue = a3;
}

- (void)setLivePhotoSRLCompensationManualMode:(BOOL)a3
{
  self->_livePhotoSRLCompensationManualMode = a3;
}

- (void)setLivePhotoSRLCompensationFilterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void)setLivePhotoSRLCompensationEnabled:(BOOL)a3
{
  self->_livePhotoSRLCompensationEnabled = a3;
}

- (void)setLivePhotoMinimumOverlappingDuration:(double)a3
{
  self->_livePhotoMinimumOverlappingDuration = a3;
}

- (void)setLivePhotoInteractionThreshold:(double)a3
{
  self->_livePhotoInteractionThreshold = a3;
}

- (void)setItemContentCornerRadius:(double)a3
{
  self->_itemContentCornerRadius = a3;
}

- (void)setInterpageSpacing:(double)a3
{
  self->_interpageSpacing = a3;
}

- (void)setHideToolbarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideToolbarWhenShowingAccessoryView = a3;
}

- (void)setHideFloatingInfoPanelWhenHidingChrome:(BOOL)a3
{
  self->_hideFloatingInfoPanelWhenHidingChrome = a3;
}

- (void)setFullQualityCrossfadeDuration:(double)a3
{
  self->_fullQualityCrossfadeDuration = a3;
}

- (void)setFullQualityCrossfadeBehavior:(unint64_t)a3
{
  self->_fullQualityCrossfadeBehavior = a3;
}

- (void)setForceURLWithFigPhotoTiledLayer:(BOOL)a3
{
  self->_forceURLWithFigPhotoTiledLayer = a3;
}

- (void)setFinalFadeOutDuration:(double)a3
{
  self->_finalFadeOutDuration = a3;
}

- (void)setEnableFigPhotoTiledLayer:(BOOL)a3
{
  self->_enableFigPhotoTiledLayer = a3;
}

- (void)setEnableFigPhotoBackgroundSizeBasedDisplay:(BOOL)a3
{
  self->_enableFigPhotoBackgroundSizeBasedDisplay = a3;
}

- (void)setDoubleTapZoomFactor:(double)a3
{
  self->_doubleTapZoomFactor = a3;
}

- (void)setDoubleTapZoomAreaExcludesBars:(BOOL)a3
{
  self->_doubleTapZoomAreaExcludesBars = a3;
}

- (void)setDoubleTapZoomAreaExcludesBackground:(BOOL)a3
{
  self->_doubleTapZoomAreaExcludesBackground = a3;
}

- (void)setDefaultZoomInFactor:(double)a3
{
  self->_defaultZoomInFactor = a3;
}

- (void)setDebuggingTitleType:(int64_t)a3
{
  self->_debuggingTitleType = a3;
}

- (void)setDebuggingBadgesWhenFavorite:(unint64_t)a3
{
  self->_debuggingBadgesWhenFavorite = a3;
}

- (void)setDebuggingBadges:(unint64_t)a3
{
  self->_debuggingBadges = a3;
}

- (void)setChromeTimedAutoHideAnimationDuration:(double)a3
{
  self->_chromeTimedAutoHideAnimationDuration = a3;
}

- (void)setChromeDefaultAnimationDuration:(double)a3
{
  self->_chromeDefaultAnimationDuration = a3;
}

- (void)setChromeBackgroundAnimationType:(int64_t)a3
{
  self->_chromeBackgroundAnimationType = a3;
}

- (void)setChromeAutoHideDelay:(double)a3
{
  self->_chromeAutoHideDelay = a3;
}

- (void)setChromeAutoHideBehaviorOnZoom:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnZoom = a3;
}

- (void)setChromeAutoHideBehaviorOnSwipe:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnSwipe = a3;
}

- (void)setChromeAutoHideBehaviorOnPlayButton:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnPlayButton = a3;
}

- (void)setChromeAutoHideBehaviorOnLivePhoto:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnLivePhoto = a3;
}

- (void)setChromeAnimationType:(int64_t)a3
{
  self->_chromeAnimationType = a3;
}

- (void)setBounceSpringDamping:(double)a3
{
  self->_bounceSpringDamping = a3;
}

- (void)setBounceInitialVelocity:(double)a3
{
  self->_bounceInitialVelocity = a3;
}

- (void)setBounceDuration:(double)a3
{
  self->_bounceDuration = a3;
}

- (void)setBounceDelay:(double)a3
{
  self->_bounceDelay = a3;
}

- (void)setBarsAreaVerticalOutset:(double)a3
{
  self->_barsAreaVerticalOutset = a3;
}

- (void)setAutoplayVideo:(BOOL)a3
{
  self->_autoplayVideo = a3;
}

- (void)setAutoplayScrubberWidth:(double)a3
{
  self->_autoplayScrubberWidth = a3;
}

- (void)setApplyPerspectiveTransformDuringVitality:(BOOL)a3
{
  self->_applyPerspectiveTransformDuringVitality = a3;
}

- (void)setAlwaysShowRenderIndicator:(BOOL)a3
{
  self->_alwaysShowRenderIndicator = a3;
}

- (void)setAlwaysShowAirPlayButton:(BOOL)a3
{
  self->_alwaysShowAirPlayButton = a3;
}

- (void)setAllowsDetailsToggleButtonInBars:(BOOL)a3
{
  self->_allowsDetailsToggleButtonInBars = a3;
}

- (void)setAllowUserTransform:(BOOL)a3
{
  self->_allowUserTransform = a3;
}

- (void)setAllowStatusBar:(BOOL)a3
{
  self->_allowStatusBar = a3;
}

- (void)setAllowScrubber:(BOOL)a3
{
  self->_allowScrubber = a3;
}

- (void)setAllowPlayButtonInBars:(BOOL)a3
{
  self->_allowPlayButtonInBars = a3;
}

- (void)setAllowParallax:(BOOL)a3
{
  self->_allowParallax = a3;
}

- (void)setAllowGIFPlayback:(BOOL)a3
{
  self->_allowGIFPlayback = a3;
}

- (void)setAllowFullsizeJPEGDisplay:(BOOL)a3
{
  self->_allowFullsizeJPEGDisplay = a3;
}

- (void)setAllowDoubleTapZoom:(BOOL)a3
{
  self->_allowDoubleTapZoom = a3;
}

- (void)setAllowChromeHiding:(BOOL)a3
{
  self->_allowChromeHiding = a3;
}

- (void)setAllowBadges:(BOOL)a3
{
  self->_allowBadges = a3;
}

- (void)setAccessoryViewType:(int64_t)a3
{
  self->_accessoryViewType = a3;
}

- (void)setAccessoryInitialTopPosition:(double)a3
{
  self->_accessoryInitialTopPosition = a3;
}

- (BOOL)allowsVisualIntelligenceRemoveBackground
{
  _BOOL8 v2;

  LODWORD(v2) = -[PUOneUpSettings userAllowsVisualIntelligenceRemoveBackground](self, "userAllowsVisualIntelligenceRemoveBackground");
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1)
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1654);
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 16) & 1;
  }
  return v2;
}

- (void)createChildren
{
  PUScrubberSettings *v3;
  PUScrubberSettings *scrubberSettings;

  v3 = -[PTSettings initWithDefaultValues]([PUScrubberSettings alloc], "initWithDefaultValues");
  scrubberSettings = self->_scrubberSettings;
  self->_scrubberSettings = v3;

}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (int64_t)version
{
  return 4;
}

- (BOOL)allowsVisualIntelligenceInVideoFrame
{
  _BOOL4 v2;

  v2 = -[PUOneUpSettings userAllowsVisualIntelligenceInVideoFrame](self, "userAllowsVisualIntelligenceInVideoFrame");
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1)
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1654);
    LOBYTE(v2) = byte_1EEBD0E2C & 1;
  }
  return v2;
}

- (BOOL)allowsVisualIntelligenceVisualLookupInfoPanelMode
{
  _BOOL8 v2;

  LODWORD(v2) = -[PUOneUpSettings userAllowsVisualIntelligenceVisualLookupInfoPanelMode](self, "userAllowsVisualIntelligenceVisualLookupInfoPanelMode");
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1)
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1654);
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 24) & 1;
  }
  return v2;
}

- (BOOL)allowAutoplayVideoForAsset:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *cachedAutoplayVideoEnabled;
  BOOL v7;

  v4 = a3;
  if (!self->_cachedAutoplayVideoEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PXPreferencesIsVideoAutoplayEnabled());
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    cachedAutoplayVideoEnabled = self->_cachedAutoplayVideoEnabled;
    self->_cachedAutoplayVideoEnabled = v5;

    PXRegisterPreferencesObserver();
  }
  if (-[PUOneUpSettings autoplayVideo](self, "autoplayVideo"))
    v7 = -[NSNumber BOOLValue](self->_cachedAutoplayVideoEnabled, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (UIColor)videoHighlightColor
{
  void *v2;

  v2 = -[PUOneUpSettings videoHighlightColorName](self, "videoHighlightColorName");
  if (v2 == (void *)1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v2;
}

- (BOOL)enableFlexGTC
{
  void *v2;
  void *v3;
  int v4;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.photos.DisableFlexGTC"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)setEnableFlexGTC:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("com.apple.photos.DisableFlexGTC"));

  }
}

- (void)preferencesDidChange
{
  NSNumber *cachedAutoplayVideoEnabled;

  cachedAutoplayVideoEnabled = self->_cachedAutoplayVideoEnabled;
  self->_cachedAutoplayVideoEnabled = 0;

  PXUnregisterPreferencesObserver();
}

- (int64_t)titleTapAction
{
  return self->_titleTapAction;
}

- (PUScrubberSettings)scrubberSettings
{
  return self->_scrubberSettings;
}

- (void)setScrubberSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberSettings, a3);
}

- (unint64_t)scaleToFitBehavior
{
  return self->_scaleToFitBehavior;
}

- (double)minimumContentInset
{
  return self->_minimumContentInset;
}

- (BOOL)allowUserTransform
{
  return self->_allowUserTransform;
}

- (BOOL)allowBadges
{
  return self->_allowBadges;
}

- (BOOL)allowScrubber
{
  return self->_allowScrubber;
}

- (BOOL)allowChromeHiding
{
  return self->_allowChromeHiding;
}

- (BOOL)allowDoubleTapZoom
{
  return self->_allowDoubleTapZoom;
}

- (BOOL)allowFullsizeJPEGDisplay
{
  return self->_allowFullsizeJPEGDisplay;
}

- (int64_t)userNavigationMaximumDistance
{
  return self->_userNavigationMaximumDistance;
}

- (BOOL)showSaliencyRects
{
  return self->_showSaliencyRects;
}

- (BOOL)showFacesRect
{
  return self->_showFacesRect;
}

- (BOOL)showPaddedFacesRect
{
  return self->_showPaddedFacesRect;
}

- (BOOL)showBestSquareRect
{
  return self->_showBestSquareRect;
}

- (BOOL)showFacesTorsosRects
{
  return self->_showFacesTorsosRects;
}

- (BOOL)showGazeRects
{
  return self->_showGazeRects;
}

- (BOOL)showWallpaperCropRect
{
  return self->_showWallpaperCropRect;
}

- (BOOL)useHDRVideoThumbnails
{
  return self->_useHDRVideoThumbnails;
}

- (BOOL)showGainMapButton
{
  return self->_showGainMapButton;
}

- (BOOL)enableHDRImages
{
  return self->_enableHDRImages;
}

- (void)setEnableHDRImages:(BOOL)a3
{
  self->_enableHDRImages = a3;
}

- (BOOL)enableImageDecodeToHDR
{
  return self->_enableImageDecodeToHDR;
}

- (void)setEnableImageDecodeToHDR:(BOOL)a3
{
  self->_enableImageDecodeToHDR = a3;
}

- (BOOL)enablePreferredImageDynamicRangeAnimation
{
  return self->_enablePreferredImageDynamicRangeAnimation;
}

- (void)setEnablePreferredImageDynamicRangeAnimation:(BOOL)a3
{
  self->_enablePreferredImageDynamicRangeAnimation = a3;
}

- (double)preferredImageDynamicRangeAnimationDuration
{
  return self->_preferredImageDynamicRangeAnimationDuration;
}

- (void)setPreferredImageDynamicRangeAnimationDuration:(double)a3
{
  self->_preferredImageDynamicRangeAnimationDuration = a3;
}

- (double)hdrSuppressionAnimationDuration
{
  return self->_hdrSuppressionAnimationDuration;
}

- (void)setHdrSuppressionAnimationDuration:(double)a3
{
  self->_hdrSuppressionAnimationDuration = a3;
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (double)accessoryInitialTopPosition
{
  return self->_accessoryInitialTopPosition;
}

- (double)minimumVisibleContentHeight
{
  return self->_minimumVisibleContentHeight;
}

- (double)minimumVisibleCommentedContentHeight
{
  return self->_minimumVisibleCommentedContentHeight;
}

- (double)minimumFullCommentTitleViewWidth
{
  return self->_minimumFullCommentTitleViewWidth;
}

- (BOOL)hideToolbarWhenShowingAccessoryView
{
  return self->_hideToolbarWhenShowingAccessoryView;
}

- (BOOL)hideFloatingInfoPanelWhenHidingChrome
{
  return self->_hideFloatingInfoPanelWhenHidingChrome;
}

- (BOOL)allowsDetailsToggleButtonInBars
{
  return self->_allowsDetailsToggleButtonInBars;
}

- (BOOL)squareImageCapToHalfHeight
{
  return self->_squareImageCapToHalfHeight;
}

- (BOOL)shouldFadeAccessoryView
{
  return self->_shouldFadeAccessoryView;
}

- (double)chromeDefaultAnimationDuration
{
  return self->_chromeDefaultAnimationDuration;
}

- (int64_t)chromeAutoHideBehaviorOnLivePhoto
{
  return self->_chromeAutoHideBehaviorOnLivePhoto;
}

- (int64_t)chromeAutoHideBehaviorOnPlayButton
{
  return self->_chromeAutoHideBehaviorOnPlayButton;
}

- (int64_t)chromeAutoHideBehaviorOnSwipe
{
  return self->_chromeAutoHideBehaviorOnSwipe;
}

- (int64_t)chromeAutoHideBehaviorOnZoom
{
  return self->_chromeAutoHideBehaviorOnZoom;
}

- (double)chromeAutoHideDelay
{
  return self->_chromeAutoHideDelay;
}

- (double)chromeTimedAutoHideAnimationDuration
{
  return self->_chromeTimedAutoHideAnimationDuration;
}

- (BOOL)persistChromeVisibility
{
  return self->_persistChromeVisibility;
}

- (int64_t)chromeAnimationType
{
  return self->_chromeAnimationType;
}

- (int64_t)chromeBackgroundAnimationType
{
  return self->_chromeBackgroundAnimationType;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (double)pagingSpringPullAdjustment
{
  return self->_pagingSpringPullAdjustment;
}

- (double)pagingFrictionAdjustment
{
  return self->_pagingFrictionAdjustment;
}

- (BOOL)allowParallax
{
  return self->_allowParallax;
}

- (int64_t)parallaxModel
{
  return self->_parallaxModel;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (double)itemContentCornerRadius
{
  return self->_itemContentCornerRadius;
}

- (BOOL)allowStatusBar
{
  return self->_allowStatusBar;
}

- (double)barsAreaVerticalOutset
{
  return self->_barsAreaVerticalOutset;
}

- (double)visualLookupGlyphAnimationFadeOutDelay
{
  return self->_visualLookupGlyphAnimationFadeOutDelay;
}

- (double)defaultZoomInFactor
{
  return self->_defaultZoomInFactor;
}

- (double)doubleTapZoomFactor
{
  return self->_doubleTapZoomFactor;
}

- (BOOL)doubleTapZoomAreaExcludesBars
{
  return self->_doubleTapZoomAreaExcludesBars;
}

- (BOOL)doubleTapZoomAreaExcludesBackground
{
  return self->_doubleTapZoomAreaExcludesBackground;
}

- (unint64_t)fullQualityCrossfadeBehavior
{
  return self->_fullQualityCrossfadeBehavior;
}

- (double)fullQualityCrossfadeDuration
{
  return self->_fullQualityCrossfadeDuration;
}

- (BOOL)retainProxyUntilZoom
{
  return self->_retainProxyUntilZoom;
}

- (void)setRetainProxyUntilZoom:(BOOL)a3
{
  self->_retainProxyUntilZoom = a3;
}

- (BOOL)enableFigPhotoTiledLayer
{
  return self->_enableFigPhotoTiledLayer;
}

- (BOOL)useURLForLargePhotosWithFigPhotoTiledLayer
{
  return self->_useURLForLargePhotosWithFigPhotoTiledLayer;
}

- (BOOL)forceURLWithFigPhotoTiledLayer
{
  return self->_forceURLWithFigPhotoTiledLayer;
}

- (BOOL)enableFigPhotoBackgroundSizeBasedDisplay
{
  return self->_enableFigPhotoBackgroundSizeBasedDisplay;
}

- (BOOL)simulateWorstCaseFigPhotoBackgroundSize
{
  return self->_simulateWorstCaseFigPhotoBackgroundSize;
}

- (BOOL)autoplayVideo
{
  return self->_autoplayVideo;
}

- (double)videoAutoplayThreshold
{
  return self->_videoAutoplayThreshold;
}

- (BOOL)allowPlayButtonInBars
{
  return self->_allowPlayButtonInBars;
}

- (double)videoPauseThreshold
{
  return self->_videoPauseThreshold;
}

- (double)autoplayScrubberWidth
{
  return self->_autoplayScrubberWidth;
}

- (BOOL)videoShowDebugBorders
{
  return self->_videoShowDebugBorders;
}

- (BOOL)videoShowLiveEffectsRenderingIndicator
{
  return self->_videoShowLiveEffectsRenderingIndicator;
}

- (BOOL)insertDummyHighlightTimeRanges
{
  return self->_insertDummyHighlightTimeRanges;
}

- (void)setInsertDummyHighlightTimeRanges:(BOOL)a3
{
  self->_insertDummyHighlightTimeRanges = a3;
}

- (BOOL)showVideoSearchHighlightLabel
{
  return self->_showVideoSearchHighlightLabel;
}

- (BOOL)videoStartAtFirstHighlight
{
  return self->_videoStartAtFirstHighlight;
}

- (BOOL)showVideoHighlightLabel
{
  return self->_showVideoHighlightLabel;
}

- (void)setShowVideoHighlightLabel:(BOOL)a3
{
  self->_showVideoHighlightLabel = a3;
}

- (BOOL)showSearchQueryInVideoHighlightLabel
{
  return self->_showSearchQueryInVideoHighlightLabel;
}

- (void)setShowSearchQueryInVideoHighlightLabel:(BOOL)a3
{
  self->_showSearchQueryInVideoHighlightLabel = a3;
}

- (unint64_t)videoHighlightColorName
{
  return self->_videoHighlightColorName;
}

- (double)videoHighlightPreroll
{
  return self->_videoHighlightPreroll;
}

- (BOOL)livePhotoSRLCompensationEnabled
{
  return self->_livePhotoSRLCompensationEnabled;
}

- (BOOL)livePhotoSRLCompensationManualMode
{
  return self->_livePhotoSRLCompensationManualMode;
}

- (double)livePhotoSRLCompensationManualValue
{
  return self->_livePhotoSRLCompensationManualValue;
}

- (NSString)livePhotoSRLCompensationFilterName
{
  return self->_livePhotoSRLCompensationFilterName;
}

- (double)livePhotoInteractionThreshold
{
  return self->_livePhotoInteractionThreshold;
}

- (BOOL)applyPerspectiveTransformDuringVitality
{
  return self->_applyPerspectiveTransformDuringVitality;
}

- (BOOL)lockScrollDuringLivePhotoPlayback
{
  return self->_lockScrollDuringLivePhotoPlayback;
}

- (BOOL)livePhotoScrubberShowForPlayback
{
  return self->_livePhotoScrubberShowForPlayback;
}

- (BOOL)shouldMergeOverlappingLivePhotos
{
  return self->_shouldMergeOverlappingLivePhotos;
}

- (double)livePhotoMinimumOverlappingDuration
{
  return self->_livePhotoMinimumOverlappingDuration;
}

- (unint64_t)overlappingLivePhotosCountLimit
{
  return self->_overlappingLivePhotosCountLimit;
}

- (double)vitalityMaskBlur
{
  return self->_vitalityMaskBlur;
}

- (double)vitalityFeatherScale
{
  return self->_vitalityFeatherScale;
}

- (double)vitalityMaxAllowedInsetPoints
{
  return self->_vitalityMaxAllowedInsetPoints;
}

- (double)vitalityMaxAllowedLargeInsetPoints
{
  return self->_vitalityMaxAllowedLargeInsetPoints;
}

- (BOOL)vitalityUseInsetLimiting
{
  return self->_vitalityUseInsetLimiting;
}

- (BOOL)showReframedBadge
{
  return self->_showReframedBadge;
}

- (unint64_t)viewModelCacheCountLimit
{
  return self->_viewModelCacheCountLimit;
}

- (double)visibilityDurationForEnteringQuickPagingRegime
{
  return self->_visibilityDurationForEnteringQuickPagingRegime;
}

- (double)visibilityDurationForExitingQuickPagingRegime
{
  return self->_visibilityDurationForExitingQuickPagingRegime;
}

- (int64_t)minNavigationDistanceForQuickPagingRegime
{
  return self->_minNavigationDistanceForQuickPagingRegime;
}

- (double)visibilityDurationForEnteringFastRegime
{
  return self->_visibilityDurationForEnteringFastRegime;
}

- (double)visibilityDurationForExitingFastRegime
{
  return self->_visibilityDurationForExitingFastRegime;
}

- (int64_t)minNavigationDistanceForFastRegime
{
  return self->_minNavigationDistanceForFastRegime;
}

- (double)bounceDuration
{
  return self->_bounceDuration;
}

- (double)bounceDelay
{
  return self->_bounceDelay;
}

- (double)bounceSpringDamping
{
  return self->_bounceSpringDamping;
}

- (double)bounceInitialVelocity
{
  return self->_bounceInitialVelocity;
}

- (BOOL)allowGIFPlayback
{
  return self->_allowGIFPlayback;
}

- (BOOL)showGIFLoadingDelays
{
  return self->_showGIFLoadingDelays;
}

- (double)playGIFSettledThreshold
{
  return self->_playGIFSettledThreshold;
}

- (double)playGIFEnterThreshold
{
  return self->_playGIFEnterThreshold;
}

- (double)playGIFMoveOutThreshold
{
  return self->_playGIFMoveOutThreshold;
}

- (BOOL)simulateAssetContentLoading
{
  return self->_simulateAssetContentLoading;
}

- (double)simulatedAssetContentLoadingDuration
{
  return self->_simulatedAssetContentLoadingDuration;
}

- (BOOL)simulateLoadingError
{
  return self->_simulateLoadingError;
}

- (int64_t)simulatedLoadingErrorType
{
  return self->_simulatedLoadingErrorType;
}

- (BOOL)showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls
{
  return self->_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls;
}

- (BOOL)quickCropEnabled
{
  return self->_quickCropEnabled;
}

- (double)quickCropInvisibilityTimer
{
  return self->_quickCropInvisibilityTimer;
}

- (double)quickCropFadeIn
{
  return self->_quickCropFadeIn;
}

- (double)quickCropFadeOut
{
  return self->_quickCropFadeOut;
}

- (double)quickCropBackgroundBrightness
{
  return self->_quickCropBackgroundBrightness;
}

- (BOOL)quickCropHideOtherToolsInEdit
{
  return self->_quickCropHideOtherToolsInEdit;
}

- (BOOL)quickCropUseSymbol
{
  return self->_quickCropUseSymbol;
}

- (BOOL)useDebuggingColors
{
  return self->_useDebuggingColors;
}

- (int64_t)debuggingTitleType
{
  return self->_debuggingTitleType;
}

- (unint64_t)debuggingBadges
{
  return self->_debuggingBadges;
}

- (unint64_t)debuggingBadgesWhenFavorite
{
  return self->_debuggingBadgesWhenFavorite;
}

- (BOOL)useDebuggingProgressLabel
{
  return self->_useDebuggingProgressLabel;
}

- (BOOL)showBufferingIndicatorDuringPlay
{
  return self->_showBufferingIndicatorDuringPlay;
}

- (BOOL)showLoadingIndicatorDuringDownload
{
  return self->_showLoadingIndicatorDuringDownload;
}

- (BOOL)alwaysShowRenderIndicator
{
  return self->_alwaysShowRenderIndicator;
}

- (double)simulatedRenderProgress
{
  return self->_simulatedRenderProgress;
}

- (BOOL)alwaysShowAirPlayButton
{
  return self->_alwaysShowAirPlayButton;
}

- (double)finalFadeOutDuration
{
  return self->_finalFadeOutDuration;
}

- (BOOL)userAllowsVisualIntelligence
{
  return self->_userAllowsVisualIntelligence;
}

- (void)setUserAllowsVisualIntelligence:(BOOL)a3
{
  self->_userAllowsVisualIntelligence = a3;
}

- (BOOL)userAllowsVisualIntelligenceV2
{
  return self->_userAllowsVisualIntelligenceV2;
}

- (void)setUserAllowsVisualIntelligenceV2:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceV2 = a3;
}

- (BOOL)userAllowsVisualIntelligenceInVideoFrame
{
  return self->_userAllowsVisualIntelligenceInVideoFrame;
}

- (void)setUserAllowsVisualIntelligenceInVideoFrame:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceInVideoFrame = a3;
}

- (BOOL)userAllowsVisualIntelligenceRemoveBackground
{
  return self->_userAllowsVisualIntelligenceRemoveBackground;
}

- (void)setUserAllowsVisualIntelligenceRemoveBackground:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceRemoveBackground = a3;
}

- (BOOL)userAllowsVisualIntelligenceVisualLookupInfoPanelMode
{
  return self->_userAllowsVisualIntelligenceVisualLookupInfoPanelMode;
}

- (void)setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceVisualLookupInfoPanelMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoSRLCompensationFilterName, 0);
  objc_storeStrong((id *)&self->_scrubberSettings, 0);
  objc_storeStrong((id *)&self->_cachedAutoplayVideoEnabled, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_52120 != -1)
    dispatch_once(&sharedInstance_onceToken_52120, &__block_literal_global_52121);
  return (id)sharedInstance_sharedInstance_52122;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  id v266;
  void *v267;
  void *v268;
  void *v269;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  int v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  _QWORD v499[19];
  void *v500;
  _QWORD v501[11];
  _QWORD v502[7];
  _QWORD v503[5];
  _QWORD v504[5];
  _QWORD v505[4];
  _QWORD v506[7];
  _QWORD v507[17];
  _QWORD v508[13];
  _QWORD v509[5];
  _QWORD v510[3];
  _QWORD v511[3];
  _QWORD v512[3];
  _QWORD v513[3];
  _QWORD v514[7];
  _QWORD v515[10];
  _QWORD v516[8];
  _QWORD v517[5];
  _QWORD v518[3];
  _QWORD v519[26];

  v519[24] = *MEMORY[0x1E0C80C00];
  v497 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Title Tap Action"), CFSTR("titleTapAction"));
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v494, "possibleValues:titles:", &unk_1E59BA1F8, &unk_1E59BA210);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v519[0] = v489;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Scale Content To Fit"), CFSTR("scaleToFitBehavior"));
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v483, "possibleValues:titles:", &unk_1E59BA228, &unk_1E59BA240);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v519[1] = v476;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Content Inset"), CFSTR("minimumContentInset"));
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v470, "minValue:maxValue:", 0.0, 300.0);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v464, "pu_increment:", 1.0);
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("scaleToFitBehavior == %@"), &unk_1E59BB850);
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v458, "condition:", v452);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v519[2] = v445;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("User Transform"), CFSTR("allowUserTransform"));
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v519[3] = v437;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Badges"), CFSTR("allowBadges"));
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v519[4] = v428;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Chrome Hiding"), CFSTR("allowChromeHiding"));
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v519[5] = v419;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Double Tap Zoom"), CFSTR("allowDoubleTapZoom"));
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v519[6] = v417;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("1:1 Zoom"), CFSTR("allowFullsizeJPEGDisplay"));
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v519[7] = v415;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("User Swipe Direction Memory"), CFSTR("userNavigationMaximumDistance"));
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v410, "minValue:maxValue:", 0.0, 20.0);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "pu_increment:", 1.0);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v519[8] = v393;
  v2 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(MEMORY[0x1E0D7BAA8], "sharedInstance");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_rowWithTitle:settings:", CFSTR("Swipe Down"), v385);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v519[9] = v377;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Library Scrubber"), CFSTR("allowScrubber"));
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v519[10] = v369;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scrubber"), CFSTR("scrubberSettings"));
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v519[11] = v361;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Saliency Rects"), CFSTR("showSaliencyRects"));
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v519[12] = v353;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Faces Rect"), CFSTR("showFacesRect"));
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v519[13] = v346;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Padded Faces Rect"), CFSTR("showPaddedFacesRect"));
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "conditionFormat:", CFSTR("showFacesRect == YES"));
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v519[14] = v332;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Best Square Rect"), CFSTR("showBestSquareRect"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v519[15] = v325;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Faces and Torsos Rects"), CFSTR("showFacesTorsosRects"));
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v519[16] = v320;
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showGazeRects);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Show Gaze Rects"), v315);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v519[17] = v310;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showWallpaperCropRect);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Show Wallpaper Crop Rects"), v306);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v519[18] = v302;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Gain Map Button"), CFSTR("showGainMapButton"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v519[19] = v298;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useHDRVideoThumbnails);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("HDR Video Thumbnails"), v293);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v519[20] = v6;
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableHDRImages);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Enable HDR Images"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v519[21] = v9;
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableImageDecodeToHDR);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Enable HDR Image Decode"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v519[22] = v12;
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFlexGTC);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Enable FlexGTC"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_enableImageDecodeToHDR);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conditionFormat:", CFSTR("%@ == YES"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v519[23] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v519, 24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v497, "sectionWithRows:title:", v18, CFSTR("Features"));
  v498 = (void *)objc_claimAutoreleasedReturnValue();

  v495 = (void *)MEMORY[0x1E0D83078];
  v19 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enablePreferredImageDynamicRangeAnimation);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:valueKeyPath:", CFSTR("Enable Animation"), v490);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v518[0] = v484;
  v20 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_preferredImageDynamicRangeAnimationDuration);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Preferred Image Dynamic Range Duration"), v477);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", 0.0, 10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pu_increment:", 0.0500000007);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "conditionFormat:", CFSTR("enablePreferredImageDynamicRangeAnimation == YES"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v518[1] = v24;
  v25 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_hdrSuppressionAnimationDuration);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pu_increment:", 0.100000001);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "conditionFormat:", CFSTR("enablePreferredImageDynamicRangeAnimation == YES"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v518[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v518, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v495, "sectionWithRows:title:", v31, CFSTR("HDR Animations"));
  v496 = (void *)objc_claimAutoreleasedReturnValue();

  v418 = _os_feature_enabled_impl();
  if (v418)
  {
    v465 = (void *)MEMORY[0x1E0D83078];
    v32 = (void *)MEMORY[0x1E0D83108];
    NSStringFromSelector(sel_userAllowsVisualIntelligence);
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Allow V1"), v491);
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    v517[0] = v485;
    v33 = (void *)MEMORY[0x1E0D83108];
    NSStringFromSelector(sel_userAllowsVisualIntelligenceV2);
    v478 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Allow V2"), v478);
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    v517[1] = v471;
    v34 = (void *)MEMORY[0x1E0D83108];
    NSStringFromSelector(sel_userAllowsVisualIntelligenceInVideoFrame);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Allow Video"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "conditionFormat:", CFSTR("allowVisualIntelligence == YES && allowsVisualIntelligenceV2 == YES"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v517[2] = v37;
    v38 = (void *)MEMORY[0x1E0D83108];
    NSStringFromSelector(sel_userAllowsVisualIntelligenceRemoveBackground);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Allow Remove Background"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "conditionFormat:", CFSTR("allowVisualIntelligence == YES"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v517[3] = v41;
    v42 = (void *)MEMORY[0x1E0D83108];
    NSStringFromSelector(sel_userAllowsVisualIntelligenceVisualLookupInfoPanelMode);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Allow Info Panel Mode"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "conditionFormat:", CFSTR("allowVisualIntelligence == YES"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v517[4] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v517, 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v465, "sectionWithRows:title:", v46, CFSTR("Visual Intelligence Allow"));
    v416 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v416 = 0;
  }
  v492 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Accessory Views"), CFSTR("accessoryViewType"));
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v486, "possibleValues:titles:", &unk_1E59BA258, &unk_1E59BA270);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v516[0] = v479;
  objc_msgSend(MEMORY[0x1E0D83048], "pu_rowWithTitle:settingsProvider:", CFSTR("Sample Accessory View Settings"), &__block_literal_global_340_51821);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accessoryViewType == %@"), &unk_1E59BB880);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v472, "condition:", v466);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  v516[1] = v459;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Initial Top Position"), CFSTR("accessoryInitialTopPosition"));
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v453, "minValue:maxValue:", 0.0, 1.0);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v446, "pu_increment:", 0.0500000007);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v516[2] = v438;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Visible Content Height"), CFSTR("minimumVisibleContentHeight"));
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v429, "minValue:maxValue:", -180.0, 500.0);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v420, "pu_increment:", 10.0);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v516[3] = v411;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Visible Commented Content Height"), CFSTR("minimumVisibleCommentedContentHeight"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "minValue:maxValue:", -100.0, 500.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "pu_increment:", 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v516[4] = v49;
  v50 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_squareImageCapToHalfHeight);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Square Image Cap to Half Height"), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v516[5] = v52;
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_hideFloatingInfoPanelWhenHidingChrome);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Hide Floating Info Panel When Hiding Chrome"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v516[6] = v55;
  v56 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldFadeAccessoryView);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("Fading Details View"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v516[7] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v516, 8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v492, "sectionWithRows:title:", v59, CFSTR("Accessory View"));
  v493 = (void *)objc_claimAutoreleasedReturnValue();

  v487 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Default Animation Duration"), CFSTR("chromeDefaultAnimationDuration"));
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v480, "minValue:maxValue:", 0.0, 1.0);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v473, "pu_increment:", 0.0500000007);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v515[0] = v467;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide on Play Button"), CFSTR("chromeAutoHideBehaviorOnPlayButton"));
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v460, "possibleValues:titles:", &unk_1E59BA288, &unk_1E59BA2A0);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v515[1] = v454;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide on Live Photo"), CFSTR("chromeAutoHideBehaviorOnLivePhoto"));
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v447, "possibleValues:titles:", &unk_1E59BA288, &unk_1E59BA2A0);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v515[2] = v439;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide on Swipe"), CFSTR("chromeAutoHideBehaviorOnSwipe"));
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v430, "possibleValues:titles:", &unk_1E59BA288, &unk_1E59BA2A0);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v515[3] = v421;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide on Zoom"), CFSTR("chromeAutoHideBehaviorOnZoom"));
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v412, "possibleValues:titles:", &unk_1E59BA288, &unk_1E59BA2A0);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v515[4] = v402;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide Delay"), CFSTR("chromeAutoHideDelay"));
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v394, "minValue:maxValue:", 0.0, 5.0);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "pu_increment:", 0.100000001);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v515[5] = v378;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide Animation Duration"), CFSTR("chromeTimedAutoHideAnimationDuration"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 5.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "pu_increment:", 0.0500000007);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "conditionFormat:", CFSTR("chromeAutoHideDelay > 0.0"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v515[6] = v63;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Persist Visibility"), CFSTR("persistChromeVisibility"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v515[7] = v64;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Animation Type"), CFSTR("chromeAnimationType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "possibleValues:titles:", &unk_1E59BA2B8, &unk_1E59BA2D0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v515[8] = v66;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Background Animation"), CFSTR("chromeBackgroundAnimationType"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "possibleValues:titles:", &unk_1E59BA2E8, &unk_1E59BA300);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v515[9] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v515, 10);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v487, "sectionWithRows:title:conditionFormat:", v69, CFSTR("Chrome"), CFSTR("allowChromeHiding != 0"));
  v488 = (void *)objc_claimAutoreleasedReturnValue();

  v481 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Interpage Spacing"), CFSTR("interpageSpacing"));
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v474, "minValue:maxValue:", 1.0, 100.0);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v468, "pu_increment:", 1.0);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v514[0] = v461;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Paging Spring Pull Adjustment"), CFSTR("pagingSpringPullAdjustment"));
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v455, "minValue:maxValue:", -3.0, 3.0);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v448, "pu_increment:", 0.100000001);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  v514[1] = v440;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Paging Friction Adjustment"), CFSTR("pagingFrictionAdjustment"));
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v431, "minValue:maxValue:", -3.0, 3.0);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v422, "pu_increment:", 0.100000001);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v514[2] = v413;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Parallax"), CFSTR("allowParallax"));
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v514[3] = v403;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Model"), CFSTR("parallaxModel"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "possibleValues:titles:", &unk_1E59BA318, &unk_1E59BA330);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v514[4] = v71;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Factor"), CFSTR("parallaxFactor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 100.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "pu_increment:", 0.5);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v514[5] = v74;
  v75 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_itemContentCornerRadius);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:valueKeyPath:", CFSTR("Item Content Corner Radius"), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", 0.0, 100.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "pu_increment:", 0.5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v514[6] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v514, 7);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v481, "sectionWithRows:title:", v80, CFSTR("Layout"));
  v482 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar"), CFSTR("allowStatusBar"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v513[0] = v82;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Area Vertical Outset"), CFSTR("barsAreaVerticalOutset"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "minValue:maxValue:", 0.0, 500.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "pu_increment:", 1.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v513[1] = v85;
  v86 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_visualLookupGlyphAnimationFadeOutDelay);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("LookUp Glyph FadeOut Delay"), v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "minValue:maxValue:", 0.0, 5.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "pu_increment:", 1.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v513[2] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v513, 3);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "sectionWithRows:title:", v91, CFSTR("Bars"));
  v475 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)MEMORY[0x1E0D83078];
  v93 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultZoomInFactor);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "rowWithTitle:valueKeyPath:", CFSTR("ZoomIn Factor"), v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "minValue:maxValue:", 1.0, 5.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "pu_increment:", 0.100000001);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v512[0] = v97;
  v98 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(MEMORY[0x1E0D7B648], "sharedInstance");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "pu_rowWithTitle:settings:", CFSTR("Core Settings"), v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v512[1] = v100;
  objc_msgSend(MEMORY[0x1E0D83048], "pu_rowWithTitle:action:", CFSTR("Review Initial Zoom Scales"), &__block_literal_global_505);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v512[2] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v512, 3);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "sectionWithRows:title:conditionFormat:", v102, CFSTR("Zoom"), CFSTR("allowDoubleTapZoom != 0"));
  v414 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Factor"), CFSTR("doubleTapZoomFactor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "minValue:maxValue:", 1.0, 5.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "pu_increment:", 0.100000001);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v511[0] = v106;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Area Excludes Bars"), CFSTR("doubleTapZoomAreaExcludesBars"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v511[1] = v107;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Area Excludes Background"), CFSTR("doubleTapZoomAreaExcludesBackground"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v511[2] = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v511, 3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "sectionWithRows:title:conditionFormat:", v109, CFSTR("Double Tap Zoom"), CFSTR("allowDoubleTapZoom != 0"));
  v469 = (void *)objc_claimAutoreleasedReturnValue();

  v462 = (void *)MEMORY[0x1E0D83078];
  v110 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "rowWithTitle:valueKeyPath:", CFSTR("Full Quality Crossfade"), v456);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v449, "possibleValues:titles:", &unk_1E59BA348, &unk_1E59BA360);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v510[0] = v441;
  v111 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_retainProxyUntilZoom);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "rowWithTitle:valueKeyPath:", CFSTR("Retain DP Proxy Until Zoom"), v432);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "conditionFormat:", CFSTR("%@ != 0"), v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v510[1] = v114;
  v115 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_fullQualityCrossfadeDuration);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "minValue:maxValue:", 0.0, 3.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "pu_increment:", 0.1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "conditionFormat:", CFSTR("%@ != 0"), v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v510[2] = v121;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v510, 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v462, "sectionWithRows:title:", v122, CFSTR("Image Loading"));
  v463 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable FigPhotoTiledLayer"), CFSTR("enableFigPhotoTiledLayer"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v509[0] = v124;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use URL for large photos"), CFSTR("useURLForLargePhotosWithFigPhotoTiledLayer"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v509[1] = v125;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force URL for all photos"), CFSTR("forceURLWithFigPhotoTiledLayer"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v509[2] = v126;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable background size based display"), CFSTR("enableFigPhotoBackgroundSizeBasedDisplay"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v509[3] = v127;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate worst case background size"), CFSTR("simulateWorstCaseFigPhotoBackgroundSize"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v509[4] = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v509, 5);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "sectionWithRows:title:", v129, CFSTR("Fig Photo Tiled Layer"));
  v457 = (void *)objc_claimAutoreleasedReturnValue();

  v450 = (void *)MEMORY[0x1E0D83078];
  v130 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_autoplayVideo);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "rowWithTitle:valueKeyPath:", CFSTR("Autoplay"), v442);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  v508[0] = v433;
  v131 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_videoAutoplayThreshold);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "rowWithTitle:valueKeyPath:", CFSTR("Threshold"), v423);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "minValue:maxValue:", 0.100000001, 1.0);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v395, "conditionFormat:", CFSTR("autoplayVideo == YES"));
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v508[1] = v387;
  v132 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_videoPauseThreshold);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "rowWithTitle:valueKeyPath:", CFSTR("Video Pause Threshold"), v379);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v370, "minValue:maxValue:", 0.100000001, 1.0);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v508[2] = v362;
  v133 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowPlayButtonInBars);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "rowWithTitle:valueKeyPath:", CFSTR("Play Button in Bars"), v354);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v508[3] = v347;
  v134 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoplayScrubberWidth);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "rowWithTitle:valueKeyPath:", CFSTR("Autoplay Scrubber Width"), v340);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v333, "minValue:maxValue:", 80.0, 200.0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v508[4] = v326;
  v135 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_videoShowDebugBorders);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "rowWithTitle:valueKeyPath:", CFSTR("Debug Borders"), v321);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v508[5] = v316;
  v136 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_videoShowLiveEffectsRenderingIndicator);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rowWithTitle:valueKeyPath:", CFSTR("Live Effects Indicator"), v311);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v508[6] = v307;
  v137 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_insertDummyHighlightTimeRanges);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "rowWithTitle:valueKeyPath:", CFSTR("Dummy Highlights"), v303);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v508[7] = v299;
  v138 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showVideoSearchHighlightLabel);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "rowWithTitle:valueKeyPath:", CFSTR("Search Highlight Label"), v294);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v508[8] = v290;
  v139 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSearchQueryInVideoHighlightLabel);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "rowWithTitle:valueKeyPath:", CFSTR("Show Query"), v287);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_showVideoSearchHighlightLabel);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "conditionFormat:", CFSTR("%@ == YES"), v281);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v508[9] = v140;
  v141 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_videoStartAtFirstHighlight);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "rowWithTitle:valueKeyPath:", CFSTR("Seek To Highlight"), v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v508[10] = v143;
  v144 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_videoHighlightColorName);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "rowWithTitle:valueKeyPath:", CFSTR("Highlight Color"), v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "possibleValues:titles:", &unk_1E59BA378, &unk_1E59BA390);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v508[11] = v147;
  v148 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_videoHighlightPreroll);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "rowWithTitle:valueKeyPath:", CFSTR("Highlight Preroll"), v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "minValue:maxValue:", 0.0, 1.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v508[12] = v151;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v508, 13);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v450, "sectionWithRows:title:", v152, CFSTR("Video"));
  v451 = (void *)objc_claimAutoreleasedReturnValue();

  v443 = (void *)MEMORY[0x1E0D83078];
  v153 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_livePhotoSRLCompensationEnabled);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "rowWithTitle:valueKeyPath:", CFSTR("SRL Compensation"), v434);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v507[0] = v424;
  v154 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_livePhotoSRLCompensationManualMode);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "rowWithTitle:valueKeyPath:", CFSTR("SRL Manual Mode"), v405);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "conditionFormat:", CFSTR("livePhotoSRLCompensationEnabled == 1"));
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v507[1] = v388;
  v155 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoSRLCompensationManualValue);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "rowWithTitle:valueKeyPath:", CFSTR("Manual Value"), v380);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "minValue:maxValue:", 0.0, 1.0);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v363, "conditionFormat:", CFSTR("livePhotoSRLCompensationEnabled == 1 && livePhotoSRLCompensationManualMode == 1"));
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v507[2] = v355;
  v156 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_livePhotoSRLCompensationFilterName);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "rowWithTitle:valueKeyPath:", CFSTR("Filter Type"), v348);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "possibleValues:titles:", &unk_1E59BA3A8, &unk_1E59BA3C0);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v334, "conditionFormat:", CFSTR("livePhotoSRLCompensationEnabled == 1"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v507[3] = v327;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Max Inset"), CFSTR("vitalityMaxAllowedInsetPoints"));
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v322, "minValue:maxValue:", 0.0, 40.0);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v507[4] = v317;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Max Large Inset"), CFSTR("vitalityMaxAllowedLargeInsetPoints"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "minValue:maxValue:", 0.0, 120.0);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v507[5] = v308;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Transform Limiting"), CFSTR("vitalityUseInsetLimiting"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v507[6] = v304;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Edge Blur"), CFSTR("vitalityMaskBlur"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "minValue:maxValue:", 0.0, 20.0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v507[7] = v295;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Feather Scale"), CFSTR("vitalityFeatherScale"));
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "minValue:maxValue:", 0.0, 0.05);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v507[8] = v288;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Interaction Threshold"), CFSTR("livePhotoInteractionThreshold"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "minValue:maxValue:", 0.0, 1.0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v507[9] = v282;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Transform During Vitality"), CFSTR("applyPerspectiveTransformDuringVitality"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v507[10] = v279;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Lock Scroll During Playback"), CFSTR("lockScrollDuringLivePhotoPlayback"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v507[11] = v277;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Scrubber on Play"), CFSTR("livePhotoScrubberShowForPlayback"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v507[12] = v157;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Merge Overlapping Captures"), CFSTR("shouldMergeOverlappingLivePhotos"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v507[13] = v158;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Overlap"), CFSTR("livePhotoMinimumOverlappingDuration"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "minValue:maxValue:", -120.0, 0.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "conditionFormat:", CFSTR("shouldMergeOverlappingLivePhotos == YES"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v507[14] = v161;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Overlapping Live Photos Count Limit"), CFSTR("overlappingLivePhotosCountLimit"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "minValue:maxValue:", 2.0, 100.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "conditionFormat:", CFSTR("shouldMergeOverlappingLivePhotos == YES"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v507[15] = v164;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Reframed Badge"), CFSTR("showReframedBadge"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v507[16] = v165;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v507, 17);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v443, "sectionWithRows:title:", v166, CFSTR("Live Photo"));
  v444 = (void *)objc_claimAutoreleasedReturnValue();

  v435 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("View Model Cache Count Limit"), CFSTR("viewModelCacheCountLimit"));
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v425, "minValue:maxValue:", 0.0, 2000.0);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v406, "pu_increment:", 50.0);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v506[0] = v397;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Entering Quick Paging Regime Duration"), CFSTR("visibilityDurationForEnteringQuickPagingRegime"));
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v389, "minValue:maxValue:", 0.0, 2.0);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "pu_increment:", 0.00999999978);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v506[1] = v372;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Exiting Quick Paging Regime Duration"), CFSTR("visibilityDurationForExitingQuickPagingRegime"));
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v364, "minValue:maxValue:", 0.0, 2.0);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "pu_increment:", 0.00999999978);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v506[2] = v349;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Scrub Distance For Quick Paging Regime"), CFSTR("minNavigationDistanceForQuickPagingRegime"));
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "minValue:maxValue:", 0.0, 100.0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "pu_increment:", 1.0);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v506[3] = v328;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Entering Fast Regime Duration"), CFSTR("visibilityDurationForEnteringFastRegime"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "minValue:maxValue:", 0.0, 0.300000012);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "pu_increment:", 0.00999999978);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v506[4] = v169;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Exiting Fast Regime Duration"), CFSTR("visibilityDurationForExitingFastRegime"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "minValue:maxValue:", 0.0, 0.300000012);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "pu_increment:", 0.00999999978);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v506[5] = v172;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Scrub Distance For Fast Regime"), CFSTR("minNavigationDistanceForFastRegime"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "minValue:maxValue:", 0.0, 100.0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "pu_increment:", 1.0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v506[6] = v175;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v506, 7);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v435, "sectionWithRows:title:", v176, CFSTR("Performance"));
  v436 = (void *)objc_claimAutoreleasedReturnValue();

  v426 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("bounceDuration"));
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v407, "minValue:maxValue:", 0.0, 1.0);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v398, "pu_increment:", 0.100000001);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v505[0] = v390;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Delay"), CFSTR("bounceDelay"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "minValue:maxValue:", 0.0, 0.5);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "pu_increment:", 0.100000001);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v505[1] = v179;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Spring Damping"), CFSTR("bounceSpringDamping"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "minValue:maxValue:", 0.0, 1.0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "pu_increment:", 0.100000001);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v505[2] = v182;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Initial Velocity"), CFSTR("bounceInitialVelocity"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "minValue:maxValue:", 0.0, 500.0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "pu_increment:", 50.0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v505[3] = v185;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v505, 4);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v426, "sectionWithRows:title:", v186, CFSTR("Orb Bounce"));
  v427 = (void *)objc_claimAutoreleasedReturnValue();

  v408 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow GIF playback"), CFSTR("allowGIFPlayback"));
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v504[0] = v399;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Loading Delays"), CFSTR("showGIFLoadingDelays"));
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "conditionFormat:", CFSTR("allowGIFPlayback != 0"));
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v504[1] = v382;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Enter Threshold"), CFSTR("playGIFEnterThreshold"));
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v373, "minValue:maxValue:", 0.0, 1.0);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "pu_increment:", 0.0500000007);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v357, "conditionFormat:", CFSTR("allowGIFPlayback != 0"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v504[2] = v187;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Settle Threshold"), CFSTR("playGIFSettledThreshold"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "minValue:maxValue:", 0.0, 1.0);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "pu_increment:", 0.0500000007);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "conditionFormat:", CFSTR("allowGIFPlayback != 0"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v504[3] = v191;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Leaving Threshold"), CFSTR("playGIFMoveOutThreshold"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "minValue:maxValue:", 0.0, 1.0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "pu_increment:", 0.0500000007);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "conditionFormat:", CFSTR("allowGIFPlayback != 0"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v504[4] = v195;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v504, 5);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v408, "sectionWithRows:title:", v196, CFSTR("GIF Playback"));
  v409 = (void *)objc_claimAutoreleasedReturnValue();

  v197 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_simulateAssetContentLoading);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "predicateWithFormat:", CFSTR("%@ != 0"), v198);
  v199 = objc_claimAutoreleasedReturnValue();

  v200 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_simulateAssetContentLoading);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_simulateLoadingError);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "predicateWithFormat:", CFSTR("%@ != 0 AND %@ != 0"), v201, v202);
  v203 = objc_claimAutoreleasedReturnValue();

  v383 = (void *)MEMORY[0x1E0D83078];
  v204 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateAssetContentLoading);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Content Loading"), v374);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v503[0] = v366;
  v205 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedAssetContentLoadingDuration);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "rowWithTitle:valueKeyPath:", CFSTR("Loading Speed"), v358);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "minValue:maxValue:", 0.0, 10.0);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v343, "pu_increment:", 0.5);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "condition:", v199);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v503[1] = v329;
  v206 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateLoadingError);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Loading Error"), v207);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v400 = (void *)v199;
  objc_msgSend(v208, "condition:", v199);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v503[2] = v209;
  v210 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedLoadingErrorType);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Error"), v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "possibleValues:titles:", &unk_1E59BA3D8, &unk_1E59BA3F0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v392 = (void *)v203;
  objc_msgSend(v213, "condition:", v203);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v503[3] = v214;
  v215 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "rowWithTitle:valueKeyPath:", CFSTR("Show File Radar Button (Internal Only)"), v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v503[4] = v217;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v503, 5);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "sectionWithRows:title:", v218, CFSTR("Loading & Playback Errors"));
  v384 = (void *)objc_claimAutoreleasedReturnValue();

  v375 = (void *)MEMORY[0x1E0D83078];
  v219 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_quickCropEnabled);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), v367);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v502[0] = v359;
  v220 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_quickCropInvisibilityTimer);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "rowWithTitle:valueKeyPath:", CFSTR("Hide Timer"), v351);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "minValue:maxValue:", 0.0, 10.0);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v502[1] = v337;
  v221 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_quickCropFadeIn);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "rowWithTitle:valueKeyPath:", CFSTR("Fade In"), v330);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "minValue:maxValue:", 0.0, 2.0);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v502[2] = v318;
  v222 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_quickCropFadeOut);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "rowWithTitle:valueKeyPath:", CFSTR("Fade Out"), v313);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "minValue:maxValue:", 0.0, 2.0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v502[3] = v224;
  v225 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_quickCropBackgroundBrightness);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "rowWithTitle:valueKeyPath:", CFSTR("BG Brightness"), v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "minValue:maxValue:", -0.5, 0.0);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v502[4] = v228;
  v229 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_quickCropHideOtherToolsInEdit);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "rowWithTitle:valueKeyPath:", CFSTR("Hide Other Edit Tools"), v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v502[5] = v231;
  v232 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_quickCropUseSymbol);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "rowWithTitle:valueKeyPath:", CFSTR("Use Symbol"), v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v502[6] = v234;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v502, 7);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v375, "sectionWithRows:title:", v235, CFSTR("Quick Crop"));
  v376 = (void *)objc_claimAutoreleasedReturnValue();

  v236 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_alwaysShowRenderIndicator);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "predicateWithFormat:", CFSTR("%@ != 0"), v237);
  v238 = objc_claimAutoreleasedReturnValue();

  v296 = (void *)MEMORY[0x1E0D83078];
  v239 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useDebuggingColors);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "rowWithTitle:valueKeyPath:", CFSTR("Debugging Colors"), v360);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v501[0] = v352;
  v240 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_debuggingTitleType);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "rowWithTitle:valueKeyPath:", CFSTR("Debugging Title"), v345);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "possibleValues:titles:", &unk_1E59BA438, &unk_1E59BA450);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v501[1] = v331;
  v241 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_debuggingBadges);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "rowWithTitle:valueKeyPath:", CFSTR("Debugging Badge"), v324);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "possibleValues:titles:", &unk_1E59BA408, &unk_1E59BA420);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "conditionFormat:", CFSTR("allowBadges != 0"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v501[2] = v309;
  v242 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_debuggingBadgesWhenFavorite);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "rowWithTitle:valueKeyPath:", CFSTR("Debugging Badge (Favorite)"), v305);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "possibleValues:titles:", &unk_1E59BA408, &unk_1E59BA420);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "conditionFormat:", CFSTR("allowBadges != 0"));
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v501[3] = v289;
  v243 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useDebuggingProgressLabel);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "rowWithTitle:valueKeyPath:", CFSTR("Progress Label"), v286);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v501[4] = v283;
  v244 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showBufferingIndicatorDuringPlay);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "rowWithTitle:valueKeyPath:", CFSTR("Buffering Indicator During Play"), v280);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v501[5] = v278;
  v245 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showLoadingIndicatorDuringDownload);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "rowWithTitle:valueKeyPath:", CFSTR("Loading Indicator During Download"), v276);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v501[6] = v275;
  v246 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysShowRenderIndicator);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "rowWithTitle:valueKeyPath:", CFSTR("Always Show Render Indicator"), v274);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v501[7] = v273;
  v247 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedRenderProgress);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "rowWithTitle:valueKeyPath:", CFSTR("Fake Render Progress"), v272);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "minValue:maxValue:", 0.0, 1.0);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "pu_increment:", 1.0);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v368 = (void *)v238;
  objc_msgSend(v249, "condition:", v238);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v501[8] = v250;
  v251 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysShowAirPlayButton);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "rowWithTitle:valueKeyPath:", CFSTR("Always Show AirPlay Button"), v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v501[9] = v253;
  v254 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_finalFadeOutDuration);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "rowWithTitle:valueKeyPath:", CFSTR("Final Fade Out Duration"), v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "minValue:maxValue:", 0.0, 2.0);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "pu_increment:", 0.1);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v501[10] = v258;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v501, 11);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "sectionWithRows:title:", v259, CFSTR("Debugging"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  v260 = (void *)MEMORY[0x1E0D83078];
  v261 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "rowWithTitle:action:", CFSTR("Restore Defaults"), v262);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v500 = v263;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v500, 1);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "sectionWithRows:", v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  v266 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v499[0] = v498;
  v499[1] = v496;
  v499[2] = v493;
  v499[3] = v488;
  v499[4] = v482;
  v499[5] = v475;
  v499[6] = v414;
  v499[7] = v469;
  v499[8] = v463;
  v499[9] = v457;
  v499[10] = v451;
  v499[11] = v444;
  v499[12] = v436;
  v499[13] = v427;
  v499[14] = v409;
  v499[15] = v384;
  v499[16] = v376;
  v499[17] = v297;
  v499[18] = v265;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v499, 19);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = (void *)objc_msgSend(v266, "initWithArray:", v267);

  if (v418)
    objc_msgSend(v268, "insertObject:atIndex:", v416, 2);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("One Up"), v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  return v269;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PUOneUpSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken != -1)
    dispatch_once(&transientProperties_onceToken, block);
  return (id)transientProperties_transientProperties;
}

void __38__PUOneUpSettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)&OBJC_METACLASS___PUOneUpSettings;
  objc_msgSendSuper2(&v11, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_videoHighlightColor);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  NSStringFromSelector(sel_allowVisualIntelligence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  NSStringFromSelector(sel_allowsVisualIntelligenceV2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  NSStringFromSelector(sel_allowsVisualIntelligenceInVideoFrame);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  NSStringFromSelector(sel_allowsVisualIntelligenceRemoveBackground);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  NSStringFromSelector(sel_allowsVisualIntelligenceVisualLookupInfoPanelMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)transientProperties_transientProperties;
  transientProperties_transientProperties = v9;

}

void __43__PUOneUpSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass;
  v11 = getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass;
  if (!getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_block_invoke;
    v7[3] = &unk_1E58AAEB0;
    v7[4] = &v8;
    __getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v6 = objc_alloc_init((Class)v4);
  objc_msgSend(v2, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", v6, 1);
}

id __43__PUOneUpSettings_settingsControllerModule__block_invoke()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPUTesterSampleAccessoryViewSettingsClass_softClass;
  v7 = getPUTesterSampleAccessoryViewSettingsClass_softClass;
  if (!getPUTesterSampleAccessoryViewSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUTesterSampleAccessoryViewSettingsClass_block_invoke;
    v3[3] = &unk_1E58AAEB0;
    v3[4] = &v4;
    __getPUTesterSampleAccessoryViewSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __33__PUOneUpSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneUpSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_52122;
  sharedInstance_sharedInstance_52122 = v0;

}

@end
