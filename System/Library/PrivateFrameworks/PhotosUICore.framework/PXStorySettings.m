@implementation PXStorySettings

- (void)createChildren
{
  PXStoryConcreteTimelineSettings *v3;
  PXStoryConcreteTimelineSettings *concreteTimelineSettings;
  PXStoryScrubberLayoutSettings *v5;
  PXStoryScrubberLayoutSettings *scrubberLayoutSettings;
  PXStoryTransitionsSettings *v7;
  PXStoryTransitionsSettings *transitionsSettings;
  PXStoryMultipartPanoramaSettings *v9;
  PXStoryMultipartPanoramaSettings *multipartPanoramaSettings;
  PXStoryChapterSettings *v11;
  PXStoryChapterSettings *chapterSettings;

  v3 = -[PTSettings initWithDefaultValues]([PXStoryConcreteTimelineSettings alloc], "initWithDefaultValues");
  concreteTimelineSettings = self->_concreteTimelineSettings;
  self->_concreteTimelineSettings = v3;

  v5 = -[PTSettings initWithDefaultValues]([PXStoryScrubberLayoutSettings alloc], "initWithDefaultValues");
  scrubberLayoutSettings = self->_scrubberLayoutSettings;
  self->_scrubberLayoutSettings = v5;

  v7 = -[PTSettings initWithDefaultValues]([PXStoryTransitionsSettings alloc], "initWithDefaultValues");
  transitionsSettings = self->_transitionsSettings;
  self->_transitionsSettings = v7;

  v9 = -[PTSettings initWithDefaultValues]([PXStoryMultipartPanoramaSettings alloc], "initWithDefaultValues");
  multipartPanoramaSettings = self->_multipartPanoramaSettings;
  self->_multipartPanoramaSettings = v9;

  v11 = -[PTSettings initWithDefaultValues]([PXStoryChapterSettings alloc], "initWithDefaultValues");
  chapterSettings = self->_chapterSettings;
  self->_chapterSettings = v11;

}

- (void)setDefaultValues
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStorySettings;
  -[PTSettings setDefaultValues](&v13, sel_setDefaultValues);
  if (PXStoryIsSlowDevice_onceToken != -1)
    dispatch_once(&PXStoryIsSlowDevice_onceToken, &__block_literal_global_1592);
  -[PXStorySettings setAllowsShowcase:](self, "setAllowsShowcase:", 0);
  -[PXStorySettings setClipCompositionShowcaseMode:](self, "setClipCompositionShowcaseMode:", 1);
  -[PXStorySettings setClipCompositionFallback:](self, "setClipCompositionFallback:", CFSTR("All"));
  -[PXStorySettings setTransitionShowcaseMode:](self, "setTransitionShowcaseMode:", 1);
  -[PXStorySettings setTransitionFallback:](self, "setTransitionFallback:", -1);
  -[PXStorySettings setSeparatorEffectsShowcaseMode:](self, "setSeparatorEffectsShowcaseMode:", 1);
  -[PXStorySettings setKenBurnsShowcaseMode:](self, "setKenBurnsShowcaseMode:", 1);
  -[PXStorySettings setOverrideDurations:](self, "setOverrideDurations:", 0);
  -[PXStorySettings setShowcaseSegmentDuration:](self, "setShowcaseSegmentDuration:", 5.0);
  v3 = 1.0;
  -[PXStorySettings setShowcaseTransitionDuration:](self, "setShowcaseTransitionDuration:", 1.0);
  -[PXStorySettings setDisableShowcaseBadge:](self, "setDisableShowcaseBadge:", 0);
  -[PXStorySettings setIncludeImagesInVisualDiagnosticsForTTR:](self, "setIncludeImagesInVisualDiagnosticsForTTR:", 0);
  -[PXStorySettings setIncludeDeviceDiagnosticsForTTR:](self, "setIncludeDeviceDiagnosticsForTTR:", 1);
  -[PXStorySettings setSimulatedError:](self, "setSimulatedError:", 0);
  -[PXStorySettings setAllowLimitingImagesTo3MP:](self, "setAllowLimitingImagesTo3MP:", 1);
  -[PXStorySettings setAllowAspectModeToggle:](self, "setAllowAspectModeToggle:", 0);
  -[PXStorySettings setIsHUDEnabled:](self, "setIsHUDEnabled:", 0);
  -[PXStorySettings setIsHUDVisible:](self, "setIsHUDVisible:", 0);
  -[PXStorySettings setAreRelatedHUDsVisible:](self, "setAreRelatedHUDsVisible:", 0);
  -[PXStorySettings setDefaultHUDType:](self, "setDefaultHUDType:", 1);
  -[PXStorySettings setIsExportHUDEnabled:](self, "setIsExportHUDEnabled:", 0);
  -[PXStorySettings setExportHUDType:](self, "setExportHUDType:", 0);
  -[PXStorySettings setFeedHUDType:](self, "setFeedHUDType:", 19);
  -[PXStorySettings setEnableDemoAction:](self, "setEnableDemoAction:", 0);
  -[PXStorySettings setEnableProtoPlayground:](self, "setEnableProtoPlayground:", 0);
  -[PXStorySettings setWantsTitles:](self, "setWantsTitles:", 1);
  -[PXStorySettings setWantsRelated:](self, "setWantsRelated:", 1);
  -[PXStorySettings setWantsResourcesPreloading:](self, "setWantsResourcesPreloading:", 1);
  -[PXStorySettings setWantsScrubber:](self, "setWantsScrubber:", 1);
  -[PXStorySettings setWantsGridLayout:](self, "setWantsGridLayout:", 1);
  -[PXStorySettings setWantsPersistence:](self, "setWantsPersistence:", 1);
  -[PXStorySettings setPersistenceConfirmationDuration:](self, "setPersistenceConfirmationDuration:", 2.0);
  -[PXStorySettings setWantsAnimations:](self, "setWantsAnimations:", 1);
  -[PXStorySettings setWantsTransitions:](self, "setWantsTransitions:", 1);
  -[PXStorySettings setWantsHighContrastColors:](self, "setWantsHighContrastColors:", 0);
  -[PXStorySettings setWantsValidation:](self, "setWantsValidation:", PFOSVariantHasInternalDiagnostics());
  -[PXStorySettings setTwoFingerTapAction:](self, "setTwoFingerTapAction:", 0);
  -[PXStorySettings setPreferredFullsizePaperTrailOptions:](self, "setPreferredFullsizePaperTrailOptions:", 1);
  -[PXStorySettings setSwipeDownAction:](self, "setSwipeDownAction:", 1);
  -[PXStorySettings setRenderTitlesForRelated:](self, "setRenderTitlesForRelated:", 1);
  -[PXStorySettings setMaximumAppBackgroundDurationBeforeAutoPause:](self, "setMaximumAppBackgroundDurationBeforeAutoPause:", 30.0);
  -[PXStorySettings setFeedPresentationType:](self, "setFeedPresentationType:", 0);
  -[PXStorySettings setPlayerPresentationType:](self, "setPlayerPresentationType:", 0);
  -[PXStorySettings setAllowCustomUserAssets:](self, "setAllowCustomUserAssets:", _os_feature_enabled_impl());
  -[PXStorySettings setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:](self, "setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:", 0);
  -[PXStorySettings setShouldHideSidebarWhenDisplayed:](self, "setShouldHideSidebarWhenDisplayed:", 0);
  -[PXStorySettings setTimelineProducerKind:](self, "setTimelineProducerKind:", 0);
  -[PXStorySettings setAllowsTimelineRecombination:](self, "setAllowsTimelineRecombination:", 1);
  -[PXStorySettings setShouldRecombineTimelineWithSameVisibleSegments:](self, "setShouldRecombineTimelineWithSameVisibleSegments:", 0);
  -[PXStorySettings setValidationShouldWaitForTimelineToBeReadyToPlay:](self, "setValidationShouldWaitForTimelineToBeReadyToPlay:", 1);
  -[PXStorySettings setAllowNonFillingCompositionsForKeyAsset:](self, "setAllowNonFillingCompositionsForKeyAsset:", 1);
  -[PXStorySettings setLimitKeyAssetAspectRatioToFeedCard:](self, "setLimitKeyAssetAspectRatioToFeedCard:", 1);
  -[PXStorySettings setKeyAssetAspectRatioOverride:](self, "setKeyAssetAspectRatioOverride:", 0);
  -[PXStorySettings setOtherAssetsAspectRatioOverride:](self, "setOtherAssetsAspectRatioOverride:", 0);
  -[PXStorySettings setAspectFillOneUpCropTolerance:](self, "setAspectFillOneUpCropTolerance:", 0.9);
  -[PXStorySettings setLivePhotoSameOrientationCompactMaximumScale:](self, "setLivePhotoSameOrientationCompactMaximumScale:", 1.7);
  -[PXStorySettings setLivePhotoSameOrientationRegularMaximumScale:](self, "setLivePhotoSameOrientationRegularMaximumScale:", 1.3);
  -[PXStorySettings setLivePhotoOppositeOrientationCompactMaximumScale:](self, "setLivePhotoOppositeOrientationCompactMaximumScale:", 1.45);
  -[PXStorySettings setLivePhotoOppositeOrientationRegularMaximumScale:](self, "setLivePhotoOppositeOrientationRegularMaximumScale:", 1.1);
  -[PXStorySettings setViewModeTransitionSpringStiffness:](self, "setViewModeTransitionSpringStiffness:", 150.0);
  -[PXStorySettings setViewModeTransitionAccessoryFadepoint:](self, "setViewModeTransitionAccessoryFadepoint:", 0.5);
  -[PXStorySettings setTimelineManagerPaperTrailLength:](self, "setTimelineManagerPaperTrailLength:", 20);
  -[PXStorySettings setEstimatedMinimumDurationPerCuratedAsset:](self, "setEstimatedMinimumDurationPerCuratedAsset:", 1.0);
  -[PXStorySettings setCuratedAssetsLimit:](self, "setCuratedAssetsLimit:", 2000);
  -[PXStorySettings setShowStyleSwitcher:](self, "setShowStyleSwitcher:", 1);
  -[PXStorySettings setShowMusicAndColorGradeEditor:](self, "setShowMusicAndColorGradeEditor:", 1);
  -[PXStorySettings setShouldStylesAlwaysIncludePersistedSong:](self, "setShouldStylesAlwaysIncludePersistedSong:", 1);
  LODWORD(v4) = 1060453346;
  -[PXStorySettings setMusicDuckedVolume:](self, "setMusicDuckedVolume:", v4);
  LODWORD(v5) = 1048615863;
  -[PXStorySettings setMusicBackgroundVolume:](self, "setMusicBackgroundVolume:", v5);
  LODWORD(v6) = 1048615863;
  -[PXStorySettings setMusicFadeOutVolume:](self, "setMusicFadeOutVolume:", v6);
  -[PXStorySettings setDuckingFadeDuration:](self, "setDuckingFadeDuration:", 1.0);
  -[PXStorySettings setFocusChangeFadeDuration:](self, "setFocusChangeFadeDuration:", 0.5);
  -[PXStorySettings setMusicSimulatedFailureMode:](self, "setMusicSimulatedFailureMode:", 0);
  LODWORD(v7) = -24.0;
  -[PXStorySettings setMusicTargetLoudnessLKFS:](self, "setMusicTargetLoudnessLKFS:", v7);
  -[PXStorySettings setMusicTouchDuckingDelay:](self, "setMusicTouchDuckingDelay:", 0.3);
  -[PXStorySettings setSimulateNoAppleMusicSubscription:](self, "setSimulateNoAppleMusicSubscription:", 0);
  -[PXStorySettings setSongsProducerKind:](self, "setSongsProducerKind:", 0);
  -[PXStorySettings setUseMusicCuesForPacing:](self, "setUseMusicCuesForPacing:", 1);
  -[PXStorySettings setUseMusicCuesForTimeline:](self, "setUseMusicCuesForTimeline:", 1);
  -[PXStorySettings setForcePacingToSegmentMaxDuration:](self, "setForcePacingToSegmentMaxDuration:", 0);
  -[PXStorySettings setAdjustToWallClockTime:](self, "setAdjustToWallClockTime:", 1);
  -[PXStorySettings setMusicDemoVolumeAdjustment:](self, "setMusicDemoVolumeAdjustment:", 1);
  -[PXStorySettings setAppleMusicPromptTrigger:](self, "setAppleMusicPromptTrigger:", 1);
  -[PXStorySettings setUseFakeAppleMusicAndPrivacyPrompt:](self, "setUseFakeAppleMusicAndPrivacyPrompt:", 0);
  -[PXStorySettings setForceFlexForNonPHMemory:](self, "setForceFlexForNonPHMemory:", 0);
  -[PXStorySettings setForceFlexForPHMemory:](self, "setForceFlexForPHMemory:", 0);
  -[PXStorySettings setForceFlexIncludesAppleMusic:](self, "setForceFlexIncludesAppleMusic:", 1);
  -[PXStorySettings setAllowsContinuousKenBurnsAnimations:](self, "setAllowsContinuousKenBurnsAnimations:", 1);
  -[PXStorySettings setContinuousKenBurnsAnimationsTolerance:](self, "setContinuousKenBurnsAnimationsTolerance:", 0.1);
  -[PXStorySettings setForceMinDurationKenBurnsAnimations:](self, "setForceMinDurationKenBurnsAnimations:", 0);
  -[PXStorySettings setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:](self, "setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:", 0);
  -[PXStorySettings setDisableVideoPlayback:](self, "setDisableVideoPlayback:", 0);
  -[PXStorySettings setForceLivePhotoVideo:](self, "setForceLivePhotoVideo:", 0);
  -[PXStorySettings setWantsMovieHighlights:](self, "setWantsMovieHighlights:", 1);
  -[PXStorySettings setUseBestHighlightTrim:](self, "setUseBestHighlightTrim:", 1);
  -[PXStorySettings setAllowOnDemandVideoAnalysis:](self, "setAllowOnDemandVideoAnalysis:", 0);
  -[PXStorySettings setVideoInlineStabilization:](self, "setVideoInlineStabilization:", 1);
  -[PXStorySettings setDebugShowVideoPlaybackDetails:](self, "setDebugShowVideoPlaybackDetails:", 0);
  -[PXStorySettings setVideoMaximumAspectFillScale:](self, "setVideoMaximumAspectFillScale:", 1.4);
  -[PXStorySettings setLivePhotoLocalVideoQuality:](self, "setLivePhotoLocalVideoQuality:", 1);
  -[PXStorySettings setExportVideoQuality:](self, "setExportVideoQuality:", 1);
  -[PXStorySettings setVideoQuality:](self, "setVideoQuality:", 1);
  -[PXStorySettings setDetectVideoLags:](self, "setDetectVideoLags:", 0);
  -[PXStorySettings setSignificantPlayedDuration:](self, "setSignificantPlayedDuration:", 1.0);
  -[PXStorySettings setMuteToggleButtonAutoHideDelay:](self, "setMuteToggleButtonAutoHideDelay:", 4.0);
  -[PXStorySettings setIsAppleMusicAllowed:](self, "setIsAppleMusicAllowed:", 1);
  -[PXStorySettings setWantsAudioFromVideo:](self, "setWantsAudioFromVideo:", 1);
  -[PXStorySettings setMuteBackgroundMusic:](self, "setMuteBackgroundMusic:", 1);
  -[PXStorySettings setForegroundAudioLoudnessTarget:](self, "setForegroundAudioLoudnessTarget:", -15.0);
  -[PXStorySettings setBackgroundAudioLoudnessTarget:](self, "setBackgroundAudioLoudnessTarget:", -35.0);
  -[PXStorySettings setVideoAudioStrategy:](self, "setVideoAudioStrategy:", 5);
  -[PXStorySettings setSlomoVideoAudioStrategy:](self, "setSlomoVideoAudioStrategy:", 0);
  -[PXStorySettings setLivePhotoAudioStrategy:](self, "setLivePhotoAudioStrategy:", 5);
  -[PXStorySettings setLoopingVideoAudioStrategy:](self, "setLoopingVideoAudioStrategy:", 1);
  -[PXStorySettings setWantsAudioFade:](self, "setWantsAudioFade:", 1);
  -[PXStorySettings setAudioFadeMinDuration:](self, "setAudioFadeMinDuration:", 0.167);
  -[PXStorySettings setAudioFadeMaxDuration:](self, "setAudioFadeMaxDuration:", 0.667);
  -[PXStorySettings setAudioFadeCurve:](self, "setAudioFadeCurve:", 2);
  -[PXStorySettings setWantsAudioJLCuts:](self, "setWantsAudioJLCuts:", 1);
  -[PXStorySettings setAudioJCutStrategy:](self, "setAudioJCutStrategy:", 3);
  -[PXStorySettings setAudioLCutStrategy:](self, "setAudioLCutStrategy:", 3);
  -[PXStorySettings setAudioJCutDuration:](self, "setAudioJCutDuration:", 0.5);
  -[PXStorySettings setAudioLCutDuration:](self, "setAudioLCutDuration:", 0.25);
  -[PXStorySettings setDebugShowAudioPlaybackDetails:](self, "setDebugShowAudioPlaybackDetails:", 0);
  -[PXStorySettings setSimulatedAudioCuesLoadingDelay:](self, "setSimulatedAudioCuesLoadingDelay:", 0.0);
  LODWORD(v8) = 0.5;
  -[PXStorySettings setAudioQualityMin:](self, "setAudioQualityMin:", v8);
  -[PXStorySettings setWantsBufferingIndicatorOverScrubber:](self, "setWantsBufferingIndicatorOverScrubber:", 1);
  -[PXStorySettings setNoncriticalBufferingTimeout:](self, "setNoncriticalBufferingTimeout:", 3.0);
  -[PXStorySettings setBufferingHUDAutoPresentationTimeout:](self, "setBufferingHUDAutoPresentationTimeout:", 10.0);
  -[PXStorySettings setPlayerShowsBufferingStatus:](self, "setPlayerShowsBufferingStatus:", 1);
  -[PXStorySettings setSimulateResourcesBufferingError:](self, "setSimulateResourcesBufferingError:", 0);
  -[PXStorySettings setSimulateSlowResourcesBuffering:](self, "setSimulateSlowResourcesBuffering:", 0);
  -[PXStorySettings setSimulatedSlowResourcesBufferingDelay:](self, "setSimulatedSlowResourcesBufferingDelay:", 2.5);
  -[PXStorySettings setExaggerateResourceDownloadTimes:](self, "setExaggerateResourceDownloadTimes:", 0);
  -[PXStorySettings setPlaybackShouldWaitForBufferingToBeReady:](self, "setPlaybackShouldWaitForBufferingToBeReady:", 1);
  -[PXStorySettings setSimultaneousPreloadingOperationsCount:](self, "setSimultaneousPreloadingOperationsCount:", 4);
  -[PXStorySettings setPreloadingSegmentsBatchSize:](self, "setPreloadingSegmentsBatchSize:", 2);
  -[PXStorySettings setPreloadingEstimationStrategy:](self, "setPreloadingEstimationStrategy:", 0);
  -[PXStorySettings setMinPreloadedeSegments:](self, "setMinPreloadedeSegments:", 4);
  -[PXStorySettings setPreloadNonKeyRelated:](self, "setPreloadNonKeyRelated:", 0);
  -[PXStorySettings setEstimateTimeLeftPerPlaybackStyle:](self, "setEstimateTimeLeftPerPlaybackStyle:", 0);
  -[PXStorySettings setScrubberDisplayMode:](self, "setScrubberDisplayMode:", 0);
  -[PXStorySettings setScrubberDimsMainContent:](self, "setScrubberDimsMainContent:", 0);
  -[PXStorySettings setScrubberEdgeFadeMode:](self, "setScrubberEdgeFadeMode:", 0);
  -[PXStorySettings setScrubberEdgeFadeDistance:](self, "setScrubberEdgeFadeDistance:", 50.0);
  -[PXStorySettings setScrubberEdgeFadeOffset:](self, "setScrubberEdgeFadeOffset:", 15.0);
  -[PXStorySettings setScrubberAutoHideDelay:](self, "setScrubberAutoHideDelay:", 1.5);
  -[PXStorySettings setScrubberLayoutStretchesSmallNumberOfAssets:](self, "setScrubberLayoutStretchesSmallNumberOfAssets:", 0);
  -[PXStorySettings setScrubberSelectionStartsPlayback:](self, "setScrubberSelectionStartsPlayback:", 0);
  -[PXStorySettings setChromeAllowAutoHide:](self, "setChromeAllowAutoHide:", 1);
  -[PXStorySettings setChromeAutoHideDelay:](self, "setChromeAutoHideDelay:", 4.0);
  -[PXStorySettings setLegibilityGradientOpacity:](self, "setLegibilityGradientOpacity:", 0.2);
  -[PXStorySettings setOverrideLegibilityGradientHeights:](self, "setOverrideLegibilityGradientHeights:", 0);
  -[PXStorySettings setTopLegibilityGradientHeight:](self, "setTopLegibilityGradientHeight:", 200.0);
  -[PXStorySettings setBottomLegibilityGradientHeight:](self, "setBottomLegibilityGradientHeight:", 260.0);
  -[PXStorySettings setUseBottomLegibilityGradientForBufferingIndicator:](self, "setUseBottomLegibilityGradientForBufferingIndicator:", 0);
  -[PXStorySettings setLegibilityRelatedDimming:](self, "setLegibilityRelatedDimming:", 0.7);
  -[PXStorySettings setLegibilityPlaybackEndDimming:](self, "setLegibilityPlaybackEndDimming:", 0.7);
  -[PXStorySettings setLegibilityPlaybackEndDimmingDuration:](self, "setLegibilityPlaybackEndDimmingDuration:", 0.5);
  -[PXStorySettings setLegibilityPlaybackEndDimmingDurationAutoReplay:](self, "setLegibilityPlaybackEndDimmingDurationAutoReplay:", 1.0);
  -[PXStorySettings setLegibilityPlaybackEndUndimmingDuration:](self, "setLegibilityPlaybackEndUndimmingDuration:", 0.3);
  -[PXStorySettings setLegibilityPlaybackEndUndimmingDurationAutoReplay:](self, "setLegibilityPlaybackEndUndimmingDurationAutoReplay:", 0.6);
  -[PXStorySettings setPlayButtonRewindSymbolName:](self, "setPlayButtonRewindSymbolName:", CFSTR("play.fill"));
  -[PXStorySettings setSimulateLongChromeStrings:](self, "setSimulateLongChromeStrings:", 0);
  -[PXStorySettings setPreferTopChromeItemsInAppNavigationBar:](self, "setPreferTopChromeItemsInAppNavigationBar:", 0);
  -[PXStorySettings setTapNavigationAreaFraction:](self, "setTapNavigationAreaFraction:", 0.1);
  -[PXStorySettings setRelatedProducerKind:](self, "setRelatedProducerKind:", 0);
  -[PXStorySettings setRelatedProductionPlaybackFractionCompletedThreshold:](self, "setRelatedProductionPlaybackFractionCompletedThreshold:", 0.25);
  -[PXStorySettings setAllowRelatedProductionBeforeReadyToPlay:](self, "setAllowRelatedProductionBeforeReadyToPlay:", 0);
  -[PXStorySettings setWantsRelatedCountdown:](self, "setWantsRelatedCountdown:", 1);
  -[PXStorySettings setRelatedAnimationDuration:](self, "setRelatedAnimationDuration:", 1.0);
  -[PXStorySettings setSmartGradientEnabled:](self, "setSmartGradientEnabled:", 1);
  -[PXStorySettings setSmartGradientUseSmartColor:](self, "setSmartGradientUseSmartColor:", 0);
  -[PXStorySettings setSmartGradientUseSimpleBlur:](self, "setSmartGradientUseSimpleBlur:", 1);
  -[PXStorySettings setSmartGradientBlurRadius:](self, "setSmartGradientBlurRadius:", 40.0);
  -[PXStorySettings setSmartGradientExposureValue:](self, "setSmartGradientExposureValue:", -0.4);
  -[PXStorySettings setSmartGradientRepeatEdges:](self, "setSmartGradientRepeatEdges:", 1);
  -[PXStorySettings setSmartGradientEdgeStretchFactor:](self, "setSmartGradientEdgeStretchFactor:", 8.0);
  -[PXStorySettings setBackgroundQualityScale:](self, "setBackgroundQualityScale:", 1.0);
  -[PXStorySettings setAllowsNUpBackground:](self, "setAllowsNUpBackground:", 1);
  -[PXStorySettings setMovementAnimationCurve:](self, "setMovementAnimationCurve:", 5);
  if (!-[PXStorySettings useMusicCuesForTimeline](self, "useMusicCuesForTimeline"))
  {
    if (-[PXStorySettings useMusicCuesForPacing](self, "useMusicCuesForPacing"))
      v3 = 1.0;
    else
      v3 = 0.85;
  }
  -[PXStorySettings setMovementAnimationLinearFraction:](self, "setMovementAnimationLinearFraction:", v3);
  -[PXStorySettings setMovementAnimationPauseDeceleration:](self, "setMovementAnimationPauseDeceleration:", 1.25);
  -[PXStorySettings setMovementAnimationPausedVelocity:](self, "setMovementAnimationPausedVelocity:", 0.0);
  -[PXStorySettings setMovementAnimationResumeAcceleration:](self, "setMovementAnimationResumeAcceleration:", 2.5);
  -[PXStorySettings setCurrentPPTPreset:](self, "setCurrentPPTPreset:", 2);
  -[PXStorySettings setCurrentPPTSubpreset:](self, "setCurrentPPTSubpreset:", 0);
  -[PXStorySettings setCurrentFeedPPTPreset:](self, "setCurrentFeedPPTPreset:", 3);
  -[PXStorySettings setShowErrorAlertsDuringTestExecution:](self, "setShowErrorAlertsDuringTestExecution:", 0);
  -[PXStorySettings setDisableColorGrading:](self, "setDisableColorGrading:", 0);
  -[PXStorySettings setColorGradeEditorPreviewMode:](self, "setColorGradeEditorPreviewMode:", 0);
  LODWORD(v9) = 0;
  -[PXStorySettings setColorGradeSmoothingFactor:](self, "setColorGradeSmoothingFactor:", v9);
  -[PXStorySettings setColorGradeSmoothingPasses:](self, "setColorGradeSmoothingPasses:", 0);
  LODWORD(v10) = 0;
  -[PXStorySettings setColorGradeBlendingFactor:](self, "setColorGradeBlendingFactor:", v10);
  -[PXStorySettings setColorNormalizationMode:](self, "setColorNormalizationMode:", 2);
  -[PXStorySettings setColorNormalizationTechnique:](self, "setColorNormalizationTechnique:", 0);
  -[PXStorySettings setEnableBrowseViewColorNormalization:](self, "setEnableBrowseViewColorNormalization:", 1);
  -[PXStorySettings setEnableScrubberColorNormalization:](self, "setEnableScrubberColorNormalization:", 1);
  -[PXStorySettings setDebugShowColorNormalizationValues:](self, "setDebugShowColorNormalizationValues:", 0);
  -[PXStorySettings setEnableFalseColorNormalization:](self, "setEnableFalseColorNormalization:", 0);
  -[PXStorySettings setColorNormalizationUseColorCube:](self, "setColorNormalizationUseColorCube:", 0);
  -[PXStorySettings setColorNormalizationCubeEdgeSize:](self, "setColorNormalizationCubeEdgeSize:", 32);
  -[PXStorySettings setEnableColorNormalizationWithoutColorGrade:](self, "setEnableColorNormalizationWithoutColorGrade:", 0);
  LODWORD(v11) = 1.0;
  -[PXStorySettings setColorNormalizationIntensity:](self, "setColorNormalizationIntensity:", v11);
  -[PXStorySettings setReportColorNormalizationErrors:](self, "setReportColorNormalizationErrors:", 0);
  -[PXStorySettings setWantsFullscreenFeedExperience:](self, "setWantsFullscreenFeedExperience:", 0);
  -[PXStorySettings setShowFeedChromeOnHover:](self, "setShowFeedChromeOnHover:", 0);
  -[PXStorySettings setWantsInlinePlayback:](self, "setWantsInlinePlayback:", 1);
  -[PXStorySettings setInlinePlaybackCriticalInsetX:](self, "setInlinePlaybackCriticalInsetX:", 90.0);
  -[PXStorySettings setInlinePlaybackCriticalInsetY:](self, "setInlinePlaybackCriticalInsetY:", 30.0);
  -[PXStorySettings setPressedScale:](self, "setPressedScale:", 0.96);
  -[PXStorySettings setFeedInitialLimit:](self, "setFeedInitialLimit:", 500);
  -[PXStorySettings setFeedCardLandscapeAspectRatio:](self, "setFeedCardLandscapeAspectRatio:", 1.5);
  -[PXStorySettings setFeedCardPortraitAspectRatio:](self, "setFeedCardPortraitAspectRatio:", 0.75);
  -[PXStorySettings setFeedCardWideLandscapeAspectRatio:](self, "setFeedCardWideLandscapeAspectRatio:", 2.9);
  -[PXStorySettings setFeedItemCornerRadius:](self, "setFeedItemCornerRadius:", 23.0);
  -[PXStorySettings setUseSimpleOverlayFeedLayout:](self, "setUseSimpleOverlayFeedLayout:", 0);
  -[PXStorySettings setUseFeedPlaceholderItems:](self, "setUseFeedPlaceholderItems:", 0);
  -[PXStorySettings setWantsFeedItemShadow:](self, "setWantsFeedItemShadow:", 1);
  -[PXStorySettings setAllowsFormSheetPresentation:](self, "setAllowsFormSheetPresentation:", 0);
  -[PXStorySettings setSwipeDownBehavior:](self, "setSwipeDownBehavior:", 0);
  -[PXStorySettings setSwipeDownDismissalDelay:](self, "setSwipeDownDismissalDelay:", 0.5);
  -[PXStorySettings setSwipeDownDismissalDistanceThreshold:](self, "setSwipeDownDismissalDistanceThreshold:", 250.0);
  -[PXStorySettings setSwipeDownSignificantDuration:](self, "setSwipeDownSignificantDuration:", 0.0);
  -[PXStorySettings setSwipeDownThresholdFadeDuration:](self, "setSwipeDownThresholdFadeDuration:", 0.3);
  -[PXStorySettings setNeeds79067616Workaround:](self, "setNeeds79067616Workaround:", 1);
  -[PXStorySettings setAutoEditDiptychCropAspectMax:](self, "setAutoEditDiptychCropAspectMax:", 1.5);
  -[PXStorySettings setAutoEditTriptychCropAspectMax:](self, "setAutoEditTriptychCropAspectMax:", 2.25);
  -[PXStorySettings setAutoEditPortraitAreaMin:](self, "setAutoEditPortraitAreaMin:", 0.0289);
  -[PXStorySettings setAutoEditPortraitAspectLargeVerticalFaceAreaMin:](self, "setAutoEditPortraitAspectLargeVerticalFaceAreaMin:", 0.3);
  -[PXStorySettings setAutoEditModuleLengthMax:](self, "setAutoEditModuleLengthMax:", 4);
  -[PXStorySettings setAutoEditRotateMotionMax:](self, "setAutoEditRotateMotionMax:", 3);
  -[PXStorySettings setAutoEditEmptySpaceLengthMax:](self, "setAutoEditEmptySpaceLengthMax:", 5);
  -[PXStorySettings setAutoEditProductionSimulatedDelay:](self, "setAutoEditProductionSimulatedDelay:", 0.0);
  -[PXStorySettings setAutoEditDisableNUp:](self, "setAutoEditDisableNUp:", 0);
  -[PXStorySettings setDisabledClipMotionStyles:](self, "setDisabledClipMotionStyles:", 0);
  -[PXStorySettings setAutoEditSongPaceOverride:](self, "setAutoEditSongPaceOverride:", 0);
  -[PXStorySettings setAutoEditUseMomentRecipes:](self, "setAutoEditUseMomentRecipes:", 0);
  -[PXStorySettings setScaleRecipeRelativeFrequency:](self, "setScaleRecipeRelativeFrequency:", 1.0);
  -[PXStorySettings setPanRecipeRelativeFrequency:](self, "setPanRecipeRelativeFrequency:", 1.0);
  -[PXStorySettings setExposeToBlackRecipeRelativeFrequency:](self, "setExposeToBlackRecipeRelativeFrequency:", 1.0);
  -[PXStorySettings setAutoEditSceneConfidenceThreshold:](self, "setAutoEditSceneConfidenceThreshold:", 0.5);
  -[PXStorySettings setAutoEditHighCurationScoreThreshold:](self, "setAutoEditHighCurationScoreThreshold:", 0.75);
  -[PXStorySettings setAutoEditDoublePlaceMultiplier:](self, "setAutoEditDoublePlaceMultiplier:", 0.5);
  -[PXStorySettings setUseReferenceWidthBasedTitleLayout:](self, "setUseReferenceWidthBasedTitleLayout:", 1);
  -[PXStorySettings setTitleReferenceWidthPortrait:](self, "setTitleReferenceWidthPortrait:", 260.0);
  -[PXStorySettings setTitleReferenceWidthLandscape:](self, "setTitleReferenceWidthLandscape:", 285.0);
  -[PXStorySettings setTitleFeedPortraitWidthScale:](self, "setTitleFeedPortraitWidthScale:", 0.0);
  -[PXStorySettings setTitleFeedLandscapeWidthScale:](self, "setTitleFeedLandscapeWidthScale:", 0.0);
  -[PXStorySettings setTitleFullScreenPortraitWidthScale:](self, "setTitleFullScreenPortraitWidthScale:", 0.0);
  -[PXStorySettings setTitleFullScreenLandscapeWidthScale:](self, "setTitleFullScreenLandscapeWidthScale:", 0.0);
  -[PXStorySettings setTitleRegularPaddingBottomScale:](self, "setTitleRegularPaddingBottomScale:", 0.21);
  -[PXStorySettings setTitlePaddingTopScale:](self, "setTitlePaddingTopScale:", 0.0);
  -[PXStorySettings setTitleWidthMin:](self, "setTitleWidthMin:", 0.0);
  -[PXStorySettings setTitleWidthMax:](self, "setTitleWidthMax:", 0.0);
  -[PXStorySettings setTitleSizeScale:](self, "setTitleSizeScale:", 0.0);
  -[PXStorySettings setSubtitleSizeScale:](self, "setSubtitleSizeScale:", 0.0);
  -[PXStorySettings setTitleMinimumScale:](self, "setTitleMinimumScale:", 0.4);
  -[PXStorySettings setSubtitleMinimumScale:](self, "setSubtitleMinimumScale:", 0.5);
  -[PXStorySettings setTitleUseCenterAlignment:](self, "setTitleUseCenterAlignment:", 0);
  -[PXStorySettings setTitleFarthestDistanceThreshold:](self, "setTitleFarthestDistanceThreshold:", 0.06);
  -[PXStorySettings setEnableTitlePositioningLogs:](self, "setEnableTitlePositioningLogs:", 0);
  -[PXStorySettings setTitleMaximumNumberOfLines:](self, "setTitleMaximumNumberOfLines:", 3);
  v12 = _os_feature_enabled_impl() ^ 1;
  -[PXStorySettings setVerticalTextMode:](self, "setVerticalTextMode:", v12);
  -[PXStorySettings setKashidaTextMode:](self, "setKashidaTextMode:", v12);
  -[PXStorySettings setSimulateSlowTextLayout:](self, "setSimulateSlowTextLayout:", 0);
  -[PXStorySettings setShowTVPreviewInDiagnostics:](self, "setShowTVPreviewInDiagnostics:", 1);
  -[PXStorySettings setCurationScorePercentileThreshold:](self, "setCurationScorePercentileThreshold:", *MEMORY[0x1E0CD1930]);
  -[PXStorySettings setAestheticsScorePercentileThreshold:](self, "setAestheticsScorePercentileThreshold:", *MEMORY[0x1E0CD1928]);
  -[PXStorySettings setUseCommonActionInfrastructureForActionMenu:](self, "setUseCommonActionInfrastructureForActionMenu:", 0);
}

