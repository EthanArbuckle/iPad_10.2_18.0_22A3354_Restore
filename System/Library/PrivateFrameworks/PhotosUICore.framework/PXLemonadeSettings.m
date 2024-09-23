@implementation PXLemonadeSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  uint64_t v5;

  static SettingsUIProvider.Module(_:sections:)(0x6564616E6F6D654CLL, 0xE800000000000000, (uint64_t (*)(uint64_t))sub_1A6E659F8, &v5);
  SettingsUIModule.prototypeToolsModule.getter();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)version
{
  return 2;
}

- (void)setDefaultValues
{
  void *v3;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXLemonadeSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[PXLemonadeSettings setProfileButtonShapeOutset:](self, "setProfileButtonShapeOutset:", 4.0);
  -[PXLemonadeSettings setSearchButtonShapeOutset:](self, "setSearchButtonShapeOutset:", 4.0);
  -[PXLemonadeSettings setSelectButtonShapeOutset:](self, "setSelectButtonShapeOutset:", 4.0);
  -[PXLemonadeSettings setNavigationBarLegibilityEDRBoost:](self, "setNavigationBarLegibilityEDRBoost:", 0.125);
  -[PXLemonadeSettings setEnableNavigationBarBlur:](self, "setEnableNavigationBarBlur:", 1);
  -[PXLemonadeSettings setEnableNavigationBarBlurInCollections:](self, "setEnableNavigationBarBlurInCollections:", 1);
  -[PXLemonadeSettings setNavigationBarBlurLegibilityEDRBoost:](self, "setNavigationBarBlurLegibilityEDRBoost:", 0.8);
  -[PXLemonadeSettings setNavigationBarBlurRadius:](self, "setNavigationBarBlurRadius:", 1.5);
  -[PXLemonadeSettings setNavigationBarBlurDistanceToBaseline:](self, "setNavigationBarBlurDistanceToBaseline:", 90.0);
  -[PXLemonadeSettings setNavigationBarTintCurve:](self, "setNavigationBarTintCurve:", 4);
  -[PXLemonadeSettings setNavigationBarTintDistanceToBaseline:](self, "setNavigationBarTintDistanceToBaseline:", 90.0);
  -[PXLemonadeSettings setNavigationBarTintOpacity:](self, "setNavigationBarTintOpacity:", 0.6);
  -[PXLemonadeSettings setAllowProfileIcon:](self, "setAllowProfileIcon:", 1);
  -[PXLemonadeSettings setNavigationBarAnimationDuration:](self, "setNavigationBarAnimationDuration:", 0.3);
  -[PXLemonadeSettings setNavigationBarTitleAppearDuration:](self, "setNavigationBarTitleAppearDuration:", 0.45);
  -[PXLemonadeSettings setNavigationBarTitleAppearDelay:](self, "setNavigationBarTitleAppearDelay:", 0.05);
  -[PXLemonadeSettings setNavigationBarTitleDisappearDuration:](self, "setNavigationBarTitleDisappearDuration:", 0.2);
  -[PXLemonadeSettings setDefaultPhoneFeedNavigationType:](self, "setDefaultPhoneFeedNavigationType:", 0);
  -[PXLemonadeSettings setEnableInlinePlaybackMemories:](self, "setEnableInlinePlaybackMemories:", 1);
  -[PXLemonadeSettings setEnableInlinePlaybackTrips:](self, "setEnableInlinePlaybackTrips:", 1);
  -[PXLemonadeSettings setEnableInlinePlaybackTripsShelf:](self, "setEnableInlinePlaybackTripsShelf:", 1);
  -[PXLemonadeSettings setEnableInlinePlaybackEvents:](self, "setEnableInlinePlaybackEvents:", 0);
  -[PXLemonadeSettings setEnableInlinePlaybackSocialGroupShelf:](self, "setEnableInlinePlaybackSocialGroupShelf:", 1);
  -[PXLemonadeSettings setEnableInlinePlaybackSocialGroupFeed:](self, "setEnableInlinePlaybackSocialGroupFeed:", 1);
  -[PXLemonadeSettings setHideInlinePlayerOnFirstSegment:](self, "setHideInlinePlayerOnFirstSegment:", 1);
  -[PXLemonadeSettings setOpacityOfPlayerOnFirstSegment:](self, "setOpacityOfPlayerOnFirstSegment:", 0.0);
  -[PXLemonadeSettings setInlinePlayerFirstSegmentPlaceholderDuration:](self, "setInlinePlayerFirstSegmentPlaceholderDuration:", 2.0);
  -[PXLemonadeSettings setInlinePlayerFrameLatencyApproximation:](self, "setInlinePlayerFrameLatencyApproximation:", 0.2);
  -[PXLemonadeSettings setInlinePlayerPlaceholderKenBurnsScale:](self, "setInlinePlayerPlaceholderKenBurnsScale:", 1.08);
  -[PXLemonadeSettings setInlinePlayerPlaceholderKenBurnsExtraDuration:](self, "setInlinePlayerPlaceholderKenBurnsExtraDuration:", 1.0);
  -[PXLemonadeSettings setInlinePlayerDecreasedPlaybackRateFactor:](self, "setInlinePlayerDecreasedPlaybackRateFactor:", 0.5);
  -[PXLemonadeSettings setEnableInlinePlaybackOnHover:](self, "setEnableInlinePlaybackOnHover:", 1);
  -[PXLemonadeSettings setInlinePlaybackOnHoverPlaybackDelay:](self, "setInlinePlaybackOnHoverPlaybackDelay:", 0.75);
  -[PXLemonadeSettings setAlwaysFilterPlaceholder:](self, "setAlwaysFilterPlaceholder:", 0);
  -[PXLemonadeSettings setInlinePlaybackMaxConcurrentPlayers:](self, "setInlinePlaybackMaxConcurrentPlayers:", 1);
  -[PXLemonadeSettings setInlinePlaybackMaxPreloadPlayers:](self, "setInlinePlaybackMaxPreloadPlayers:", 1);
  -[PXLemonadeSettings setInlinePlaybackMaxSupportedVisiblePlayers:](self, "setInlinePlaybackMaxSupportedVisiblePlayers:", 30);
  -[PXLemonadeSettings setEnableInlinePlaybackDebugHUD:](self, "setEnableInlinePlaybackDebugHUD:", 0);
  -[PXLemonadeSettings setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:](self, "setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:", 0);
  -[PXLemonadeSettings setInlinePlaybackVisibilityThreshold:](self, "setInlinePlaybackVisibilityThreshold:", 0.75);
  -[PXLemonadeSettings setInlinePlayerCoveredDurationForPause:](self, "setInlinePlayerCoveredDurationForPause:", 1.0);
  -[PXLemonadeSettings setPreferNewPlayerForFeeds:](self, "setPreferNewPlayerForFeeds:", 0);
  -[PXLemonadeSettings setShouldUsePhotosIntelligenceSPIForUtilities:](self, "setShouldUsePhotosIntelligenceSPIForUtilities:", 0);
  -[PXLemonadeSettings setMaxNumberOfSharedAlbumActivityItemsToShow:](self, "setMaxNumberOfSharedAlbumActivityItemsToShow:", 8);
  -[PXLemonadeSettings setEnableCollectionsSortButton:](self, "setEnableCollectionsSortButton:", 1);
  -[PXLemonadeSettings setEnableUserSmartAlbums:](self, "setEnableUserSmartAlbums:", 0);
  -[PXLemonadeSettings setEventsAlgorithm:](self, "setEventsAlgorithm:", 10);
  -[PXLemonadeSettings setEventsDataSource:](self, "setEventsDataSource:", 1);
  -[PXLemonadeSettings setEnableEventsCellCollageStyle:](self, "setEnableEventsCellCollageStyle:", 0);
  -[PXLemonadeSettings setEventsCellItemAspectRatio:](self, "setEventsCellItemAspectRatio:", 1.17);
  -[PXLemonadeSettings setShouldRemoveFilteredEventsFromUI:](self, "setShouldRemoveFilteredEventsFromUI:", 1);
  -[PXLemonadeSettings setEventFilterType:](self, "setEventFilterType:", 1);
  -[PXLemonadeSettings setEventsPromotionScoreThreshold:](self, "setEventsPromotionScoreThreshold:", 0.45);
  -[PXLemonadeSettings setEventsExtendedCountThreshold:](self, "setEventsExtendedCountThreshold:", 4);
  -[PXLemonadeSettings setEventsSummaryCountThreshold:](self, "setEventsSummaryCountThreshold:", 3);
  -[PXLemonadeSettings setEnableEventsDebugOverlay:](self, "setEnableEventsDebugOverlay:", 0);
  -[PXLemonadeSettings setEnableSavedToday:](self, "setEnableSavedToday:", 1);
  -[PXLemonadeSettings setSavedTodayToleranceInHours:](self, "setSavedTodayToleranceInHours:", 2.0);
  -[PXLemonadeSettings setTripsSource:](self, "setTripsSource:", 1);
  -[PXLemonadeSettings setEnableNewDetailsView:](self, "setEnableNewDetailsView:", 1);
  -[PXLemonadeSettings setForceDarkDetailsView:](self, "setForceDarkDetailsView:", 0);
  -[PXLemonadeSettings setEnablePreviewSharing:](self, "setEnablePreviewSharing:", 1);
  -[PXLemonadeSettings setEnablePreviewCaching:](self, "setEnablePreviewCaching:", 0);
  -[PXLemonadeSettings setEnablePreviewKeyAsset:](self, "setEnablePreviewKeyAsset:", 1);
  -[PXLemonadeSettings setSimulateDetailsViewLeaking:](self, "setSimulateDetailsViewLeaking:", 0);
  -[PXLemonadeSettings setSimulatedDetailsViewLoadingDelay:](self, "setSimulatedDetailsViewLoadingDelay:", 0.0);
  -[PXLemonadeSettings setSimulatedPreviewPlayerDelay:](self, "setSimulatedPreviewPlayerDelay:", 0.0);
  -[PXLemonadeSettings setScrubberKind:](self, "setScrubberKind:", 0);
  -[PXLemonadeSettings setEnableDetailsViewHorizontalKeyboardScrolling:](self, "setEnableDetailsViewHorizontalKeyboardScrolling:", 0);
  -[PXLemonadeSettings setEnableDetailsViewHorizontalPaging:](self, "setEnableDetailsViewHorizontalPaging:", 1);
  -[PXLemonadeSettings setHorizontalPagingTechnique:](self, "setHorizontalPagingTechnique:", 0);
  -[PXLemonadeSettings setEnableHorizontalPagingHint:](self, "setEnableHorizontalPagingHint:", 1);
  -[PXLemonadeSettings setHorizontalPagingHintMaximumScale:](self, "setHorizontalPagingHintMaximumScale:", 0.22);
  -[PXLemonadeSettings setHorizontalPagingHintMaximumOvershoot:](self, "setHorizontalPagingHintMaximumOvershoot:", 600.0);
  -[PXLemonadeSettings setEnableAggregatedHighlightGridInEditorial:](self, "setEnableAggregatedHighlightGridInEditorial:", 0);
  -[PXLemonadeSettings setAggregatedHighlightColumns:](self, "setAggregatedHighlightColumns:", 3);
  -[PXLemonadeSettings setLowQualityAggregationPromotionScoreThreshold:](self, "setLowQualityAggregationPromotionScoreThreshold:", 0.35);
  -[PXLemonadeSettings setDetailsViewHeaderAspectRatio:](self, "setDetailsViewHeaderAspectRatio:", 0.84);
  -[PXLemonadeSettings setEnableFocusMapLensOnAnchors:](self, "setEnableFocusMapLensOnAnchors:", 1);
  -[PXLemonadeSettings setMapLensAnchorFocusKilometerRadius:](self, "setMapLensAnchorFocusKilometerRadius:", 0.5);
  -[PXLemonadeSettings setEnableDetailsSummaryButton:](self, "setEnableDetailsSummaryButton:", 0);
  -[PXLemonadeSettings setEnableDetailsViewPrototype:](self, "setEnableDetailsViewPrototype:", 0);
  -[PXLemonadeSettings setEnableDynamicHeader:](self, "setEnableDynamicHeader:", 1);
  -[PXLemonadeSettings setDynamicHeaderChromeHidingDelay:](self, "setDynamicHeaderChromeHidingDelay:", 2.0);
  -[PXLemonadeSettings setDynamicHeaderDebugOverlay:](self, "setDynamicHeaderDebugOverlay:", 0);
  -[PXLemonadeSettings setDynamicHeaderDebugBehavior:](self, "setDynamicHeaderDebugBehavior:", 0);
  -[PXLemonadeSettings setDynamicHeaderMaximumDelayFromPreview:](self, "setDynamicHeaderMaximumDelayFromPreview:", 2.0);
  -[PXLemonadeSettings setDynamicHeaderMaximumDelayFromMovie:](self, "setDynamicHeaderMaximumDelayFromMovie:", 0.3);
  -[PXLemonadeSettings setDynamicHeaderDismissAreaBottomInset:](self, "setDynamicHeaderDismissAreaBottomInset:", 0.0);
  -[PXLemonadeSettings setDetailsDismissArea:](self, "setDetailsDismissArea:", 1);
  -[PXLemonadeSettings setEnableProtoBanner:](self, "setEnableProtoBanner:", 0);
  -[PXLemonadeSettings setTopTitleVerticalSpace:](self, "setTopTitleVerticalSpace:", 123.0);
  -[PXLemonadeSettings setTitleOverlayScaleAtTop:](self, "setTitleOverlayScaleAtTop:", 0.75);
  -[PXLemonadeSettings setTitleOverlayVerticalOffsetAtTop:](self, "setTitleOverlayVerticalOffsetAtTop:", 6.0);
  -[PXLemonadeSettings setTitleOverlayScaleDistance:](self, "setTitleOverlayScaleDistance:", 150.0);
  -[PXLemonadeSettings setTitleOverlayDetachingDistance:](self, "setTitleOverlayDetachingDistance:", 150.0);
  -[PXLemonadeSettings setTitleOverlayTopDetentTolerance:](self, "setTitleOverlayTopDetentTolerance:", 3.0);
  -[PXLemonadeSettings setTitleOverlaySingleLineTopDetentTolerance:](self, "setTitleOverlaySingleLineTopDetentTolerance:", 20.0);
  -[PXLemonadeSettings setMovieCurationAffordance:](self, "setMovieCurationAffordance:", 1);
  -[PXLemonadeSettings setAlwaysEnterDetailsViewInFullscreenPlayback:](self, "setAlwaysEnterDetailsViewInFullscreenPlayback:", 0);
  -[PXLemonadeSettings setMapTabInitialKilometerRadius:](self, "setMapTabInitialKilometerRadius:", 100.0);
  -[PXLemonadeSettings setMapTileInitialKilometerDiameter:](self, "setMapTileInitialKilometerDiameter:", self->_mapTabInitialKilometerRadius * 1000.0);
  -[PXLemonadeSettings setPresentZoomableGridFromMapCluster:](self, "setPresentZoomableGridFromMapCluster:", 1);
  -[PXLemonadeSettings setEnableUtilityPrototypeCollections:](self, "setEnableUtilityPrototypeCollections:", 0);
  -[PXLemonadeSettings setEnableRecentlySharedCollection:](self, "setEnableRecentlySharedCollection:", 1);
  -[PXLemonadeSettings setEnableRecentlyViewedCollection:](self, "setEnableRecentlyViewedCollection:", 1);
  -[PXLemonadeSettings setEnableRecentlyEditedCollection:](self, "setEnableRecentlyEditedCollection:", 1);
  -[PXLemonadeSettings setEnableDocumentsSection:](self, "setEnableDocumentsSection:", 1);
  -[PXLemonadeSettings setMaximumNumberOfAssetsForPlaybackAsMemory:](self, "setMaximumNumberOfAssetsForPlaybackAsMemory:", 500);
  -[PXLemonadeSettings setMinimumNumberOfAssetsForPlaybackAsMemory:](self, "setMinimumNumberOfAssetsForPlaybackAsMemory:", 4);
  -[PXLemonadeSettings setPlayLensCollectionPersistenceConfirmationStyle:](self, "setPlayLensCollectionPersistenceConfirmationStyle:", 1);
  -[PXLemonadeSettings setEnableCuratedLibrary:](self, "setEnableCuratedLibrary:", 1);
  -[PXLemonadeSettings setEnableCubeMode:](self, "setEnableCubeMode:", 0);
  -[PXLemonadeSettings setEnableRadarButton:](self, "setEnableRadarButton:", 1);
  -[PXLemonadeSettings setEnableMonthLocationTitles:](self, "setEnableMonthLocationTitles:", 0);
  -[PXLemonadeSettings setEnableMonthHeroPromotion:](self, "setEnableMonthHeroPromotion:", 0);
  -[PXLemonadeSettings setShowSharedLibraryPill:](self, "setShowSharedLibraryPill:", 0);
  -[PXLemonadeSettings setSharedWithYouOnlyFilterIncludesUnsaved:](self, "setSharedWithYouOnlyFilterIncludesUnsaved:", 0);
  -[PXLemonadeSettings setResetAllPhotosOnDismiss:](self, "setResetAllPhotosOnDismiss:", 1);
  -[PXLemonadeSettings setMinimumCuratedLibraryVisibleFractionForExpansion:](self, "setMinimumCuratedLibraryVisibleFractionForExpansion:", 0.25);
  -[PXLemonadeSettings setYearsAndMonthsMode:](self, "setYearsAndMonthsMode:", 2);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 0;

  -[PXLemonadeSettings setCollectionPreviewTransition:](self, "setCollectionPreviewTransition:", v4);
  -[PXLemonadeSettings setEnableKenBurnsInCollectionPreview:](self, "setEnableKenBurnsInCollectionPreview:", 1);
  -[PXLemonadeSettings setCollectionPreviewKenBurnsScaleDirection:](self, "setCollectionPreviewKenBurnsScaleDirection:", 2);
  -[PXLemonadeSettings setCuratedLibraryExpansionSpringStiffness:](self, "setCuratedLibraryExpansionSpringStiffness:", 150.0);
  -[PXLemonadeSettings setCuratedLibraryToggleExpansionAnimationDuration:](self, "setCuratedLibraryToggleExpansionAnimationDuration:", 0.6);
  -[PXLemonadeSettings setCuratedLibraryBottomPadding:](self, "setCuratedLibraryBottomPadding:", 22.0);
  -[PXLemonadeSettings setEnableSearchResultDiffAnimation:](self, "setEnableSearchResultDiffAnimation:", 0);
  -[PXLemonadeSettings setEnableMetadataSearch:](self, "setEnableMetadataSearch:", 1);
  -[PXLemonadeSettings setEnableEmbeddingSearch:](self, "setEnableEmbeddingSearch:", _os_feature_enabled_impl());
  -[PXLemonadeSettings setMaxRankedAssetSearchResults:](self, "setMaxRankedAssetSearchResults:", 13);
  -[PXLemonadeSettings setMaxSearchSuggestions:](self, "setMaxSearchSuggestions:", 4);
  -[PXLemonadeSettings setMinQueryLengthForFullRanking:](self, "setMinQueryLengthForFullRanking:", 0);
  -[PXLemonadeSettings setMaxCuratedCollectionsPerType:](self, "setMaxCuratedCollectionsPerType:", 2);
  -[PXLemonadeSettings setSearchMediaAnalysisUIThreshold:](self, "setSearchMediaAnalysisUIThreshold:", 0.95);
  -[PXLemonadeSettings setEnableZKWForPad:](self, "setEnableZKWForPad:", 1);
  -[PXLemonadeSettings setOverrideSuggestionPills:](self, "setOverrideSuggestionPills:", 0);
  -[PXLemonadeSettings setShowSearchDebugBadges:](self, "setShowSearchDebugBadges:", 0);
  -[PXLemonadeSettings setImplicitSearchScopeForPickerSuggestionScopeSearch:](self, "setImplicitSearchScopeForPickerSuggestionScopeSearch:", 1);
  -[PXLemonadeSettings setEnableExactMatchResults:](self, "setEnableExactMatchResults:", 0);
  -[PXLemonadeSettings setEnableHybridMatchResults:](self, "setEnableHybridMatchResults:", 1);
  -[PXLemonadeSettings setMinNumberOfResultsForNextTokenGeneration:](self, "setMinNumberOfResultsForNextTokenGeneration:", *MEMORY[0x1E0CD1DD8]);
  -[PXLemonadeSettings setSearchQueryTimeout:](self, "setSearchQueryTimeout:", *MEMORY[0x1E0CD1DE0]);
  -[PXLemonadeSettings setEnableFullPageScreenshots:](self, "setEnableFullPageScreenshots:", 0);
  -[PXLemonadeSettings setEnableFullPageScreenshotDebuggingOverlays:](self, "setEnableFullPageScreenshotDebuggingOverlays:", 0);
  -[PXLemonadeSettings setLimitFullPageScreenshotScale:](self, "setLimitFullPageScreenshotScale:", 0);
  -[PXLemonadeSettings setLimitFullPageScreenshotSize:](self, "setLimitFullPageScreenshotSize:", 1);
  -[PXLemonadeSettings setMaximumFullPageScreenshotDimension:](self, "setMaximumFullPageScreenshotDimension:", 10000.0);
  -[PXLemonadeSettings setEnableStackCounting:](self, "setEnableStackCounting:", 0);
  -[PXLemonadeSettings setEnablePhotosChallenge:](self, "setEnablePhotosChallenge:", 1);
  -[PXLemonadeSettings setEnableShelfIPadLayout:](self, "setEnableShelfIPadLayout:", 1);
  -[PXLemonadeSettings setEnableShelfDrawBorders:](self, "setEnableShelfDrawBorders:", 0);
  -[PXLemonadeSettings setShelfSpacing:](self, "setShelfSpacing:", 36.0);
  -[PXLemonadeSettings setEnableSidebarHeaderSelection:](self, "setEnableSidebarHeaderSelection:", 1);
  -[PXLemonadeSettings setEnableDismissPersistence:](self, "setEnableDismissPersistence:", 0);
  -[PXLemonadeSettings setOnlyDismissedInProfile:](self, "setOnlyDismissedInProfile:", 1);
  -[PXLemonadeSettings setIncludeSharedAlbumsActivityInProfileNotifications:](self, "setIncludeSharedAlbumsActivityInProfileNotifications:", 1);
  -[PXLemonadeSettings setHideNotifications:](self, "setHideNotifications:", 0);
  -[PXLemonadeSettings setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:](self, "setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:", 1);
  -[PXLemonadeSettings setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:](self, "setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:", 5);
  -[PXLemonadeSettings setWallpaperLoadingTimeout:](self, "setWallpaperLoadingTimeout:", 5.0);
  -[PXLemonadeSettings setWallpaperLoadingArtificialDelay:](self, "setWallpaperLoadingArtificialDelay:", 0.0);
  -[PXLemonadeSettings setForceShowProcessingUI:](self, "setForceShowProcessingUI:", 0);
  -[PXLemonadeSettings setForceHideProcessingUI:](self, "setForceHideProcessingUI:", 0);
  -[PXLemonadeSettings setUseFeatureAvailabilityReporter:](self, "setUseFeatureAvailabilityReporter:", 0);
  -[PXLemonadeSettings setSectionedFeedTabBarItemSpacing:](self, "setSectionedFeedTabBarItemSpacing:", 8.0);
  -[PXLemonadeSettings setDefaultFloatingToolbarBottomInset:](self, "setDefaultFloatingToolbarBottomInset:", 20.0);
  -[PXLemonadeSettings setEnableShelves:](self, "setEnableShelves:", 1);
  -[PXLemonadeSettings setEnableShelvesLoader:](self, "setEnableShelvesLoader:", 1);
  -[PXLemonadeSettings setEnableShelvesLoaderGradualDelivery:](self, "setEnableShelvesLoaderGradualDelivery:", 1);
  -[PXLemonadeSettings setEnabledShelvesLazyVStack:](self, "setEnabledShelvesLazyVStack:", 0);
  -[PXLemonadeSettings setEnableResponsiveScrolling:](self, "setEnableResponsiveScrolling:", 1);
  -[PXLemonadeSettings setEnableLoadingStatusHUD:](self, "setEnableLoadingStatusHUD:", 0);
  -[PXLemonadeSettings setSimulateEmptyShelves:](self, "setSimulateEmptyShelves:", 0);
  -[PXLemonadeSettings setShouldWorkAround126757137:](self, "setShouldWorkAround126757137:", 0);
}

