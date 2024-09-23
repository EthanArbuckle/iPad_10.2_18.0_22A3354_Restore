@implementation PXCuratedLibrarySettings

- (BOOL)useCustomDaysCurationType
{
  return self->_useCustomDaysCurationType;
}

- (double)monthsFloatingHeadersSubtitleAlpha
{
  return self->_monthsFloatingHeadersSubtitleAlpha;
}

- (double)monthsFloatingHeadersFadeoutDistance
{
  return self->_monthsFloatingHeadersFadeoutDistance;
}

- (double)monthsFloatingHeadersDistanceFromSafeAreaTop
{
  return self->_monthsFloatingHeadersDistanceFromSafeAreaTop;
}

- (double)monthsFloatingHeadersAppearanceCrossfadeStartDistance
{
  return self->_monthsFloatingHeadersAppearanceCrossfadeStartDistance;
}

- (double)monthsFloatingHeadersAppearanceCrossfadeDistance
{
  return self->_monthsFloatingHeadersAppearanceCrossfadeDistance;
}

- (double)floatingHeadersAppearanceCrossfadeDuration
{
  return self->_floatingHeadersAppearanceCrossfadeDuration;
}

- (double)monthsInlineHeadersFadeoutOffset
{
  return self->_monthsInlineHeadersFadeoutOffset;
}

- (double)monthsInlineHeadersFadeoutMinimumAlpha
{
  return self->_monthsInlineHeadersFadeoutMinimumAlpha;
}

- (double)monthsInlineHeadersFadeoutDistance
{
  return self->_monthsInlineHeadersFadeoutDistance;
}

- (double)monthsHeaderGradientAlpha
{
  return self->_monthsHeaderGradientAlpha;
}

- (BOOL)allowsCustomDateTitles
{
  return self->_allowsCustomDateTitles;
}

- (double)monthsSmallHeaderGradientHeight
{
  return self->_monthsSmallHeaderGradientHeight;
}

- (double)monthsHeaderGradientHeight
{
  return self->_monthsHeaderGradientHeight;
}

- (double)yearsHeadersFadeoutOffset
{
  return self->_yearsHeadersFadeoutOffset;
}

- (double)yearsHeadersFadeoutMinimumAlpha
{
  return self->_yearsHeadersFadeoutMinimumAlpha;
}

- (double)yearsHeadersFadeoutDistance
{
  return self->_yearsHeadersFadeoutDistance;
}

- (double)yearsHeaderGradientHeight
{
  return self->_yearsHeaderGradientHeight;
}

- (double)yearsHeaderGradientAlpha
{
  return self->_yearsHeaderGradientAlpha;
}

- (BOOL)showStatusBar
{
  return self->_showStatusBar;
}

- (BOOL)enableSkimmingInYears
{
  return self->_enableSkimmingInYears;
}

- (double)swipeBackGestureMinTranslation
{
  return self->_swipeBackGestureMinTranslation;
}

- (double)swipeBackGestureMinAngle
{
  return self->_swipeBackGestureMinAngle;
}

- (int64_t)firstTimeExperienceMaxNonProcessedHighlights
{
  return self->_firstTimeExperienceMaxNonProcessedHighlights;
}

- (int64_t)firstTimeExperienceMaxNonProcessedAssets
{
  return self->_firstTimeExperienceMaxNonProcessedAssets;
}

+ (PXCuratedLibrarySettings)sharedInstance
{
  if (sharedInstance_onceToken_202421 != -1)
    dispatch_once(&sharedInstance_onceToken_202421, &__block_literal_global_202422);
  return (PXCuratedLibrarySettings *)(id)sharedInstance_sharedInstance_202423;
}

- (BOOL)showAllHighlights
{
  return self->_showAllHighlights;
}

- (double)nonInterestingPromotionScore
{
  return self->_nonInterestingPromotionScore;
}

- (BOOL)forceFloatingHeaderVisible
{
  return self->_forceFloatingHeaderVisible;
}

- (double)interitemSpacingForDays
{
  return self->_interitemSpacingForDays;
}