- (BOOL)useMusicCuesForTimeline
{
  return self->_useMusicCuesForTimeline;
}

- (void)setWantsValidation:(BOOL)a3
{
  self->_wantsValidation = a3;
}

- (void)setWantsTransitions:(BOOL)a3
{
  self->_wantsTransitions = a3;
}

- (void)setWantsTitles:(BOOL)a3
{
  self->_wantsTitles = a3;
}

- (void)setWantsScrubber:(BOOL)a3
{
  self->_wantsScrubber = a3;
}

- (void)setWantsResourcesPreloading:(BOOL)a3
{
  self->_wantsResourcesPreloading = a3;
}

- (void)setWantsRelatedCountdown:(BOOL)a3
{
  self->_wantsRelatedCountdown = a3;
}

- (void)setWantsRelated:(BOOL)a3
{
  self->_wantsRelated = a3;
}

- (void)setWantsPersistence:(BOOL)a3
{
  self->_wantsPersistence = a3;
}

- (void)setWantsMovieHighlights:(BOOL)a3
{
  self->_wantsMovieHighlights = a3;
}

- (void)setWantsInlinePlayback:(BOOL)a3
{
  self->_wantsInlinePlayback = a3;
}

- (void)setWantsHighContrastColors:(BOOL)a3
{
  self->_wantsHighContrastColors = a3;
}

- (void)setWantsGridLayout:(BOOL)a3
{
  self->_wantsGridLayout = a3;
}

- (void)setWantsFullscreenFeedExperience:(BOOL)a3
{
  self->_wantsFullscreenFeedExperience = a3;
}

- (void)setWantsFeedItemShadow:(BOOL)a3
{
  self->_wantsFeedItemShadow = a3;
}

- (void)setWantsBufferingIndicatorOverScrubber:(BOOL)a3
{
  self->_wantsBufferingIndicatorOverScrubber = a3;
}

- (void)setWantsAudioJLCuts:(BOOL)a3
{
  self->_wantsAudioJLCuts = a3;
}

- (void)setWantsAudioFromVideo:(BOOL)a3
{
  self->_wantsAudioFromVideo = a3;
}

- (void)setWantsAudioFade:(BOOL)a3
{
  self->_wantsAudioFade = a3;
}

- (void)setWantsAnimations:(BOOL)a3
{
  self->_wantsAnimations = a3;
}

- (void)setViewModeTransitionSpringStiffness:(double)a3
{
  self->_viewModeTransitionSpringStiffness = a3;
}

- (void)setViewModeTransitionAccessoryFadepoint:(double)a3
{
  self->_viewModeTransitionAccessoryFadepoint = a3;
}

- (void)setVideoQuality:(int64_t)a3
{
  self->_videoQuality = a3;
}

- (void)setVideoMaximumAspectFillScale:(double)a3
{
  self->_videoMaximumAspectFillScale = a3;
}

- (void)setVideoInlineStabilization:(BOOL)a3
{
  self->_videoInlineStabilization = a3;
}

- (void)setVideoAudioStrategy:(int64_t)a3
{
  self->_videoAudioStrategy = a3;
}

- (void)setVerticalTextMode:(int64_t)a3
{
  self->_verticalTextMode = a3;
}

- (void)setValidationShouldWaitForTimelineToBeReadyToPlay:(BOOL)a3
{
  self->_validationShouldWaitForTimelineToBeReadyToPlay = a3;
}

- (void)setUseSimpleOverlayFeedLayout:(BOOL)a3
{
  self->_useSimpleOverlayFeedLayout = a3;
}

- (void)setUseReferenceWidthBasedTitleLayout:(BOOL)a3
{
  self->_useReferenceWidthBasedTitleLayout = a3;
}

- (void)setUseMusicCuesForTimeline:(BOOL)a3
{
  self->_useMusicCuesForTimeline = a3;
}

- (void)setUseMusicCuesForPacing:(BOOL)a3
{
  self->_useMusicCuesForPacing = a3;
}

- (void)setUseFeedPlaceholderItems:(BOOL)a3
{
  self->_useFeedPlaceholderItems = a3;
}

- (void)setUseBottomLegibilityGradientForBufferingIndicator:(BOOL)a3
{
  self->_useBottomLegibilityGradientForBufferingIndicator = a3;
}

- (void)setUseBestHighlightTrim:(BOOL)a3
{
  self->_useBestHighlightTrim = a3;
}

- (void)setTwoFingerTapAction:(int64_t)a3
{
  self->_twoFingerTapAction = a3;
}

- (void)setTransitionShowcaseMode:(int64_t)a3
{
  self->_transitionShowcaseMode = a3;
}

- (void)setTransitionFallback:(int64_t)a3
{
  self->_transitionFallback = a3;
}

- (void)setTopLegibilityGradientHeight:(double)a3
{
  self->_topLegibilityGradientHeight = a3;
}

- (void)setTitleWidthMin:(double)a3
{
  self->_titleWidthMin = a3;
}

- (void)setTitleWidthMax:(double)a3
{
  self->_titleWidthMax = a3;
}

- (void)setTitleUseCenterAlignment:(BOOL)a3
{
  self->_titleUseCenterAlignment = a3;
}

- (void)setTitleSizeScale:(double)a3
{
  self->_titleSizeScale = a3;
}

- (void)setTitleRegularPaddingBottomScale:(double)a3
{
  self->_titleRegularPaddingBottomScale = a3;
}

- (void)setTitleReferenceWidthPortrait:(double)a3
{
  self->_titleReferenceWidthPortrait = a3;
}

- (void)setTitleReferenceWidthLandscape:(double)a3
{
  self->_titleReferenceWidthLandscape = a3;
}

- (void)setTitlePaddingTopScale:(double)a3
{
  self->_titlePaddingTopScale = a3;
}

- (void)setTitleMinimumScale:(double)a3
{
  self->_titleMinimumScale = a3;
}

- (void)setTitleMaximumNumberOfLines:(int64_t)a3
{
  self->_titleMaximumNumberOfLines = a3;
}

- (void)setTitleFullScreenPortraitWidthScale:(double)a3
{
  self->_titleFullScreenPortraitWidthScale = a3;
}

- (void)setTitleFullScreenLandscapeWidthScale:(double)a3
{
  self->_titleFullScreenLandscapeWidthScale = a3;
}

- (void)setTitleFeedPortraitWidthScale:(double)a3
{
  self->_titleFeedPortraitWidthScale = a3;
}

- (void)setTitleFeedLandscapeWidthScale:(double)a3
{
  self->_titleFeedLandscapeWidthScale = a3;
}

- (void)setTitleFarthestDistanceThreshold:(double)a3
{
  self->_titleFarthestDistanceThreshold = a3;
}

- (void)setTimelineProducerKind:(int64_t)a3
{
  self->_timelineProducerKind = a3;
}

- (void)setTimelineManagerPaperTrailLength:(int64_t)a3
{
  self->_timelineManagerPaperTrailLength = a3;
}

- (void)setTapNavigationAreaFraction:(double)a3
{
  self->_tapNavigationAreaFraction = a3;
}

- (void)setSwipeDownThresholdFadeDuration:(double)a3
{
  self->_swipeDownThresholdFadeDuration = a3;
}

- (void)setSwipeDownSignificantDuration:(double)a3
{
  self->_swipeDownSignificantDuration = a3;
}

- (void)setSwipeDownDismissalDistanceThreshold:(double)a3
{
  self->_swipeDownDismissalDistanceThreshold = a3;
}

- (void)setSwipeDownDismissalDelay:(double)a3
{
  self->_swipeDownDismissalDelay = a3;
}

- (void)setSwipeDownBehavior:(int64_t)a3
{
  self->_swipeDownBehavior = a3;
}

- (void)setSwipeDownAction:(int64_t)a3
{
  self->_swipeDownAction = a3;
}

- (void)setSubtitleSizeScale:(double)a3
{
  self->_subtitleSizeScale = a3;
}