- (void)createChildren
{
  PXLemonadeOneUpSettings *v3;

  v3 = -[PTSettings initWithDefaultValues]([PXLemonadeOneUpSettings alloc], "initWithDefaultValues");
  -[PXLemonadeSettings setOneUpSettings:](self, "setOneUpSettings:", v3);

}

- (void)restoreDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLemonadeSettings;
  -[PXSettings restoreDefaultValues](&v3, sel_restoreDefaultValues);
  -[PXLemonadeSettings setInternal_wantsLemonadeUI:](self, "setInternal_wantsLemonadeUI:", 1);
}

- (void)setInternal_wantsLemonadeUI:(BOOL)a3
{
  PXPreferencesSetBool(CFSTR("WantsLemonadeUI"), a3);
}

- (BOOL)internal_wantsLemonadeUI
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WantsLemonadeUI"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (double)profileButtonShapeOutset
{
  return self->_profileButtonShapeOutset;
}

- (void)setProfileButtonShapeOutset:(double)a3
{
  self->_profileButtonShapeOutset = a3;
}

- (double)searchButtonShapeOutset
{
  return self->_searchButtonShapeOutset;
}

- (void)setSearchButtonShapeOutset:(double)a3
{
  self->_searchButtonShapeOutset = a3;
}

- (double)selectButtonShapeOutset
{
  return self->_selectButtonShapeOutset;
}