- (double)cornerRadiusForDays
{
  return self->_cornerRadiusForDays;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (BOOL)exaggerateContrast
{
  return self->_exaggerateContrast;
}

- (BOOL)emulatesEmptyLibrary
{
  return self->_emulatesEmptyLibrary;
}

- (BOOL)showSecondaryToolbar
{
  return self->_showSecondaryToolbar;
}

- (BOOL)secondaryToolbarAlwaysVisible
{
  return self->_secondaryToolbarAlwaysVisible;
}

- (BOOL)enableShowAllButtons
{
  return self->_enableShowAllButtons;
}

- (double)statusBarGradientHeight
{
  return self->_statusBarGradientHeight;
}

- (double)statusBarGradientAndStyleFadeDuration
{
  return self->_statusBarGradientAndStyleFadeDuration;
}

- (double)statusBarGradientAlpha
{
  return self->_statusBarGradientAlpha;
}

- (double)playingRecordsUpdateRateLimit
{
  return self->_playingRecordsUpdateRateLimit;
}

- (double)playbackVisibleRectEdgeInset
{
  return self->_playbackVisibleRectEdgeInset;
}

- (BOOL)enableSlideshowInYears
{
  return self->_enableSlideshowInYears;
}

- (double)slideshowTriggerDelay
{
  return self->_slideshowTriggerDelay;
}

- (double)slideshowIntervalDelay
{
  return self->_slideshowIntervalDelay;
}

- (double)topInsetForVisibilityAnchoring
{
  return self->_topInsetForVisibilityAnchoring;
}

- (int64_t)largeHeroDensity
{
  return self->_largeHeroDensity;
}

- (double)allowSpecialPanoHeaders
{
  return self->_allowSpecialPanoHeaders;
}

- (id)acceptableLargeHeroPredicate
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXCuratedLibrarySettings_acceptableLargeHeroPredicate__block_invoke;
  aBlock[3] = &unk_1E51354B0;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (double)cornerRadiusForYears
{
  return self->_cornerRadiusForYears;
}

- (double)cornerRadiusForMonths
{
  return self->_cornerRadiusForMonths;
}

- (double)aspectRatioForCompactPortraitMonths
{
  return self->_aspectRatioForCompactPortraitMonths;
}

- (double)aspectRatioForCompactPortraitYears
{
  return self->_aspectRatioForCompactPortraitYears;
}

- (double)spacingBetweenDays
{
  return self->_spacingBetweenDays;
}

- (double)daysHeaderGradientHeight
{
  return self->_daysHeaderGradientHeight;
}

- (double)daysHeaderGradientAlpha
{
  return self->_daysHeaderGradientAlpha;
}

- (double)zoomLevelPinchSignificantScaleDelta
{
  return self->_zoomLevelPinchSignificantScaleDelta;
}

- (BOOL)launchToSavedAllPhotosScrollPosition
{
  return self->_launchToSavedAllPhotosScrollPosition;
}

- (BOOL)forcePlayback
{
  return self->_forcePlayback;
}

- (BOOL)showSaliencyRects
{
  return self->_showSaliencyRects;
}

- (int64_t)sectionsToPrefetch
{
  return self->_sectionsToPrefetch;
}

- (int64_t)initialZoomLevel
{
  return self->_initialZoomLevel;
}

- (BOOL)hideStatusFooterInSelectMode
{
  return self->_hideStatusFooterInSelectMode;
}

- (BOOL)enablePlaybackDiagnostics
{
  return self->_enablePlaybackDiagnostics;
}

- (double)floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom
{
  return self->_floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom;
}

- (double)floatingHeaderFadeOverDistance
{
  return self->_floatingHeaderFadeOverDistance;
}

- (double)floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop
{
  return self->_floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop;
}

- (double)floatingHeaderButtonsFadeOverDistance
{
  return self->_floatingHeaderButtonsFadeOverDistance;
}

- (BOOL)showDebugInformationInFloatingHeader
{
  return self->_showDebugInformationInFloatingHeader;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXCuratedLibrarySettings setEnablePlayMovieInYears:](self, "setEnablePlayMovieInYears:", 0);
  -[PXCuratedLibrarySettings setEnableSkimmingInYears:](self, "setEnableSkimmingInYears:", 1);
  -[PXCuratedLibrarySettings setEnableSlideshowInYears:](self, "setEnableSlideshowInYears:", 1);
  -[PXCuratedLibrarySettings setLaunchToSavedAllPhotosScrollPosition:](self, "setLaunchToSavedAllPhotosScrollPosition:", 0);
  -[PXCuratedLibrarySettings setSavedAllPhotosScrollPositionAnchorAssetIdentifier:](self, "setSavedAllPhotosScrollPositionAnchorAssetIdentifier:", 0);
  -[PXCuratedLibrarySettings setEmulatesEmptyLibrary:](self, "setEmulatesEmptyLibrary:", 0);
  -[PXCuratedLibrarySettings setBlurredBackgroundRadius:](self, "setBlurredBackgroundRadius:", 40.0);
  -[PXCuratedLibrarySettings setShowStatusBar:](self, "setShowStatusBar:", 1);
  -[PXCuratedLibrarySettings setSecondaryToolbarAlwaysVisible:](self, "setSecondaryToolbarAlwaysVisible:", 0);
  -[PXCuratedLibrarySettings setAlwaysShowSecondaryToolbarAtBottom:](self, "setAlwaysShowSecondaryToolbarAtBottom:", 0);
  -[PXCuratedLibrarySettings setBottomCenterSecondaryToolbarWidth:](self, "setBottomCenterSecondaryToolbarWidth:", 400.0);
  -[PXCuratedLibrarySettings setShowSecondaryToolbar:](self, "setShowSecondaryToolbar:", 1);
  -[PXCuratedLibrarySettings setEnableTapOnTitleToScroll:](self, "setEnableTapOnTitleToScroll:", 1);
  -[PXCuratedLibrarySettings setEnableCustomScrollToTopOrBottom:](self, "setEnableCustomScrollToTopOrBottom:", 0);
  -[PXCuratedLibrarySettings setScrollSnapMaximumDecelerationFactor:](self, "setScrollSnapMaximumDecelerationFactor:", 2.0);
  -[PXCuratedLibrarySettings setScrollSnapMaximumAccelerationFactor:](self, "setScrollSnapMaximumAccelerationFactor:", 1.2);
  -[PXCuratedLibrarySettings setScrollSnapMinimumSpeed:](self, "setScrollSnapMinimumSpeed:", 0.1);
  -[PXCuratedLibrarySettings setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:](self, "setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:", 50.0);
  -[PXCuratedLibrarySettings setFloatingHeaderFadeOverDistance:](self, "setFloatingHeaderFadeOverDistance:", 100.0);
  -[PXCuratedLibrarySettings setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:](self, "setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:", 12.0);
  -[PXCuratedLibrarySettings setFloatingHeaderButtonsFadeOverDistance:](self, "setFloatingHeaderButtonsFadeOverDistance:", 30.0);
  -[PXCuratedLibrarySettings setFloatingHeadersAppearanceCrossfadeDuration:](self, "setFloatingHeadersAppearanceCrossfadeDuration:", 0.4);
  -[PXCuratedLibrarySettings setMonthsFloatingHeadersDistanceFromSafeAreaTop:](self, "setMonthsFloatingHeadersDistanceFromSafeAreaTop:", 3.0);
  -[PXCuratedLibrarySettings setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:](self, "setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:", 0.3);
  -[PXCuratedLibrarySettings setMonthsFloatingHeadersAppearanceCrossfadeDistance:](self, "setMonthsFloatingHeadersAppearanceCrossfadeDistance:", 1.0);
  -[PXCuratedLibrarySettings setMonthsFloatingHeadersFadeoutDistance:](self, "setMonthsFloatingHeadersFadeoutDistance:", 1.5);
  -[PXCuratedLibrarySettings setMonthsFloatingHeadersSubtitleAlpha:](self, "setMonthsFloatingHeadersSubtitleAlpha:", 0.67);
  -[PXCuratedLibrarySettings setMonthsInlineHeadersFadeoutOffset:](self, "setMonthsInlineHeadersFadeoutOffset:", 0.8);
  -[PXCuratedLibrarySettings setMonthsInlineHeadersFadeoutDistance:](self, "setMonthsInlineHeadersFadeoutDistance:", 2.0);
  -[PXCuratedLibrarySettings setMonthsInlineHeadersFadeoutMinimumAlpha:](self, "setMonthsInlineHeadersFadeoutMinimumAlpha:", 0.4);
  -[PXCuratedLibrarySettings setYearsHeadersFadeoutOffset:](self, "setYearsHeadersFadeoutOffset:", -20.0);
  -[PXCuratedLibrarySettings setYearsHeadersFadeoutDistance:](self, "setYearsHeadersFadeoutDistance:", 67.0);
  -[PXCuratedLibrarySettings setYearsHeadersFadeoutMinimumAlpha:](self, "setYearsHeadersFadeoutMinimumAlpha:", 0.4);
  -[PXCuratedLibrarySettings setUseSaliency:](self, "setUseSaliency:", 1);
  -[PXCuratedLibrarySettings setShowSaliencyRects:](self, "setShowSaliencyRects:", 0);
  -[PXCuratedLibrarySettings setLargeHeroDensity:](self, "setLargeHeroDensity:", 3);
  -[PXCuratedLibrarySettings setLargeHeroMinimumScore:](self, "setLargeHeroMinimumScore:", 0.0);
  -[PXCuratedLibrarySettings setAspectRatioForCompactPortraitYears:](self, "setAspectRatioForCompactPortraitYears:", 1.33333333);
  -[PXCuratedLibrarySettings setAspectRatioForCompactLandscapeYears:](self, "setAspectRatioForCompactLandscapeYears:", 1.77777778);
  -[PXCuratedLibrarySettings setAspectRatioForRegularYears:](self, "setAspectRatioForRegularYears:", 1.5);
  -[PXCuratedLibrarySettings setForcedNumberOfYearsColumn:](self, "setForcedNumberOfYearsColumn:", 0);
  -[PXCuratedLibrarySettings setUseWideModularLayoutInYears:](self, "setUseWideModularLayoutInYears:", 0);
  -[PXCuratedLibrarySettings setAspectRatioForCompactPortraitMonths:](self, "setAspectRatioForCompactPortraitMonths:", 1.0);
  -[PXCuratedLibrarySettings setSpacingBetweenDays:](self, "setSpacingBetweenDays:", 5.0);
  -[PXCuratedLibrarySettings setInteritemSpacingForDays:](self, "setInteritemSpacingForDays:", 2.0);
  -[PXCuratedLibrarySettings setCornerRadiusForDays:](self, "setCornerRadiusForDays:", 0.0);
  -[PXCuratedLibrarySettings setCornerRadiusForMonths:](self, "setCornerRadiusForMonths:", 10.0);
  -[PXCuratedLibrarySettings setCornerRadiusForYears:](self, "setCornerRadiusForYears:", 10.0);
  -[PXCuratedLibrarySettings setAllowSpecialPanoHeaders:](self, "setAllowSpecialPanoHeaders:", 0.0);
  -[PXCuratedLibrarySettings setTopInsetForVisibilityAnchoring:](self, "setTopInsetForVisibilityAnchoring:", 90.0);
  -[PXCuratedLibrarySettings setSectionShadowOpacity:](self, "setSectionShadowOpacity:", 0.3);
  -[PXCuratedLibrarySettings setSkimmingScale:](self, "setSkimmingScale:", 0.95);
  -[PXCuratedLibrarySettings setSectionsToPrefetch:](self, "setSectionsToPrefetch:", 5);
  -[PXCuratedLibrarySettings setFaultInDistance:](self, "setFaultInDistance:", 2000.0);
  -[PXCuratedLibrarySettings setFaultOutPadding:](self, "setFaultOutPadding:", 1000.0);
  -[PXCuratedLibrarySettings setForceFloatingHeaderVisible:](self, "setForceFloatingHeaderVisible:", 0);
  -[PXCuratedLibrarySettings setShowDebugInformationInFloatingHeader:](self, "setShowDebugInformationInFloatingHeader:", 0);
  -[PXCuratedLibrarySettings setMinimumVisibleHeightForTopMostSection:](self, "setMinimumVisibleHeightForTopMostSection:", 0.0);
  -[PXCuratedLibrarySettings setEnableShowAllButtons:](self, "setEnableShowAllButtons:", 1);
  -[PXCuratedLibrarySettings setAllowsCustomDateTitles:](self, "setAllowsCustomDateTitles:", 1);
  -[PXCuratedLibrarySettings setYearsHeaderGradientAlpha:](self, "setYearsHeaderGradientAlpha:", 0.4);
  -[PXCuratedLibrarySettings setYearsHeaderGradientHeight:](self, "setYearsHeaderGradientHeight:", 120.0);
  -[PXCuratedLibrarySettings setMonthsHeaderGradientAlpha:](self, "setMonthsHeaderGradientAlpha:", 0.4);
  -[PXCuratedLibrarySettings setMonthsHeaderGradientHeight:](self, "setMonthsHeaderGradientHeight:", 120.0);
  -[PXCuratedLibrarySettings setMonthsSmallHeaderGradientHeight:](self, "setMonthsSmallHeaderGradientHeight:", 90.0);
  -[PXCuratedLibrarySettings setDaysHeaderGradientAlpha:](self, "setDaysHeaderGradientAlpha:", 0.4);
  -[PXCuratedLibrarySettings setDaysHeaderGradientHeight:](self, "setDaysHeaderGradientHeight:", 150.0);
  -[PXCuratedLibrarySettings setStatusBarGradientAlpha:](self, "setStatusBarGradientAlpha:", 0.25);
  -[PXCuratedLibrarySettings setStatusBarGradientHeight:](self, "setStatusBarGradientHeight:", 130.0);
  -[PXCuratedLibrarySettings setStatusBarGradientAndStyleFadeDuration:](self, "setStatusBarGradientAndStyleFadeDuration:", 0.75);
  -[PXCuratedLibrarySettings setInitialZoomLevel:](self, "setInitialZoomLevel:", 3);
  -[PXCuratedLibrarySettings setShowAllHighlights:](self, "setShowAllHighlights:", 0);
  -[PXCuratedLibrarySettings setUseCustomDaysCurationType:](self, "setUseCustomDaysCurationType:", 0);
  -[PXCuratedLibrarySettings setDaysCurationType:](self, "setDaysCurationType:", 2);
  -[PXCuratedLibrarySettings setNonInterestingPromotionScore:](self, "setNonInterestingPromotionScore:", 0.25);
  -[PXCuratedLibrarySettings setHideRecents:](self, "setHideRecents:", 0);
  -[PXCuratedLibrarySettings setHideAggregations:](self, "setHideAggregations:", 0);
  -[PXCuratedLibrarySettings setEnableInlinePlayback:](self, "setEnableInlinePlayback:", 1);
  -[PXCuratedLibrarySettings setEnableInlinePlaybackInZoomableGrids:](self, "setEnableInlinePlaybackInZoomableGrids:", 0);
  -[PXCuratedLibrarySettings setStabilizeLivePhotos:](self, "setStabilizeLivePhotos:", 1);
  -[PXCuratedLibrarySettings setForcePlayback:](self, "setForcePlayback:", 0);
  -[PXCuratedLibrarySettings setMinAutoplaySuggestionScore:](self, "setMinAutoplaySuggestionScore:", 0.5);
  -[PXCuratedLibrarySettings setPlayBestTimeRange:](self, "setPlayBestTimeRange:", 1);
  -[PXCuratedLibrarySettings setMaxNumberOfPlayingItems:](self, "setMaxNumberOfPlayingItems:", 1);
  -[PXCuratedLibrarySettings setPlaybackVisibleRectEdgeInset:](self, "setPlaybackVisibleRectEdgeInset:", 30.0);
  -[PXCuratedLibrarySettings setLivePhotoLoopingCrossfadeDuration:](self, "setLivePhotoLoopingCrossfadeDuration:", 0.25);
  -[PXCuratedLibrarySettings setEnablePlaybackDiagnostics:](self, "setEnablePlaybackDiagnostics:", 0);
  -[PXCuratedLibrarySettings setPlayingRecordsUpdateRateLimit:](self, "setPlayingRecordsUpdateRateLimit:", 0.02);
  -[PXCuratedLibrarySettings setSlideshowTriggerDelay:](self, "setSlideshowTriggerDelay:", 5.0);
  -[PXCuratedLibrarySettings setSlideshowIntervalDelay:](self, "setSlideshowIntervalDelay:", 4.0);
  -[PXCuratedLibrarySettings setFirstTimeExperienceMaxNonProcessedHighlights:](self, "setFirstTimeExperienceMaxNonProcessedHighlights:", 2);
  -[PXCuratedLibrarySettings setFirstTimeExperienceMaxNonProcessedAssets:](self, "setFirstTimeExperienceMaxNonProcessedAssets:", 50);
  -[PXCuratedLibrarySettings setFirstTimeExperienceAlwaysLogReadiness:](self, "setFirstTimeExperienceAlwaysLogReadiness:", 0);
  -[PXCuratedLibrarySettings setEnableInteractiveTransition:](self, "setEnableInteractiveTransition:", 0);
  -[PXCuratedLibrarySettings setDefaultZoomLevelTransitionAnimationDuration:](self, "setDefaultZoomLevelTransitionAnimationDuration:", 0.58);
  -[PXCuratedLibrarySettings setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:](self, "setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:", 2.0);
  -[PXCuratedLibrarySettings setNonAnchorYearsFadeSpeed:](self, "setNonAnchorYearsFadeSpeed:", 1.3);
  -[PXCuratedLibrarySettings setNonAnchorMonthsFadeSpeed:](self, "setNonAnchorMonthsFadeSpeed:", 1.4);
  -[PXCuratedLibrarySettings setNonAnchorDaysFadeSpeed:](self, "setNonAnchorDaysFadeSpeed:", 1.4);
  -[PXCuratedLibrarySettings setTransitionToOrFromAllPhotosAnimationDuration:](self, "setTransitionToOrFromAllPhotosAnimationDuration:", 0.58);
  -[PXCuratedLibrarySettings setTransitionToOrFromAllPhotosScale:](self, "setTransitionToOrFromAllPhotosScale:", 0.8);
  -[PXCuratedLibrarySettings setTransitionScaleForDayNotMatchingMonths:](self, "setTransitionScaleForDayNotMatchingMonths:", 0.8);
  -[PXCuratedLibrarySettings setZoomLevelPinchSignificantScaleDelta:](self, "setZoomLevelPinchSignificantScaleDelta:", 0.1);
  -[PXCuratedLibrarySettings setSwipeBackGestureMinAngle:](self, "setSwipeBackGestureMinAngle:", 20.0);
  -[PXCuratedLibrarySettings setSwipeBackGestureMinTranslation:](self, "setSwipeBackGestureMinTranslation:", 30.0);
  -[PXCuratedLibrarySettings setZoomLevelControlSegmentExpansionFactor:](self, "setZoomLevelControlSegmentExpansionFactor:", 0.5);
  -[PXCuratedLibrarySettings setEnableRecentlyEditedAlbum:](self, "setEnableRecentlyEditedAlbum:", 0);
  -[PXCuratedLibrarySettings setAlignActionButtonsTrailingEdges:](self, "setAlignActionButtonsTrailingEdges:", 0);
  -[PXCuratedLibrarySettings setLateralMarginDays:](self, "setLateralMarginDays:", 0.0);
  -[PXCuratedLibrarySettings setLateralMarginMonths:](self, "setLateralMarginMonths:", 22.0);
  -[PXCuratedLibrarySettings setLateralMarginYears:](self, "setLateralMarginYears:", 26.0);
  -[PXCuratedLibrarySettings setExternalSecondaryToolbarHeight:](self, "setExternalSecondaryToolbarHeight:", 24.0);
  -[PXCuratedLibrarySettings setExaggerateContrast:](self, "setExaggerateContrast:", 0);
  -[PXCuratedLibrarySettings setForceBadgesOnAllAssets:](self, "setForceBadgesOnAllAssets:", 0);
  -[PXCuratedLibrarySettings setForceShowAllButtonsVisible:](self, "setForceShowAllButtonsVisible:", 0);
  -[PXCuratedLibrarySettings setHideStatusFooter:](self, "setHideStatusFooter:", 0);
  -[PXCuratedLibrarySettings setHideStatusFooterInSelectMode:](self, "setHideStatusFooterInSelectMode:", 1);
  -[PXCuratedLibrarySettings setHideAnalyzingStatus:](self, "setHideAnalyzingStatus:", 0);
  -[PXCuratedLibrarySettings setIncludeGuestAssetsInFooterCount:](self, "setIncludeGuestAssetsInFooterCount:", 0);
}