- (void)setSubtitleMinimumScale:(double)a3
{
  self->_subtitleMinimumScale = a3;
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (void)setSmartGradientUseSmartColor:(BOOL)a3
{
  self->_smartGradientUseSmartColor = a3;
}

- (void)setSmartGradientUseSimpleBlur:(BOOL)a3
{
  self->_smartGradientUseSimpleBlur = a3;
}

- (void)setSmartGradientRepeatEdges:(BOOL)a3
{
  self->_smartGradientRepeatEdges = a3;
}

- (void)setSmartGradientExposureValue:(double)a3
{
  self->_smartGradientExposureValue = a3;
}

- (void)setSmartGradientEnabled:(BOOL)a3
{
  self->_smartGradientEnabled = a3;
}

- (void)setSmartGradientEdgeStretchFactor:(double)a3
{
  self->_smartGradientEdgeStretchFactor = a3;
}

- (void)setSmartGradientBlurRadius:(double)a3
{
  self->_smartGradientBlurRadius = a3;
}

- (void)setSlomoVideoAudioStrategy:(int64_t)a3
{
  self->_slomoVideoAudioStrategy = a3;
}

- (void)setSimultaneousPreloadingOperationsCount:(int64_t)a3
{
  self->_simultaneousPreloadingOperationsCount = a3;
}

- (void)setSimulatedSlowResourcesBufferingDelay:(double)a3
{
  self->_simulatedSlowResourcesBufferingDelay = a3;
}

- (void)setSimulatedError:(int64_t)a3
{
  self->_simulatedError = a3;
}

- (void)setSimulatedAudioCuesLoadingDelay:(double)a3
{
  self->_simulatedAudioCuesLoadingDelay = a3;
}

- (void)setSimulateSlowTextLayout:(BOOL)a3
{
  self->_simulateSlowTextLayout = a3;
}

- (void)setSimulateSlowResourcesBuffering:(BOOL)a3
{
  self->_simulateSlowResourcesBuffering = a3;
}

- (void)setSimulateResourcesBufferingError:(BOOL)a3
{
  self->_simulateResourcesBufferingError = a3;
}

- (void)setSimulateNoAppleMusicSubscription:(BOOL)a3
{
  self->_simulateNoAppleMusicSubscription = a3;
}

- (void)setSimulateLongChromeStrings:(BOOL)a3
{
  self->_simulateLongChromeStrings = a3;
}

- (void)setSignificantPlayedDuration:(double)a3
{
  self->_significantPlayedDuration = a3;
}

- (void)setShowcaseTransitionDuration:(double)a3
{
  self->_showcaseTransitionDuration = a3;
}

- (void)setShowcaseSegmentDuration:(double)a3
{
  self->_showcaseSegmentDuration = a3;
}

- (void)setShowTVPreviewInDiagnostics:(BOOL)a3
{
  self->_showTVPreviewInDiagnostics = a3;
}

- (void)setShowStyleSwitcher:(BOOL)a3
{
  self->_showStyleSwitcher = a3;
}

- (void)setShowMusicAndColorGradeEditor:(BOOL)a3
{
  self->_showMusicAndColorGradeEditor = a3;
}

- (void)setShowFeedChromeOnHover:(BOOL)a3
{
  self->_showFeedChromeOnHover = a3;
}

- (void)setShowErrorAlertsDuringTestExecution:(BOOL)a3
{
  self->_showErrorAlertsDuringTestExecution = a3;
}

- (void)setShouldStylesAlwaysIncludePersistedSong:(BOOL)a3
{
  self->_shouldStylesAlwaysIncludePersistedSong = a3;
}

- (void)setShouldRecombineTimelineWithSameVisibleSegments:(BOOL)a3
{
  self->_shouldRecombineTimelineWithSameVisibleSegments = a3;
}

- (void)setShouldHideSidebarWhenDisplayed:(BOOL)a3
{
  self->_shouldHideSidebarWhenDisplayed = a3;
}

- (void)setSeparatorEffectsShowcaseMode:(int64_t)a3
{
  self->_separatorEffectsShowcaseMode = a3;
}

- (void)setScrubberSelectionStartsPlayback:(BOOL)a3
{
  self->_scrubberSelectionStartsPlayback = a3;
}

- (void)setScrubberLayoutStretchesSmallNumberOfAssets:(BOOL)a3
{
  self->_scrubberLayoutStretchesSmallNumberOfAssets = a3;
}

- (void)setScrubberEdgeFadeOffset:(double)a3
{
  self->_scrubberEdgeFadeOffset = a3;
}

- (void)setScrubberEdgeFadeMode:(int64_t)a3
{
  self->_scrubberEdgeFadeMode = a3;
}

- (void)setScrubberEdgeFadeDistance:(double)a3
{
  self->_scrubberEdgeFadeDistance = a3;
}

- (void)setScrubberDisplayMode:(int64_t)a3
{
  self->_scrubberDisplayMode = a3;
}

- (void)setScrubberDimsMainContent:(BOOL)a3
{
  self->_scrubberDimsMainContent = a3;
}

- (void)setScrubberAutoHideDelay:(double)a3
{
  self->_scrubberAutoHideDelay = a3;
}

- (void)setScaleRecipeRelativeFrequency:(double)a3
{
  self->_scaleRecipeRelativeFrequency = a3;
}

- (void)setReportColorNormalizationErrors:(BOOL)a3
{
  self->_reportColorNormalizationErrors = a3;
}

- (void)setRenderTitlesForRelated:(BOOL)a3
{
  self->_renderTitlesForRelated = a3;
}

- (void)setRelatedProductionPlaybackFractionCompletedThreshold:(double)a3
{
  self->_relatedProductionPlaybackFractionCompletedThreshold = a3;
}

- (void)setRelatedProducerKind:(int64_t)a3
{
  self->_relatedProducerKind = a3;
}

- (void)setRelatedAnimationDuration:(double)a3
{
  self->_relatedAnimationDuration = a3;
}

- (void)setPressedScale:(double)a3
{
  self->_pressedScale = a3;
}

- (void)setPreloadingSegmentsBatchSize:(int64_t)a3
{
  self->_preloadingSegmentsBatchSize = a3;
}

- (void)setPreloadingEstimationStrategy:(int64_t)a3
{
  self->_preloadingEstimationStrategy = a3;
}

- (void)setPreloadNonKeyRelated:(BOOL)a3
{
  self->_preloadNonKeyRelated = a3;
}

- (void)setPreferredFullsizePaperTrailOptions:(unint64_t)a3
{
  self->_preferredFullsizePaperTrailOptions = a3;
}

- (void)setPreferTopChromeItemsInAppNavigationBar:(BOOL)a3
{
  self->_preferTopChromeItemsInAppNavigationBar = a3;
}

- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3
{
  self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = a3;
}

- (void)setPlayerShowsBufferingStatus:(BOOL)a3
{
  self->_playerShowsBufferingStatus = a3;
}

- (void)setPlayerPresentationType:(unsigned __int8)a3
{
  self->_playerPresentationType = a3;
}

- (void)setPlaybackShouldWaitForBufferingToBeReady:(BOOL)a3
{
  self->_playbackShouldWaitForBufferingToBeReady = a3;
}

- (void)setPlayButtonRewindSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (void)setPanRecipeRelativeFrequency:(double)a3
{
  self->_panRecipeRelativeFrequency = a3;
}

- (void)setOverrideLegibilityGradientHeights:(BOOL)a3
{
  self->_overrideLegibilityGradientHeights = a3;
}

- (void)setOverrideDurations:(BOOL)a3
{
  self->_overrideDurations = a3;
}

- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3
{
  self->_otherAssetsAspectRatioOverride = a3;
}

- (void)setNoncriticalBufferingTimeout:(double)a3
{
  self->_noncriticalBufferingTimeout = a3;
}

- (void)setNeeds79067616Workaround:(BOOL)a3
{
  self->_needs79067616Workaround = a3;
}

- (void)setMuteToggleButtonAutoHideDelay:(double)a3
{
  self->_muteToggleButtonAutoHideDelay = a3;
}

- (void)setMuteBackgroundMusic:(BOOL)a3
{
  self->_muteBackgroundMusic = a3;
}

- (void)setMusicTouchDuckingDelay:(double)a3
{
  self->_musicTouchDuckingDelay = a3;
}

- (void)setMusicTargetLoudnessLKFS:(float)a3
{
  self->_musicTargetLoudnessLKFS = a3;
}

- (void)setMusicSimulatedFailureMode:(int64_t)a3
{
  self->_musicSimulatedFailureMode = a3;
}

- (void)setMusicFadeOutVolume:(float)a3
{
  self->_musicFadeOutVolume = a3;
}

- (void)setMusicDuckedVolume:(float)a3
{
  self->_musicDuckedVolume = a3;
}

- (void)setMusicDemoVolumeAdjustment:(BOOL)a3
{
  self->_musicDemoVolumeAdjustment = a3;
}

- (void)setMusicBackgroundVolume:(float)a3
{
  self->_musicBackgroundVolume = a3;
}

- (void)setMovementAnimationResumeAcceleration:(double)a3
{
  self->_movementAnimationResumeAcceleration = a3;
}

- (void)setMovementAnimationPausedVelocity:(double)a3
{
  self->_movementAnimationPausedVelocity = a3;
}

- (void)setMovementAnimationPauseDeceleration:(double)a3
{
  self->_movementAnimationPauseDeceleration = a3;
}

- (void)setMovementAnimationLinearFraction:(double)a3
{
  self->_movementAnimationLinearFraction = a3;
}

- (void)setMovementAnimationCurve:(int64_t)a3
{
  self->_movementAnimationCurve = a3;
}

- (void)setMinPreloadedeSegments:(int64_t)a3
{
  self->_minPreloadedeSegments = a3;
}

- (void)setMaximumAppBackgroundDurationBeforeAutoPause:(double)a3
{
  self->_maximumAppBackgroundDurationBeforeAutoPause = a3;
}

- (void)setLoopingVideoAudioStrategy:(int64_t)a3
{
  self->_loopingVideoAudioStrategy = a3;
}

- (void)setLivePhotoSameOrientationRegularMaximumScale:(double)a3
{
  self->_livePhotoSameOrientationRegularMaximumScale = a3;
}

- (void)setLivePhotoSameOrientationCompactMaximumScale:(double)a3
{
  self->_livePhotoSameOrientationCompactMaximumScale = a3;
}

- (void)setLivePhotoOppositeOrientationRegularMaximumScale:(double)a3
{
  self->_livePhotoOppositeOrientationRegularMaximumScale = a3;
}

- (void)setLivePhotoOppositeOrientationCompactMaximumScale:(double)a3
{
  self->_livePhotoOppositeOrientationCompactMaximumScale = a3;
}

- (void)setLivePhotoLocalVideoQuality:(int64_t)a3
{
  self->_livePhotoLocalVideoQuality = a3;
}

- (void)setLivePhotoAudioStrategy:(int64_t)a3
{
  self->_livePhotoAudioStrategy = a3;
}

- (void)setLimitKeyAssetAspectRatioToFeedCard:(BOOL)a3
{
  self->_limitKeyAssetAspectRatioToFeedCard = a3;
}

- (void)setLegibilityRelatedDimming:(double)a3
{
  self->_legibilityRelatedDimming = a3;
}

- (void)setLegibilityPlaybackEndUndimmingDuration:(double)a3
{
  self->_legibilityPlaybackEndUndimmingDuration = a3;
}

- (void)setLegibilityPlaybackEndDimmingDuration:(double)a3
{
  self->_legibilityPlaybackEndDimmingDuration = a3;
}

- (void)setLegibilityPlaybackEndDimming:(double)a3
{
  self->_legibilityPlaybackEndDimming = a3;
}

- (void)setLegibilityGradientOpacity:(double)a3
{
  self->_legibilityGradientOpacity = a3;
}

- (void)setKeyAssetAspectRatioOverride:(int64_t)a3
{
  self->_keyAssetAspectRatioOverride = a3;
}

- (void)setKenBurnsShowcaseMode:(int64_t)a3
{
  self->_kenBurnsShowcaseMode = a3;
}

- (void)setKashidaTextMode:(int64_t)a3
{
  self->_kashidaTextMode = a3;
}

- (void)setIsHUDVisible:(BOOL)a3
{
  self->_isHUDVisible = a3;
}

- (void)setIsHUDEnabled:(BOOL)a3
{
  self->_isHUDEnabled = a3;
}

- (void)setIsExportHUDEnabled:(BOOL)a3
{
  self->_isExportHUDEnabled = a3;
}

- (void)setIsAppleMusicAllowed:(BOOL)a3
{
  self->_isAppleMusicAllowed = a3;
}

- (void)setInlinePlaybackCriticalInsetY:(double)a3
{
  self->_inlinePlaybackCriticalInsetY = a3;
}

- (void)setInlinePlaybackCriticalInsetX:(double)a3
{
  self->_inlinePlaybackCriticalInsetX = a3;
}

- (void)setIncludeImagesInVisualDiagnosticsForTTR:(BOOL)a3
{
  self->_includeImagesInVisualDiagnosticsForTTR = a3;
}

- (void)setIncludeDeviceDiagnosticsForTTR:(BOOL)a3
{
  self->_includeDeviceDiagnosticsForTTR = a3;
}

- (void)setForegroundAudioLoudnessTarget:(double)a3
{
  self->_foregroundAudioLoudnessTarget = a3;
}

- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3
{
  self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = a3;
}

- (void)setForcePacingToSegmentMaxDuration:(BOOL)a3
{
  self->_forcePacingToSegmentMaxDuration = a3;
}

- (void)setForceMinDurationKenBurnsAnimations:(BOOL)a3
{
  self->_forceMinDurationKenBurnsAnimations = a3;
}

- (void)setForceLivePhotoVideo:(BOOL)a3
{
  self->_forceLivePhotoVideo = a3;
}

- (void)setFocusChangeFadeDuration:(double)a3
{
  self->_focusChangeFadeDuration = a3;
}

- (void)setFeedPresentationType:(unsigned __int8)a3
{
  self->_feedPresentationType = a3;
}

- (void)setFeedItemCornerRadius:(double)a3
{
  self->_feedItemCornerRadius = a3;
}

- (void)setFeedInitialLimit:(int64_t)a3
{
  self->_feedInitialLimit = a3;
}

- (void)setFeedHUDType:(int64_t)a3
{
  self->_feedHUDType = a3;
}

- (void)setFeedCardWideLandscapeAspectRatio:(double)a3
{
  self->_feedCardWideLandscapeAspectRatio = a3;
}

- (void)setFeedCardPortraitAspectRatio:(double)a3
{
  self->_feedCardPortraitAspectRatio = a3;
}

- (void)setFeedCardLandscapeAspectRatio:(double)a3
{
  self->_feedCardLandscapeAspectRatio = a3;
}

- (void)setExposeToBlackRecipeRelativeFrequency:(double)a3
{
  self->_exposeToBlackRecipeRelativeFrequency = a3;
}

- (void)setExportVideoQuality:(int64_t)a3
{
  self->_exportVideoQuality = a3;
}

- (void)setExportHUDType:(int64_t)a3
{
  self->_exportHUDType = a3;
}

- (void)setExaggerateResourceDownloadTimes:(BOOL)a3
{
  self->_exaggerateResourceDownloadTimes = a3;
}

- (void)setEstimatedMinimumDurationPerCuratedAsset:(double)a3
{
  self->_estimatedMinimumDurationPerCuratedAsset = a3;
}

- (void)setEstimateTimeLeftPerPlaybackStyle:(BOOL)a3
{
  self->_estimateTimeLeftPerPlaybackStyle = a3;
}

- (void)setEnableTitlePositioningLogs:(BOOL)a3
{
  self->_enableTitlePositioningLogs = a3;
}

- (void)setEnableScrubberColorNormalization:(BOOL)a3
{
  self->_enableScrubberColorNormalization = a3;
}

- (void)setEnableFalseColorNormalization:(BOOL)a3
{
  self->_enableFalseColorNormalization = a3;
}

- (void)setEnableDemoAction:(BOOL)a3
{
  self->_enableDemoAction = a3;
}

- (void)setEnableColorNormalizationWithoutColorGrade:(BOOL)a3
{
  self->_enableColorNormalizationWithoutColorGrade = a3;
}

- (void)setEnableBrowseViewColorNormalization:(BOOL)a3
{
  self->_enableBrowseViewColorNormalization = a3;
}

- (void)setDuckingFadeDuration:(double)a3
{
  self->_duckingFadeDuration = a3;
}

- (void)setDisableVideoPlayback:(BOOL)a3
{
  self->_disableVideoPlayback = a3;
}

- (void)setDisableShowcaseBadge:(BOOL)a3
{
  self->_disableShowcaseBadge = a3;
}

- (void)setDisableColorGrading:(BOOL)a3
{
  self->_disableColorGrading = a3;
}

- (void)setDetectVideoLags:(BOOL)a3
{
  self->_detectVideoLags = a3;
}

- (void)setDefaultHUDType:(int64_t)a3
{
  self->_defaultHUDType = a3;
}

- (void)setDebugShowVideoPlaybackDetails:(BOOL)a3
{
  self->_debugShowVideoPlaybackDetails = a3;
}

- (void)setDebugShowColorNormalizationValues:(BOOL)a3
{
  self->_debugShowColorNormalizationValues = a3;
}

- (void)setDebugShowAudioPlaybackDetails:(BOOL)a3
{
  self->_debugShowAudioPlaybackDetails = a3;
}

- (void)setCurrentPPTSubpreset:(unint64_t)a3
{
  self->_currentPPTSubpreset = a3;
}

- (void)setCurrentPPTPreset:(unint64_t)a3
{
  self->_currentPPTPreset = a3;
}

- (void)setCurrentFeedPPTPreset:(unint64_t)a3
{
  self->_currentFeedPPTPreset = a3;
}

- (void)setCurationScorePercentileThreshold:(double)a3
{
  self->_curationScorePercentileThreshold = a3;
}

- (void)setCuratedAssetsLimit:(int64_t)a3
{
  self->_curatedAssetsLimit = a3;
}

- (void)setContinuousKenBurnsAnimationsTolerance:(double)a3
{
  self->_continuousKenBurnsAnimationsTolerance = a3;
}

- (void)setColorNormalizationUseColorCube:(BOOL)a3
{
  self->_colorNormalizationUseColorCube = a3;
}

- (void)setColorNormalizationTechnique:(int64_t)a3
{
  self->_colorNormalizationTechnique = a3;
}

- (void)setColorNormalizationMode:(int64_t)a3
{
  self->_colorNormalizationMode = a3;
}

- (void)setColorNormalizationIntensity:(float)a3
{
  self->_colorNormalizationIntensity = a3;
}

- (void)setColorNormalizationCubeEdgeSize:(int64_t)a3
{
  self->_colorNormalizationCubeEdgeSize = a3;
}

- (void)setColorGradeSmoothingPasses:(int64_t)a3
{
  self->_colorGradeSmoothingPasses = a3;
}

- (void)setColorGradeSmoothingFactor:(float)a3
{
  self->_colorGradeSmoothingFactor = a3;
}

- (void)setColorGradeEditorPreviewMode:(int64_t)a3
{
  self->_colorGradeEditorPreviewMode = a3;
}

- (void)setColorGradeBlendingFactor:(float)a3
{
  self->_colorGradeBlendingFactor = a3;
}

- (void)setClipCompositionShowcaseMode:(int64_t)a3
{
  self->_clipCompositionShowcaseMode = a3;
}

- (void)setClipCompositionFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setChromeAutoHideDelay:(double)a3
{
  self->_chromeAutoHideDelay = a3;
}

- (void)setChromeAllowAutoHide:(BOOL)a3
{
  self->_chromeAllowAutoHide = a3;
}

- (void)setBufferingHUDAutoPresentationTimeout:(double)a3
{
  self->_bufferingHUDAutoPresentationTimeout = a3;
}

- (void)setBottomLegibilityGradientHeight:(double)a3
{
  self->_bottomLegibilityGradientHeight = a3;
}

- (void)setBackgroundQualityScale:(double)a3
{
  self->_backgroundQualityScale = a3;
}

- (void)setBackgroundAudioLoudnessTarget:(double)a3
{
  self->_backgroundAudioLoudnessTarget = a3;
}

- (void)setAutoEditUseMomentRecipes:(BOOL)a3
{
  self->_autoEditUseMomentRecipes = a3;
}

- (void)setAutoEditTriptychCropAspectMax:(double)a3
{
  self->_autoEditTriptychCropAspectMax = a3;
}

- (void)setAutoEditSongPaceOverride:(int64_t)a3
{
  self->_autoEditSongPaceOverride = a3;
}

- (void)setAutoEditSceneConfidenceThreshold:(double)a3
{
  self->_autoEditSceneConfidenceThreshold = a3;
}

- (void)setAutoEditRotateMotionMax:(int64_t)a3
{
  self->_autoEditRotateMotionMax = a3;
}

- (void)setAutoEditProductionSimulatedDelay:(double)a3
{
  self->_autoEditProductionSimulatedDelay = a3;
}

- (void)setAutoEditPortraitAspectLargeVerticalFaceAreaMin:(double)a3
{
  self->_autoEditPortraitAspectLargeVerticalFaceAreaMin = a3;
}

- (void)setAutoEditPortraitAreaMin:(double)a3
{
  self->_autoEditPortraitAreaMin = a3;
}

- (void)setAutoEditModuleLengthMax:(int64_t)a3
{
  self->_autoEditModuleLengthMax = a3;
}

- (void)setAutoEditHighCurationScoreThreshold:(double)a3
{
  self->_autoEditHighCurationScoreThreshold = a3;
}

- (void)setAutoEditEmptySpaceLengthMax:(int64_t)a3
{
  self->_autoEditEmptySpaceLengthMax = a3;
}

- (void)setAutoEditDoublePlaceMultiplier:(double)a3
{
  self->_autoEditDoublePlaceMultiplier = a3;
}

- (void)setAutoEditDisableNUp:(BOOL)a3
{
  self->_autoEditDisableNUp = a3;
}

- (void)setAutoEditDiptychCropAspectMax:(double)a3
{
  self->_autoEditDiptychCropAspectMax = a3;
}

- (void)setAudioQualityMin:(float)a3
{
  self->_audioQualityMin = a3;
}

- (void)setAudioLCutStrategy:(int64_t)a3
{
  self->_audioLCutStrategy = a3;
}

- (void)setAudioLCutDuration:(double)a3
{
  self->_audioLCutDuration = a3;
}

- (void)setAudioJCutStrategy:(int64_t)a3
{
  self->_audioJCutStrategy = a3;
}

- (void)setAudioJCutDuration:(double)a3
{
  self->_audioJCutDuration = a3;
}

- (void)setAudioFadeMinDuration:(double)a3
{
  self->_audioFadeMinDuration = a3;
}

- (void)setAudioFadeMaxDuration:(double)a3
{
  self->_audioFadeMaxDuration = a3;
}

- (void)setAudioFadeCurve:(int64_t)a3
{
  self->_audioFadeCurve = a3;
}

- (void)setAspectFillOneUpCropTolerance:(double)a3
{
  self->_aspectFillOneUpCropTolerance = a3;
}

- (void)setAreRelatedHUDsVisible:(BOOL)a3
{
  self->_areRelatedHUDsVisible = a3;
}

- (void)setAppleMusicPromptTrigger:(int64_t)a3
{
  self->_appleMusicPromptTrigger = a3;
}

- (void)setAllowsTimelineRecombination:(BOOL)a3
{
  self->_allowsTimelineRecombination = a3;
}

- (void)setAllowsShowcase:(BOOL)a3
{
  self->_allowsShowcase = a3;
}

- (void)setAllowsNUpBackground:(BOOL)a3
{
  self->_allowsNUpBackground = a3;
}

- (void)setAllowsFormSheetPresentation:(BOOL)a3
{
  self->_allowsFormSheetPresentation = a3;
}

- (void)setAllowsContinuousKenBurnsAnimations:(BOOL)a3
{
  self->_allowsContinuousKenBurnsAnimations = a3;
}

- (void)setAllowRelatedProductionBeforeReadyToPlay:(BOOL)a3
{
  self->_allowRelatedProductionBeforeReadyToPlay = a3;
}

- (void)setAllowOnDemandVideoAnalysis:(BOOL)a3
{
  self->_allowOnDemandVideoAnalysis = a3;
}

- (void)setAllowNonFillingCompositionsForKeyAsset:(BOOL)a3
{
  self->_allowNonFillingCompositionsForKeyAsset = a3;
}

- (void)setAllowLimitingImagesTo3MP:(BOOL)a3
{
  self->_allowLimitingImagesTo3MP = a3;
}

- (void)setAllowCustomUserAssets:(BOOL)a3
{
  self->_allowCustomUserAssets = a3;
}

- (void)setAllowAspectModeToggle:(BOOL)a3
{
  self->_allowAspectModeToggle = a3;
}

- (void)setAestheticsScorePercentileThreshold:(double)a3
{
  self->_aestheticsScorePercentileThreshold = a3;
}

- (void)setAdjustToWallClockTime:(BOOL)a3
{
  self->_adjustToWallClockTime = a3;
}

void __33__PXStorySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_53346;
  sharedInstance_sharedInstance_53346 = v0;

}

- (int64_t)appleMusicPromptTrigger
{
  return self->_appleMusicPromptTrigger;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_53344 != -1)
    dispatch_once(&sharedInstance_onceToken_53344, &__block_literal_global_53345);
  return (id)sharedInstance_sharedInstance_53346;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)performPostSaveActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXStorySettings;
  -[PXSettings performPostSaveActions](&v11, sel_performPostSaveActions);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v3, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PXStorySettings curationScorePercentileThreshold](self, "curationScorePercentileThreshold");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x1E0CD1920]);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PXStorySettings aestheticsScorePercentileThreshold](self, "aestheticsScorePercentileThreshold");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x1E0CD1918]);

  objc_msgSend(v3, "setPersistentDomain:forName:", v6, v4);
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStorySettings;
  -[PXStorySettings didChangeValueForKey:](&v10, sel_didChangeValueForKey_, v4);
  NSStringFromSelector(sel_curationScorePercentileThreshold);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
LABEL_7:

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    NSStringFromSelector(sel_aestheticsScorePercentileThreshold);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 != v4)
    {
      v8 = v7;
      v9 = objc_msgSend(v4, "isEqualToString:", v7);

      if ((v9 & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }

    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  -[PXStorySettings performPostSaveActions](self, "performPostSaveActions");
LABEL_10:

}

- (unint64_t)fullsizePaperTrailOptions
{
  void *v3;
  int v4;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canShowInternalUI");

  if (v4)
    return -[PXStorySettings preferredFullsizePaperTrailOptions](self, "preferredFullsizePaperTrailOptions");
  else
    return 0;
}

- (BOOL)allowsDefaultBehaviorForShowcaseMode:(int64_t)a3
{
  _BOOL4 v4;

  v4 = !-[PXStorySettings allowsShowcase](self, "allowsShowcase");
  return a3 != 2 || v4;
}

- (BOOL)allowsRandomFallbackForShowcaseMode:(int64_t)a3
{
  BOOL result;

  result = -[PXStorySettings allowsShowcase](self, "allowsShowcase");
  if ((unint64_t)(a3 - 1) >= 2)
    return 0;
  return result;
}

- (id)feedItemShadow
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowColor:", v4);

  objc_msgSend(v3, "setShadowOffset:", 0.0, 8.0);
  objc_msgSend(v3, "setShadowBlurRadius:", 20.0);
  if (-[PXStorySettings wantsHighContrastColors](self, "wantsHighContrastColors"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShadowColor:", v6);

  }
  return v3;
}

- (CGSize)inlinePlaybackCriticalInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PXStorySettings inlinePlaybackCriticalInsetX](self, "inlinePlaybackCriticalInsetX");
  v4 = v3;
  -[PXStorySettings inlinePlaybackCriticalInsetY](self, "inlinePlaybackCriticalInsetY");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)possibleClipCompositionsForFallback:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "availableClipCompositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("All")))
  {
    v5 = v4;
  }
  else
  {
    v9 = v3;
    PXFilter();
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v5, "count"))
  {
    +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }

  return v5;
}

- (id)possibleTransitionKindsForFallback:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    +[PXStoryTransitionsSettings supportedTransitions](PXStoryTransitionsSettings, "supportedTransitions");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
}

- (BOOL)shouldShowAppleMusicRelatedUI
{
  return !-[PXStorySettings forceFlexForPHMemory](self, "forceFlexForPHMemory")
      && !-[PXStorySettings forceFlexForNonPHMemory](self, "forceFlexForNonPHMemory")
      || -[PXStorySettings forceFlexIncludesAppleMusic](self, "forceFlexIncludesAppleMusic");
}

- (BOOL)allowsShowcase
{
  return self->_allowsShowcase;
}

- (int64_t)clipCompositionShowcaseMode
{
  return self->_clipCompositionShowcaseMode;
}

- (NSString)clipCompositionFallback
{
  return self->_clipCompositionFallback;
}

- (int64_t)transitionShowcaseMode
{
  return self->_transitionShowcaseMode;
}