- (void)setSelectButtonShapeOutset:(double)a3
{
  self->_selectButtonShapeOutset = a3;
}

- (double)navigationBarLegibilityEDRBoost
{
  return self->_navigationBarLegibilityEDRBoost;
}

- (void)setNavigationBarLegibilityEDRBoost:(double)a3
{
  self->_navigationBarLegibilityEDRBoost = a3;
}

- (BOOL)enableNavigationBarBlur
{
  return self->_enableNavigationBarBlur;
}

- (void)setEnableNavigationBarBlur:(BOOL)a3
{
  self->_enableNavigationBarBlur = a3;
}

- (BOOL)enableNavigationBarBlurInCollections
{
  return self->_enableNavigationBarBlurInCollections;
}

- (void)setEnableNavigationBarBlurInCollections:(BOOL)a3
{
  self->_enableNavigationBarBlurInCollections = a3;
}

- (double)navigationBarBlurLegibilityEDRBoost
{
  return self->_navigationBarBlurLegibilityEDRBoost;
}

- (void)setNavigationBarBlurLegibilityEDRBoost:(double)a3
{
  self->_navigationBarBlurLegibilityEDRBoost = a3;
}

- (double)navigationBarBlurRadius
{
  return self->_navigationBarBlurRadius;
}

- (void)setNavigationBarBlurRadius:(double)a3
{
  self->_navigationBarBlurRadius = a3;
}