- (void)setZoomLevelPinchSignificantScaleDelta:(double)a3
{
  self->_zoomLevelPinchSignificantScaleDelta = a3;
}

- (void)setZoomLevelControlSegmentExpansionFactor:(double)a3
{
  self->_zoomLevelControlSegmentExpansionFactor = a3;
}

- (void)setYearsHeadersFadeoutOffset:(double)a3
{
  self->_yearsHeadersFadeoutOffset = a3;
}

- (void)setYearsHeadersFadeoutMinimumAlpha:(double)a3
{
  self->_yearsHeadersFadeoutMinimumAlpha = a3;
}

- (void)setYearsHeadersFadeoutDistance:(double)a3
{
  self->_yearsHeadersFadeoutDistance = a3;
}

- (void)setYearsHeaderGradientHeight:(double)a3
{
  self->_yearsHeaderGradientHeight = a3;
}

- (void)setYearsHeaderGradientAlpha:(double)a3
{
  self->_yearsHeaderGradientAlpha = a3;
}

- (void)setUseWideModularLayoutInYears:(BOOL)a3
{
  self->_useWideModularLayoutInYears = a3;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (void)setUseCustomDaysCurationType:(BOOL)a3
{
  self->_useCustomDaysCurationType = a3;
}

- (void)setTransitionToOrFromAllPhotosScale:(double)a3
{
  self->_transitionToOrFromAllPhotosScale = a3;
}

- (void)setTransitionToOrFromAllPhotosAnimationDuration:(double)a3
{
  self->_transitionToOrFromAllPhotosAnimationDuration = a3;
}

- (void)setTransitionScaleForDayNotMatchingMonths:(double)a3
{
  self->_transitionScaleForDayNotMatchingMonths = a3;
}

- (void)setTopInsetForVisibilityAnchoring:(double)a3
{
  self->_topInsetForVisibilityAnchoring = a3;
}

- (void)setSwipeBackGestureMinTranslation:(double)a3
{
  self->_swipeBackGestureMinTranslation = a3;
}

- (void)setSwipeBackGestureMinAngle:(double)a3
{
  self->_swipeBackGestureMinAngle = a3;
}

- (void)setStatusBarGradientHeight:(double)a3
{
  self->_statusBarGradientHeight = a3;
}

- (void)setStatusBarGradientAndStyleFadeDuration:(double)a3
{
  self->_statusBarGradientAndStyleFadeDuration = a3;
}

- (void)setStatusBarGradientAlpha:(double)a3
{
  self->_statusBarGradientAlpha = a3;
}

- (void)setStabilizeLivePhotos:(BOOL)a3
{
  self->_stabilizeLivePhotos = a3;
}

- (void)setSpacingBetweenDays:(double)a3
{
  self->_spacingBetweenDays = a3;
}

- (void)setSlideshowTriggerDelay:(double)a3
{
  self->_slideshowTriggerDelay = a3;
}

- (void)setSlideshowIntervalDelay:(double)a3
{
  self->_slideshowIntervalDelay = a3;
}

- (void)setSkimmingScale:(double)a3
{
  self->_skimmingScale = a3;
}

- (void)setShowStatusBar:(BOOL)a3
{
  self->_showStatusBar = a3;
}

- (void)setShowSecondaryToolbar:(BOOL)a3
{
  self->_showSecondaryToolbar = a3;
}

- (void)setShowSaliencyRects:(BOOL)a3
{
  self->_showSaliencyRects = a3;
}

- (void)setShowDebugInformationInFloatingHeader:(BOOL)a3
{
  self->_showDebugInformationInFloatingHeader = a3;
}

- (void)setShowAllHighlights:(BOOL)a3
{
  self->_showAllHighlights = a3;
}

- (void)setSectionsToPrefetch:(int64_t)a3
{
  self->_sectionsToPrefetch = a3;
}

- (void)setSectionShadowOpacity:(double)a3
{
  self->_sectionShadowOpacity = a3;
}

- (void)setSecondaryToolbarAlwaysVisible:(BOOL)a3
{
  self->_secondaryToolbarAlwaysVisible = a3;
}

- (void)setScrollSnapMinimumSpeed:(double)a3
{
  self->_scrollSnapMinimumSpeed = a3;
}

- (void)setScrollSnapMaximumDecelerationFactor:(double)a3
{
  self->_scrollSnapMaximumDecelerationFactor = a3;
}

- (void)setScrollSnapMaximumAccelerationFactor:(double)a3
{
  self->_scrollSnapMaximumAccelerationFactor = a3;
}

- (void)setSavedAllPhotosScrollPositionAnchorAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setPlayingRecordsUpdateRateLimit:(double)a3
{
  self->_playingRecordsUpdateRateLimit = a3;
}

- (void)setPlaybackVisibleRectEdgeInset:(double)a3
{
  self->_playbackVisibleRectEdgeInset = a3;
}

- (void)setPlayBestTimeRange:(BOOL)a3
{
  self->_playBestTimeRange = a3;
}

- (void)setNonInterestingPromotionScore:(double)a3
{
  self->_nonInterestingPromotionScore = a3;
}

- (void)setNonAnchorYearsFadeSpeed:(double)a3
{
  self->_nonAnchorYearsFadeSpeed = a3;
}

- (void)setNonAnchorMonthsFadeSpeed:(double)a3
{
  self->_nonAnchorMonthsFadeSpeed = a3;
}

- (void)setNonAnchorDaysFadeSpeed:(double)a3
{
  self->_nonAnchorDaysFadeSpeed = a3;
}

- (void)setMonthsSmallHeaderGradientHeight:(double)a3
{
  self->_monthsSmallHeaderGradientHeight = a3;
}

- (void)setMonthsInlineHeadersFadeoutOffset:(double)a3
{
  self->_monthsInlineHeadersFadeoutOffset = a3;
}

- (void)setMonthsInlineHeadersFadeoutMinimumAlpha:(double)a3
{
  self->_monthsInlineHeadersFadeoutMinimumAlpha = a3;
}

- (void)setMonthsInlineHeadersFadeoutDistance:(double)a3
{
  self->_monthsInlineHeadersFadeoutDistance = a3;
}

- (void)setMonthsHeaderGradientHeight:(double)a3
{
  self->_monthsHeaderGradientHeight = a3;
}

- (void)setMonthsHeaderGradientAlpha:(double)a3
{
  self->_monthsHeaderGradientAlpha = a3;
}

- (void)setMonthsFloatingHeadersSubtitleAlpha:(double)a3
{
  self->_monthsFloatingHeadersSubtitleAlpha = a3;
}

- (void)setMonthsFloatingHeadersFadeoutDistance:(double)a3
{
  self->_monthsFloatingHeadersFadeoutDistance = a3;
}

- (void)setMonthsFloatingHeadersDistanceFromSafeAreaTop:(double)a3
{
  self->_monthsFloatingHeadersDistanceFromSafeAreaTop = a3;
}

- (void)setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:(double)a3
{
  self->_monthsFloatingHeadersAppearanceCrossfadeStartDistance = a3;
}

- (void)setMonthsFloatingHeadersAppearanceCrossfadeDistance:(double)a3
{
  self->_monthsFloatingHeadersAppearanceCrossfadeDistance = a3;
}

- (void)setMinimumVisibleHeightForTopMostSection:(double)a3
{
  self->_minimumVisibleHeightForTopMostSection = a3;
}

- (void)setMinAutoplaySuggestionScore:(double)a3
{
  self->_minAutoplaySuggestionScore = a3;
}

- (void)setMaxNumberOfPlayingItems:(int64_t)a3
{
  self->_maxNumberOfPlayingItems = a3;
}

- (void)setLivePhotoLoopingCrossfadeDuration:(double)a3
{
  self->_livePhotoLoopingCrossfadeDuration = a3;
}

- (void)setLaunchToSavedAllPhotosScrollPosition:(BOOL)a3
{
  self->_launchToSavedAllPhotosScrollPosition = a3;
}

- (void)setLargeHeroMinimumScore:(double)a3
{
  self->_largeHeroMinimumScore = a3;
}

- (void)setLargeHeroDensity:(int64_t)a3
{
  self->_largeHeroDensity = a3;
}

- (void)setInteritemSpacingForDays:(double)a3
{
  self->_interitemSpacingForDays = a3;
}

- (void)setInitialZoomLevel:(int64_t)a3
{
  self->_initialZoomLevel = a3;
}

- (void)setIncludeGuestAssetsInFooterCount:(BOOL)a3
{
  self->_includeGuestAssetsInFooterCount = a3;
}

- (void)setHideStatusFooterInSelectMode:(BOOL)a3
{
  self->_hideStatusFooterInSelectMode = a3;
}

- (void)setHideStatusFooter:(BOOL)a3
{
  self->_hideStatusFooter = a3;
}

- (void)setHideRecents:(BOOL)a3
{
  self->_hideRecents = a3;
}

- (void)setHideAnalyzingStatus:(BOOL)a3
{
  self->_hideAnalyzingStatus = a3;
}

- (void)setHideAggregations:(BOOL)a3
{
  self->_hideAggregations = a3;
}

- (void)setForcedNumberOfYearsColumn:(int64_t)a3
{
  self->_forcedNumberOfYearsColumn = a3;
}

- (void)setForceShowAllButtonsVisible:(BOOL)a3
{
  self->_forceShowAllButtonsVisible = a3;
}

- (void)setForcePlayback:(BOOL)a3
{
  self->_forcePlayback = a3;
}

- (void)setForceFloatingHeaderVisible:(BOOL)a3
{
  self->_forceFloatingHeaderVisible = a3;
}

- (void)setForceBadgesOnAllAssets:(BOOL)a3
{
  self->_forceBadgesOnAllAssets = a3;
}

- (void)setFloatingHeadersAppearanceCrossfadeDuration:(double)a3
{
  self->_floatingHeadersAppearanceCrossfadeDuration = a3;
}

- (void)setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:(double)a3
{
  self->_floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom = a3;
}

- (void)setFloatingHeaderFadeOverDistance:(double)a3
{
  self->_floatingHeaderFadeOverDistance = a3;
}

- (void)setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:(double)a3
{
  self->_floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop = a3;
}

- (void)setFloatingHeaderButtonsFadeOverDistance:(double)a3
{
  self->_floatingHeaderButtonsFadeOverDistance = a3;
}

- (void)setFirstTimeExperienceMaxNonProcessedHighlights:(int64_t)a3
{
  self->_firstTimeExperienceMaxNonProcessedHighlights = a3;
}

- (void)setFirstTimeExperienceMaxNonProcessedAssets:(int64_t)a3
{
  self->_firstTimeExperienceMaxNonProcessedAssets = a3;
}

- (void)setFirstTimeExperienceAlwaysLogReadiness:(BOOL)a3
{
  self->_firstTimeExperienceAlwaysLogReadiness = a3;
}

- (void)setFaultOutPadding:(double)a3
{
  self->_faultOutPadding = a3;
}

- (void)setFaultInDistance:(double)a3
{
  self->_faultInDistance = a3;
}

- (void)setExaggerateContrast:(BOOL)a3
{
  self->_exaggerateContrast = a3;
}

- (void)setEnableTapOnTitleToScroll:(BOOL)a3
{
  self->_enableTapOnTitleToScroll = a3;
}

- (void)setEnableSlideshowInYears:(BOOL)a3
{
  self->_enableSlideshowInYears = a3;
}

- (void)setEnableSkimmingInYears:(BOOL)a3
{
  self->_enableSkimmingInYears = a3;
}

- (void)setEnableShowAllButtons:(BOOL)a3
{
  self->_enableShowAllButtons = a3;
}

- (void)setEnableRecentlyEditedAlbum:(BOOL)a3
{
  self->_enableRecentlyEditedAlbum = a3;
}

- (void)setEnablePlaybackDiagnostics:(BOOL)a3
{
  self->_enablePlaybackDiagnostics = a3;
}

- (void)setEnablePlayMovieInYears:(BOOL)a3
{
  self->_enablePlayMovieInYears = a3;
}

- (void)setEnableInteractiveTransition:(BOOL)a3
{
  self->_enableInteractiveTransition = a3;
}

- (void)setEnableInlinePlaybackInZoomableGrids:(BOOL)a3
{
  self->_enableInlinePlaybackInZoomableGrids = a3;
}

- (void)setEnableInlinePlayback:(BOOL)a3
{
  self->_enableInlinePlayback = a3;
}

- (void)setEnableCustomScrollToTopOrBottom:(BOOL)a3
{
  self->_enableCustomScrollToTopOrBottom = a3;
}

- (void)setEmulatesEmptyLibrary:(BOOL)a3
{
  self->_emulatesEmptyLibrary = a3;
}

- (void)setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:(double)a3
{
  self->_defaultZoomLevelTransitionMaximumScaleAroundAnchor = a3;
}

- (void)setDefaultZoomLevelTransitionAnimationDuration:(double)a3
{
  self->_defaultZoomLevelTransitionAnimationDuration = a3;
}

- (void)setDaysHeaderGradientHeight:(double)a3
{
  self->_daysHeaderGradientHeight = a3;
}

- (void)setDaysHeaderGradientAlpha:(double)a3
{
  self->_daysHeaderGradientAlpha = a3;
}

- (void)setDaysCurationType:(unsigned __int16)a3
{
  self->_daysCurationType = a3;
}

- (void)setCornerRadiusForYears:(double)a3
{
  self->_cornerRadiusForYears = a3;
}

- (void)setCornerRadiusForMonths:(double)a3
{
  self->_cornerRadiusForMonths = a3;
}

- (void)setCornerRadiusForDays:(double)a3
{
  self->_cornerRadiusForDays = a3;
}

- (void)setBottomCenterSecondaryToolbarWidth:(double)a3
{
  self->_bottomCenterSecondaryToolbarWidth = a3;
}

- (void)setAspectRatioForRegularYears:(double)a3
{
  self->_aspectRatioForRegularYears = a3;
}

- (void)setAspectRatioForCompactPortraitYears:(double)a3
{
  self->_aspectRatioForCompactPortraitYears = a3;
}

- (void)setAspectRatioForCompactPortraitMonths:(double)a3
{
  self->_aspectRatioForCompactPortraitMonths = a3;
}

- (void)setAspectRatioForCompactLandscapeYears:(double)a3
{
  self->_aspectRatioForCompactLandscapeYears = a3;
}

- (void)setAlwaysShowSecondaryToolbarAtBottom:(BOOL)a3
{
  self->_alwaysShowSecondaryToolbarAtBottom = a3;
}

- (void)setAllowsCustomDateTitles:(BOOL)a3
{
  self->_allowsCustomDateTitles = a3;
}

- (void)setAllowSpecialPanoHeaders:(double)a3
{
  self->_allowSpecialPanoHeaders = a3;
}

- (void)setAlignActionButtonsTrailingEdges:(BOOL)a3
{
  self->_alignActionButtonsTrailingEdges = a3;
}

- (double)zoomLevelControlSegmentExpansionFactor
{
  return self->_zoomLevelControlSegmentExpansionFactor;
}

- (BOOL)forceBadgesOnAllAssets
{
  return self->_forceBadgesOnAllAssets;
}

- (double)faultOutPadding
{
  return self->_faultOutPadding;
}

- (double)faultInDistance
{
  return self->_faultInDistance;
}

void __42__PXCuratedLibrarySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "curatedLibrarySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_202423;
  sharedInstance_sharedInstance_202423 = v0;

}