- (int64_t)transitionFallback
{
  return self->_transitionFallback;
}

- (int64_t)separatorEffectsShowcaseMode
{
  return self->_separatorEffectsShowcaseMode;
}

- (int64_t)kenBurnsShowcaseMode
{
  return self->_kenBurnsShowcaseMode;
}

- (BOOL)overrideDurations
{
  return self->_overrideDurations;
}

- (double)showcaseSegmentDuration
{
  return self->_showcaseSegmentDuration;
}

- (double)showcaseTransitionDuration
{
  return self->_showcaseTransitionDuration;
}

- (BOOL)disableShowcaseBadge
{
  return self->_disableShowcaseBadge;
}

- (BOOL)includeImagesInVisualDiagnosticsForTTR
{
  return self->_includeImagesInVisualDiagnosticsForTTR;
}

- (BOOL)includeDeviceDiagnosticsForTTR
{
  return self->_includeDeviceDiagnosticsForTTR;
}

- (int64_t)simulatedError
{
  return self->_simulatedError;
}

- (BOOL)allowLimitingImagesTo3MP
{
  return self->_allowLimitingImagesTo3MP;
}

- (BOOL)allowAspectModeToggle
{
  return self->_allowAspectModeToggle;
}

- (BOOL)wantsTitles
{
  return self->_wantsTitles;
}

- (BOOL)wantsRelated
{
  return self->_wantsRelated;
}

- (BOOL)wantsResourcesPreloading
{
  return self->_wantsResourcesPreloading;
}

- (BOOL)wantsScrubber
{
  return self->_wantsScrubber;
}

- (BOOL)wantsGridLayout
{
  return self->_wantsGridLayout;
}

- (BOOL)wantsPersistence
{
  return self->_wantsPersistence;
}

- (double)persistenceConfirmationDuration
{
  return self->_persistenceConfirmationDuration;
}

- (void)setPersistenceConfirmationDuration:(double)a3
{
  self->_persistenceConfirmationDuration = a3;
}

- (BOOL)wantsAnimations
{
  return self->_wantsAnimations;
}

- (BOOL)wantsTransitions
{
  return self->_wantsTransitions;
}

- (BOOL)wantsHighContrastColors
{
  return self->_wantsHighContrastColors;
}

- (BOOL)wantsValidation
{
  return self->_wantsValidation;
}

- (BOOL)isHUDEnabled
{
  return self->_isHUDEnabled;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (BOOL)areRelatedHUDsVisible
{
  return self->_areRelatedHUDsVisible;
}

- (int64_t)defaultHUDType
{
  return self->_defaultHUDType;
}

- (BOOL)isExportHUDEnabled
{
  return self->_isExportHUDEnabled;
}

- (int64_t)exportHUDType
{
  return self->_exportHUDType;
}

- (BOOL)isFeedHUDVisible
{
  return self->_isFeedHUDVisible;
}

- (void)setIsFeedHUDVisible:(BOOL)a3
{
  self->_isFeedHUDVisible = a3;
}

- (int64_t)feedHUDType
{
  return self->_feedHUDType;
}

- (BOOL)enableDemoAction
{
  return self->_enableDemoAction;
}

- (BOOL)enableProtoPlayground
{
  return self->_enableProtoPlayground;
}

- (void)setEnableProtoPlayground:(BOOL)a3
{
  self->_enableProtoPlayground = a3;
}

- (unint64_t)preferredFullsizePaperTrailOptions
{
  return self->_preferredFullsizePaperTrailOptions;
}

- (int64_t)twoFingerTapAction
{
  return self->_twoFingerTapAction;
}

- (int64_t)swipeDownAction
{
  return self->_swipeDownAction;
}

- (double)viewModeTransitionSpringStiffness
{
  return self->_viewModeTransitionSpringStiffness;
}

- (double)viewModeTransitionAccessoryFadepoint
{
  return self->_viewModeTransitionAccessoryFadepoint;
}

- (BOOL)renderTitlesForRelated
{
  return self->_renderTitlesForRelated;
}

- (double)maximumAppBackgroundDurationBeforeAutoPause
{
  return self->_maximumAppBackgroundDurationBeforeAutoPause;
}

- (unsigned)playerPresentationType
{
  return self->_playerPresentationType;
}

- (unsigned)feedPresentationType
{
  return self->_feedPresentationType;
}

- (BOOL)allowCustomUserAssets
{
  return self->_allowCustomUserAssets;
}

- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle
{
  return self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
}

- (BOOL)shouldHideSidebarWhenDisplayed
{
  return self->_shouldHideSidebarWhenDisplayed;
}

- (int64_t)timelineProducerKind
{
  return self->_timelineProducerKind;
}

- (BOOL)allowNonFillingCompositionsForKeyAsset
{
  return self->_allowNonFillingCompositionsForKeyAsset;
}

- (BOOL)limitKeyAssetAspectRatioToFeedCard
{
  return self->_limitKeyAssetAspectRatioToFeedCard;
}

- (int64_t)keyAssetAspectRatioOverride
{
  return self->_keyAssetAspectRatioOverride;
}

- (int64_t)otherAssetsAspectRatioOverride
{
  return self->_otherAssetsAspectRatioOverride;
}

- (double)aspectFillOneUpCropTolerance
{
  return self->_aspectFillOneUpCropTolerance;
}

- (double)livePhotoSameOrientationCompactMaximumScale
{
  return self->_livePhotoSameOrientationCompactMaximumScale;
}

- (double)livePhotoSameOrientationRegularMaximumScale
{
  return self->_livePhotoSameOrientationRegularMaximumScale;
}

- (double)livePhotoOppositeOrientationCompactMaximumScale
{
  return self->_livePhotoOppositeOrientationCompactMaximumScale;
}

- (double)livePhotoOppositeOrientationRegularMaximumScale
{
  return self->_livePhotoOppositeOrientationRegularMaximumScale;
}

- (BOOL)allowsTimelineRecombination
{
  return self->_allowsTimelineRecombination;
}

- (BOOL)shouldRecombineTimelineWithSameVisibleSegments
{
  return self->_shouldRecombineTimelineWithSameVisibleSegments;
}

- (PXStoryMultipartPanoramaSettings)multipartPanoramaSettings
{
  return self->_multipartPanoramaSettings;
}

- (void)setMultipartPanoramaSettings:(id)a3
{
  objc_storeStrong((id *)&self->_multipartPanoramaSettings, a3);
}

- (PXStoryConcreteTimelineSettings)concreteTimelineSettings
{
  return self->_concreteTimelineSettings;
}

- (void)setConcreteTimelineSettings:(id)a3
{
  objc_storeStrong((id *)&self->_concreteTimelineSettings, a3);
}

- (BOOL)validationShouldWaitForTimelineToBeReadyToPlay
{
  return self->_validationShouldWaitForTimelineToBeReadyToPlay;
}

- (int64_t)timelineManagerPaperTrailLength
{
  return self->_timelineManagerPaperTrailLength;
}

- (double)estimatedMinimumDurationPerCuratedAsset
{
  return self->_estimatedMinimumDurationPerCuratedAsset;
}

- (int64_t)curatedAssetsLimit
{
  return self->_curatedAssetsLimit;
}

- (PXStoryTransitionsSettings)transitionsSettings
{
  return self->_transitionsSettings;
}

- (void)setTransitionsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transitionsSettings, a3);
}

- (BOOL)showStyleSwitcher
{
  return self->_showStyleSwitcher;
}

- (BOOL)shouldPauseInStyleSwitcher
{
  return self->_shouldPauseInStyleSwitcher;
}

- (void)setShouldPauseInStyleSwitcher:(BOOL)a3
{
  self->_shouldPauseInStyleSwitcher = a3;
}

- (BOOL)useVerboseStyleHUDText
{
  return self->_useVerboseStyleHUDText;
}

- (void)setUseVerboseStyleHUDText:(BOOL)a3
{
  self->_useVerboseStyleHUDText = a3;
}

- (BOOL)shouldStylesAlwaysIncludePersistedSong
{
  return self->_shouldStylesAlwaysIncludePersistedSong;
}

- (BOOL)useMusicCuesForPacing
{
  return self->_useMusicCuesForPacing;
}

- (BOOL)forcePacingToSegmentMaxDuration
{
  return self->_forcePacingToSegmentMaxDuration;
}

- (BOOL)adjustToWallClockTime
{
  return self->_adjustToWallClockTime;
}

- (float)musicDuckedVolume
{
  return self->_musicDuckedVolume;
}

- (float)musicBackgroundVolume
{
  return self->_musicBackgroundVolume;
}

- (float)musicFadeOutVolume
{
  return self->_musicFadeOutVolume;
}

- (BOOL)musicDemoVolumeAdjustment
{
  return self->_musicDemoVolumeAdjustment;
}

- (float)musicTargetLoudnessLKFS
{
  return self->_musicTargetLoudnessLKFS;
}

- (double)duckingFadeDuration
{
  return self->_duckingFadeDuration;
}

- (double)focusChangeFadeDuration
{
  return self->_focusChangeFadeDuration;
}

- (double)musicTouchDuckingDelay
{
  return self->_musicTouchDuckingDelay;
}

- (BOOL)useFakeAppleMusicAndPrivacyPrompt
{
  return self->_useFakeAppleMusicAndPrivacyPrompt;
}

- (void)setUseFakeAppleMusicAndPrivacyPrompt:(BOOL)a3
{
  self->_useFakeAppleMusicAndPrivacyPrompt = a3;
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (BOOL)isAppleMusicAllowed
{
  return self->_isAppleMusicAllowed;
}

- (BOOL)simulateNoAppleMusicSubscription
{
  return self->_simulateNoAppleMusicSubscription;
}

- (int64_t)musicSimulatedFailureMode
{
  return self->_musicSimulatedFailureMode;
}

- (BOOL)forceFlexForNonPHMemory
{
  return self->_forceFlexForNonPHMemory;
}

- (void)setForceFlexForNonPHMemory:(BOOL)a3
{
  self->_forceFlexForNonPHMemory = a3;
}

- (BOOL)forceFlexForPHMemory
{
  return self->_forceFlexForPHMemory;
}

- (void)setForceFlexForPHMemory:(BOOL)a3
{
  self->_forceFlexForPHMemory = a3;
}

- (BOOL)forceFlexIncludesAppleMusic
{
  return self->_forceFlexIncludesAppleMusic;
}

- (void)setForceFlexIncludesAppleMusic:(BOOL)a3
{
  self->_forceFlexIncludesAppleMusic = a3;
}

- (BOOL)allowsContinuousKenBurnsAnimations
{
  return self->_allowsContinuousKenBurnsAnimations;
}

- (double)continuousKenBurnsAnimationsTolerance
{
  return self->_continuousKenBurnsAnimationsTolerance;
}

- (BOOL)forceMinDurationKenBurnsAnimations
{
  return self->_forceMinDurationKenBurnsAnimations;
}

- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset
{
  return self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
}

- (BOOL)disableVideoPlayback
{
  return self->_disableVideoPlayback;
}

- (BOOL)forceLivePhotoVideo
{
  return self->_forceLivePhotoVideo;
}

- (BOOL)wantsMovieHighlights
{
  return self->_wantsMovieHighlights;
}

- (BOOL)useBestHighlightTrim
{
  return self->_useBestHighlightTrim;
}

- (BOOL)allowOnDemandVideoAnalysis
{
  return self->_allowOnDemandVideoAnalysis;
}

- (BOOL)videoInlineStabilization
{
  return self->_videoInlineStabilization;
}

- (BOOL)debugShowVideoPlaybackDetails
{
  return self->_debugShowVideoPlaybackDetails;
}

- (double)videoMaximumAspectFillScale
{
  return self->_videoMaximumAspectFillScale;
}

- (int64_t)livePhotoLocalVideoQuality
{
  return self->_livePhotoLocalVideoQuality;
}

- (int64_t)videoQuality
{
  return self->_videoQuality;
}

- (int64_t)exportVideoQuality
{
  return self->_exportVideoQuality;
}

- (BOOL)detectVideoLags
{
  return self->_detectVideoLags;
}

- (double)significantPlayedDuration
{
  return self->_significantPlayedDuration;
}

- (double)muteToggleButtonAutoHideDelay
{
  return self->_muteToggleButtonAutoHideDelay;
}

- (BOOL)wantsAudioFromVideo
{
  return self->_wantsAudioFromVideo;
}

- (BOOL)muteBackgroundMusic
{
  return self->_muteBackgroundMusic;
}

- (double)foregroundAudioLoudnessTarget
{
  return self->_foregroundAudioLoudnessTarget;
}

- (double)backgroundAudioLoudnessTarget
{
  return self->_backgroundAudioLoudnessTarget;
}

- (int64_t)videoAudioStrategy
{
  return self->_videoAudioStrategy;
}

- (int64_t)livePhotoAudioStrategy
{
  return self->_livePhotoAudioStrategy;
}

- (int64_t)loopingVideoAudioStrategy
{
  return self->_loopingVideoAudioStrategy;
}

- (int64_t)slomoVideoAudioStrategy
{
  return self->_slomoVideoAudioStrategy;
}

- (BOOL)wantsAudioFade
{
  return self->_wantsAudioFade;
}

- (double)audioFadeMaxDuration
{
  return self->_audioFadeMaxDuration;
}

- (double)audioFadeMinDuration
{
  return self->_audioFadeMinDuration;
}

- (int64_t)audioFadeCurve
{
  return self->_audioFadeCurve;
}

- (BOOL)wantsAudioJLCuts
{
  return self->_wantsAudioJLCuts;
}

- (int64_t)audioJCutStrategy
{
  return self->_audioJCutStrategy;
}

- (int64_t)audioLCutStrategy
{
  return self->_audioLCutStrategy;
}

- (double)audioJCutDuration
{
  return self->_audioJCutDuration;
}

- (double)audioLCutDuration
{
  return self->_audioLCutDuration;
}

- (BOOL)debugShowAudioPlaybackDetails
{
  return self->_debugShowAudioPlaybackDetails;
}

- (double)simulatedAudioCuesLoadingDelay
{
  return self->_simulatedAudioCuesLoadingDelay;
}

- (float)audioQualityMin
{
  return self->_audioQualityMin;
}

- (BOOL)wantsBufferingIndicatorOverScrubber
{
  return self->_wantsBufferingIndicatorOverScrubber;
}

- (double)noncriticalBufferingTimeout
{
  return self->_noncriticalBufferingTimeout;
}

- (double)bufferingHUDAutoPresentationTimeout
{
  return self->_bufferingHUDAutoPresentationTimeout;
}

- (BOOL)playerShowsBufferingStatus
{
  return self->_playerShowsBufferingStatus;
}

- (BOOL)simulateResourcesBufferingError
{
  return self->_simulateResourcesBufferingError;
}

- (BOOL)simulateSlowResourcesBuffering
{
  return self->_simulateSlowResourcesBuffering;
}

- (double)simulatedSlowResourcesBufferingDelay
{
  return self->_simulatedSlowResourcesBufferingDelay;
}

- (BOOL)exaggerateResourceDownloadTimes
{
  return self->_exaggerateResourceDownloadTimes;
}

- (BOOL)playbackShouldWaitForBufferingToBeReady
{
  return self->_playbackShouldWaitForBufferingToBeReady;
}

- (int64_t)simultaneousPreloadingOperationsCount
{
  return self->_simultaneousPreloadingOperationsCount;
}

- (int64_t)preloadingSegmentsBatchSize
{
  return self->_preloadingSegmentsBatchSize;
}

- (int64_t)preloadingEstimationStrategy
{
  return self->_preloadingEstimationStrategy;
}

- (int64_t)minPreloadedeSegments
{
  return self->_minPreloadedeSegments;
}

- (BOOL)preloadNonKeyRelated
{
  return self->_preloadNonKeyRelated;
}

- (BOOL)estimateTimeLeftPerPlaybackStyle
{
  return self->_estimateTimeLeftPerPlaybackStyle;
}

- (int64_t)scrubberDisplayMode
{
  return self->_scrubberDisplayMode;
}

- (BOOL)scrubberDimsMainContent
{
  return self->_scrubberDimsMainContent;
}

- (int64_t)scrubberEdgeFadeMode
{
  return self->_scrubberEdgeFadeMode;
}

- (double)scrubberEdgeFadeDistance
{
  return self->_scrubberEdgeFadeDistance;
}

- (double)scrubberEdgeFadeOffset
{
  return self->_scrubberEdgeFadeOffset;
}

- (double)scrubberAutoHideDelay
{
  return self->_scrubberAutoHideDelay;
}

- (PXStoryScrubberLayoutSettings)scrubberLayoutSettings
{
  return self->_scrubberLayoutSettings;
}

- (void)setScrubberLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberLayoutSettings, a3);
}

- (BOOL)scrubberLayoutStretchesSmallNumberOfAssets
{
  return self->_scrubberLayoutStretchesSmallNumberOfAssets;
}

- (BOOL)scrubberSelectionStartsPlayback
{
  return self->_scrubberSelectionStartsPlayback;
}

- (BOOL)chromeAllowAutoHide
{
  return self->_chromeAllowAutoHide;
}

- (double)chromeAutoHideDelay
{
  return self->_chromeAutoHideDelay;
}

- (double)legibilityGradientOpacity
{
  return self->_legibilityGradientOpacity;
}

- (BOOL)overrideLegibilityGradientHeights
{
  return self->_overrideLegibilityGradientHeights;
}

- (double)topLegibilityGradientHeight
{
  return self->_topLegibilityGradientHeight;
}

- (double)bottomLegibilityGradientHeight
{
  return self->_bottomLegibilityGradientHeight;
}

- (BOOL)useBottomLegibilityGradientForBufferingIndicator
{
  return self->_useBottomLegibilityGradientForBufferingIndicator;
}

- (double)legibilityRelatedDimming
{
  return self->_legibilityRelatedDimming;
}

- (double)legibilityPlaybackEndDimming
{
  return self->_legibilityPlaybackEndDimming;
}

- (double)legibilityPlaybackEndDimmingDuration
{
  return self->_legibilityPlaybackEndDimmingDuration;
}

- (double)legibilityPlaybackEndDimmingDurationAutoReplay
{
  return self->_legibilityPlaybackEndDimmingDurationAutoReplay;
}

- (void)setLegibilityPlaybackEndDimmingDurationAutoReplay:(double)a3
{
  self->_legibilityPlaybackEndDimmingDurationAutoReplay = a3;
}

- (double)legibilityPlaybackEndUndimmingDuration
{
  return self->_legibilityPlaybackEndUndimmingDuration;
}

- (double)legibilityPlaybackEndUndimmingDurationAutoReplay
{
  return self->_legibilityPlaybackEndUndimmingDurationAutoReplay;
}

- (void)setLegibilityPlaybackEndUndimmingDurationAutoReplay:(double)a3
{
  self->_legibilityPlaybackEndUndimmingDurationAutoReplay = a3;
}

- (NSString)playButtonRewindSymbolName
{
  return self->_playButtonRewindSymbolName;
}

- (BOOL)simulateLongChromeStrings
{
  return self->_simulateLongChromeStrings;
}

- (BOOL)preferTopChromeItemsInAppNavigationBar
{
  return self->_preferTopChromeItemsInAppNavigationBar;
}

- (double)tapNavigationAreaFraction
{
  return self->_tapNavigationAreaFraction;
}

- (int64_t)relatedProducerKind
{
  return self->_relatedProducerKind;
}

- (double)relatedProductionPlaybackFractionCompletedThreshold
{
  return self->_relatedProductionPlaybackFractionCompletedThreshold;
}

- (BOOL)allowRelatedProductionBeforeReadyToPlay
{
  return self->_allowRelatedProductionBeforeReadyToPlay;
}

- (BOOL)wantsRelatedCountdown
{
  return self->_wantsRelatedCountdown;
}

- (double)relatedAnimationDuration
{
  return self->_relatedAnimationDuration;
}

- (BOOL)smartGradientEnabled
{
  return self->_smartGradientEnabled;
}

- (BOOL)smartGradientUseSmartColor
{
  return self->_smartGradientUseSmartColor;
}

- (BOOL)smartGradientUseSimpleBlur
{
  return self->_smartGradientUseSimpleBlur;
}

- (double)smartGradientBlurRadius
{
  return self->_smartGradientBlurRadius;
}

- (double)smartGradientExposureValue
{
  return self->_smartGradientExposureValue;
}

- (BOOL)smartGradientRepeatEdges
{
  return self->_smartGradientRepeatEdges;
}

- (double)smartGradientEdgeStretchFactor
{
  return self->_smartGradientEdgeStretchFactor;
}

- (BOOL)allowsNUpBackground
{
  return self->_allowsNUpBackground;
}

- (double)backgroundQualityScale
{
  return self->_backgroundQualityScale;
}

- (int64_t)movementAnimationCurve
{
  return self->_movementAnimationCurve;
}

- (double)movementAnimationLinearFraction
{
  return self->_movementAnimationLinearFraction;
}

- (double)movementAnimationPauseDeceleration
{
  return self->_movementAnimationPauseDeceleration;
}

- (double)movementAnimationPausedVelocity
{
  return self->_movementAnimationPausedVelocity;
}

- (double)movementAnimationResumeAcceleration
{
  return self->_movementAnimationResumeAcceleration;
}

- (unint64_t)currentPPTPreset
{
  return self->_currentPPTPreset;
}

- (unint64_t)currentPPTSubpreset
{
  return self->_currentPPTSubpreset;
}

- (unint64_t)currentFeedPPTPreset
{
  return self->_currentFeedPPTPreset;
}

- (BOOL)showErrorAlertsDuringTestExecution
{
  return self->_showErrorAlertsDuringTestExecution;
}

- (BOOL)showMusicAndColorGradeEditor
{
  return self->_showMusicAndColorGradeEditor;
}

- (BOOL)disableColorGrading
{
  return self->_disableColorGrading;
}

- (int64_t)colorGradeEditorPreviewMode
{
  return self->_colorGradeEditorPreviewMode;
}

- (float)colorGradeSmoothingFactor
{
  return self->_colorGradeSmoothingFactor;
}

- (int64_t)colorGradeSmoothingPasses
{
  return self->_colorGradeSmoothingPasses;
}

- (float)colorGradeBlendingFactor
{
  return self->_colorGradeBlendingFactor;
}

- (int64_t)colorNormalizationMode
{
  return self->_colorNormalizationMode;
}

- (int64_t)colorNormalizationTechnique
{
  return self->_colorNormalizationTechnique;
}

- (BOOL)debugShowColorNormalizationValues
{
  return self->_debugShowColorNormalizationValues;
}

- (BOOL)enableFalseColorNormalization
{
  return self->_enableFalseColorNormalization;
}

- (BOOL)colorNormalizationUseColorCube
{
  return self->_colorNormalizationUseColorCube;
}

- (int64_t)colorNormalizationCubeEdgeSize
{
  return self->_colorNormalizationCubeEdgeSize;
}

- (BOOL)enableBrowseViewColorNormalization
{
  return self->_enableBrowseViewColorNormalization;
}

- (BOOL)enableScrubberColorNormalization
{
  return self->_enableScrubberColorNormalization;
}

- (BOOL)enableColorNormalizationWithoutColorGrade
{
  return self->_enableColorNormalizationWithoutColorGrade;
}

- (float)colorNormalizationIntensity
{
  return self->_colorNormalizationIntensity;
}

- (BOOL)reportColorNormalizationErrors
{
  return self->_reportColorNormalizationErrors;
}

- (BOOL)wantsFullscreenFeedExperience
{
  return self->_wantsFullscreenFeedExperience;
}

- (BOOL)showFeedChromeOnHover
{
  return self->_showFeedChromeOnHover;
}

- (BOOL)wantsInlinePlayback
{
  return self->_wantsInlinePlayback;
}

- (double)inlinePlaybackCriticalInsetX
{
  return self->_inlinePlaybackCriticalInsetX;
}

- (double)inlinePlaybackCriticalInsetY
{
  return self->_inlinePlaybackCriticalInsetY;
}

- (double)pressedScale
{
  return self->_pressedScale;
}

- (int64_t)feedInitialLimit
{
  return self->_feedInitialLimit;
}

- (double)feedCardLandscapeAspectRatio
{
  return self->_feedCardLandscapeAspectRatio;
}

- (double)feedCardPortraitAspectRatio
{
  return self->_feedCardPortraitAspectRatio;
}