- (double)navigationBarBlurDistanceToBaseline
{
  return self->_navigationBarBlurDistanceToBaseline;
}

- (void)setNavigationBarBlurDistanceToBaseline:(double)a3
{
  self->_navigationBarBlurDistanceToBaseline = a3;
}

- (int64_t)navigationBarTintCurve
{
  return self->_navigationBarTintCurve;
}

- (void)setNavigationBarTintCurve:(int64_t)a3
{
  self->_navigationBarTintCurve = a3;
}

- (double)navigationBarTintDistanceToBaseline
{
  return self->_navigationBarTintDistanceToBaseline;
}

- (void)setNavigationBarTintDistanceToBaseline:(double)a3
{
  self->_navigationBarTintDistanceToBaseline = a3;
}

- (double)navigationBarTintOpacity
{
  return self->_navigationBarTintOpacity;
}

- (void)setNavigationBarTintOpacity:(double)a3
{
  self->_navigationBarTintOpacity = a3;
}

- (BOOL)allowProfileIcon
{
  return self->_allowProfileIcon;
}

- (void)setAllowProfileIcon:(BOOL)a3
{
  self->_allowProfileIcon = a3;
}

- (double)navigationBarAnimationDuration
{
  return self->_navigationBarAnimationDuration;
}

- (void)setNavigationBarAnimationDuration:(double)a3
{
  self->_navigationBarAnimationDuration = a3;
}

- (double)navigationBarTitleAppearDuration
{
  return self->_navigationBarTitleAppearDuration;
}

- (void)setNavigationBarTitleAppearDuration:(double)a3
{
  self->_navigationBarTitleAppearDuration = a3;
}

- (double)navigationBarTitleAppearDelay
{
  return self->_navigationBarTitleAppearDelay;
}

- (void)setNavigationBarTitleAppearDelay:(double)a3
{
  self->_navigationBarTitleAppearDelay = a3;
}

- (double)navigationBarTitleDisappearDuration
{
  return self->_navigationBarTitleDisappearDuration;
}

- (void)setNavigationBarTitleDisappearDuration:(double)a3
{
  self->_navigationBarTitleDisappearDuration = a3;
}

- (unint64_t)defaultPhoneFeedNavigationType
{
  return self->_defaultPhoneFeedNavigationType;
}

- (void)setDefaultPhoneFeedNavigationType:(unint64_t)a3
{
  self->_defaultPhoneFeedNavigationType = a3;
}

- (BOOL)enableInlinePlaybackMemories
{
  return self->_enableInlinePlaybackMemories;
}

- (void)setEnableInlinePlaybackMemories:(BOOL)a3
{
  self->_enableInlinePlaybackMemories = a3;
}

- (BOOL)enableInlinePlaybackTrips
{
  return self->_enableInlinePlaybackTrips;
}

- (void)setEnableInlinePlaybackTrips:(BOOL)a3
{
  self->_enableInlinePlaybackTrips = a3;
}

- (BOOL)enableInlinePlaybackTripsShelf
{
  return self->_enableInlinePlaybackTripsShelf;
}

- (void)setEnableInlinePlaybackTripsShelf:(BOOL)a3
{
  self->_enableInlinePlaybackTripsShelf = a3;
}

- (BOOL)enableInlinePlaybackEvents
{
  return self->_enableInlinePlaybackEvents;
}

- (void)setEnableInlinePlaybackEvents:(BOOL)a3
{
  self->_enableInlinePlaybackEvents = a3;
}

- (BOOL)enableInlinePlaybackSocialGroupShelf
{
  return self->_enableInlinePlaybackSocialGroupShelf;
}

- (void)setEnableInlinePlaybackSocialGroupShelf:(BOOL)a3
{
  self->_enableInlinePlaybackSocialGroupShelf = a3;
}

- (BOOL)enableInlinePlaybackSocialGroupFeed
{
  return self->_enableInlinePlaybackSocialGroupFeed;
}

- (void)setEnableInlinePlaybackSocialGroupFeed:(BOOL)a3
{
  self->_enableInlinePlaybackSocialGroupFeed = a3;
}

- (int64_t)inlinePlaybackMaxConcurrentPlayers
{
  return self->_inlinePlaybackMaxConcurrentPlayers;
}

- (void)setInlinePlaybackMaxConcurrentPlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxConcurrentPlayers = a3;
}

- (int64_t)inlinePlaybackMaxPreloadPlayers
{
  return self->_inlinePlaybackMaxPreloadPlayers;
}

- (void)setInlinePlaybackMaxPreloadPlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxPreloadPlayers = a3;
}

- (int64_t)inlinePlaybackMaxSupportedVisiblePlayers
{
  return self->_inlinePlaybackMaxSupportedVisiblePlayers;
}

- (void)setInlinePlaybackMaxSupportedVisiblePlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxSupportedVisiblePlayers = a3;
}

- (BOOL)enableInlinePlaybackOnHover
{
  return self->_enableInlinePlaybackOnHover;
}

- (void)setEnableInlinePlaybackOnHover:(BOOL)a3
{
  self->_enableInlinePlaybackOnHover = a3;
}

- (double)inlinePlaybackOnHoverPlaybackDelay
{
  return self->_inlinePlaybackOnHoverPlaybackDelay;
}

- (void)setInlinePlaybackOnHoverPlaybackDelay:(double)a3
{
  self->_inlinePlaybackOnHoverPlaybackDelay = a3;
}

- (BOOL)enableInlinePlaybackDebugHUD
{
  return self->_enableInlinePlaybackDebugHUD;
}

- (void)setEnableInlinePlaybackDebugHUD:(BOOL)a3
{
  self->_enableInlinePlaybackDebugHUD = a3;
}

- (BOOL)inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal
{
  return self->_inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal;
}

- (void)setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:(BOOL)a3
{
  self->_inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal = a3;
}

- (double)inlinePlaybackVisibilityThreshold
{
  return self->_inlinePlaybackVisibilityThreshold;
}

- (void)setInlinePlaybackVisibilityThreshold:(double)a3
{
  self->_inlinePlaybackVisibilityThreshold = a3;
}

- (double)inlinePlayerCoveredDurationForPause
{
  return self->_inlinePlayerCoveredDurationForPause;
}

- (void)setInlinePlayerCoveredDurationForPause:(double)a3
{
  self->_inlinePlayerCoveredDurationForPause = a3;
}

- (BOOL)preferNewPlayerForFeeds
{
  return self->_preferNewPlayerForFeeds;
}

- (void)setPreferNewPlayerForFeeds:(BOOL)a3
{
  self->_preferNewPlayerForFeeds = a3;
}

- (BOOL)hideInlinePlayerOnFirstSegment
{
  return self->_hideInlinePlayerOnFirstSegment;
}

- (void)setHideInlinePlayerOnFirstSegment:(BOOL)a3
{
  self->_hideInlinePlayerOnFirstSegment = a3;
}

- (double)opacityOfPlayerOnFirstSegment
{
  return self->_opacityOfPlayerOnFirstSegment;
}

- (void)setOpacityOfPlayerOnFirstSegment:(double)a3
{
  self->_opacityOfPlayerOnFirstSegment = a3;
}

- (double)inlinePlayerFirstSegmentPlaceholderDuration
{
  return self->_inlinePlayerFirstSegmentPlaceholderDuration;
}

- (void)setInlinePlayerFirstSegmentPlaceholderDuration:(double)a3
{
  self->_inlinePlayerFirstSegmentPlaceholderDuration = a3;
}

- (double)inlinePlayerFrameLatencyApproximation
{
  return self->_inlinePlayerFrameLatencyApproximation;
}

- (void)setInlinePlayerFrameLatencyApproximation:(double)a3
{
  self->_inlinePlayerFrameLatencyApproximation = a3;
}