- (BOOL)hideRecents
{
  return self->_hideRecents;
}

- (BOOL)hideAggregations
{
  return self->_hideAggregations;
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
  id v33;
  id v34;
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
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
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
  void *v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
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
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
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
  _QWORD v344[22];
  _QWORD v345[3];
  _QWORD v346[2];
  void *v347;
  _QWORD v348[6];
  _QWORD v349[6];
  _QWORD v350[3];
  _QWORD v351[2];
  _QWORD v352[11];
  _QWORD v353[7];
  void *v354;
  _QWORD v355[3];
  _QWORD v356[8];
  _QWORD v357[5];
  _QWORD v358[19];
  void *v359;
  _QWORD v360[3];
  _QWORD v361[15];
  _QWORD v362[5];
  void *v363;
  _QWORD v364[6];
  _QWORD v365[3];

  v365[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D830B8];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Review All"), &__block_literal_global_156037);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v365[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v365, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v4, CFSTR("External Assets"));
  v343 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Launch to Saved All Photos Position"), CFSTR("launchToSavedAllPhotosScrollPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v364[0] = v6;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Save Current All Photos Position"), &__block_literal_global_14_156042);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionFormat:", CFSTR("launchToSavedAllPhotosScrollPosition != 0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v364[1] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Slideshow In Years"), CFSTR("enableSlideshowInYears"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v364[2] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Play Movie In Years"), CFSTR("enablePlayMovieInYears"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v364[3] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Analyzing Status"), CFSTR("hideAnalyzingStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v364[4] = v11;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_emulatesEmptyLibrary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Emulates Empty Library"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v364[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v364, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v15, CFSTR("Demo"));
  v342 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blurredBackgroundRadius);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Y/M Blur Radius"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minValue:maxValue:", 0.0, 60.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_increment:", 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v363 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v363, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v22, CFSTR("Lemonade"));
  v341 = (void *)objc_claimAutoreleasedReturnValue();

  v339 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Tap on Title to Scroll"), CFSTR("enableTapOnTitleToScroll"));
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v362[0] = v336;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Custom Scroll to Top/Bottom"), CFSTR("enableCustomScrollToTopOrBottom"));
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v362[1] = v333;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Snap Max Deceleration"), CFSTR("scrollSnapMaximumDecelerationFactor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 1.0, 5.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "px_increment:", 0.1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v362[2] = v25;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Snap Max Acceleration"), CFSTR("scrollSnapMaximumAccelerationFactor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 1.0, 5.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "px_increment:", 0.1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v362[3] = v28;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Snap Min Speed"), CFSTR("scrollSnapMinimumSpeed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 0.0, 0.5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "px_increment:", 0.01);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v362[4] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v362, 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "sectionWithRows:title:", v32, CFSTR("Scrolling"));
  v340 = (void *)objc_claimAutoreleasedReturnValue();

  v337 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Saliency for Layouts"), CFSTR("useSaliency"));
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = v334;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Saliency Rects"), CFSTR("showSaliencyRects"));
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v361[1] = v331;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Large Hero Density"), CFSTR("largeHeroDensity"));
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = &unk_1E53E96D8;
  v34 = &unk_1E53E96F0;
  objc_msgSend(v328, "possibleValues:titles:", &unk_1E53E96D8, &unk_1E53E96F0);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v361[2] = v324;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Large Hero Min Score"), CFSTR("largeHeroMinimumScore"));
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "minValue:maxValue:", 0.0, 1.0);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "px_increment:", 0.05);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v361[3] = v308;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Forced Years Column"), CFSTR("forcedNumberOfYearsColumn"));
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "minValue:maxValue:", 0.0, 3.0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "px_increment:", 1.0);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v361[4] = v288;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Days Spacing"), CFSTR("spacingBetweenDays"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "minValue:maxValue:", 0.0, 100.0);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "px_increment:", 1.0);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v361[5] = v268;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Days Item Spacing"), CFSTR("interitemSpacingForDays"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "minValue:maxValue:", 0.0, 5.0);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "px_increment:", 0.5);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v361[6] = v247;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Special Pano Headers"), CFSTR("allowSpecialPanoHeaders"));
  v239 = (id)objc_claimAutoreleasedReturnValue();
  v361[7] = v239;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Top Visibility Inset"), CFSTR("topInsetForVisibilityAnchoring"));
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "minValue:maxValue:", 0.0, 200.0);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "px_increment:", 5.0);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v361[8] = v221;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Section Shadow Opacity"), CFSTR("sectionShadowOpacity"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "minValue:maxValue:", 0.0, 1.0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "px_increment:", 0.05);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v361[9] = v210;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Skimming Scale"), CFSTR("skimmingScale"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "minValue:maxValue:", 0.5, 1.0);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "px_increment:", 0.01);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v361[10] = v35;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fault In Distance"), CFSTR("faultInDistance"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", 0.0, 5000.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_increment:", 100.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v361[11] = v38;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fault Out Padding"), CFSTR("faultOutPadding"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 5000.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "px_increment:", 100.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v361[12] = v41;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Status Footer"), CFSTR("hideStatusFooter"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v361[13] = v42;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Status Footer In Select Mode"), CFSTR("hideStatusFooterInSelectMode"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v361[14] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v361, 15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v337, "sectionWithRows:title:", v44, CFSTR("Layout"));
  v338 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Years Aspect Ratio"), CFSTR("aspectRatioForCompactPortraitYears"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "possibleValues:titles:", &unk_1E53E9D20, &unk_1E53E9D38);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v360[0] = v47;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Years Landscape Aspect Ratio"), CFSTR("aspectRatioForCompactLandscapeYears"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "possibleValues:titles:", &unk_1E53E9D20, &unk_1E53E9D38);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v360[1] = v49;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Months Aspect Ratio"), CFSTR("aspectRatioForCompactPortraitMonths"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "possibleValues:titles:", &unk_1E53E9D20, &unk_1E53E9D38);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v360[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v360, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sectionWithRows:title:", v52, CFSTR("Phone Layout"));
  v335 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Years Aspect Ratio"), CFSTR("aspectRatioForRegularYears"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "possibleValues:titles:", &unk_1E53E9D20, &unk_1E53E9D38);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v359 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v359, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sectionWithRows:title:", v56, CFSTR("Pad Layout"));
  v332 = (void *)objc_claimAutoreleasedReturnValue();

  v329 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Floating Header Visible"), CFSTR("forceFloatingHeaderVisible"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v358[0] = v325;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Debug Info in Floating Header"), CFSTR("showDebugInformationInFloatingHeader"));
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v358[1] = v320;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Min. Visible Section Height"), CFSTR("minimumVisibleHeightForTopMostSection"));
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "px_possibleValues:", &unk_1E53E9D50);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v358[2] = v309;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("“Show All“ Buttons"), CFSTR("enableShowAllButtons"));
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v358[3] = v303;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Custom Date Titles"), CFSTR("allowsCustomDateTitles"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v358[4] = v296;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Years Header Gradient Alpha"), CFSTR("yearsHeaderGradientAlpha"));
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "minValue:maxValue:", 0.0, 1.0);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "px_increment:", 0.0500000007);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v358[5] = v276;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Years Header Gradient Height"), CFSTR("yearsHeaderGradientHeight"));
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "minValue:maxValue:", 0.0, 350.0);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "px_increment:", 10.0);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v358[6] = v255;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Years Header Gradient Alpha"), CFSTR("monthsHeaderGradientAlpha"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "minValue:maxValue:", 0.0, 1.0);
  v240 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "px_increment:", 0.0500000007);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v358[7] = v234;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Months Header Gradient Height"), CFSTR("monthsHeaderGradientHeight"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "minValue:maxValue:", 0.0, 350.0);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "px_increment:", 10.0);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v358[8] = v217;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Months Small Header Gradient Height"), CFSTR("monthsSmallHeaderGradientHeight"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "minValue:maxValue:", 0.0, 350.0);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "px_increment:", 10.0);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v358[9] = v208;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Days Header Gradient Alpha"), CFSTR("daysHeaderGradientAlpha"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "minValue:maxValue:", 0.0, 1.0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "px_increment:", 0.0500000007);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v358[10] = v200;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Days Header Gradient Height"), CFSTR("daysHeaderGradientHeight"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "minValue:maxValue:", 0.0, 350.0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "px_increment:", 10.0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v358[11] = v194;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Status Bar"), CFSTR("showStatusBar"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v358[12] = v192;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar Gradient Alpha"), CFSTR("statusBarGradientAlpha"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "minValue:maxValue:", 0.0, 1.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "px_increment:", 0.0500000007);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v358[13] = v187;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar Gradient Height"), CFSTR("statusBarGradientHeight"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "minValue:maxValue:", 0.0, 350.0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "px_increment:", 10.0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v358[14] = v184;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar Gradient & Style Fade Duration"), CFSTR("statusBarGradientAndStyleFadeDuration"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", 0.0, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "px_increment:", 0.0500000007);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v358[15] = v59;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Toolbar Always Visible"), CFSTR("secondaryToolbarAlwaysVisible"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v358[16] = v60;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Toolbar Always at Bottom"), CFSTR("alwaysShowSecondaryToolbarAtBottom"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v358[17] = v61;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Bottom Toolbar Width"), CFSTR("bottomCenterSecondaryToolbarWidth"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", 300.0, 1000.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "px_increment:", 10.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "conditionFormat:", CFSTR("alwaysShowSecondaryToolbarAtBottom != 0"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v358[18] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v358, 19);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "sectionWithRows:title:", v66, CFSTR("Header"));
  v330 = (void *)objc_claimAutoreleasedReturnValue();

  v326 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Position Threshold"), CFSTR("floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom"));
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "minValue:maxValue:", 0.0, 300.0);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "px_increment:", 5.0);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v357[0] = v310;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Distance"), CFSTR("floatingHeaderFadeOverDistance"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "minValue:maxValue:", 0.0, 300.0);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "px_increment:", 5.0);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v357[1] = v290;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Buttons Position Threshold"), CFSTR("floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "minValue:maxValue:", -50.0, 100.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "px_increment:", 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v357[2] = v69;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Buttons Fade Distance"), CFSTR("floatingHeaderButtonsFadeOverDistance"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "minValue:maxValue:", 1.0, 100.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "px_increment:", 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v357[3] = v72;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("X-Fade Duration"), CFSTR("floatingHeadersAppearanceCrossfadeDuration"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "minValue:maxValue:", 0.0, 2.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "px_increment:", 0.1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v357[4] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v357, 5);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "sectionWithRows:title:", v76, CFSTR("Floating Header"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();

  v322 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Floating Distance"), CFSTR("monthsFloatingHeadersDistanceFromSafeAreaTop"));
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "minValue:maxValue:", -20.0, 50.0);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "px_increment:", 1.0);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v356[0] = v305;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Hysteresis Distance"), CFSTR("monthsFloatingHeadersAppearanceCrossfadeStartDistance"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "minValue:maxValue:", -1.0, 2.0);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "px_increment:", 0.05);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v356[1] = v284;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("X-Fade Distance"), CFSTR("monthsFloatingHeadersAppearanceCrossfadeDistance"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "minValue:maxValue:", 0.0, 2.0);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "px_increment:", 0.1);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v356[2] = v263;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Out Distance"), CFSTR("monthsFloatingHeadersFadeoutDistance"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "minValue:maxValue:", 0.0, 3.0);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "px_increment:", 0.1);
  v241 = (id)objc_claimAutoreleasedReturnValue();
  v356[3] = v241;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Floating Subtitle Alpha"), CFSTR("monthsFloatingHeadersSubtitleAlpha"));
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "minValue:maxValue:", 0.0, 1.0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "px_increment:", 0.01);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v356[4] = v223;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inline Fade Offset"), CFSTR("monthsInlineHeadersFadeoutOffset"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", -1.0, 2.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "px_increment:", 0.1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v356[5] = v79;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inline Fade Distance"), CFSTR("monthsInlineHeadersFadeoutDistance"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "minValue:maxValue:", 0.0, 3.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "px_increment:", 0.1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v356[6] = v82;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inline Min Alpha"), CFSTR("monthsInlineHeadersFadeoutMinimumAlpha"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "minValue:maxValue:", 0.0, 1.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "px_increment:", 0.05);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v356[7] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v356, 8);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v322, "sectionWithRows:title:", v86, CFSTR("Months Headers"));
  v323 = (void *)objc_claimAutoreleasedReturnValue();

  v317 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Offset"), CFSTR("yearsHeadersFadeoutOffset"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "minValue:maxValue:", -100.0, 20.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "px_increment:", 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v355[0] = v89;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Distance"), CFSTR("yearsHeadersFadeoutDistance"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "minValue:maxValue:", 0.0, 150.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "px_increment:", 1.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v355[1] = v92;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Alpha"), CFSTR("yearsHeadersFadeoutMinimumAlpha"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "minValue:maxValue:", 0.0, 1.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "px_increment:", 0.05);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v355[2] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v355, 3);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "sectionWithRows:title:", v96, CFSTR("Years Headers"));
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = (void *)MEMORY[0x1E0D83078];
  v98 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeGuestAssetsInFooterCount);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "rowWithTitle:valueKeyPath:", CFSTR("Counts Include Guest Assets"), v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v354 = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v354, 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "sectionWithRows:title:", v101, CFSTR("Footer"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  v306 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Initial Zoom Level"), CFSTR("initialZoomLevel"));
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "possibleValues:titles:", &unk_1E53E9D98, &unk_1E53E9DB0);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v353[0] = v292;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show All Highlights"), CFSTR("showAllHighlights"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v353[1] = v285;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Custom Days Curation"), CFSTR("useCustomDaysCurationType"));
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v353[2] = v278;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Days Curation"), CFSTR("daysCurationType"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "possibleValues:titles:", &unk_1E53E9D68, &unk_1E53E9D80);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "conditionFormat:", CFSTR("useCustomDaysCurationType == YES"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v353[3] = v104;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Low Promotion Score Threshold"), CFSTR("nonInterestingPromotionScore"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "minValue:maxValue:", 0.0, 1.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "px_increment:", 0.05);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "conditionFormat:", CFSTR("showAllHighlights == 0"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v353[4] = v108;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Recents"), CFSTR("hideRecents"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v353[5] = v109;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Aggregations"), CFSTR("hideAggregations"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v353[6] = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 7);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "sectionWithRows:title:", v111, CFSTR("Data Source"));
  v307 = (void *)objc_claimAutoreleasedReturnValue();

  v300 = (void *)MEMORY[0x1E0D83078];
  v112 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInlinePlayback);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rowWithTitle:valueKeyPath:", CFSTR("Inline Playback"), v293);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v352[0] = v286;
  v113 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInlinePlaybackInZoomableGrids);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "rowWithTitle:valueKeyPath:", CFSTR("…in Zoomable Grid"), v279);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v352[1] = v264;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Playback"), CFSTR("forcePlayback"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v352[2] = v250;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Autoplay Suggestion Score"), CFSTR("minAutoplaySuggestionScore"));
  v242 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "minValue:maxValue:", 0.0, 1.0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "px_increment:", 0.100000001);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "conditionFormat:", CFSTR("enableInlinePlayback == YES && forcePlayback == NO"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v352[3] = v224;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Play Best Time Range"), CFSTR("playBestTimeRange"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "conditionFormat:", CFSTR("enableInlinePlayback == YES "));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v352[4] = v215;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Max # of Playing Items"), CFSTR("maxNumberOfPlayingItems"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "possibleValues:titles:", &unk_1E53E9DC8, &unk_1E53E9DE0);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v352[5] = v206;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Playback Visibility Inset"), CFSTR("playbackVisibleRectEdgeInset"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "minValue:maxValue:", 0.0, 200.0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "px_increment:", 1.0);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v352[6] = v197;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Live Photo Crossfade Duration"), CFSTR("livePhotoLoopingCrossfadeDuration"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "minValue:maxValue:", 0.0, 1.0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "px_increment:", 0.05);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v352[7] = v189;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Playback Diagnostics"), CFSTR("enablePlaybackDiagnostics"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v352[8] = v115;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Stabilize Live Photos"), CFSTR("stabilizeLivePhotos"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v352[9] = v117;
  v118 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_playingRecordsUpdateRateLimit);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "rowWithTitle:valueKeyPath:", CFSTR("Playing Records Update Rate Limit"), v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "minValue:maxValue:", 0.0, 2.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "px_increment:", 0.02);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "conditionFormat:", CFSTR("enableInlinePlayback == YES"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v352[10] = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v352, 11);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "sectionWithRows:title:", v124, CFSTR("Inline Media Playback"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Trigger Delay"), CFSTR("slideshowTriggerDelay"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "minValue:maxValue:", 1.0, 15.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "px_increment:", 0.5);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v351[0] = v128;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Interval Delay"), CFSTR("slideshowIntervalDelay"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "minValue:maxValue:", 1.0, 15.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "px_increment:", 0.5);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v351[1] = v131;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v351, 2);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "sectionWithRows:title:", v132, CFSTR("Slideshow"));
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Non-Processed Highlights"), CFSTR("firstTimeExperienceMaxNonProcessedHighlights"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "minValue:maxValue:", 0.0, 100.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "px_increment:", 1.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v350[0] = v136;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Non-Processed assets"), CFSTR("firstTimeExperienceMaxNonProcessedAssets"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "minValue:maxValue:", 0.0, 1000.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "px_increment:", 50.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v350[1] = v139;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Log FTE Readiness"), CFSTR("firstTimeExperienceAlwaysLogReadiness"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v350[2] = v140;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v350, 3);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "sectionWithRows:title:", v141, CFSTR("First Time Experience"));
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  v280 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Level Duration"), CFSTR("defaultZoomLevelTransitionAnimationDuration"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "minValue:maxValue:", 0.0, 2.0);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "px_increment:", 0.05);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v349[0] = v258;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Scale"), CFSTR("defaultZoomLevelTransitionMaximumScaleAroundAnchor"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "minValue:maxValue:", 1.0, 10.0);
  v243 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "px_increment:", 0.1);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v349[1] = v237;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Years Fade Speed"), CFSTR("nonAnchorYearsFadeSpeed"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "minValue:maxValue:", 1.0, 2.0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "px_increment:", 0.05);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v349[2] = v219;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Months Fade Speed"), CFSTR("nonAnchorMonthsFadeSpeed"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "minValue:maxValue:", 1.0, 2.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "px_increment:", 0.05);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v349[3] = v144;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Days Fade Speed"), CFSTR("nonAnchorDaysFadeSpeed"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "minValue:maxValue:", 1.0, 2.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "px_increment:", 0.05);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v349[4] = v147;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("All Photos Duration"), CFSTR("transitionToOrFromAllPhotosAnimationDuration"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "minValue:maxValue:", 0.0, 2.0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "px_increment:", 0.05);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v349[5] = v150;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v349, 6);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "sectionWithRows:title:", v151, CFSTR("Animations"));
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  v273 = (void *)MEMORY[0x1E0D83078];
  v152 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInteractiveTransition);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "rowWithTitle:valueKeyPath:", CFSTR("Interactive transitions"), v266);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v348[0] = v259;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("All Photos Scale"), CFSTR("transitionToOrFromAllPhotosScale"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "minValue:maxValue:", 0.5, 1.0);
  v244 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "px_increment:", 0.01);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v348[1] = v238;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Day Scale Not Matching Months"), CFSTR("transitionScaleForDayNotMatchingMonths"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "minValue:maxValue:", 0.5, 1.0);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "px_increment:", 0.01);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v348[2] = v220;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Pinch Scale Delta"), CFSTR("zoomLevelPinchSignificantScaleDelta"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "minValue:maxValue:", 0.0, 0.2);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "px_increment:", 0.01);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v348[3] = v155;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Back Angle"), CFSTR("swipeBackGestureMinAngle"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "minValue:maxValue:", 10.0, 85.0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "px_increment:", 1.0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v348[4] = v158;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Back Translation"), CFSTR("swipeBackGestureMinTranslation"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "minValue:maxValue:", 10.0, 100.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "px_increment:", 5.0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v348[5] = v161;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v348, 6);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "sectionWithRows:title:", v162, CFSTR("Transitions"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Segment Expansion"), CFSTR("zoomLevelControlSegmentExpansionFactor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "minValue:maxValue:", 0.0, 1.0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "px_increment:", 0.05);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v347 = v166;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v347, 1);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "sectionWithRows:title:", v167, CFSTR("Zoom Level Control"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = (void *)MEMORY[0x1E0D83078];
  v169 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableRecentlyEditedAlbum);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "rowWithTitle:valueKeyPath:", CFSTR("Enable Recently Edited Album"), v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v346[0] = v171;
  v172 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alignActionButtonsTrailingEdges);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "rowWithTitle:valueKeyPath:", CFSTR("Align Action Button Trailing Edge"), v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v346[1] = v174;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v346, 2);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "sectionWithRows:title:", v175, CFSTR("Miscellaneous"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();

  v176 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Exaggerate Contrast"), CFSTR("exaggerateContrast"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v345[0] = v177;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Badges on All Assets"), CFSTR("forceBadgesOnAllAssets"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v345[1] = v178;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Show All Buttons Visible"), CFSTR("forceShowAllButtonsVisible"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v345[2] = v179;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v345, 3);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "sectionWithRows:title:", v180, CFSTR("Debug"));
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = (id)MEMORY[0x1E0D83078];
  v344[0] = v343;
  v344[1] = v342;
  v344[2] = v341;
  v344[3] = v340;
  v344[4] = v338;
  v344[5] = v335;
  v344[6] = v332;
  v344[7] = v330;
  v344[8] = v327;
  v344[9] = v323;
  v344[10] = v318;
  v344[11] = v312;
  v344[12] = v307;
  v344[13] = v301;
  v344[14] = v294;
  v344[15] = v287;
  v344[16] = v281;
  v344[17] = v274;
  v344[18] = v267;
  v344[19] = v260;
  v344[20] = v253;
  v344[21] = v181;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v344, 22);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "moduleWithTitle:contents:", CFSTR("Curated Library"), v182);
  v246 = (id)objc_claimAutoreleasedReturnValue();

  return v246;
}