- (double)feedCardWideLandscapeAspectRatio
{
  return self->_feedCardWideLandscapeAspectRatio;
}

- (double)feedItemCornerRadius
{
  return self->_feedItemCornerRadius;
}

- (BOOL)useSimpleOverlayFeedLayout
{
  return self->_useSimpleOverlayFeedLayout;
}

- (BOOL)useFeedPlaceholderItems
{
  return self->_useFeedPlaceholderItems;
}

- (BOOL)wantsFeedItemShadow
{
  return self->_wantsFeedItemShadow;
}

- (BOOL)allowsFormSheetPresentation
{
  return self->_allowsFormSheetPresentation;
}

- (int64_t)swipeDownBehavior
{
  return self->_swipeDownBehavior;
}

- (double)swipeDownDismissalDistanceThreshold
{
  return self->_swipeDownDismissalDistanceThreshold;
}

- (double)swipeDownSignificantDuration
{
  return self->_swipeDownSignificantDuration;
}

- (double)swipeDownDismissalDelay
{
  return self->_swipeDownDismissalDelay;
}

- (double)swipeDownThresholdFadeDuration
{
  return self->_swipeDownThresholdFadeDuration;
}

- (BOOL)needs79067616Workaround
{
  return self->_needs79067616Workaround;
}

- (double)autoEditDiptychCropAspectMax
{
  return self->_autoEditDiptychCropAspectMax;
}

- (double)autoEditTriptychCropAspectMax
{
  return self->_autoEditTriptychCropAspectMax;
}

- (double)autoEditPortraitAreaMin
{
  return self->_autoEditPortraitAreaMin;
}

- (double)autoEditPortraitAspectLargeVerticalFaceAreaMin
{
  return self->_autoEditPortraitAspectLargeVerticalFaceAreaMin;
}

- (int64_t)autoEditModuleLengthMax
{
  return self->_autoEditModuleLengthMax;
}

- (int64_t)autoEditRotateMotionMax
{
  return self->_autoEditRotateMotionMax;
}

- (int64_t)autoEditEmptySpaceLengthMax
{
  return self->_autoEditEmptySpaceLengthMax;
}

- (double)autoEditProductionSimulatedDelay
{
  return self->_autoEditProductionSimulatedDelay;
}

- (BOOL)autoEditDisableNUp
{
  return self->_autoEditDisableNUp;
}

- (unint64_t)disabledClipMotionStyles
{
  return self->_disabledClipMotionStyles;
}

- (void)setDisabledClipMotionStyles:(unint64_t)a3
{
  self->_disabledClipMotionStyles = a3;
}

- (int64_t)autoEditSongPaceOverride
{
  return self->_autoEditSongPaceOverride;
}

- (BOOL)autoEditUseMomentRecipes
{
  return self->_autoEditUseMomentRecipes;
}

- (double)scaleRecipeRelativeFrequency
{
  return self->_scaleRecipeRelativeFrequency;
}

- (double)panRecipeRelativeFrequency
{
  return self->_panRecipeRelativeFrequency;
}

- (double)exposeToBlackRecipeRelativeFrequency
{
  return self->_exposeToBlackRecipeRelativeFrequency;
}

- (double)autoEditSceneConfidenceThreshold
{
  return self->_autoEditSceneConfidenceThreshold;
}

- (double)autoEditHighCurationScoreThreshold
{
  return self->_autoEditHighCurationScoreThreshold;
}

- (double)autoEditDoublePlaceMultiplier
{
  return self->_autoEditDoublePlaceMultiplier;
}

- (BOOL)useReferenceWidthBasedTitleLayout
{
  return self->_useReferenceWidthBasedTitleLayout;
}

- (double)titleReferenceWidthPortrait
{
  return self->_titleReferenceWidthPortrait;
}

- (double)titleReferenceWidthLandscape
{
  return self->_titleReferenceWidthLandscape;
}

- (double)titleFeedPortraitWidthScale
{
  return self->_titleFeedPortraitWidthScale;
}

- (double)titleFeedLandscapeWidthScale
{
  return self->_titleFeedLandscapeWidthScale;
}

- (double)titleFullScreenPortraitWidthScale
{
  return self->_titleFullScreenPortraitWidthScale;
}

- (double)titleFullScreenLandscapeWidthScale
{
  return self->_titleFullScreenLandscapeWidthScale;
}

- (double)titleRegularPaddingBottomScale
{
  return self->_titleRegularPaddingBottomScale;
}

- (double)titlePaddingTopScale
{
  return self->_titlePaddingTopScale;
}

- (double)titleWidthMin
{
  return self->_titleWidthMin;
}

- (double)titleWidthMax
{
  return self->_titleWidthMax;
}

- (double)titleSizeScale
{
  return self->_titleSizeScale;
}

- (double)subtitleSizeScale
{
  return self->_subtitleSizeScale;
}

- (double)titleMinimumScale
{
  return self->_titleMinimumScale;
}

- (double)subtitleMinimumScale
{
  return self->_subtitleMinimumScale;
}

- (BOOL)titleUseCenterAlignment
{
  return self->_titleUseCenterAlignment;
}

- (double)titleFarthestDistanceThreshold
{
  return self->_titleFarthestDistanceThreshold;
}

- (BOOL)enableTitlePositioningLogs
{
  return self->_enableTitlePositioningLogs;
}

- (int64_t)titleMaximumNumberOfLines
{
  return self->_titleMaximumNumberOfLines;
}

- (int64_t)verticalTextMode
{
  return self->_verticalTextMode;
}

- (int64_t)kashidaTextMode
{
  return self->_kashidaTextMode;
}

- (BOOL)simulateSlowTextLayout
{
  return self->_simulateSlowTextLayout;
}

- (PXStoryChapterSettings)chapterSettings
{
  return self->_chapterSettings;
}

- (void)setChapterSettings:(id)a3
{
  objc_storeStrong((id *)&self->_chapterSettings, a3);
}

- (BOOL)showTVPreviewInDiagnostics
{
  return self->_showTVPreviewInDiagnostics;
}

- (double)curationScorePercentileThreshold
{
  return self->_curationScorePercentileThreshold;
}

- (double)aestheticsScorePercentileThreshold
{
  return self->_aestheticsScorePercentileThreshold;
}

- (BOOL)useCommonActionInfrastructureForActionMenu
{
  return self->_useCommonActionInfrastructureForActionMenu;
}

- (void)setUseCommonActionInfrastructureForActionMenu:(BOOL)a3
{
  self->_useCommonActionInfrastructureForActionMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterSettings, 0);
  objc_storeStrong((id *)&self->_playButtonRewindSymbolName, 0);
  objc_storeStrong((id *)&self->_scrubberLayoutSettings, 0);
  objc_storeStrong((id *)&self->_transitionsSettings, 0);
  objc_storeStrong((id *)&self->_concreteTimelineSettings, 0);
  objc_storeStrong((id *)&self->_multipartPanoramaSettings, 0);
  objc_storeStrong((id *)&self->_clipCompositionFallback, 0);
}

uint64_t __55__PXStorySettings_possibleClipCompositionsForFallback___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXStorySettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_53339 != -1)
    dispatch_once(&transientProperties_onceToken_53339, block);
  return (id)transientProperties_transientProperties_53340;
}

+ (id)possibleDefaultHUDTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "px_integersFrom:to:", 1, 18);
}

+ (id)possibleFeedHUDTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "px_integersFrom:to:", 18, 19);
}

+ (id)possiblePaperTrailOptions
{
  return &unk_1E53E8D60;
}

+ (id)availableClipCompositions
{
  return +[PXStoryClipCompositionFactory allSupportedCompositions](PXStoryClipCompositionFactory, "allSupportedCompositions");
}

+ (id)possibleClipCompositionFallbacks
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "availableClipCompositions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", CFSTR("All"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)possibleTransitionFallbacks
{
  void *v2;
  void *v3;

  +[PXStoryTransitionsSettings supportedTransitions](PXStoryTransitionsSettings, "supportedTransitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", &unk_1E53EBFD0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)possibleTransitionFallbackTitles
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "possibleTransitionFallbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)possibleNormalizationModes
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPIColorNormalizationFilterClass_softClass_53322;
  v9 = getPIColorNormalizationFilterClass_softClass_53322;
  if (!getPIColorNormalizationFilterClass_softClass_53322)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPIColorNormalizationFilterClass_block_invoke_53323;
    v5[3] = &unk_1E51482E0;
    v5[4] = &v6;
    __getPIColorNormalizationFilterClass_block_invoke_53323((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if (objc_msgSend(v3, "isAnalysisAvailable"))
    return &unk_1E53E8D78;
  else
    return &unk_1E53E8D90;
}

+ (id)possibleNormalizationTechniques
{
  return &unk_1E53E8DA8;
}

__CFString *__51__PXStorySettings_possibleTransitionFallbackTitles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 == -1)
    return CFSTR("All");
  if (v2 > 0xAu)
    v3 = CFSTR("??");
  else
    v3 = off_1E5136018[v2];
  return v3;
}

uint64_t __51__PXStorySettings_possibleClipCompositionFallbacks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