- (double)inlinePlayerPlaceholderKenBurnsScale
{
  return self->_inlinePlayerPlaceholderKenBurnsScale;
}

- (void)setInlinePlayerPlaceholderKenBurnsScale:(double)a3
{
  self->_inlinePlayerPlaceholderKenBurnsScale = a3;
}

- (double)inlinePlayerDecreasedPlaybackRateFactor
{
  return self->_inlinePlayerDecreasedPlaybackRateFactor;
}

- (void)setInlinePlayerDecreasedPlaybackRateFactor:(double)a3
{
  self->_inlinePlayerDecreasedPlaybackRateFactor = a3;
}

- (double)inlinePlayerPlaceholderKenBurnsExtraDuration
{
  return self->_inlinePlayerPlaceholderKenBurnsExtraDuration;
}

- (void)setInlinePlayerPlaceholderKenBurnsExtraDuration:(double)a3
{
  self->_inlinePlayerPlaceholderKenBurnsExtraDuration = a3;
}

- (BOOL)alwaysFilterPlaceholder
{
  return self->_alwaysFilterPlaceholder;
}

- (void)setAlwaysFilterPlaceholder:(BOOL)a3
{
  self->_alwaysFilterPlaceholder = a3;
}

- (BOOL)shouldUsePhotosIntelligenceSPIForUtilities
{
  return self->_shouldUsePhotosIntelligenceSPIForUtilities;
}

- (void)setShouldUsePhotosIntelligenceSPIForUtilities:(BOOL)a3
{
  self->_shouldUsePhotosIntelligenceSPIForUtilities = a3;
}

- (int64_t)maxNumberOfSharedAlbumActivityItemsToShow
{
  return self->_maxNumberOfSharedAlbumActivityItemsToShow;
}

- (void)setMaxNumberOfSharedAlbumActivityItemsToShow:(int64_t)a3
{
  self->_maxNumberOfSharedAlbumActivityItemsToShow = a3;
}

- (BOOL)enableCollectionsSortButton
{
  return self->_enableCollectionsSortButton;
}

- (void)setEnableCollectionsSortButton:(BOOL)a3
{
  self->_enableCollectionsSortButton = a3;
}

- (BOOL)enableUserSmartAlbums
{
  return self->_enableUserSmartAlbums;
}

- (void)setEnableUserSmartAlbums:(BOOL)a3
{
  self->_enableUserSmartAlbums = a3;
}

- (int64_t)eventsAlgorithm
{
  return self->_eventsAlgorithm;
}

- (void)setEventsAlgorithm:(int64_t)a3
{
  self->_eventsAlgorithm = a3;
}

- (int64_t)eventsDataSource
{
  return self->_eventsDataSource;
}

- (void)setEventsDataSource:(int64_t)a3
{
  self->_eventsDataSource = a3;
}

- (BOOL)enableEventsCellCollageStyle
{
  return self->_enableEventsCellCollageStyle;
}

- (void)setEnableEventsCellCollageStyle:(BOOL)a3
{
  self->_enableEventsCellCollageStyle = a3;
}

- (double)eventsCellItemAspectRatio
{
  return self->_eventsCellItemAspectRatio;
}

- (void)setEventsCellItemAspectRatio:(double)a3
{
  self->_eventsCellItemAspectRatio = a3;
}

- (BOOL)shouldRemoveFilteredEventsFromUI
{
  return self->_shouldRemoveFilteredEventsFromUI;
}

- (void)setShouldRemoveFilteredEventsFromUI:(BOOL)a3
{
  self->_shouldRemoveFilteredEventsFromUI = a3;
}

- (int64_t)eventFilterType
{
  return self->_eventFilterType;
}

- (void)setEventFilterType:(int64_t)a3
{
  self->_eventFilterType = a3;
}

- (double)eventsPromotionScoreThreshold
{
  return self->_eventsPromotionScoreThreshold;
}

- (void)setEventsPromotionScoreThreshold:(double)a3
{
  self->_eventsPromotionScoreThreshold = a3;
}

- (int)eventsExtendedCountThreshold
{
  return self->_eventsExtendedCountThreshold;
}

- (void)setEventsExtendedCountThreshold:(int)a3
{
  self->_eventsExtendedCountThreshold = a3;
}

- (int)eventsSummaryCountThreshold
{
  return self->_eventsSummaryCountThreshold;
}

- (void)setEventsSummaryCountThreshold:(int)a3
{
  self->_eventsSummaryCountThreshold = a3;
}

- (BOOL)enableEventsDebugOverlay
{
  return self->_enableEventsDebugOverlay;
}

- (void)setEnableEventsDebugOverlay:(BOOL)a3
{
  self->_enableEventsDebugOverlay = a3;
}

- (BOOL)enableSavedToday
{
  return self->_enableSavedToday;
}

- (void)setEnableSavedToday:(BOOL)a3
{
  self->_enableSavedToday = a3;
}

- (double)savedTodayToleranceInHours
{
  return self->_savedTodayToleranceInHours;
}

- (void)setSavedTodayToleranceInHours:(double)a3
{
  self->_savedTodayToleranceInHours = a3;
}

- (int64_t)tripsSource
{
  return self->_tripsSource;
}

- (void)setTripsSource:(int64_t)a3
{
  self->_tripsSource = a3;
}

- (BOOL)enableNewDetailsView
{
  return self->_enableNewDetailsView;
}

- (void)setEnableNewDetailsView:(BOOL)a3
{
  self->_enableNewDetailsView = a3;
}

- (BOOL)forceDarkDetailsView
{
  return self->_forceDarkDetailsView;
}

- (void)setForceDarkDetailsView:(BOOL)a3
{
  self->_forceDarkDetailsView = a3;
}

- (BOOL)enablePreviewSharing
{
  return self->_enablePreviewSharing;
}

- (void)setEnablePreviewSharing:(BOOL)a3
{
  self->_enablePreviewSharing = a3;
}

- (BOOL)enablePreviewCaching
{
  return self->_enablePreviewCaching;
}

- (void)setEnablePreviewCaching:(BOOL)a3
{
  self->_enablePreviewCaching = a3;
}

- (BOOL)enablePreviewKeyAsset
{
  return self->_enablePreviewKeyAsset;
}

- (void)setEnablePreviewKeyAsset:(BOOL)a3
{
  self->_enablePreviewKeyAsset = a3;
}

- (BOOL)simulateDetailsViewLeaking
{
  return self->_simulateDetailsViewLeaking;
}

- (void)setSimulateDetailsViewLeaking:(BOOL)a3
{
  self->_simulateDetailsViewLeaking = a3;
}

- (double)simulatedDetailsViewLoadingDelay
{
  return self->_simulatedDetailsViewLoadingDelay;
}

- (void)setSimulatedDetailsViewLoadingDelay:(double)a3
{
  self->_simulatedDetailsViewLoadingDelay = a3;
}

- (double)simulatedPreviewPlayerDelay
{
  return self->_simulatedPreviewPlayerDelay;
}

- (void)setSimulatedPreviewPlayerDelay:(double)a3
{
  self->_simulatedPreviewPlayerDelay = a3;
}

- (int64_t)scrubberKind
{
  return self->_scrubberKind;
}

- (void)setScrubberKind:(int64_t)a3
{
  self->_scrubberKind = a3;
}

- (unint64_t)detailsViewGridContent
{
  return self->_detailsViewGridContent;
}

- (void)setDetailsViewGridContent:(unint64_t)a3
{
  self->_detailsViewGridContent = a3;
}

- (BOOL)enableDetailsViewHorizontalKeyboardScrolling
{
  return self->_enableDetailsViewHorizontalKeyboardScrolling;
}

- (void)setEnableDetailsViewHorizontalKeyboardScrolling:(BOOL)a3
{
  self->_enableDetailsViewHorizontalKeyboardScrolling = a3;
}

- (BOOL)enableDetailsViewHorizontalPaging
{
  return self->_enableDetailsViewHorizontalPaging;
}

- (void)setEnableDetailsViewHorizontalPaging:(BOOL)a3
{
  self->_enableDetailsViewHorizontalPaging = a3;
}

- (int64_t)horizontalPagingTechnique
{
  return self->_horizontalPagingTechnique;
}

- (void)setHorizontalPagingTechnique:(int64_t)a3
{
  self->_horizontalPagingTechnique = a3;
}

- (BOOL)enableHorizontalPagingHint
{
  return self->_enableHorizontalPagingHint;
}

- (void)setEnableHorizontalPagingHint:(BOOL)a3
{
  self->_enableHorizontalPagingHint = a3;
}

- (double)horizontalPagingHintMaximumScale
{
  return self->_horizontalPagingHintMaximumScale;
}

- (void)setHorizontalPagingHintMaximumScale:(double)a3
{
  self->_horizontalPagingHintMaximumScale = a3;
}