void __56__PXCuratedLibrarySettings_UI__settingsControllerModule__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", PXCuratedLibrarySaveCurrentAllPhotosScrollPositionNotificationName, 0);

}

void __56__PXCuratedLibrarySettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = a2;
  v15 = 0;
  PXExternalContentReviewViewController((uint64_t)&v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v2;
    v8 = v7;
    if (v6)
    {
      if (v7)
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, 0, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAction:", v10);

        objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentAlertForNavigationController(NSString *__strong, NSString * _Nullable __strong, UINavigationController *__strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibrarySettings+UI.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

      if (v8)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentAlertForNavigationController(NSString *__strong, NSString * _Nullable __strong, UINavigationController *__strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySettings+UI.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController"));

    goto LABEL_5;
  }
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);
LABEL_6:

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)allowsModularLayoutForZoomLevel:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 layoutStyle:(unint64_t)a6
{
  if ((unint64_t)(a3 - 1) > 1)
    return 0;
  if (a4 == 2 || a4 == 1 && a5 == 2)
    return 1;
  return a3 == 2 && a6 == 1;
}

- (int64_t)version
{
  return 11;
}

- (double)recentHighlightsTimeInterval
{
  return self->_recentHighlightsTimeInterval;
}

- (void)setRecentHighlightsTimeInterval:(double)a3
{
  self->_recentHighlightsTimeInterval = a3;
}

- (BOOL)enablePlayMovieInYears
{
  return self->_enablePlayMovieInYears;
}

- (NSString)savedAllPhotosScrollPositionAnchorAssetIdentifier
{
  return self->_savedAllPhotosScrollPositionAnchorAssetIdentifier;
}

- (BOOL)alwaysShowSecondaryToolbarAtBottom
{
  return self->_alwaysShowSecondaryToolbarAtBottom;
}

- (double)bottomCenterSecondaryToolbarWidth
{
  return self->_bottomCenterSecondaryToolbarWidth;
}

- (double)blurredBackgroundRadius
{
  return self->_blurredBackgroundRadius;
}

- (void)setBlurredBackgroundRadius:(double)a3
{
  self->_blurredBackgroundRadius = a3;
}

- (BOOL)enableTapOnTitleToScroll
{
  return self->_enableTapOnTitleToScroll;
}

- (BOOL)enableCustomScrollToTopOrBottom
{
  return self->_enableCustomScrollToTopOrBottom;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (double)scrollSnapMinimumSpeed
{
  return self->_scrollSnapMinimumSpeed;
}

- (double)largeHeroMinimumScore
{
  return self->_largeHeroMinimumScore;
}

- (double)aspectRatioForCompactLandscapeYears
{
  return self->_aspectRatioForCompactLandscapeYears;
}

- (double)aspectRatioForRegularYears
{
  return self->_aspectRatioForRegularYears;
}

- (int64_t)forcedNumberOfYearsColumn
{
  return self->_forcedNumberOfYearsColumn;
}

- (BOOL)useWideModularLayoutInYears
{
  return self->_useWideModularLayoutInYears;
}

- (double)sectionShadowOpacity
{
  return self->_sectionShadowOpacity;
}

- (double)skimmingScale
{
  return self->_skimmingScale;
}

- (BOOL)hideStatusFooter
{
  return self->_hideStatusFooter;
}

- (BOOL)hideAnalyzingStatus
{
  return self->_hideAnalyzingStatus;
}

- (double)minimumVisibleHeightForTopMostSection
{
  return self->_minimumVisibleHeightForTopMostSection;
}

- (BOOL)includeGuestAssetsInFooterCount
{
  return self->_includeGuestAssetsInFooterCount;
}

- (unsigned)daysCurationType
{
  return self->_daysCurationType;
}

- (BOOL)enableInlinePlayback
{
  return self->_enableInlinePlayback;
}

- (BOOL)enableInlinePlaybackInZoomableGrids
{
  return self->_enableInlinePlaybackInZoomableGrids;
}

- (double)minAutoplaySuggestionScore
{
  return self->_minAutoplaySuggestionScore;
}

- (BOOL)playBestTimeRange
{
  return self->_playBestTimeRange;
}

- (int64_t)maxNumberOfPlayingItems
{
  return self->_maxNumberOfPlayingItems;
}

- (double)livePhotoLoopingCrossfadeDuration
{
  return self->_livePhotoLoopingCrossfadeDuration;
}

- (BOOL)stabilizeLivePhotos
{
  return self->_stabilizeLivePhotos;
}

- (BOOL)firstTimeExperienceAlwaysLogReadiness
{
  return self->_firstTimeExperienceAlwaysLogReadiness;
}

- (BOOL)enableInteractiveTransition
{
  return self->_enableInteractiveTransition;
}

- (double)defaultZoomLevelTransitionAnimationDuration
{
  return self->_defaultZoomLevelTransitionAnimationDuration;
}

- (double)defaultZoomLevelTransitionMaximumScaleAroundAnchor
{
  return self->_defaultZoomLevelTransitionMaximumScaleAroundAnchor;
}

- (double)nonAnchorYearsFadeSpeed
{
  return self->_nonAnchorYearsFadeSpeed;
}

- (double)nonAnchorMonthsFadeSpeed
{
  return self->_nonAnchorMonthsFadeSpeed;
}

- (double)nonAnchorDaysFadeSpeed
{
  return self->_nonAnchorDaysFadeSpeed;
}

- (double)transitionToOrFromAllPhotosAnimationDuration
{
  return self->_transitionToOrFromAllPhotosAnimationDuration;
}

- (double)transitionToOrFromAllPhotosScale
{
  return self->_transitionToOrFromAllPhotosScale;
}

- (double)transitionScaleForDayNotMatchingMonths
{
  return self->_transitionScaleForDayNotMatchingMonths;
}

- (BOOL)enableRecentlyEditedAlbum
{
  return self->_enableRecentlyEditedAlbum;
}

- (BOOL)alignActionButtonsTrailingEdges
{
  return self->_alignActionButtonsTrailingEdges;
}

- (double)lateralMarginDays
{
  return self->_lateralMarginDays;
}

- (void)setLateralMarginDays:(double)a3
{
  self->_lateralMarginDays = a3;
}

- (double)lateralMarginMonths
{
  return self->_lateralMarginMonths;
}

- (void)setLateralMarginMonths:(double)a3
{
  self->_lateralMarginMonths = a3;
}

- (double)lateralMarginYears
{
  return self->_lateralMarginYears;
}

- (void)setLateralMarginYears:(double)a3
{
  self->_lateralMarginYears = a3;
}

- (double)externalSecondaryToolbarHeight
{
  return self->_externalSecondaryToolbarHeight;
}

- (void)setExternalSecondaryToolbarHeight:(double)a3
{
  self->_externalSecondaryToolbarHeight = a3;
}

- (BOOL)forceShowAllButtonsVisible
{
  return self->_forceShowAllButtonsVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAllPhotosScrollPositionAnchorAssetIdentifier, 0);
}

BOOL __56__PXCuratedLibrarySettings_acceptableLargeHeroPredicate__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "weightUsingCriterion:", 2);
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "largeHeroMinimumScore");
  return v4 >= v5;
}

+ (BOOL)enableEmptyYearsMonthsDaysForTesting
{
  return _enableEmptyYearsMonthsDaysForTesting;
}

+ (void)setEnableEmptyYearsMonthsDaysForTesting:(BOOL)a3
{
  _enableEmptyYearsMonthsDaysForTesting = a3;
}

@end