void __38__PXStorySettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___PXStorySettings;
  objc_msgSendSuper2(&v6, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fullsizePaperTrailOptions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)transientProperties_transientProperties_53340;
  transientProperties_transientProperties_53340 = v4;

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
  id v14;
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
  id v65;
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
  id v76;
  void *v77;
  id v78;
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
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
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
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  id v244;
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
  void *v418;
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
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  void *v653;
  void *v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  void *v674;
  void *v675;
  void *v676;
  void *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  void *v683;
  void *v684;
  void *v685;
  void *v686;
  void *v687;
  void *v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  void *v694;
  void *v695;
  void *v696;
  void *v697;
  void *v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  void *v705;
  void *v706;
  void *v707;
  void *v708;
  void *v709;
  void *v710;
  void *v711;
  void *v712;
  void *v713;
  void *v714;
  void *v715;
  void *v716;
  void *v717;
  void *v718;
  void *v719;
  void *v720;
  void *v721;
  void *v722;
  void *v723;
  void *v724;
  void *v725;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  void *v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  void *v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  void *v751;
  void *v752;
  void *v753;
  void *v754;
  void *v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  void *v761;
  void *v762;
  void *v763;
  void *v764;
  char *v765;
  void *v766;
  void *v767;
  void *v768;
  void *v769;
  void *v770;
  void *v771;
  void *v772;
  void *v773;
  void *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  void *v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  void *v786;
  void *v787;
  void *v788;
  void *v789;
  void *v790;
  void *v791;
  void *v792;
  void *v793;
  void *v794;
  void *v795;
  void *v796;
  void *v797;
  void *v798;
  void *v799;
  void *v800;
  void *v801;
  void *v802;
  void *v803;
  void *v804;
  void *v805;
  void *v806;
  void *v807;
  void *v808;
  void *v809;
  void *v810;
  void *v811;
  void *v812;
  void *v813;
  void *v814;
  void *v815;
  void *v816;
  void *v817;
  void *v818;
  void *v819;
  void *v820;
  void *v821;
  void *v822;
  void *v823;
  void *v824;
  void *v825;
  void *v826;
  void *v827;
  void *v828;
  void *v829;
  void *v830;
  void *v831;
  void *v832;
  void *v833;
  void *v834;
  void *v835;
  void *v836;
  void *v837;
  char *v838;
  void *v839;
  void *v840;
  void *v841;
  void *v842;
  void *v843;
  void *v844;
  void *v845;
  void *v846;
  void *v847;
  void *v848;
  void *v849;
  void *v850;
  void *v851;
  void *v852;
  void *v853;
  void *v854;
  void *v855;
  void *v856;
  void *v857;
  void *v858;
  void *v859;
  void *v860;
  void *v861;
  void *v862;
  void *v863;
  void *v864;
  void *v865;
  void *v866;
  void *v867;
  void *v868;
  void *v869;
  void *v870;
  void *v871;
  void *v872;
  void *v873;
  void *v874;
  void *v875;
  void *v876;
  void *v877;
  void *v878;
  void *v879;
  void *v880;
  void *v881;
  void *v882;
  void *v883;
  void *v884;
  void *v885;
  void *v886;
  void *v887;
  void *v888;
  void *v889;
  void *v890;
  void *v891;
  void *v892;
  void *v893;
  void *v894;
  void *v895;
  void *v896;
  void *v897;
  void *v898;
  void *v899;
  void *v900;
  void *v901;
  void *v902;
  void *v903;
  void *v904;
  void *v905;
  void *v906;
  void *v907;
  void *v908;
  void *v909;
  void *v910;
  void *v911;
  void *v912;
  void *v913;
  void *v914;
  void *v915;
  void *v916;
  void *v917;
  void *v918;
  void *v919;
  void *v920;
  void *v921;
  void *v922;
  void *v923;
  void *v924;
  void *v925;
  void *v926;
  void *v927;
  void *v928;
  void *v929;
  void *v930;
  void *v931;
  void *v932;
  void *v933;
  void *v934;
  void *v935;
  void *v936;
  void *v937;
  void *v938;
  void *v939;
  void *v940;
  void *v941;
  void *v942;
  void *v943;
  void *v944;
  void *v945;
  void *v946;
  void *v947;
  void *v948;
  void *v949;
  id v950;
  id v951;
  void *v952;
  void *v953;
  void *v954;
  void *v955;
  void *v956;
  void *v957;
  void *v958;
  void *v959;
  void *v960;
  void *v961;
  void *v962;
  void *v963;
  void *v964;
  void *v965;
  void *v966;
  void *v967;
  void *v968;
  void *v969;
  void *v970;
  void *v971;
  void *v972;
  void *v973;
  void *v974;
  void *v975;
  void *v976;
  void *v977;
  void *v978;
  void *v979;
  void *v980;
  void *v981;
  void *v982;
  void *v983;
  void *v984;
  void *v985;
  void *v986;
  void *v987;
  void *v988;
  void *v989;
  void *v990;
  void *v991;
  void *v992;
  void *v993;
  void *v994;
  void *v995;
  void *v996;
  void *v997;
  void *v998;
  void *v999;
  void *v1000;
  void *v1001;
  void *v1002;
  void *v1003;
  void *v1004;
  void *v1005;
  void *v1006;
  void *v1007;
  void *v1008;
  void *v1009;
  void *v1010;
  void *v1011;
  void *v1012;
  void *v1013;
  void *v1014;
  void *v1015;
  void *v1016;
  void *v1017;
  void *v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  void *v1022;
  void *v1023;
  void *v1024;
  void *v1025;
  void *v1026;
  void *v1027;
  void *v1028;
  void *v1029;
  void *v1030;
  void *v1031;
  void *v1032;
  void *v1033;
  void *v1034;
  void *v1035;
  void *v1036;
  void *v1037;
  void *v1038;
  void *v1039;
  void *v1040;
  void *v1041;
  void *v1042;
  void *v1043;
  void *v1044;
  void *v1045;
  void *v1046;
  void *v1047;
  void *v1048;
  void *v1049;
  void *v1050;
  void *v1051;
  void *v1052;
  void *v1053;
  void *v1054;
  void *v1055;
  void *v1056;
  void *v1057;
  void *v1058;
  void *v1059;
  void *v1060;
  void *v1061;
  void *v1062;
  void *v1063;
  void *v1064;
  void *v1065;
  void *v1066;
  void *v1067;
  void *v1068;
  void *v1069;
  void *v1070;
  void *v1071;
  void *v1072;
  void *v1073;
  void *v1074;
  void *v1075;
  void *v1076;
  void *v1077;
  void *v1078;
  void *v1079;
  void *v1080;
  void *v1081;
  void *v1082;
  void *v1083;
  void *v1084;
  void *v1085;
  void *v1086;
  void *v1087;
  void *v1088;
  void *v1089;
  void *v1090;
  void *v1091;
  void *v1092;
  void *v1093;
  void *v1094;
  void *v1095;
  void *v1096;
  void *v1097;
  void *v1098;
  void *v1099;
  void *v1100;
  void *v1101;
  void *v1102;
  void *v1103;
  void *v1104;
  void *v1105;
  void *v1106;
  void *v1107;
  void *v1108;
  void *v1109;
  void *v1110;
  void *v1111;
  void *v1112;
  void *v1113;
  void *v1114;
  void *v1115;
  void *v1116;
  void *v1117;
  void *v1118;
  void *v1119;
  void *v1120;
  void *v1121;
  void *v1122;
  void *v1123;
  void *v1124;
  void *v1125;
  void *v1126;
  void *v1127;
  void *v1128;
  void *v1129;
  void *v1130;
  void *v1131;
  void *v1132;
  void *v1133;
  void *v1134;
  void *v1135;
  void *v1136;
  void *v1137;
  void *v1138;
  void *v1139;
  void *v1140;
  void *v1141;
  void *v1142;
  void *v1143;
  void *v1144;
  void *v1145;
  void *v1146;
  void *v1147;
  void *v1148;
  void *v1149;
  void *v1150;
  void *v1151;
  void *v1152;
  void *v1153;
  void *v1154;
  char *v1155;
  void *v1156;
  void *v1157;
  void *v1158;
  void *v1159;
  void *v1160;
  void *v1161;
  void *v1162;
  void *v1163;
  void *v1164;
  void *v1165;
  void *v1166;
  void *v1167;
  void *v1168;
  void *v1169;
  void *v1170;
  void *v1171;
  void *v1172;
  void *v1173;
  void *v1174;
  void *v1175;
  void *v1176;
  void *v1177;
  void *v1178;
  void *v1179;
  void *v1180;
  void *v1181;
  void *v1182;
  void *v1183;
  void *v1184;
  void *v1185;
  void *v1186;
  void *v1187;
  void *v1188;
  void *v1189;
  void *v1190;
  void *v1191;
  void *v1192;
  void *v1193;
  void *v1194;
  void *v1195;
  void *v1196;
  void *v1197;
  void *v1198;
  void *v1199;
  void *v1200;
  void *v1201;
  void *v1202;
  void *v1203;
  void *v1204;
  void *v1205;
  void *v1206;
  void *v1207;
  void *v1208;
  void *v1209;
  void *v1210;
  void *v1211;
  void *v1212;
  void *v1213;
  char *aSelector;
  void *v1215;
  void *v1216;
  void *v1217;
  void *v1218;
  void *v1219;
  void *v1220;
  void *v1221;
  void *v1222;
  void *v1223;
  void *v1224;
  void *v1225;
  void *v1226;
  void *v1227;
  void *v1228;
  void *v1229;
  void *v1230;
  void *v1231;
  void *v1232;
  void *v1233;
  void *v1234;
  void *v1235;
  void *v1236;
  void *v1237;
  void *v1238;
  void *v1239;
  void *v1240;
  void *v1241;
  void *v1242;
  void *v1243;
  void *v1244;
  void *v1245;
  void *v1246;
  void *v1247;
  void *v1248;
  void *v1249;
  void *v1250;
  void *v1251;
  void *v1252;
  void *v1253;
  void *v1254;
  void *v1255;
  _QWORD v1256[3];
  _QWORD v1257[23];
  _QWORD v1258[18];
  _QWORD v1259[7];
  _QWORD v1260[16];
  _QWORD v1261[11];
  _QWORD v1262[5];
  void *v1263;
  _QWORD v1264[4];
  _QWORD v1265[5];
  _QWORD v1266[9];
  _QWORD v1267[6];
  void *v1268;
  _QWORD v1269[15];
  _QWORD v1270[7];
  _QWORD v1271[14];
  _QWORD v1272[21];
  _QWORD v1273[13];
  _QWORD v1274[4];
  _QWORD v1275[6];
  _QWORD v1276[15];
  _QWORD v1277[4];
  _QWORD v1278[2];
  _QWORD v1279[2];
  _QWORD v1280[18];
  void *v1281;
  void *v1282;
  _QWORD v1283[27];
  _QWORD v1284[10];
  void *v1285;
  _QWORD v1286[34];

  MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v1286[32] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_allowsShowcase);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K != 0"), v5);
  v1251 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsScrubber);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K != 0"), v7);
  v1254 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_swipeDownBehavior);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %li"), v9, 1);
  v1249 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_overrideDurations);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K != 0"), v11);
  v1252 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_overrideLegibilityGradientHeights);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K != 0"), v13);
  v1250 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = &unk_1E53E8DC0;
  +[PXStorySettings possiblePaperTrailOptions](PXStorySettings, "possiblePaperTrailOptions");
  v1253 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D83078];
  v950 = (id)MEMORY[0x1E0D83078];
  v16 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsShowcase);
  v1246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Showcase Mode"), v1246);
  v1245 = (void *)objc_claimAutoreleasedReturnValue();
  v1285 = v1245;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1285, 1);
  v1244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v1244);
  v1243 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[0] = v1243;
  v1200 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_clipCompositionShowcaseMode);
  v1242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Clip Compositions"), v1242);
  v1241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1241, "px_possibleValues:formatter:", &unk_1E53E8DC0, &__block_literal_global_218667);
  v1240 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[0] = v1240;
  v18 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_clipCompositionFallback);
  v1239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Fallback Composition(s)"), v1239);
  v1238 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  objc_msgSend(v3, "possibleClipCompositionFallbacks");
  v1237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleClipCompositionFallbackTitles");
  v1236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1238, "possibleValues:titles:", v1237, v1236);
  v1234 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_clipCompositionShowcaseMode);
  v1235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K != %li"), v1235, 0);
  v1233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1234, "condition:", v1233);
  v1232 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[1] = v1232;
  v21 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_transitionShowcaseMode);
  v1231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Transitions"), v1231);
  v1230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1230, "px_possibleValues:formatter:", &unk_1E53E8DC0, &__block_literal_global_218667);
  v1229 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[2] = v1229;
  v22 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_transitionFallback);
  v1228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Fallback Transition(s)"), v1228);
  v1227 = (void *)objc_claimAutoreleasedReturnValue();
  v1247 = v19;
  objc_msgSend(v19, "possibleTransitionFallbacks");
  v1226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleTransitionFallbackTitles");
  v1225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1227, "possibleValues:titles:", v1226, v1225);
  v1223 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_transitionShowcaseMode);
  v1224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K != %li"), v1224, 0);
  v1222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1223, "condition:", v1222);
  v1221 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[3] = v1221;
  v24 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_separatorEffectsShowcaseMode);
  v1220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Separator Effects"), v1220);
  v1219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1219, "px_possibleValues:formatter:", &unk_1E53E8DC0, &__block_literal_global_218667);
  v1218 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[4] = v1218;
  v25 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_kenBurnsShowcaseMode);
  v1217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Ken Burns"), v1217);
  v1216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1216, "px_possibleValues:formatter:", &unk_1E53E8DC0, &__block_literal_global_218667);
  v1215 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[5] = v1215;
  v26 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_overrideDurations);
  aSelector = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Override Durations"), aSelector);
  v1213 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[6] = v1213;
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_showcaseSegmentDuration);
  v1212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Segment Duration"), v1212);
  v1211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1211, "minValue:maxValue:", 1.0, 10.0);
  v1210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1210, "condition:", v1252);
  v1209 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[7] = v1209;
  v28 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_showcaseTransitionDuration);
  v1208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Transition Duration"), v1208);
  v1207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1207, "minValue:maxValue:", 0.3, 10.0);
  v1206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1206, "condition:", v1252);
  v1205 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[8] = v1205;
  v29 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableShowcaseBadge);
  v1204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Disable Badge"), v1204);
  v1203 = (void *)objc_claimAutoreleasedReturnValue();
  v1284[9] = v1203;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1284, 10);
  v1202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1200, "sectionWithRows:title:condition:", v1202, CFSTR("Showcase Mode"), v1251);
  v1201 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[1] = v1201;
  v30 = (void *)MEMORY[0x1E0D83078];
  v31 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowLimitingImagesTo3MP);
  v1199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Allow limiting images to 3MP"), v1199);
  v1198 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[0] = v1198;
  v32 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowAspectModeToggle);
  v1197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Aspect Mode Toggle"), v1197);
  v1196 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[1] = v1196;
  v33 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isHUDEnabled);
  v1195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("HUD Enabled"), v1195);
  v1194 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[2] = v1194;
  v34 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isHUDVisible);
  v1193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("HUD Visible"), v1193);
  v1191 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_isHUDEnabled);
  v1192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K != 0"), v1192);
  v1190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1191, "condition:", v1190);
  v1189 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[3] = v1189;
  v36 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_defaultHUDType);
  v1188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("HUD Type"), v1188);
  v1187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleDefaultHUDTypes");
  v1186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1187, "px_possibleValues:formatter:", v1186, &__block_literal_global_224_218683);
  v1184 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_isHUDEnabled);
  v1185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K != 0"), v1185);
  v1183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1184, "condition:", v1183);
  v1182 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[4] = v1182;
  v38 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isExportHUDEnabled);
  v1181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Export HUD Enabled"), v1181);
  v1180 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[5] = v1180;
  v39 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_exportHUDType);
  v1179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("Export HUD Type"), v1179);
  v1178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleDefaultHUDTypes");
  v1177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1178, "px_possibleValues:formatter:", v1177, &__block_literal_global_233_218686);
  v1175 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_isExportHUDEnabled);
  v1176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "predicateWithFormat:", CFSTR("%K != 0"), v1176);
  v1174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1175, "condition:", v1174);
  v1173 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[6] = v1173;
  v41 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDemoAction);
  v1172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Demo Action"), v1172);
  v1171 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[7] = v1171;
  v42 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableProtoPlayground);
  v1170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Proto Playground"), v1170);
  v1169 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[8] = v1169;
  objc_msgSend(MEMORY[0x1E0D83048], "px_rowWithTitle:action:", CFSTR("Proto Playground Settings"), &__block_literal_global_246_218690);
  v1167 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_enableProtoPlayground);
  v1168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "predicateWithFormat:", CFSTR("%K != 0"), v1168);
  v1166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1167, "condition:", v1166);
  v1165 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[9] = v1165;
  v44 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_preferredFullsizePaperTrailOptions);
  v1164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:valueKeyPath:", CFSTR("Fullsize Paper Trail"), v1164);
  v1163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1163, "px_possibleValues:formatter:", v1253, &__block_literal_global_154_218692);
  v1162 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[10] = v1162;
  v45 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsTitles);
  v1161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:valueKeyPath:", CFSTR("Titles"), v1161);
  v1160 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[11] = v1160;
  v46 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsRelated);
  v1159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Related"), v1159);
  v1158 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[12] = v1158;
  v47 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsResourcesPreloading);
  v1157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Resources Preloading"), v1157);
  v1156 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[13] = v1156;
  v48 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsScrubber);
  v1155 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Scrubber"), v1155);
  v1154 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[14] = v1154;
  v49 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsGridLayout);
  v1153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("Grid"), v1153);
  v1152 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[15] = v1152;
  v50 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsPersistence);
  v1151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Persistence"), v1151);
  v1150 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[16] = v1150;
  v51 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_persistenceConfirmationDuration);
  v1149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Persistence Confirmation Duration"), v1149);
  v1148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1148, "minValue:maxValue:", 0.0, 10.0);
  v1147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1147, "px_increment:", 0.5);
  v1146 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[17] = v1146;
  v52 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsAnimations);
  v1145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Animations"), v1145);
  v1144 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[18] = v1144;
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsHighContrastColors);
  v1143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("High Contrast Colors"), v1143);
  v1142 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[19] = v1142;
  v54 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsValidation);
  v1141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:valueKeyPath:", CFSTR("Validation"), v1141);
  v1140 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[20] = v1140;
  v55 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_twoFingerTapAction);
  v1139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Two Finger Tap"), v1139);
  v1138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1138, "possibleValues:titles:", &unk_1E53EA488, &unk_1E53EA4A0);
  v1137 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[21] = v1137;
  v56 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumAppBackgroundDurationBeforeAutoPause);
  v1136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("App Background Auto-Pause Delay"), v1136);
  v1135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1135, "minValue:maxValue:", 10.0, 300.0);
  v1134 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[22] = v1134;
  v57 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_playerPresentationType);
  v1133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:valueKeyPath:", CFSTR("Player Presentation Type"), v1133);
  v1132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1132, "possibleValues:titles:", &unk_1E53EA4B8, &unk_1E53EA4D0);
  v1131 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[23] = v1131;
  v58 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_feedPresentationType);
  v1130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:valueKeyPath:", CFSTR("Feed Presentation Type"), v1130);
  v1129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1129, "possibleValues:titles:", &unk_1E53EA4E8, &unk_1E53EA500);
  v1128 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[24] = v1128;
  v59 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowCustomUserAssets);
  v1127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "rowWithTitle:valueKeyPath:", CFSTR("Allow Custom User Assets"), v1127);
  v1126 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[25] = v1126;
  v60 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_preferAssetLocationAndCreationDateForClipTitleAndSubtitle);
  v1125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rowWithTitle:valueKeyPath:", CFSTR("Location & Date For Clip Title and Subtitle"), v1125);
  v1124 = (void *)objc_claimAutoreleasedReturnValue();
  v1283[26] = v1124;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1283, 27);
  v1123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v1123, CFSTR("General"));
  v1122 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[2] = v1122;
  v61 = (void *)MEMORY[0x1E0D83078];
  v62 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeImagesInVisualDiagnosticsForTTR);
  v1121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rowWithTitle:valueKeyPath:", CFSTR("Include photos in Visual Diagnosics"), v1121);
  v1120 = (void *)objc_claimAutoreleasedReturnValue();
  v1282 = v1120;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1282, 1);
  v1119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sectionWithRows:title:", v1119, CFSTR("Tap-To-Radar"));
  v1118 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[3] = v1118;
  v63 = (void *)MEMORY[0x1E0D83078];
  v64 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedError);
  v1117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Error"), v1117);
  v1116 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = &unk_1E53E8DD8;
  objc_msgSend(v1116, "px_possibleValues:formatter:", &unk_1E53E8DD8, &__block_literal_global_361_218715);
  v1115 = (void *)objc_claimAutoreleasedReturnValue();
  v1281 = v1115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1281, 1);
  v1114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sectionWithRows:title:", v1114, CFSTR("Errors"));
  v1113 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[4] = v1113;
  v1057 = (void *)MEMORY[0x1E0D83078];
  v66 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_timelineProducerKind);
  v1112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Producer Kind"), v1112);
  v1111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1111, "possibleValues:titles:", &unk_1E53EA518, &unk_1E53EA530);
  v1110 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[0] = v1110;
  v67 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsTimelineRecombination);
  v1109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Timeline Recombination"), v1109);
  v1108 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[1] = v1108;
  v68 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldRecombineTimelineWithSameVisibleSegments);
  v1107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:valueKeyPath:", CFSTR("Recombine with Same Visible Segments"), v1107);
  v1105 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_allowsTimelineRecombination);
  v1106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "predicateWithFormat:", CFSTR("%K != 0"), v1106);
  v1104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1105, "condition:", v1104);
  v1103 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[2] = v1103;
  v70 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_multipartPanoramaSettings);
  v1102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:childSettingsKeyPath:", CFSTR("Multipart Panoramas"), v1102);
  v1101 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[3] = v1101;
  v71 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_validationShouldWaitForTimelineToBeReadyToPlay);
  v1100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:valueKeyPath:", CFSTR("Validate When Ready"), v1100);
  v1099 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[4] = v1099;
  v72 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowNonFillingCompositionsForKeyAsset);
  v1098 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Non-Filling Key Asset"), v1098);
  v1097 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[5] = v1097;
  v73 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_limitKeyAssetAspectRatioToFeedCard);
  v1096 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Limit A/R to Card"), v1096);
  v1094 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_allowNonFillingCompositionsForKeyAsset);
  v1095 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "predicateWithFormat:", CFSTR("%K != 0"), v1095);
  v1093 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1094, "condition:", v1093);
  v1092 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[6] = v1092;
  v75 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_keyAssetAspectRatioOverride);
  v1091 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:valueKeyPath:", CFSTR("Key Asset Aspect Ratio Override"), v1091);
  v1090 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = &unk_1E53E8E38;
  objc_msgSend(v1090, "px_possibleValues:formatter:", &unk_1E53E8E38, &__block_literal_global_405);
  v1089 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[7] = v1089;
  v77 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_otherAssetsAspectRatioOverride);
  v1088 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:valueKeyPath:", CFSTR("Other Assets Aspect Ratio Override"), v1088);
  v1087 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = &unk_1E53E8E38;
  objc_msgSend(v1087, "px_possibleValues:formatter:", &unk_1E53E8E38, &__block_literal_global_411);
  v1086 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[8] = v1086;
  v79 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_aspectFillOneUpCropTolerance);
  v1085 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "rowWithTitle:valueKeyPath:", CFSTR("Aspect Fill 1-Up Crop Tolerance"), v1085);
  v1084 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1084, "minValue:maxValue:", 0.0, 1.0);
  v1083 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[9] = v1083;
  v80 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoSameOrientationCompactMaximumScale);
  v1082 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:valueKeyPath:", CFSTR("LP ||C Max Scale"), v1082);
  v1081 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1081, "minValue:maxValue:", 1.0, 3.0);
  v1080 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[10] = v1080;
  v81 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoSameOrientationRegularMaximumScale);
  v1079 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "rowWithTitle:valueKeyPath:", CFSTR("LP ||R Max Scale"), v1079);
  v1078 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1078, "minValue:maxValue:", 1.0, 3.0);
  v1077 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[11] = v1077;
  v82 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoOppositeOrientationCompactMaximumScale);
  v1076 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "rowWithTitle:valueKeyPath:", CFSTR("LP –|C Max Scale"), v1076);
  v1075 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1075, "minValue:maxValue:", 1.0, 3.0);
  v1074 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[12] = v1074;
  v83 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoOppositeOrientationRegularMaximumScale);
  v1073 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:valueKeyPath:", CFSTR("LP –|R Max Scale"), v1073);
  v1072 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1072, "minValue:maxValue:", 1.0, 3.0);
  v1071 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[13] = v1071;
  v84 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_concreteTimelineSettings);
  v1070 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rowWithTitle:childSettingsKeyPath:", CFSTR("Concrete Timeline"), v1070);
  v1069 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[14] = v1069;
  v85 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_timelineManagerPaperTrailLength);
  v1068 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rowWithTitle:valueKeyPath:", CFSTR("Paper Trail Length"), v1068);
  v1067 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1067, "px_possibleValues:", &unk_1E53EA548);
  v1066 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[15] = v1066;
  v86 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_estimatedMinimumDurationPerCuratedAsset);
  v1065 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("Estim Min Asset Duration"), v1065);
  v1064 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1064, "minValue:maxValue:", 0.0, 3.0);
  v1063 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[16] = v1063;
  v87 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_curatedAssetsLimit);
  v1062 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "rowWithTitle:valueKeyPath:", CFSTR("Curated Assets Limit"), v1062);
  v1061 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1061, "px_possibleValues:", &unk_1E53EA560);
  v1060 = (void *)objc_claimAutoreleasedReturnValue();
  v1280[17] = v1060;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1280, 18);
  v1059 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1057, "sectionWithRows:title:", v1059, CFSTR("Timeline"));
  v1058 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[5] = v1058;
  v88 = (void *)MEMORY[0x1E0D83078];
  v89 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_viewModeTransitionSpringStiffness);
  v1056 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("Spring Stiffness"), v1056);
  v1055 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1055, "minValue:maxValue:", 0.0, 300.0);
  v1054 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1054, "px_increment:", 1.0);
  v1053 = (void *)objc_claimAutoreleasedReturnValue();
  v1279[0] = v1053;
  v90 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_viewModeTransitionAccessoryFadepoint);
  v1052 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "rowWithTitle:valueKeyPath:", CFSTR("Accessory Fadepoint"), v1052);
  v1051 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1051, "minValue:maxValue:", 0.0, 1.0);
  v1050 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1050, "px_increment:", 0.05);
  v1049 = (void *)objc_claimAutoreleasedReturnValue();
  v1279[1] = v1049;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1279, 2);
  v1048 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sectionWithRows:title:", v1048, CFSTR("Player <-> Grid Transition"));
  v1047 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[6] = v1047;
  v91 = (void *)MEMORY[0x1E0D83078];
  v92 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsTransitions);
  v1046 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), v1046);
  v1045 = (void *)objc_claimAutoreleasedReturnValue();
  v1278[0] = v1045;
  v93 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_transitionsSettings);
  v1044 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "rowWithTitle:childSettingsKeyPath:", CFSTR("Transitions Settings"), v1044);
  v1043 = (void *)objc_claimAutoreleasedReturnValue();
  v1278[1] = v1043;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1278, 2);
  v1042 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "sectionWithRows:title:", v1042, CFSTR("Transitions"));
  v1041 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[7] = v1041;
  v94 = (void *)MEMORY[0x1E0D83078];
  v95 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showStyleSwitcher);
  v1040 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "rowWithTitle:valueKeyPath:", CFSTR("Show Style Switcher"), v1040);
  v1039 = (void *)objc_claimAutoreleasedReturnValue();
  v1277[0] = v1039;
  v96 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldPauseInStyleSwitcher);
  v1038 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rowWithTitle:valueKeyPath:", CFSTR("Pause In Switcher"), v1038);
  v1037 = (void *)objc_claimAutoreleasedReturnValue();
  v1277[1] = v1037;
  v97 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useVerboseStyleHUDText);
  v1036 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "rowWithTitle:valueKeyPath:", CFSTR("Verbose Style/Movement HUD Text"), v1036);
  v1035 = (void *)objc_claimAutoreleasedReturnValue();
  v1277[2] = v1035;
  v98 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldStylesAlwaysIncludePersistedSong);
  v1034 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "rowWithTitle:valueKeyPath:", CFSTR("Mixes Include Persisted Song"), v1034);
  v1033 = (void *)objc_claimAutoreleasedReturnValue();
  v1277[3] = v1033;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1277, 4);
  v1032 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sectionWithRows:title:", v1032, CFSTR("Style"));
  v1031 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[8] = v1031;
  v99 = (void *)MEMORY[0x1E0D83078];
  v100 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useMusicCuesForTimeline);
  v1030 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "rowWithTitle:valueKeyPath:", CFSTR("Timeline Sync"), v1030);
  v1029 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[0] = v1029;
  v101 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useMusicCuesForPacing);
  v1028 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Live Sync"), v1028);
  v1027 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[1] = v1027;
  v102 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forcePacingToSegmentMaxDuration);
  v1026 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "rowWithTitle:valueKeyPath:", CFSTR("Force Segment Durations To Max"), v1026);
  v1025 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[2] = v1025;
  v103 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_adjustToWallClockTime);
  v1024 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "rowWithTitle:valueKeyPath:", CFSTR("Adjust to Wall Clock Time"), v1024);
  v1023 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[3] = v1023;
  v104 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicDuckedVolume);
  v1022 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "rowWithTitle:valueKeyPath:", CFSTR("Ducked Volume"), v1022);
  v1021 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1021, "minValue:maxValue:", 0.0, 1.0);
  v1020 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[4] = v1020;
  v105 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicFadeOutVolume);
  v1019 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "rowWithTitle:valueKeyPath:", CFSTR("Fade-Out Volume"), v1019);
  v1018 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1018, "minValue:maxValue:", 0.0, 1.0);
  v1017 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[5] = v1017;
  v106 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicBackgroundVolume);
  v1016 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "rowWithTitle:valueKeyPath:", CFSTR("Background Volume"), v1016);
  v1015 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1015, "minValue:maxValue:", 0.0, 1.0);
  v1014 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[6] = v1014;
  v107 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_duckingFadeDuration);
  v1013 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "rowWithTitle:valueKeyPath:", CFSTR("Duck Fade"), v1013);
  v1012 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1012, "minValue:maxValue:", 0.3, 1.5);
  v1011 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[7] = v1011;
  v108 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicTouchDuckingDelay);
  v1010 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "rowWithTitle:valueKeyPath:", CFSTR("Touch Duck Delay"), v1010);
  v1009 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1009, "minValue:maxValue:", 0.0, 1.0);
  v1008 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[8] = v1008;
  v109 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_focusChangeFadeDuration);
  v1007 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "rowWithTitle:valueKeyPath:", CFSTR("Style Fade"), v1007);
  v1006 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1006, "minValue:maxValue:", 0.3, 1.5);
  v1005 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[9] = v1005;
  v110 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicTargetLoudnessLKFS);
  v1004 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "rowWithTitle:valueKeyPath:", CFSTR("Music Loudness LKFS"), v1004);
  v1003 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1003, "minValue:maxValue:", -60.0, 0.0);
  v1002 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[10] = v1002;
  v111 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_musicDemoVolumeAdjustment);
  v1001 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "rowWithTitle:valueKeyPath:", CFSTR("Demo Volume Adjustment"), v1001);
  v1000 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1000, "minValue:maxValue:", 0.0, 1.0);
  v999 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[11] = v999;
  v112 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_554);
  v998 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rowWithTitle:action:", CFSTR("Flex Music Library"), v998);
  v997 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[12] = v997;
  v113 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_appleMusicPromptTrigger);
  v996 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "rowWithTitle:valueKeyPath:", CFSTR("Apple Music Prompt Trigger"), v996);
  v995 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v995, "possibleValues:titles:", &unk_1E53EA578, &unk_1E53EA590);
  v994 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[13] = v994;
  v114 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useFakeAppleMusicAndPrivacyPrompt);
  v993 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "rowWithTitle:valueKeyPath:", CFSTR("Use Fake AM&P Alert"), v993);
  v992 = (void *)objc_claimAutoreleasedReturnValue();
  v1276[14] = v992;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1276, 15);
  v991 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sectionWithRows:title:", v991, CFSTR("Music"));
  v990 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[9] = v990;
  v115 = (void *)MEMORY[0x1E0D83078];
  v116 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_songsProducerKind);
  v989 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "rowWithTitle:valueKeyPath:", CFSTR("Producer Kind"), v989);
  v988 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v988, "possibleValues:titles:", &unk_1E53EA5A8, &unk_1E53EA5C0);
  v987 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[0] = v987;
  v117 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isAppleMusicAllowed);
  v986 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "rowWithTitle:valueKeyPath:", CFSTR("Allow  Music"), v986);
  v985 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[1] = v985;
  v118 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_musicSimulatedFailureMode);
  v984 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Error"), v984);
  v983 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v983, "possibleValues:titles:", &unk_1E53EA5D8, &unk_1E53EA5F0);
  v982 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[2] = v982;
  v119 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceFlexForPHMemory);
  v981 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "rowWithTitle:valueKeyPath:", CFSTR("Force Flex for PHMemory"), v981);
  v980 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[3] = v980;
  v120 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceFlexForNonPHMemory);
  v979 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "rowWithTitle:valueKeyPath:", CFSTR("Force Flex for non-PHMemory"), v979);
  v978 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[4] = v978;
  v121 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceFlexIncludesAppleMusic);
  v977 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "rowWithTitle:valueKeyPath:", CFSTR("Force Flex includes Music"), v977);
  v976 = (void *)objc_claimAutoreleasedReturnValue();
  v1275[5] = v976;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1275, 6);
  v975 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "sectionWithRows:title:", v975, CFSTR("Music Curation"));
  v974 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[10] = v974;
  v122 = (void *)MEMORY[0x1E0D83078];
  v123 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsContinuousKenBurnsAnimations);
  v973 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "rowWithTitle:valueKeyPath:", CFSTR("Continuous Animations"), v973);
  v972 = (void *)objc_claimAutoreleasedReturnValue();
  v1274[0] = v972;
  v124 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_continuousKenBurnsAnimationsTolerance);
  v971 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "rowWithTitle:valueKeyPath:", CFSTR("Tolerance"), v971);
  v970 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v970, "minValue:maxValue:", 0.0, 1.0);
  v968 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_allowsContinuousKenBurnsAnimations);
  v969 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "predicateWithFormat:", CFSTR("%K != 0"), v969);
  v967 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v968, "condition:", v967);
  v966 = (void *)objc_claimAutoreleasedReturnValue();
  v1274[1] = v966;
  v126 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceMinDurationKenBurnsAnimations);
  v965 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "rowWithTitle:valueKeyPath:", CFSTR("Force Short Animations"), v965);
  v964 = (void *)objc_claimAutoreleasedReturnValue();
  v1274[2] = v964;
  v127 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset);
  v963 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "rowWithTitle:valueKeyPath:", CFSTR("Pan Up Or Down Portrait Aspect Asset"), v963);
  v962 = (void *)objc_claimAutoreleasedReturnValue();
  v1274[3] = v962;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1274, 4);
  v961 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "sectionWithRows:title:", v961, CFSTR("Ken Burns"));
  v960 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[11] = v960;
  v128 = (void *)MEMORY[0x1E0D83078];
  v129 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableVideoPlayback);
  v959 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "rowWithTitle:valueKeyPath:", CFSTR("Disable Video Playback"), v959);
  v958 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[0] = v958;
  v130 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceLivePhotoVideo);
  v957 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "rowWithTitle:valueKeyPath:", CFSTR("Force LP Video"), v957);
  v956 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[1] = v956;
  v131 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsMovieHighlights);
  v955 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "rowWithTitle:valueKeyPath:", CFSTR("Movie Highlights"), v955);
  v954 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[2] = v954;
  v132 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useBestHighlightTrim);
  v953 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "rowWithTitle:valueKeyPath:", CFSTR("Best Highlight Trim"), v953);
  v952 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[3] = v952;
  v133 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowOnDemandVideoAnalysis);
  v949 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "rowWithTitle:valueKeyPath:", CFSTR("On-Demand Video Analysis"), v949);
  v948 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[4] = v948;
  v134 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_videoInlineStabilization);
  v947 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "rowWithTitle:valueKeyPath:", CFSTR("Inline Stabilization"), v947);
  v946 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[5] = v946;
  v135 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugShowVideoPlaybackDetails);
  v945 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "rowWithTitle:valueKeyPath:", CFSTR("Show Video Playback Details"), v945);
  v944 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[6] = v944;
  v136 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_videoMaximumAspectFillScale);
  v943 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rowWithTitle:valueKeyPath:", CFSTR("Max Aspect Fill Scale"), v943);
  v942 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v942, "minValue:maxValue:", 1.0, 2.0);
  v941 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[7] = v941;
  v137 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_livePhotoLocalVideoQuality);
  v940 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "rowWithTitle:valueKeyPath:", CFSTR("LP Local Quality"), v940);
  v939 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = &unk_1E53E8E50;
  objc_msgSend(v939, "px_possibleValues:formatter:", &unk_1E53E8E50, &__block_literal_global_152);
  v938 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[8] = v938;
  v139 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_exportVideoQuality);
  v937 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "rowWithTitle:valueKeyPath:", CFSTR("Export Quality"), v937);
  v936 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = &unk_1E53E8E50;
  objc_msgSend(v936, "px_possibleValues:formatter:", &unk_1E53E8E50, &__block_literal_global_152);
  v935 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[9] = v935;
  v141 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_videoQuality);
  v934 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "rowWithTitle:valueKeyPath:", CFSTR("Quality"), v934);
  v933 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = &unk_1E53E8E50;
  objc_msgSend(v933, "px_possibleValues:formatter:", &unk_1E53E8E50, &__block_literal_global_152);
  v932 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[10] = v932;
  v143 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_detectVideoLags);
  v931 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "rowWithTitle:valueKeyPath:", CFSTR("Detect Video Lags"), v931);
  v930 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[11] = v930;
  v144 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_significantPlayedDuration);
  v929 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "rowWithTitle:valueKeyPath:", CFSTR("Significant Played Duration"), v929);
  v928 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v928, "minValue:maxValue:", 0.0, 2.0);
  v927 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v927, "px_increment:", 0.1);
  v926 = (void *)objc_claimAutoreleasedReturnValue();
  v1273[12] = v926;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1273, 13);
  v925 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "sectionWithRows:title:", v925, CFSTR("Video"));
  v924 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[12] = v924;
  v145 = (void *)MEMORY[0x1E0D83078];
  v146 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_muteToggleButtonAutoHideDelay);
  v923 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "rowWithTitle:valueKeyPath:", CFSTR("Mute Button Auto-Hide Delay"), v923);
  v922 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v922, "minValue:maxValue:", 0.0, 10.0);
  v921 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v921, "px_increment:", 0.5);
  v920 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[0] = v920;
  v147 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsAudioFromVideo);
  v919 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "rowWithTitle:valueKeyPath:", CFSTR("Play Audio from Video"), v919);
  v918 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[1] = v918;
  v148 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_videoAudioStrategy);
  v917 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "rowWithTitle:valueKeyPath:", CFSTR("Video Audio Strategy"), v917);
  v916 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = &unk_1E53E8DF0;
  objc_msgSend(v916, "px_possibleValues:formatter:", &unk_1E53E8DF0, &__block_literal_global_704);
  v915 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[2] = v915;
  v150 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_slomoVideoAudioStrategy);
  v914 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "rowWithTitle:valueKeyPath:", CFSTR("Slomo Audio Strategy"), v914);
  v913 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = &unk_1E53E8DF0;
  objc_msgSend(v913, "px_possibleValues:formatter:", &unk_1E53E8DF0, &__block_literal_global_710);
  v912 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[3] = v912;
  v152 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_livePhotoAudioStrategy);
  v911 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "rowWithTitle:valueKeyPath:", CFSTR("Live Photo Audio Strategy"), v911);
  v910 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = &unk_1E53E8DF0;
  objc_msgSend(v910, "px_possibleValues:formatter:", &unk_1E53E8DF0, &__block_literal_global_716);
  v909 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[4] = v909;
  v154 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_loopingVideoAudioStrategy);
  v908 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "rowWithTitle:valueKeyPath:", CFSTR("Looping Video Audio Strategy"), v908);
  v907 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = &unk_1E53E8DF0;
  objc_msgSend(v907, "px_possibleValues:formatter:", &unk_1E53E8DF0, &__block_literal_global_722);
  v906 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[5] = v906;
  v156 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_muteBackgroundMusic);
  v905 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "rowWithTitle:valueKeyPath:", CFSTR("Mute Background Music"), v905);
  v904 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[6] = v904;
  v157 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_foregroundAudioLoudnessTarget);
  v903 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "rowWithTitle:valueKeyPath:", CFSTR("Loudness Target Foreground"), v903);
  v902 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v902, "minValue:maxValue:", -60.0, 0.0);
  v901 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[7] = v901;
  v158 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_backgroundAudioLoudnessTarget);
  v900 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "rowWithTitle:valueKeyPath:", CFSTR("Loudness Target Background"), v900);
  v899 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v899, "minValue:maxValue:", -60.0, 0.0);
  v898 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[8] = v898;
  v159 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsAudioFade);
  v897 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "rowWithTitle:valueKeyPath:", CFSTR("Fade Audio In/Out"), v897);
  v896 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[9] = v896;
  v160 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_audioFadeMinDuration);
  v895 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "rowWithTitle:valueKeyPath:", CFSTR("Min Fade Duration"), v895);
  v894 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v894, "minValue:maxValue:", 0.0, 1.0);
  v892 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioFade);
  v893 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "predicateWithFormat:", CFSTR("%K != 0"), v893);
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v892, "condition:", v891);
  v890 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[10] = v890;
  v162 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_audioFadeMaxDuration);
  v889 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "rowWithTitle:valueKeyPath:", CFSTR("Max Fade Duration"), v889);
  v888 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v888, "minValue:maxValue:", 0.0, 1.0);
  v886 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioFade);
  v887 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "predicateWithFormat:", CFSTR("%K != 0"), v887);
  v885 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v886, "condition:", v885);
  v884 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[11] = v884;
  v164 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_audioFadeCurve);
  v883 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "rowWithTitle:valueKeyPath:", CFSTR("Fade Curve"), v883);
  v882 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = &unk_1E53E8E20;
  objc_msgSend(v882, "px_possibleValues:formatter:", &unk_1E53E8E20, &__block_literal_global_752);
  v880 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioFade);
  v881 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "predicateWithFormat:", CFSTR("%K != 0"), v881);
  v879 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v880, "condition:", v879);
  v878 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[12] = v878;
  v167 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsAudioJLCuts);
  v877 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "rowWithTitle:valueKeyPath:", CFSTR("Enable J&L Cuts"), v877);
  v876 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[13] = v876;
  v168 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_audioJCutStrategy);
  v875 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "rowWithTitle:valueKeyPath:", CFSTR("J Cut Strategy"), v875);
  v874 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = &unk_1E53E8E08;
  objc_msgSend(v874, "px_possibleValues:formatter:", &unk_1E53E8E08, &__block_literal_global_762);
  v872 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioJLCuts);
  v873 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "predicateWithFormat:", CFSTR("%K != 0"), v873);
  v871 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v872, "condition:", v871);
  v870 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[14] = v870;
  v171 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_audioLCutStrategy);
  v869 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "rowWithTitle:valueKeyPath:", CFSTR("L Cut Strategy"), v869);
  v868 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = &unk_1E53E8E08;
  objc_msgSend(v868, "px_possibleValues:formatter:", &unk_1E53E8E08, &__block_literal_global_767);
  v866 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioJLCuts);
  v867 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "predicateWithFormat:", CFSTR("%K != 0"), v867);
  v865 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v866, "condition:", v865);
  v864 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[15] = v864;
  v174 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_audioJCutDuration);
  v863 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "rowWithTitle:valueKeyPath:", CFSTR("J Cut Duration"), v863);
  v862 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v862, "minValue:maxValue:", 0.0, 2.0);
  v860 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioJLCuts);
  v861 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "predicateWithFormat:", CFSTR("%K != 0"), v861);
  v859 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v860, "condition:", v859);
  v858 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[16] = v858;
  v176 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_audioLCutDuration);
  v857 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "rowWithTitle:valueKeyPath:", CFSTR("L Cut Duration"), v857);
  v856 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v856, "minValue:maxValue:", 0.0, 2.0);
  v854 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsAudioJLCuts);
  v855 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "predicateWithFormat:", CFSTR("%K != 0"), v855);
  v853 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v854, "condition:", v853);
  v852 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[17] = v852;
  v178 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugShowAudioPlaybackDetails);
  v851 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "rowWithTitle:valueKeyPath:", CFSTR("Show Audio Playback Details"), v851);
  v850 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[18] = v850;
  v179 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedAudioCuesLoadingDelay);
  v849 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Cues Loading Delay"), v849);
  v848 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v848, "minValue:maxValue:", 0.0, 30.0);
  v847 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[19] = v847;
  v180 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_audioQualityMin);
  v846 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "rowWithTitle:valueKeyPath:", CFSTR("Minimum Audio Score"), v846);
  v845 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v845, "minValue:maxValue:", 0.0, 1.0);
  v844 = (void *)objc_claimAutoreleasedReturnValue();
  v1272[20] = v844;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1272, 21);
  v843 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "sectionWithRows:title:", v843, CFSTR("Audio"));
  v842 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[13] = v842;
  v181 = (void *)MEMORY[0x1E0D83078];
  v182 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsBufferingIndicatorOverScrubber);
  v841 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "rowWithTitle:valueKeyPath:", CFSTR("Spinner Over Scrubber"), v841);
  v840 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[0] = v840;
  v183 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_noncriticalBufferingTimeout);
  v839 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "rowWithTitle:valueKeyPath:", CFSTR("Noncritical Buffering Timeout"), v839);
  v837 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v837, "minValue:maxValue:", 0.0, 10.0);
  v836 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[1] = v836;
  v184 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_bufferingHUDAutoPresentationTimeout);
  v835 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "rowWithTitle:valueKeyPath:", CFSTR("Show Spinner HUD After"), v835);
  v834 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v834, "minValue:maxValue:", 2.0, 20.0);
  v833 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[2] = v833;
  v185 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_playerShowsBufferingStatus);
  v832 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "rowWithTitle:valueKeyPath:", CFSTR("Player Shows Buffering Status"), v832);
  v831 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[3] = v831;
  v186 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateResourcesBufferingError);
  v830 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Assets Buffering Error"), v830);
  v829 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[4] = v829;
  v187 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSlowResourcesBuffering);
  v828 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Slow Assets Buffering"), v828);
  v827 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[5] = v827;
  v188 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedSlowResourcesBufferingDelay);
  v826 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "rowWithTitle:valueKeyPath:", CFSTR("Assets Buffering Delay"), v826);
  v825 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v825, "minValue:maxValue:", 0.0, 20.0);
  v823 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_simulateSlowResourcesBuffering);
  v824 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "predicateWithFormat:", CFSTR("%K != 0"), v824);
  v822 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v823, "condition:", v822);
  v821 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[6] = v821;
  v190 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_exaggerateResourceDownloadTimes);
  v820 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "rowWithTitle:valueKeyPath:", CFSTR("Exaggerate Resource Download Times"), v820);
  v819 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[7] = v819;
  v191 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_playbackShouldWaitForBufferingToBeReady);
  v818 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "rowWithTitle:valueKeyPath:", CFSTR("Prevents Playback"), v818);
  v817 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[8] = v817;
  v192 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simultaneousPreloadingOperationsCount);
  v816 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "rowWithTitle:valueKeyPath:", CFSTR("Simultaneous Preloading Operations"), v816);
  v815 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v815, "minValue:maxValue:", 1.0, 10.0);
  v814 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[9] = v814;
  v193 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_preloadingSegmentsBatchSize);
  v813 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "rowWithTitle:valueKeyPath:", CFSTR("Simultaneous Segments Preloading"), v813);
  v812 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v812, "minValue:maxValue:", 1.0, 4.0);
  v811 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[10] = v811;
  v194 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_preloadingEstimationStrategy);
  v810 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "rowWithTitle:valueKeyPath:", CFSTR("Estimation Strategy"), v810);
  v809 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v809, "possibleValues:titles:", &unk_1E53EA608, &unk_1E53EA620);
  v808 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[11] = v808;
  v195 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_minPreloadedeSegments);
  v807 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "rowWithTitle:valueKeyPath:", CFSTR("Min Preloaded Segments"), v807);
  v806 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v806, "minValue:maxValue:", 1.0, 8.0);
  v804 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_preloadingEstimationStrategy);
  v805 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "predicateWithFormat:", CFSTR("%K == %@"), v805, &unk_1E53EEAF0);
  v803 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v804, "condition:", v803);
  v802 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[12] = v802;
  v197 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_preloadNonKeyRelated);
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "rowWithTitle:valueKeyPath:", CFSTR("Preload Non-Key Related"), v801);
  v800 = (void *)objc_claimAutoreleasedReturnValue();
  v1271[13] = v800;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1271, 14);
  v799 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "sectionWithRows:title:", v799, CFSTR("Buffering"));
  v798 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[14] = v798;
  v198 = (void *)MEMORY[0x1E0D83078];
  v199 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_scrubberDisplayMode);
  v797 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "rowWithTitle:valueKeyPath:", CFSTR("Display Mode"), v797);
  v796 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v796, "possibleValues:titles:", &unk_1E53EA638, &unk_1E53EA650);
  v795 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[0] = v795;
  v200 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scrubberAutoHideDelay);
  v794 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "rowWithTitle:valueKeyPath:", CFSTR("Auto-Hide Delay"), v794);
  v793 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v793, "minValue:maxValue:", 0.0, 10.0);
  v792 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[1] = v792;
  v201 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_scrubberDimsMainContent);
  v791 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "rowWithTitle:valueKeyPath:", CFSTR("Dims Main Content When Present"), v791);
  v790 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[2] = v790;
  v202 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_scrubberEdgeFadeMode);
  v789 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "rowWithTitle:valueKeyPath:", CFSTR("Edge Fade Mode"), v789);
  v788 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v788, "possibleValues:titles:", &unk_1E53EA668, &unk_1E53EA680);
  v787 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[3] = v787;
  v203 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scrubberEdgeFadeDistance);
  v786 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "rowWithTitle:valueKeyPath:", CFSTR("Edge Fade Distance"), v786);
  v785 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v785, "minValue:maxValue:", 0.0, 250.0);
  v784 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[4] = v784;
  v204 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scrubberEdgeFadeOffset);
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "rowWithTitle:valueKeyPath:", CFSTR("Edge Fade Offset"), v783);
  v782 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v782, "minValue:maxValue:", 0.0, 250.0);
  v781 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[5] = v781;
  v205 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_scrubberLayoutSettings);
  v780 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "rowWithTitle:childSettingsKeyPath:", CFSTR("Layout Settings"), v780);
  v779 = (void *)objc_claimAutoreleasedReturnValue();
  v1270[6] = v779;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1270, 7);
  v778 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "sectionWithRows:title:condition:", v778, CFSTR("Scrubber"), v1254);
  v777 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[15] = v777;
  v206 = (void *)MEMORY[0x1E0D83078];
  v207 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_chromeAllowAutoHide);
  v776 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "rowWithTitle:valueKeyPath:", CFSTR("Allow Auto-Hide"), v776);
  v775 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[0] = v775;
  v208 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_chromeAutoHideDelay);
  v774 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "rowWithTitle:valueKeyPath:", CFSTR("Auto-Hide Delay"), v774);
  v773 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v773, "minValue:maxValue:", 0.0, 10.0);
  v771 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_chromeAllowAutoHide);
  v772 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "predicateWithFormat:", CFSTR("%K != 0"), v772);
  v770 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v771, "condition:", v770);
  v769 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[1] = v769;
  v210 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityGradientOpacity);
  v768 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "rowWithTitle:valueKeyPath:", CFSTR("Gradient Opacity"), v768);
  v767 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v767, "minValue:maxValue:", 0.0, 1.0);
  v766 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[2] = v766;
  v211 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_overrideLegibilityGradientHeights);
  v765 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "rowWithTitle:valueKeyPath:", CFSTR("Override Gradient Heights"), v765);
  v764 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[3] = v764;
  v212 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_topLegibilityGradientHeight);
  v763 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "rowWithTitle:valueKeyPath:", CFSTR("Top Gradient"), v763);
  v762 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v762, "minValue:maxValue:", 0.0, 300.0);
  v761 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v761, "px_increment:", 10.0);
  v760 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v760, "condition:", v1250);
  v759 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[4] = v759;
  v213 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_bottomLegibilityGradientHeight);
  v758 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "rowWithTitle:valueKeyPath:", CFSTR("Bottom Gradient"), v758);
  v757 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v757, "minValue:maxValue:", 0.0, 300.0);
  v756 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v756, "px_increment:", 10.0);
  v755 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v755, "condition:", v1250);
  v754 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[5] = v754;
  v214 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useBottomLegibilityGradientForBufferingIndicator);
  v753 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "rowWithTitle:valueKeyPath:", CFSTR("Bottom Gradient for Buffering Indicator"), v753);
  v752 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[6] = v752;
  v215 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityRelatedDimming);
  v751 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "rowWithTitle:valueKeyPath:", CFSTR("Related Dimming"), v751);
  v750 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v750, "minValue:maxValue:", 0.0, 1.0);
  v749 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[7] = v749;
  v216 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityPlaybackEndDimming);
  v748 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "rowWithTitle:valueKeyPath:", CFSTR("End Dimming"), v748);
  v747 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v747, "minValue:maxValue:", 0.0, 1.0);
  v746 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[8] = v746;
  v217 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityPlaybackEndDimmingDuration);
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "rowWithTitle:valueKeyPath:", CFSTR("End Dimming Duration"), v745);
  v744 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v744, "minValue:maxValue:", 0.0, 1.0);
  v743 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[9] = v743;
  v218 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityPlaybackEndDimmingDurationAutoReplay);
  v742 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "rowWithTitle:valueKeyPath:", CFSTR("[Loop] End Dimming Duration"), v742);
  v741 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v741, "minValue:maxValue:", 0.0, 3.0);
  v740 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[10] = v740;
  v219 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityPlaybackEndUndimmingDuration);
  v739 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "rowWithTitle:valueKeyPath:", CFSTR("End Undimming Duration"), v739);
  v738 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v738, "minValue:maxValue:", 0.0, 1.0);
  v737 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[11] = v737;
  v220 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_legibilityPlaybackEndUndimmingDurationAutoReplay);
  v736 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "rowWithTitle:valueKeyPath:", CFSTR("[Loop] End Undimming Duration"), v736);
  v735 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v735, "minValue:maxValue:", 0.0, 1.0);
  v734 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[12] = v734;
  v221 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_playButtonRewindSymbolName);
  v733 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "rowWithTitle:valueKeyPath:", CFSTR("Play Button Rewind Symbol"), v733);
  v732 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v732, "px_possibleValues:", &unk_1E53EA698);
  v731 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[13] = v731;
  v222 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateLongChromeStrings);
  v730 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Long Chrome Strings"), v730);
  v729 = (void *)objc_claimAutoreleasedReturnValue();
  v1269[14] = v729;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1269, 15);
  v728 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "sectionWithRows:title:", v728, CFSTR("Chrome"));
  v727 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[16] = v727;
  v223 = (void *)MEMORY[0x1E0D83078];
  v224 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_tapNavigationAreaFraction);
  v726 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "rowWithTitle:valueKeyPath:", CFSTR("Tappable Width"), v726);
  v725 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v725, "minValue:maxValue:", 0.0, 0.5);
  v724 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v724, "px_increment:", 0.05);
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v723, "valueStringFormatter:", &__block_literal_global_971);
  v722 = (void *)objc_claimAutoreleasedReturnValue();
  v1268 = v722;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1268, 1);
  v721 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "sectionWithRows:title:", v721, CFSTR("Side Tap Navigation"));
  v720 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[17] = v720;
  v225 = (void *)MEMORY[0x1E0D83078];
  v226 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_relatedProducerKind);
  v719 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "rowWithTitle:valueKeyPath:", CFSTR("Producer Kind"), v719);
  v718 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v718, "possibleValues:titles:", &unk_1E53EA6B0, &unk_1E53EA6C8);
  v717 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[0] = v717;
  v227 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_relatedProductionPlaybackFractionCompletedThreshold);
  v716 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "rowWithTitle:valueKeyPath:", CFSTR("Completed Playback Threshold"), v716);
  v715 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v715, "minValue:maxValue:", 0.0, 0.9);
  v714 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[1] = v714;
  v228 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowRelatedProductionBeforeReadyToPlay);
  v713 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "rowWithTitle:valueKeyPath:", CFSTR("Produce Before Playback Ready"), v713);
  v712 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[2] = v712;
  v229 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsRelatedCountdown);
  v711 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "rowWithTitle:valueKeyPath:", CFSTR("Countdown"), v711);
  v710 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[3] = v710;
  v230 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_relatedAnimationDuration);
  v709 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "rowWithTitle:valueKeyPath:", CFSTR("Animation Duration"), v709);
  v708 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v708, "minValue:maxValue:", 0.0, 2.0);
  v707 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[4] = v707;
  v231 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_areRelatedHUDsVisible);
  v706 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "rowWithTitle:valueKeyPath:", CFSTR("Related HUDs"), v706);
  v705 = (void *)objc_claimAutoreleasedReturnValue();
  v1267[5] = v705;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1267, 6);
  v704 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "sectionWithRows:title:", v704, CFSTR("Related"));
  v703 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[18] = v703;
  v232 = (void *)MEMORY[0x1E0D83078];
  v233 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_smartGradientEnabled);
  v702 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "rowWithTitle:valueKeyPath:", CFSTR("Smart Gradient"), v702);
  v701 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[0] = v701;
  v234 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_smartGradientUseSmartColor);
  v700 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "rowWithTitle:valueKeyPath:", CFSTR("Single Color Smart Gradient"), v700);
  v699 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[1] = v699;
  v235 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_smartGradientUseSimpleBlur);
  v698 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "rowWithTitle:valueKeyPath:", CFSTR("Use Simple Blur"), v698);
  v697 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[2] = v697;
  v236 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_smartGradientBlurRadius);
  v696 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "rowWithTitle:valueKeyPath:", CFSTR("Simple Blur Radius"), v696);
  v695 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v695, "minValue:maxValue:", 0.0, 100.0);
  v694 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[3] = v694;
  v237 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_smartGradientExposureValue);
  v693 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "rowWithTitle:valueKeyPath:", CFSTR("Simple Blur Exposure"), v693);
  v692 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v692, "minValue:maxValue:", -2.0, 2.0);
  v691 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[4] = v691;
  v238 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_smartGradientRepeatEdges);
  v690 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "rowWithTitle:valueKeyPath:", CFSTR("Simple Blur Edge Only"), v690);
  v689 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[5] = v689;
  v239 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_smartGradientEdgeStretchFactor);
  v688 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "rowWithTitle:valueKeyPath:", CFSTR("Edge Stretch Factor"), v688);
  v687 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v687, "minValue:maxValue:", 1.0, 10.0);
  v686 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[6] = v686;
  v240 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsNUpBackground);
  v685 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "rowWithTitle:valueKeyPath:", CFSTR("N-Up Background"), v685);
  v684 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[7] = v684;
  v241 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_backgroundQualityScale);
  v683 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "rowWithTitle:valueKeyPath:", CFSTR("Quality Scale"), v683);
  v682 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v682, "minValue:maxValue:", 0.1, 1.0);
  v681 = (void *)objc_claimAutoreleasedReturnValue();
  v1266[8] = v681;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1266, 9);
  v680 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "sectionWithRows:title:", v680, CFSTR("Background"));
  v679 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[19] = v679;
  v242 = (void *)MEMORY[0x1E0D83078];
  v243 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_movementAnimationCurve);
  v678 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "rowWithTitle:valueKeyPath:", CFSTR("Curve"), v678);
  v677 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = &unk_1E53E88F8;
  objc_msgSend(v677, "px_possibleValues:formatter:", &unk_1E53E88F8, &__block_literal_global_1047);
  v676 = (void *)objc_claimAutoreleasedReturnValue();
  v1265[0] = v676;
  v245 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_movementAnimationLinearFraction);
  v675 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "rowWithTitle:valueKeyPath:", CFSTR("Linear Fraction"), v675);
  v674 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v674, "minValue:maxValue:", 0.0, 1.0);
  v673 = (void *)objc_claimAutoreleasedReturnValue();
  v1265[1] = v673;
  v246 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_movementAnimationPauseDeceleration);
  v672 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "rowWithTitle:valueKeyPath:", CFSTR("Pause Deceleration"), v672);
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v671, "minValue:maxValue:", 0.1, 5.0);
  v670 = (void *)objc_claimAutoreleasedReturnValue();
  v1265[2] = v670;
  v247 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_movementAnimationPausedVelocity);
  v669 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "rowWithTitle:valueKeyPath:", CFSTR("Paused Velocity"), v669);
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v668, "minValue:maxValue:", 0.0, 0.9);
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  v1265[3] = v667;
  v248 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_movementAnimationResumeAcceleration);
  v666 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "rowWithTitle:valueKeyPath:", CFSTR("Resume Acceleration"), v666);
  v665 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v665, "minValue:maxValue:", 0.1, 5.0);
  v664 = (void *)objc_claimAutoreleasedReturnValue();
  v1265[4] = v664;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1265, 5);
  v663 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "sectionWithRows:title:", v663, CFSTR("Movement Animations"));
  v662 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[20] = v662;
  v249 = (void *)MEMORY[0x1E0D83078];
  v250 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_currentPPTPreset);
  v661 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "rowWithTitle:valueKeyPath:", CFSTR("Player Configuration(s)"), v661);
  v660 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryPPTPresetPossibleValues();
  v659 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v660, "px_possibleValues:formatter:", v659, &__block_literal_global_1070);
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  v1264[0] = v658;
  v251 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_currentPPTSubpreset);
  v657 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "rowWithTitle:valueKeyPath:", CFSTR("Player Subconfiguration"), v657);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryPPTSubpresetPossibleValues();
  v655 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v656, "px_possibleValues:formatter:", v655, &__block_literal_global_1075);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  v1264[1] = v654;
  v252 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_currentFeedPPTPreset);
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "rowWithTitle:valueKeyPath:", CFSTR("Feed Configuration(s)"), v653);
  v652 = (void *)objc_claimAutoreleasedReturnValue();
  PXFeedPPTPresetPossibleValues();
  v651 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v652, "px_possibleValues:formatter:", v651, &__block_literal_global_1080);
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  v1264[2] = v650;
  v253 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showErrorAlertsDuringTestExecution);
  v649 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "rowWithTitle:valueKeyPath:", CFSTR("Show Error Alerts"), v649);
  v648 = (void *)objc_claimAutoreleasedReturnValue();
  v1264[3] = v648;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1264, 4);
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "sectionWithRows:title:", v647, CFSTR("Performance Testing"));
  v646 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[21] = v646;
  v254 = (void *)MEMORY[0x1E0D83078];
  v255 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showMusicAndColorGradeEditor);
  v645 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "rowWithTitle:valueKeyPath:", CFSTR("Enable Edit Sheet"), v645);
  v644 = (void *)objc_claimAutoreleasedReturnValue();
  v1263 = v644;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1263, 1);
  v643 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "sectionWithRows:title:", v643, CFSTR("Edit Sheet"));
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[22] = v642;
  v256 = (void *)MEMORY[0x1E0D83078];
  v257 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableColorGrading);
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "rowWithTitle:valueKeyPath:", CFSTR("Disable Color Grading"), v641);
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  v1262[0] = v640;
  v258 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_colorGradeEditorPreviewMode);
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "rowWithTitle:valueKeyPath:", CFSTR("Preview Mode"), v639);
  v638 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v638, "possibleValues:titles:", &unk_1E53EA6E0, &unk_1E53EA6F8);
  v637 = (void *)objc_claimAutoreleasedReturnValue();
  v1262[1] = v637;
  v259 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_colorGradeSmoothingFactor);
  v636 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "rowWithTitle:valueKeyPath:", CFSTR("Color Grade Smoothing Amount"), v636);
  v635 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v635, "minValue:maxValue:", 0.0, 1.0);
  v634 = (void *)objc_claimAutoreleasedReturnValue();
  v1262[2] = v634;
  v260 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_colorGradeSmoothingPasses);
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "rowWithTitle:valueKeyPath:", CFSTR("Color Grade Smoothing Passes"), v633);
  v632 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v632, "minValue:maxValue:", 0.0, 10.0);
  v631 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v631, "px_increment:", 1.0);
  v630 = (void *)objc_claimAutoreleasedReturnValue();
  v1262[3] = v630;
  v261 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_colorGradeBlendingFactor);
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "rowWithTitle:valueKeyPath:", CFSTR("Color Grade Neutral Blending"), v629);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v628, "minValue:maxValue:", 0.0, 1.0);
  v627 = (void *)objc_claimAutoreleasedReturnValue();
  v1262[4] = v627;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1262, 5);
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "sectionWithRows:title:", v626, CFSTR("Color Grade"));
  v625 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[23] = v625;
  v262 = (void *)MEMORY[0x1E0D83078];
  v263 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_colorNormalizationMode);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "rowWithTitle:valueKeyPath:", CFSTR("Mode"), v624);
  v623 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1247, "possibleNormalizationModes");
  v622 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v623, "px_possibleValues:formatter:", v622, &__block_literal_global_1129);
  v621 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[0] = v621;
  v264 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_colorNormalizationTechnique);
  v620 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "rowWithTitle:valueKeyPath:", CFSTR("Technique"), v620);
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1247, "possibleNormalizationTechniques");
  v618 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v619, "px_possibleValues:formatter:", v618, &__block_literal_global_1134);
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[1] = v617;
  v265 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableScrubberColorNormalization);
  v616 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "rowWithTitle:valueKeyPath:", CFSTR("Scrubber"), v616);
  v615 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[2] = v615;
  v266 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBrowseViewColorNormalization);
  v614 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "rowWithTitle:valueKeyPath:", CFSTR("Browse View"), v614);
  v613 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[3] = v613;
  v267 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugShowColorNormalizationValues);
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "rowWithTitle:valueKeyPath:", CFSTR("Show Values in HUD"), v612);
  v611 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[4] = v611;
  v268 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFalseColorNormalization);
  v610 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "rowWithTitle:valueKeyPath:", CFSTR("False Colors"), v610);
  v609 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[5] = v609;
  v269 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_colorNormalizationUseColorCube);
  v608 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "rowWithTitle:valueKeyPath:", CFSTR("CI Adjustment Use Color Cube"), v608);
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[6] = v607;
  v270 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_colorNormalizationCubeEdgeSize);
  v606 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "rowWithTitle:valueKeyPath:", CFSTR("LUT Cube Size"), v606);
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v605, "minValue:maxValue:", 2.0, 64.0);
  v604 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v604, "px_increment:", 2.0);
  v603 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[7] = v603;
  v271 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableColorNormalizationWithoutColorGrade);
  v602 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "rowWithTitle:valueKeyPath:", CFSTR("Apply to Original"), v602);
  v601 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[8] = v601;
  v272 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_colorNormalizationIntensity);
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "rowWithTitle:valueKeyPath:", CFSTR("Intensity"), v600);
  v599 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v599, "minValue:maxValue:", 0.0, 1.0);
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[9] = v598;
  v273 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_reportColorNormalizationErrors);
  v597 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "rowWithTitle:valueKeyPath:", CFSTR("Report Errors"), v597);
  v596 = (void *)objc_claimAutoreleasedReturnValue();
  v1261[10] = v596;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1261, 11);
  v595 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "sectionWithRows:title:", v595, CFSTR("Color Normalization"));
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[24] = v594;
  v274 = (void *)MEMORY[0x1E0D83078];
  v275 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsFullscreenFeedExperience);
  v593 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "rowWithTitle:valueKeyPath:", CFSTR("Fullscreen Experience"), v593);
  v592 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[0] = v592;
  v276 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFeedChromeOnHover);
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "rowWithTitle:valueKeyPath:", CFSTR("Show Chrome on Hover"), v591);
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[1] = v590;
  v277 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsInlinePlayback);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "rowWithTitle:valueKeyPath:", CFSTR("Inline Playback"), v589);
  v588 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[2] = v588;
  v278 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_pressedScale);
  v587 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "rowWithTitle:valueKeyPath:", CFSTR("Pressed Scale"), v587);
  v586 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v586, "minValue:maxValue:", 0.7, 1.0);
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[3] = v585;
  v279 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isFeedHUDVisible);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "rowWithTitle:valueKeyPath:", CFSTR("HUD"), v584);
  v583 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[4] = v583;
  v280 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_feedHUDType);
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "rowWithTitle:valueKeyPath:", CFSTR("HUD Type"), v582);
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1247, "possibleFeedHUDTypes");
  v1248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v581, "px_possibleValues:formatter:", v1248, &__block_literal_global_1193);
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_isFeedHUDVisible);
  v580 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "predicateWithFormat:", CFSTR("%K != 0"), v580);
  v578 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v579, "condition:", v578);
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[5] = v577;
  v282 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_feedInitialLimit);
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "rowWithTitle:valueKeyPath:", CFSTR("Initial Memories"), v576);
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v575, "minValue:maxValue:", 0.0, 1000.0);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v574, "px_increment:", 100.0);
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[6] = v573;
  v283 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_feedCardLandscapeAspectRatio);
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "rowWithTitle:valueKeyPath:", CFSTR("Landscape A/R"), v572);
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v571, "minValue:maxValue:", 1.0, 2.0);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[7] = v570;
  v284 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_feedCardPortraitAspectRatio);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "rowWithTitle:valueKeyPath:", CFSTR("Portrait A/R"), v569);
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v568, "minValue:maxValue:", 0.5, 1.0);
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[8] = v567;
  v285 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_feedCardWideLandscapeAspectRatio);
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "rowWithTitle:valueKeyPath:", CFSTR("Wide Landscape A/R"), v566);
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v565, "minValue:maxValue:", 2.0, 4.0);
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[9] = v564;
  v286 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_feedItemCornerRadius);
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "rowWithTitle:valueKeyPath:", CFSTR("Item Corner Radius"), v563);
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v562, "minValue:maxValue:", 0.0, 30.0);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[10] = v561;
  v287 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSimpleOverlayFeedLayout);
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "rowWithTitle:valueKeyPath:", CFSTR("Use Simple Overlay Feed Layout"), v560);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[11] = v559;
  v288 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsFeedItemShadow);
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "rowWithTitle:valueKeyPath:", CFSTR("Item Drop Shadow"), v558);
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[12] = v557;
  v289 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_inlinePlaybackCriticalInsetX);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "rowWithTitle:valueKeyPath:", CFSTR("Playback Inset X"), v556);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v555, "minValue:maxValue:", 0.0, 1000.0);
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v554, "px_increment:", 1.0);
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[13] = v553;
  v290 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_inlinePlaybackCriticalInsetY);
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "rowWithTitle:valueKeyPath:", CFSTR("Playback Inset Y"), v552);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v551, "minValue:maxValue:", 0.0, 1000.0);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v550, "px_increment:", 1.0);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[14] = v549;
  v291 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useFeedPlaceholderItems);
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "rowWithTitle:valueKeyPath:", CFSTR("Placeholder Items"), v548);
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v1260[15] = v547;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1260, 16);
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "sectionWithRows:title:", v546, CFSTR("For You & Feed"));
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[25] = v545;
  v292 = (void *)MEMORY[0x1E0D83078];
  v293 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsFormSheetPresentation);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "rowWithTitle:valueKeyPath:", CFSTR("Sheet Presentation"), v544);
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[0] = v543;
  v294 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_swipeDownBehavior);
  v838 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "rowWithTitle:valueKeyPath:", CFSTR("Swipe Down"), v838);
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v542, "possibleValues:titles:", &unk_1E53EA710, &unk_1E53EA728);
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[1] = v541;
  v295 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_swipeDownSignificantDuration);
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "rowWithTitle:valueKeyPath:", CFSTR("Significant Duration"), v540);
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v539, "minValue:maxValue:", 0.0, 0.5);
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v538, "px_increment:", 0.01);
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v537, "condition:", v1249);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[2] = v536;
  v296 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_swipeDownDismissalDistanceThreshold);
  v535 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "rowWithTitle:valueKeyPath:", CFSTR("Distance Threshold"), v535);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v534, "minValue:maxValue:", 0.0, 600.0);
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v533, "px_increment:", 20.0);
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v532, "condition:", v1249);
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[3] = v531;
  v297 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_swipeDownDismissalDelay);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "rowWithTitle:valueKeyPath:", CFSTR("Delay"), v530);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v529, "minValue:maxValue:", 0.0, 2.0);
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v528, "px_increment:", 0.1);
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v527, "condition:", v1249);
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[4] = v526;
  v298 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_swipeDownThresholdFadeDuration);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "rowWithTitle:valueKeyPath:", CFSTR("Fade Duration"), v525);
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v524, "minValue:maxValue:", 0.0, 2.0);
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v523, "px_increment:", 0.1);
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v522, "condition:", v1249);
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[5] = v521;
  v299 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_needs79067616Workaround);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "rowWithTitle:valueKeyPath:", CFSTR("79067616 Workaround"), v520);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v1259[6] = v519;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1259, 7);
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "sectionWithRows:title:", v518, CFSTR("View Controller Transition"));
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[26] = v517;
  v300 = (void *)MEMORY[0x1E0D83078];
  v301 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditPortraitAreaMin);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "rowWithTitle:valueKeyPath:", CFSTR("Portrait Min Face Area"), v516);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v515, "minValue:maxValue:", 0.0, 1.0);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[0] = v514;
  v302 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditPortraitAspectLargeVerticalFaceAreaMin);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "rowWithTitle:valueKeyPath:", CFSTR("Portrait Aspect Asset Min Large Vertical Face Area"), v513);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v512, "minValue:maxValue:", 0.0, 1.0);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[1] = v511;
  v303 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditModuleLengthMax);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v303, "rowWithTitle:valueKeyPath:", CFSTR("Module Max Length"), v510);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v509, "minValue:maxValue:", 1.0, 20.0);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v508, "px_increment:", 1.0);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[2] = v507;
  v304 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditRotateMotionMax);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "rowWithTitle:valueKeyPath:", CFSTR("Rotate Max Length"), v506);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v505, "minValue:maxValue:", 1.0, 20.0);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v504, "px_increment:", 1.0);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[3] = v503;
  v305 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditEmptySpaceLengthMax);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "rowWithTitle:valueKeyPath:", CFSTR("Empty Space Max"), v502);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v501, "minValue:maxValue:", 1.0, 20.0);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v500, "px_increment:", 1.0);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[4] = v499;
  v306 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditDiptychCropAspectMax);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "rowWithTitle:valueKeyPath:", CFSTR("2-Up Crop Ratio"), v498);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v497, "minValue:maxValue:", 1.0, 10.0);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[5] = v496;
  v307 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditTriptychCropAspectMax);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "rowWithTitle:valueKeyPath:", CFSTR("3-Up Crop Ratio"), v495);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v494, "minValue:maxValue:", 1.0, 10.0);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[6] = v493;
  v308 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditProductionSimulatedDelay);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Delay"), v492);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v491, "minValue:maxValue:", 0.0, 30.0);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v490, "px_increment:", 1.0);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[7] = v489;
  v309 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_autoEditDisableNUp);
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v309, "rowWithTitle:valueKeyPath:", CFSTR("Disable N-Up"), v488);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[8] = v487;
  v310 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_disabledClipMotionStyles);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "rowWithTitle:valueKeyPath:", CFSTR("Disabled Motion Styles"), v486);
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v485, "possibleValues:titles:", &unk_1E53EA740, &unk_1E53EA758);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[9] = v484;
  v311 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_autoEditSongPaceOverride);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "rowWithTitle:valueKeyPath:", CFSTR("Song Pace"), v483);
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v482, "possibleValues:titles:", &unk_1E53EA770, &unk_1E53EA788);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[10] = v481;
  v312 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "rowWithTitle:valueKeyPath:", CFSTR("Use Moment Recipes"), v480);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[11] = v479;
  v313 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scaleRecipeRelativeFrequency);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "rowWithTitle:valueKeyPath:", CFSTR("Scale Recipe Relative Frequency"), v478);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v477, "minValue:maxValue:", 0.0, 1.0);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "predicateWithFormat:", CFSTR("%K != 0"), v476);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v475, "condition:", v474);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[12] = v473;
  v315 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panRecipeRelativeFrequency);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "rowWithTitle:valueKeyPath:", CFSTR("Pan Recipe Relative Frequency"), v472);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v471, "minValue:maxValue:", 0.0, 1.0);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "predicateWithFormat:", CFSTR("%K != 0"), v470);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v469, "condition:", v468);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[13] = v467;
  v317 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_exposeToBlackRecipeRelativeFrequency);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "rowWithTitle:valueKeyPath:", CFSTR("Exposure-Bleed/Fade-to-Black Recipe Relative Frequency"), v466);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v465, "minValue:maxValue:", 0.0, 1.0);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "predicateWithFormat:", CFSTR("%K != 0"), v464);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v463, "condition:", v462);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[14] = v461;
  v319 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditSceneConfidenceThreshold);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "rowWithTitle:valueKeyPath:", CFSTR("Scene Confidence Threshold"), v460);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v459, "minValue:maxValue:", 0.0, 1.0);
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "predicateWithFormat:", CFSTR("%K != 0"), v458);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v457, "condition:", v456);
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[15] = v455;
  v321 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditHighCurationScoreThreshold);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "rowWithTitle:valueKeyPath:", CFSTR("High Curation Score Threshold"), v454);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v453, "minValue:maxValue:", 0.0, 1.0);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v322, "predicateWithFormat:", CFSTR("%K != 0"), v452);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v451, "condition:", v450);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[16] = v449;
  v323 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_autoEditDoublePlaceMultiplier);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "rowWithTitle:valueKeyPath:", CFSTR("Double-Pace Multiplier"), v448);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v447, "minValue:maxValue:", 0.1, 1.0);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v324 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v324, "predicateWithFormat:", CFSTR("%K != 0"), v446);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v445, "condition:", v444);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  v1258[17] = v443;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1258, 18);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "sectionWithRows:title:", v442, CFSTR("Auto Edit"));
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[27] = v441;
  v325 = (void *)MEMORY[0x1E0D83078];
  v326 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleRegularPaddingBottomScale);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Padding Bottom Scale"), v440);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v439, "minValue:maxValue:", 0.0, 1.0);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[0] = v438;
  v327 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titlePaddingTopScale);
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "rowWithTitle:valueKeyPath:", CFSTR("Top Padding Scale"), v437);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v436, "minValue:maxValue:", 0.0, 1.0);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[1] = v435;
  v328 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleWidthMin);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v328, "rowWithTitle:valueKeyPath:", CFSTR("Width Min"), v434);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v433, "minValue:maxValue:", 0.0, 300.0);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[2] = v432;
  v329 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleWidthMax);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "rowWithTitle:valueKeyPath:", CFSTR("Width Max"), v431);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v430, "minValue:maxValue:", 0.0, 900.0);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[3] = v429;
  v330 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleMinimumScale);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "rowWithTitle:valueKeyPath:", CFSTR("Title Min Scale"), v428);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v427, "minValue:maxValue:", 0.0, 1.0);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[4] = v426;
  v331 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_subtitleMinimumScale);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v331, "rowWithTitle:valueKeyPath:", CFSTR("Subtitle Min Scale"), v425);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v424, "minValue:maxValue:", 0.0, 1.0);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[5] = v423;
  v332 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_titleUseCenterAlignment);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v332, "rowWithTitle:valueKeyPath:", CFSTR("Use Center Alignment"), v422);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[6] = v421;
  v333 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleFarthestDistanceThreshold);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v333, "rowWithTitle:valueKeyPath:", CFSTR("Farthest Distance Threshold"), v420);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v419, "minValue:maxValue:", 0.0, 2.0);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[7] = v418;
  v334 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableTitlePositioningLogs);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v334, "rowWithTitle:valueKeyPath:", CFSTR("Enable Title Positioning Logs"), v417);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[8] = v416;
  v335 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_verticalTextMode);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "rowWithTitle:valueKeyPath:", CFSTR("Vertical Text Mode"), v415);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v414, "possibleValues:titles:", &unk_1E53EA7A0, &unk_1E53EA7B8);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[9] = v413;
  v336 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_kashidaTextMode);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "rowWithTitle:valueKeyPath:", CFSTR("Kashida Mode"), v412);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "possibleValues:titles:", &unk_1E53EA7D0, &unk_1E53EA7E8);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[10] = v410;
  v337 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleMaximumNumberOfLines);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v337, "rowWithTitle:valueKeyPath:", CFSTR("Title Max num Of Lines"), v409);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v408, "minValue:maxValue:", 1.0, 5.0);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v407, "px_increment:", 1.0);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[11] = v406;
  v338 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useReferenceWidthBasedTitleLayout);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "rowWithTitle:valueKeyPath:", CFSTR("Use Reference Width Based Title Layout"), v405);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[12] = v404;
  v339 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleReferenceWidthPortrait);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "rowWithTitle:valueKeyPath:", CFSTR("Reference Width Portrait"), v403);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "minValue:maxValue:", 0.0, 500.0);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[13] = v401;
  v340 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleReferenceWidthLandscape);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v340, "rowWithTitle:valueKeyPath:", CFSTR("Reference Width Landscape"), v400);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v399, "minValue:maxValue:", 0.0, 500.0);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[14] = v398;
  v341 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleFullScreenPortraitWidthScale);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Portrait Width Scale"), v397);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "minValue:maxValue:", 0.0, 1.0);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[15] = v395;
  v342 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleFullScreenLandscapeWidthScale);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Landscape Width Scale"), v394);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v393, "minValue:maxValue:", 0.0, 1.0);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[16] = v392;
  v343 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleFeedPortraitWidthScale);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v343, "rowWithTitle:valueKeyPath:", CFSTR("Feed Portrait Width Scale"), v391);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "minValue:maxValue:", 0.0, 1.0);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[17] = v389;
  v344 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleFeedLandscapeWidthScale);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "rowWithTitle:valueKeyPath:", CFSTR("Feed Landscape Width Scale"), v388);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v387, "minValue:maxValue:", 0.0, 1.0);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[18] = v386;
  v345 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_titleSizeScale);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v345, "rowWithTitle:valueKeyPath:", CFSTR("(Old Version)Full Screen Title Font Size Scale"), v385);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v384, "minValue:maxValue:", 0.0, 4.0);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[19] = v383;
  v346 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_subtitleSizeScale);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v346, "rowWithTitle:valueKeyPath:", CFSTR("(Old Version)Full Screen Subtitle Font Size Scale"), v382);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "minValue:maxValue:", 0.0, 4.0);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[20] = v380;
  v347 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSlowTextLayout);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v347, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Slow Layout"), v379);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[21] = v378;
  v348 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_chapterSettings);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "rowWithTitle:childSettingsKeyPath:", CFSTR("Chapters"), v377);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v1257[22] = v376;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1257, 23);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v325, "sectionWithRows:title:", v375, CFSTR("Titles"));
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[28] = v374;
  v349 = (void *)MEMORY[0x1E0D83078];
  v350 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showTVPreviewInDiagnostics);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "rowWithTitle:valueKeyPath:", CFSTR("Show TV Preview in Diagnostics"), v373);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v1256[0] = v372;
  v351 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_curationScorePercentileThreshold);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "rowWithTitle:valueKeyPath:", CFSTR("Curation Score Threshold"), v371);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v370, "minValue:maxValue:", 0.0, 1.0);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v369, "px_increment:", 0.05);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v1256[1] = v368;
  v352 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_aestheticsScorePercentileThreshold);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v352, "rowWithTitle:valueKeyPath:", CFSTR("Aesthetic Score Threshold"), v367);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v366, "minValue:maxValue:", 0.0, 1.0);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v353, "px_increment:", 0.05);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v1256[2] = v354;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1256, 3);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v349, "sectionWithRows:title:", v355, CFSTR("TV Preview"));
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[29] = v356;
  v357 = (void *)MEMORY[0x1E0D83078];
  v358 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useCommonActionInfrastructureForActionMenu);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v358, "rowWithTitle:valueKeyPath:", CFSTR("Common Infra. for Menu"), v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v1255 = v360;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v1255, 1);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v357, "sectionWithRows:title:", v361, CFSTR("Actions"));
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[30] = v362;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[31] = v363;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1286, 32);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v950, "moduleWithTitle:contents:", CFSTR("Interactive Memories"), v364);
  v951 = (id)objc_claimAutoreleasedReturnValue();

  return v951;
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if ((unint64_t)(v2 - 1) > 0x12)
    return CFSTR("None");
  else
    return off_1E5136070[v2 - 1];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2;
  const __CFString *v3;

  v2 = objc_msgSend(a2, "integerValue");
  v3 = CFSTR("??");
  if (v2 == 1)
    v3 = CFSTR("CoreImage Adjustment");
  if (v2)
    return v3;
  else
    return CFSTR("Shader LUT");
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_13(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 4)
    return CFSTR("??");
  else
    return off_1E511DE98[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_12(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 4)
    return CFSTR("??");
  else
    return off_1E5144A40[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_11(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
    return CFSTR("??");
  else
    return off_1E5122088[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 7)
    return CFSTR("??");
  else
    return off_1E5122048[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 6)
    return CFSTR("??");
  else
    return off_1E511B4F0[v2];
}

uint64_t __47__PXStorySettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("%d%%"), (int)(float)(v3 * 100.0));
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
    return CFSTR("??");
  else
    return off_1E511DEF0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_6_761(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
    return CFSTR("??");
  else
    return off_1E511DEF0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_5_751(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 4)
    return CFSTR("??");
  else
    return off_1E512F410[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_4_721(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 5)
    return CFSTR("??");
  else
    return off_1E511DEC0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3_715(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 5)
    return CFSTR("??");
  else
    return off_1E511DEC0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2_709(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 5)
    return CFSTR("??");
  else
    return off_1E511DEC0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_703(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 5)
    return CFSTR("??");
  else
    return off_1E511DEC0[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 5)
    return CFSTR("??");
  else
    return off_1E511DF60[v2];
}

uint64_t __47__PXStorySettings_UI__settingsControllerModule__block_invoke_552(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  PXFlexMusicViewController *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PXFlexMusicViewController);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v3, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3_410(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 9)
    return CFSTR("??");
  else
    return off_1E511DF10[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2_404(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 9)
    return CFSTR("??");
  else
    return off_1E511DF10[v2];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_360(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
    return CFSTR("??");
  else
    return off_1E511DE78[v2];
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  return PXStoryPaperTrailOptionsDescription(objc_msgSend(a2, "integerValue"));
}

void __47__PXStorySettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = PXSoftLinkedProtoRootSettingsLoadIfNecessary(1);
  -[objc_class sharedInstance](NSClassFromString(CFSTR("PXProtoMemoriesPlayerPlaygroundSettings")), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F20], "px_viewControllerWithSettings:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", v4, 1);

}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if ((unint64_t)(v2 - 1) > 0x12)
    return CFSTR("None");
  else
    return off_1E5136070[v2 - 1];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if ((unint64_t)(v2 - 1) > 0x12)
    return CFSTR("None");
  else
    return off_1E5136070[v2 - 1];
}

const __CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 2)
    return CFSTR("??");
  else
    return off_1E511DE60[v2];
}

@end