- (double)horizontalPagingHintMaximumOvershoot
{
  return self->_horizontalPagingHintMaximumOvershoot;
}

- (void)setHorizontalPagingHintMaximumOvershoot:(double)a3
{
  self->_horizontalPagingHintMaximumOvershoot = a3;
}

- (BOOL)enableAggregatedHighlightGridInEditorial
{
  return self->_enableAggregatedHighlightGridInEditorial;
}

- (void)setEnableAggregatedHighlightGridInEditorial:(BOOL)a3
{
  self->_enableAggregatedHighlightGridInEditorial = a3;
}

- (int64_t)aggregatedHighlightColumns
{
  return self->_aggregatedHighlightColumns;
}

- (void)setAggregatedHighlightColumns:(int64_t)a3
{
  self->_aggregatedHighlightColumns = a3;
}

- (double)lowQualityAggregationPromotionScoreThreshold
{
  return self->_lowQualityAggregationPromotionScoreThreshold;
}

- (void)setLowQualityAggregationPromotionScoreThreshold:(double)a3
{
  self->_lowQualityAggregationPromotionScoreThreshold = a3;
}

- (double)detailsViewHeaderAspectRatio
{
  return self->_detailsViewHeaderAspectRatio;
}

- (void)setDetailsViewHeaderAspectRatio:(double)a3
{
  self->_detailsViewHeaderAspectRatio = a3;
}

- (BOOL)enableFocusMapLensOnAnchors
{
  return self->_enableFocusMapLensOnAnchors;
}

- (void)setEnableFocusMapLensOnAnchors:(BOOL)a3
{
  self->_enableFocusMapLensOnAnchors = a3;
}

- (double)mapLensAnchorFocusKilometerRadius
{
  return self->_mapLensAnchorFocusKilometerRadius;
}

- (void)setMapLensAnchorFocusKilometerRadius:(double)a3
{
  self->_mapLensAnchorFocusKilometerRadius = a3;
}

- (BOOL)enableDetailsSummaryButton
{
  return self->_enableDetailsSummaryButton;
}

- (void)setEnableDetailsSummaryButton:(BOOL)a3
{
  self->_enableDetailsSummaryButton = a3;
}

- (BOOL)enableDetailsViewPrototype
{
  return self->_enableDetailsViewPrototype;
}

- (void)setEnableDetailsViewPrototype:(BOOL)a3
{
  self->_enableDetailsViewPrototype = a3;
}

- (BOOL)enableDynamicHeader
{
  return self->_enableDynamicHeader;
}

- (void)setEnableDynamicHeader:(BOOL)a3
{
  self->_enableDynamicHeader = a3;
}

- (double)dynamicHeaderChromeHidingDelay
{
  return self->_dynamicHeaderChromeHidingDelay;
}

- (void)setDynamicHeaderChromeHidingDelay:(double)a3
{
  self->_dynamicHeaderChromeHidingDelay = a3;
}

- (int64_t)dynamicHeaderDebugOverlay
{
  return self->_dynamicHeaderDebugOverlay;
}

- (void)setDynamicHeaderDebugOverlay:(int64_t)a3
{
  self->_dynamicHeaderDebugOverlay = a3;
}

- (int64_t)dynamicHeaderDebugBehavior
{
  return self->_dynamicHeaderDebugBehavior;
}

- (void)setDynamicHeaderDebugBehavior:(int64_t)a3
{
  self->_dynamicHeaderDebugBehavior = a3;
}

- (double)dynamicHeaderMaximumDelayFromPreview
{
  return self->_dynamicHeaderMaximumDelayFromPreview;
}

- (void)setDynamicHeaderMaximumDelayFromPreview:(double)a3
{
  self->_dynamicHeaderMaximumDelayFromPreview = a3;
}

- (double)dynamicHeaderMaximumDelayFromMovie
{
  return self->_dynamicHeaderMaximumDelayFromMovie;
}

- (void)setDynamicHeaderMaximumDelayFromMovie:(double)a3
{
  self->_dynamicHeaderMaximumDelayFromMovie = a3;
}

- (double)dynamicHeaderDismissAreaBottomInset
{
  return self->_dynamicHeaderDismissAreaBottomInset;
}

- (void)setDynamicHeaderDismissAreaBottomInset:(double)a3
{
  self->_dynamicHeaderDismissAreaBottomInset = a3;
}

- (unint64_t)detailsDismissArea
{
  return self->_detailsDismissArea;
}

- (void)setDetailsDismissArea:(unint64_t)a3
{
  self->_detailsDismissArea = a3;
}

- (BOOL)enableProtoBanner
{
  return self->_enableProtoBanner;
}

- (void)setEnableProtoBanner:(BOOL)a3
{
  self->_enableProtoBanner = a3;
}

- (double)topTitleVerticalSpace
{
  return self->_topTitleVerticalSpace;
}

- (void)setTopTitleVerticalSpace:(double)a3
{
  self->_topTitleVerticalSpace = a3;
}

- (double)titleOverlayScaleAtTop
{
  return self->_titleOverlayScaleAtTop;
}

- (void)setTitleOverlayScaleAtTop:(double)a3
{
  self->_titleOverlayScaleAtTop = a3;
}

- (double)titleOverlayVerticalOffsetAtTop
{
  return self->_titleOverlayVerticalOffsetAtTop;
}

- (void)setTitleOverlayVerticalOffsetAtTop:(double)a3
{
  self->_titleOverlayVerticalOffsetAtTop = a3;
}

- (double)titleOverlayScaleDistance
{
  return self->_titleOverlayScaleDistance;
}

- (void)setTitleOverlayScaleDistance:(double)a3
{
  self->_titleOverlayScaleDistance = a3;
}

- (double)titleOverlayDetachingDistance
{
  return self->_titleOverlayDetachingDistance;
}

- (void)setTitleOverlayDetachingDistance:(double)a3
{
  self->_titleOverlayDetachingDistance = a3;
}

- (double)titleOverlayTopDetentTolerance
{
  return self->_titleOverlayTopDetentTolerance;
}

- (void)setTitleOverlayTopDetentTolerance:(double)a3
{
  self->_titleOverlayTopDetentTolerance = a3;
}

- (double)titleOverlaySingleLineTopDetentTolerance
{
  return self->_titleOverlaySingleLineTopDetentTolerance;
}

- (void)setTitleOverlaySingleLineTopDetentTolerance:(double)a3
{
  self->_titleOverlaySingleLineTopDetentTolerance = a3;
}

- (int64_t)movieCurationAffordance
{
  return self->_movieCurationAffordance;
}

- (void)setMovieCurationAffordance:(int64_t)a3
{
  self->_movieCurationAffordance = a3;
}

- (BOOL)alwaysEnterDetailsViewInFullscreenPlayback
{
  return self->_alwaysEnterDetailsViewInFullscreenPlayback;
}

- (void)setAlwaysEnterDetailsViewInFullscreenPlayback:(BOOL)a3
{
  self->_alwaysEnterDetailsViewInFullscreenPlayback = a3;
}

- (int64_t)playLensCollectionPersistenceConfirmationStyle
{
  return self->_playLensCollectionPersistenceConfirmationStyle;
}

- (void)setPlayLensCollectionPersistenceConfirmationStyle:(int64_t)a3
{
  self->_playLensCollectionPersistenceConfirmationStyle = a3;
}

- (int64_t)minimumNumberOfAssetsForPlaybackAsMemory
{
  return self->_minimumNumberOfAssetsForPlaybackAsMemory;
}

- (void)setMinimumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3
{
  self->_minimumNumberOfAssetsForPlaybackAsMemory = a3;
}

- (int64_t)maximumNumberOfAssetsForPlaybackAsMemory
{
  return self->_maximumNumberOfAssetsForPlaybackAsMemory;
}

- (void)setMaximumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3
{
  self->_maximumNumberOfAssetsForPlaybackAsMemory = a3;
}

- (double)mapTabInitialKilometerRadius
{
  return self->_mapTabInitialKilometerRadius;
}

- (void)setMapTabInitialKilometerRadius:(double)a3
{
  self->_mapTabInitialKilometerRadius = a3;
}

- (double)mapTileInitialKilometerDiameter
{
  return self->_mapTileInitialKilometerDiameter;
}

- (void)setMapTileInitialKilometerDiameter:(double)a3
{
  self->_mapTileInitialKilometerDiameter = a3;
}

- (BOOL)presentZoomableGridFromMapCluster
{
  return self->_presentZoomableGridFromMapCluster;
}

- (void)setPresentZoomableGridFromMapCluster:(BOOL)a3
{
  self->_presentZoomableGridFromMapCluster = a3;
}

- (BOOL)enableLensesInPlacesMapView
{
  return self->_enableLensesInPlacesMapView;
}

- (void)setEnableLensesInPlacesMapView:(BOOL)a3
{
  self->_enableLensesInPlacesMapView = a3;
}

- (BOOL)enableUtilityPrototypeCollections
{
  return self->_enableUtilityPrototypeCollections;
}

- (void)setEnableUtilityPrototypeCollections:(BOOL)a3
{
  self->_enableUtilityPrototypeCollections = a3;
}

- (BOOL)enableRecentlyViewedCollection
{
  return self->_enableRecentlyViewedCollection;
}

- (void)setEnableRecentlyViewedCollection:(BOOL)a3
{
  self->_enableRecentlyViewedCollection = a3;
}

- (BOOL)enableRecentlyEditedCollection
{
  return self->_enableRecentlyEditedCollection;
}

- (void)setEnableRecentlyEditedCollection:(BOOL)a3
{
  self->_enableRecentlyEditedCollection = a3;
}

- (BOOL)enableRecentlySharedCollection
{
  return self->_enableRecentlySharedCollection;
}

- (void)setEnableRecentlySharedCollection:(BOOL)a3
{
  self->_enableRecentlySharedCollection = a3;
}

- (BOOL)enableDocumentsSection
{
  return self->_enableDocumentsSection;
}

- (void)setEnableDocumentsSection:(BOOL)a3
{
  self->_enableDocumentsSection = a3;
}

- (PXLemonadeOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (void)setOneUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpSettings, a3);
}

- (BOOL)enableCubeMode
{
  return self->_enableCubeMode;
}

- (void)setEnableCubeMode:(BOOL)a3
{
  self->_enableCubeMode = a3;
}

- (BOOL)enableRadarButton
{
  return self->_enableRadarButton;
}

- (void)setEnableRadarButton:(BOOL)a3
{
  self->_enableRadarButton = a3;
}

- (BOOL)resetAllPhotosOnDismiss
{
  return self->_resetAllPhotosOnDismiss;
}

- (void)setResetAllPhotosOnDismiss:(BOOL)a3
{
  self->_resetAllPhotosOnDismiss = a3;
}

- (BOOL)enableMonthLocationTitles
{
  return self->_enableMonthLocationTitles;
}

- (void)setEnableMonthLocationTitles:(BOOL)a3
{
  self->_enableMonthLocationTitles = a3;
}

- (BOOL)enableMonthHeroPromotion
{
  return self->_enableMonthHeroPromotion;
}

- (void)setEnableMonthHeroPromotion:(BOOL)a3
{
  self->_enableMonthHeroPromotion = a3;
}

- (BOOL)showSharedLibraryPill
{
  return self->_showSharedLibraryPill;
}

- (void)setShowSharedLibraryPill:(BOOL)a3
{
  self->_showSharedLibraryPill = a3;
}

- (BOOL)sharedWithYouOnlyFilterIncludesUnsaved
{
  return self->_sharedWithYouOnlyFilterIncludesUnsaved;
}

- (void)setSharedWithYouOnlyFilterIncludesUnsaved:(BOOL)a3
{
  self->_sharedWithYouOnlyFilterIncludesUnsaved = a3;
}

- (double)minimumCuratedLibraryVisibleFractionForExpansion
{
  return self->_minimumCuratedLibraryVisibleFractionForExpansion;
}

- (void)setMinimumCuratedLibraryVisibleFractionForExpansion:(double)a3
{
  self->_minimumCuratedLibraryVisibleFractionForExpansion = a3;
}

- (int64_t)yearsAndMonthsMode
{
  return self->_yearsAndMonthsMode;
}

- (void)setYearsAndMonthsMode:(int64_t)a3
{
  self->_yearsAndMonthsMode = a3;
}

- (int64_t)collectionPreviewTransition
{
  return self->_collectionPreviewTransition;
}

- (void)setCollectionPreviewTransition:(int64_t)a3
{
  self->_collectionPreviewTransition = a3;
}

- (BOOL)enableKenBurnsInCollectionPreview
{
  return self->_enableKenBurnsInCollectionPreview;
}

- (void)setEnableKenBurnsInCollectionPreview:(BOOL)a3
{
  self->_enableKenBurnsInCollectionPreview = a3;
}

- (char)collectionPreviewKenBurnsScaleDirection
{
  return self->_collectionPreviewKenBurnsScaleDirection;
}

- (void)setCollectionPreviewKenBurnsScaleDirection:(char)a3
{
  self->_collectionPreviewKenBurnsScaleDirection = a3;
}

- (BOOL)enableCuratedLibrary
{
  return self->_enableCuratedLibrary;
}

- (void)setEnableCuratedLibrary:(BOOL)a3
{
  self->_enableCuratedLibrary = a3;
}

- (double)curatedLibraryExpansionSpringStiffness
{
  return self->_curatedLibraryExpansionSpringStiffness;
}

- (void)setCuratedLibraryExpansionSpringStiffness:(double)a3
{
  self->_curatedLibraryExpansionSpringStiffness = a3;
}

- (double)curatedLibraryToggleExpansionAnimationDuration
{
  return self->_curatedLibraryToggleExpansionAnimationDuration;
}

- (void)setCuratedLibraryToggleExpansionAnimationDuration:(double)a3
{
  self->_curatedLibraryToggleExpansionAnimationDuration = a3;
}

- (double)curatedLibraryBottomPadding
{
  return self->_curatedLibraryBottomPadding;
}

- (void)setCuratedLibraryBottomPadding:(double)a3
{
  self->_curatedLibraryBottomPadding = a3;
}

- (BOOL)enableSearchResultDiffAnimation
{
  return self->_enableSearchResultDiffAnimation;
}

- (void)setEnableSearchResultDiffAnimation:(BOOL)a3
{
  self->_enableSearchResultDiffAnimation = a3;
}

- (BOOL)enableMetadataSearch
{
  return self->_enableMetadataSearch;
}

- (void)setEnableMetadataSearch:(BOOL)a3
{
  self->_enableMetadataSearch = a3;
}

- (BOOL)enableEmbeddingSearch
{
  return self->_enableEmbeddingSearch;
}

- (void)setEnableEmbeddingSearch:(BOOL)a3
{
  self->_enableEmbeddingSearch = a3;
}

- (BOOL)enableQueryUnderstanding
{
  return self->_enableQueryUnderstanding;
}

- (void)setEnableQueryUnderstanding:(BOOL)a3
{
  self->_enableQueryUnderstanding = a3;
}

- (int64_t)maxSearchResults
{
  return self->_maxSearchResults;
}

- (void)setMaxSearchResults:(int64_t)a3
{
  self->_maxSearchResults = a3;
}

- (int64_t)maxRankedAssetSearchResults
{
  return self->_maxRankedAssetSearchResults;
}

- (void)setMaxRankedAssetSearchResults:(int64_t)a3
{
  self->_maxRankedAssetSearchResults = a3;
}

- (int64_t)maxSearchSuggestions
{
  return self->_maxSearchSuggestions;
}

- (void)setMaxSearchSuggestions:(int64_t)a3
{
  self->_maxSearchSuggestions = a3;
}

- (int64_t)minQueryLengthForFullRanking
{
  return self->_minQueryLengthForFullRanking;
}

- (void)setMinQueryLengthForFullRanking:(int64_t)a3
{
  self->_minQueryLengthForFullRanking = a3;
}

- (int64_t)maxCuratedCollectionsPerType
{
  return self->_maxCuratedCollectionsPerType;
}

- (void)setMaxCuratedCollectionsPerType:(int64_t)a3
{
  self->_maxCuratedCollectionsPerType = a3;
}

- (double)searchMediaAnalysisUIThreshold
{
  return self->_searchMediaAnalysisUIThreshold;
}

- (void)setSearchMediaAnalysisUIThreshold:(double)a3
{
  self->_searchMediaAnalysisUIThreshold = a3;
}

- (BOOL)enableZKWForPad
{
  return self->_enableZKWForPad;
}

- (void)setEnableZKWForPad:(BOOL)a3
{
  self->_enableZKWForPad = a3;
}

- (BOOL)enableExactMatchResults
{
  return self->_enableExactMatchResults;
}

- (void)setEnableExactMatchResults:(BOOL)a3
{
  self->_enableExactMatchResults = a3;
}

- (BOOL)enableHybridMatchResults
{
  return self->_enableHybridMatchResults;
}

- (void)setEnableHybridMatchResults:(BOOL)a3
{
  self->_enableHybridMatchResults = a3;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (BOOL)enableEmbeddingOnlyResultsInExactMatches
{
  return self->_enableEmbeddingOnlyResultsInExactMatches;
}

- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3
{
  self->_enableEmbeddingOnlyResultsInExactMatches = a3;
}

- (double)searchQueryTimeout
{
  return self->_searchQueryTimeout;
}

- (void)setSearchQueryTimeout:(double)a3
{
  self->_searchQueryTimeout = a3;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (BOOL)overrideSuggestionPills
{
  return self->_overrideSuggestionPills;
}

- (void)setOverrideSuggestionPills:(BOOL)a3
{
  self->_overrideSuggestionPills = a3;
}

- (BOOL)showSearchDebugBadges
{
  return self->_showSearchDebugBadges;
}

- (void)setShowSearchDebugBadges:(BOOL)a3
{
  self->_showSearchDebugBadges = a3;
}

- (BOOL)implicitSearchScopeForPickerSuggestionScopeSearch
{
  return self->_implicitSearchScopeForPickerSuggestionScopeSearch;
}

- (void)setImplicitSearchScopeForPickerSuggestionScopeSearch:(BOOL)a3
{
  self->_implicitSearchScopeForPickerSuggestionScopeSearch = a3;
}

- (BOOL)enableFullPageScreenshots
{
  return self->_enableFullPageScreenshots;
}

- (void)setEnableFullPageScreenshots:(BOOL)a3
{
  self->_enableFullPageScreenshots = a3;
}

- (BOOL)enableFullPageScreenshotDebuggingOverlays
{
  return self->_enableFullPageScreenshotDebuggingOverlays;
}

- (void)setEnableFullPageScreenshotDebuggingOverlays:(BOOL)a3
{
  self->_enableFullPageScreenshotDebuggingOverlays = a3;
}

- (BOOL)limitFullPageScreenshotScale
{
  return self->_limitFullPageScreenshotScale;
}

- (void)setLimitFullPageScreenshotScale:(BOOL)a3
{
  self->_limitFullPageScreenshotScale = a3;
}

- (BOOL)limitFullPageScreenshotSize
{
  return self->_limitFullPageScreenshotSize;
}

- (void)setLimitFullPageScreenshotSize:(BOOL)a3
{
  self->_limitFullPageScreenshotSize = a3;
}

- (double)maximumFullPageScreenshotDimension
{
  return self->_maximumFullPageScreenshotDimension;
}

- (void)setMaximumFullPageScreenshotDimension:(double)a3
{
  self->_maximumFullPageScreenshotDimension = a3;
}

- (BOOL)enableStackCounting
{
  return self->_enableStackCounting;
}

- (void)setEnableStackCounting:(BOOL)a3
{
  self->_enableStackCounting = a3;
}

- (BOOL)enablePhotosChallenge
{
  return self->_enablePhotosChallenge;
}

- (void)setEnablePhotosChallenge:(BOOL)a3
{
  self->_enablePhotosChallenge = a3;
}

- (BOOL)enableShelfIPadLayout
{
  return self->_enableShelfIPadLayout;
}

- (void)setEnableShelfIPadLayout:(BOOL)a3
{
  self->_enableShelfIPadLayout = a3;
}

- (BOOL)enableShelfDrawBorders
{
  return self->_enableShelfDrawBorders;
}

- (void)setEnableShelfDrawBorders:(BOOL)a3
{
  self->_enableShelfDrawBorders = a3;
}

- (double)shelfSpacing
{
  return self->_shelfSpacing;
}

- (void)setShelfSpacing:(double)a3
{
  self->_shelfSpacing = a3;
}

- (BOOL)enableSidebarHeaderSelection
{
  return self->_enableSidebarHeaderSelection;
}

- (void)setEnableSidebarHeaderSelection:(BOOL)a3
{
  self->_enableSidebarHeaderSelection = a3;
}

- (BOOL)enableDismissPersistence
{
  return self->_enableDismissPersistence;
}

- (void)setEnableDismissPersistence:(BOOL)a3
{
  self->_enableDismissPersistence = a3;
}

- (BOOL)onlyDismissedInProfile
{
  return self->_onlyDismissedInProfile;
}

- (void)setOnlyDismissedInProfile:(BOOL)a3
{
  self->_onlyDismissedInProfile = a3;
}

- (BOOL)includeSharedAlbumsActivityInProfileNotifications
{
  return self->_includeSharedAlbumsActivityInProfileNotifications;
}

- (void)setIncludeSharedAlbumsActivityInProfileNotifications:(BOOL)a3
{
  self->_includeSharedAlbumsActivityInProfileNotifications = a3;
}

- (BOOL)hideNotifications
{
  return self->_hideNotifications;
}

- (void)setHideNotifications:(BOOL)a3
{
  self->_hideNotifications = a3;
}

- (unint64_t)maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications
{
  return self->_maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications;
}

- (void)setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3
{
  self->_maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications = a3;
}

- (unint64_t)maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications
{
  return self->_maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications;
}

- (void)setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3
{
  self->_maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications = a3;
}

- (double)wallpaperLoadingTimeout
{
  return self->_wallpaperLoadingTimeout;
}

- (void)setWallpaperLoadingTimeout:(double)a3
{
  self->_wallpaperLoadingTimeout = a3;
}

- (double)wallpaperLoadingArtificialDelay
{
  return self->_wallpaperLoadingArtificialDelay;
}

- (void)setWallpaperLoadingArtificialDelay:(double)a3
{
  self->_wallpaperLoadingArtificialDelay = a3;
}

- (BOOL)forceHideProcessingUI
{
  return self->_forceHideProcessingUI;
}

- (void)setForceHideProcessingUI:(BOOL)a3
{
  self->_forceHideProcessingUI = a3;
}

- (BOOL)forceShowProcessingUI
{
  return self->_forceShowProcessingUI;
}

- (void)setForceShowProcessingUI:(BOOL)a3
{
  self->_forceShowProcessingUI = a3;
}

- (BOOL)useFeatureAvailabilityReporter
{
  return self->_useFeatureAvailabilityReporter;
}

- (void)setUseFeatureAvailabilityReporter:(BOOL)a3
{
  self->_useFeatureAvailabilityReporter = a3;
}

- (double)sectionedFeedTabBarItemSpacing
{
  return self->_sectionedFeedTabBarItemSpacing;
}

- (void)setSectionedFeedTabBarItemSpacing:(double)a3
{
  self->_sectionedFeedTabBarItemSpacing = a3;
}

- (double)defaultFloatingToolbarBottomInset
{
  return self->_defaultFloatingToolbarBottomInset;
}

- (void)setDefaultFloatingToolbarBottomInset:(double)a3
{
  self->_defaultFloatingToolbarBottomInset = a3;
}

- (BOOL)enableShelves
{
  return self->_enableShelves;
}

- (void)setEnableShelves:(BOOL)a3
{
  self->_enableShelves = a3;
}

- (BOOL)enableShelvesLoader
{
  return self->_enableShelvesLoader;
}

- (void)setEnableShelvesLoader:(BOOL)a3
{
  self->_enableShelvesLoader = a3;
}

- (BOOL)enableShelvesLoaderGradualDelivery
{
  return self->_enableShelvesLoaderGradualDelivery;
}

- (void)setEnableShelvesLoaderGradualDelivery:(BOOL)a3
{
  self->_enableShelvesLoaderGradualDelivery = a3;
}

- (BOOL)enabledShelvesLazyVStack
{
  return self->_enabledShelvesLazyVStack;
}

- (void)setEnabledShelvesLazyVStack:(BOOL)a3
{
  self->_enabledShelvesLazyVStack = a3;
}

- (BOOL)simulateEmptyShelves
{
  return self->_simulateEmptyShelves;
}

- (void)setSimulateEmptyShelves:(BOOL)a3
{
  self->_simulateEmptyShelves = a3;
}

- (BOOL)shouldWorkAround126757137
{
  return self->_shouldWorkAround126757137;
}

- (void)setShouldWorkAround126757137:(BOOL)a3
{
  self->_shouldWorkAround126757137 = a3;
}

- (BOOL)enableLoadingStatusHUD
{
  return self->_enableLoadingStatusHUD;
}

- (void)setEnableLoadingStatusHUD:(BOOL)a3
{
  self->_enableLoadingStatusHUD = a3;
}

- (BOOL)enableResponsiveScrolling
{
  return self->_enableResponsiveScrolling;
}

- (void)setEnableResponsiveScrolling:(BOOL)a3
{
  self->_enableResponsiveScrolling = a3;
}

- (BOOL)internal_oneUpRefreshEnabled
{
  return self->_internal_oneUpRefreshEnabled;
}

- (void)setInternal_oneUpRefreshEnabled:(BOOL)a3
{
  self->_internal_oneUpRefreshEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
}

+ (BOOL)isLemonadeUIEnabled
{
  return _os_feature_enabled_impl();
}

+ (PXLemonadeSettings)sharedInstance
{
  if (sharedInstance_onceToken_140204 != -1)
    dispatch_once(&sharedInstance_onceToken_140204, &__block_literal_global_140205);
  return (PXLemonadeSettings *)(id)sharedInstance_sharedInstance_140206;
}

void __36__PXLemonadeSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lemonadeSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_140206;
  sharedInstance_sharedInstance_140206 = v0;

}

@end
