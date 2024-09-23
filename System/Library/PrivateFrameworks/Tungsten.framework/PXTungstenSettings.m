@implementation PXTungstenSettings

- (PXTungstenSettings)init
{
  PXTungstenSettings *v2;
  PXTungstenSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTungstenSettings;
  v2 = -[PXTungstenSettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXTungstenSettings setDefaultValues](v2, "setDefaultValues");
  return v3;
}

- (BOOL)anySpritesRectDiagnosticsEnabled
{
  return -[PXTungstenSettings enableRectDiagnosticsForUndefinedSprites](self, "enableRectDiagnosticsForUndefinedSprites")|| -[PXTungstenSettings enableRectDiagnosticsForNamedImageSprites](self, "enableRectDiagnosticsForNamedImageSprites")|| -[PXTungstenSettings enableRectDiagnosticsForDisplayAssetSprites](self, "enableRectDiagnosticsForDisplayAssetSprites")|| -[PXTungstenSettings enableRectDiagnosticsForTextSprites](self, "enableRectDiagnosticsForTextSprites")|| -[PXTungstenSettings enableRectDiagnosticsForTitleSubtitleSprites](self, "enableRectDiagnosticsForTitleSubtitleSprites")|| -[PXTungstenSettings enableRectDiagnosticsForSolidColorSprites](self, "enableRectDiagnosticsForSolidColorSprites")|| -[PXTungstenSettings enableRectDiagnosticsForGradientSprites](self, "enableRectDiagnosticsForGradientSprites")|| -[PXTungstenSettings enableRectDiagnosticsForShadowSprites](self, "enableRectDiagnosticsForShadowSprites")|| -[PXTungstenSettings enableRectDiagnosticsForDecorationSprites](self,
           "enableRectDiagnosticsForDecorationSprites")
      || -[PXTungstenSettings enableRectDiagnosticsForViewSprites](self, "enableRectDiagnosticsForViewSprites")
      || -[PXTungstenSettings enableRectDiagnosticsForPathSprites](self, "enableRectDiagnosticsForPathSprites");
}

- (void)setDefaultValues
{
  -[PXTungstenSettings setEnableXcodeCustomDebugHierarchy:](self, "setEnableXcodeCustomDebugHierarchy:", 0);
  -[PXTungstenSettings setSortSpritesInXcodeCustomDebugHierarchy:](self, "setSortSpritesInXcodeCustomDebugHierarchy:", 1);
  -[PXTungstenSettings setIncludeLayoutsLocalSpritesInDebugHierarchy:](self, "setIncludeLayoutsLocalSpritesInDebugHierarchy:", 0);
  -[PXTungstenSettings setSimulateMissingMetalDevice:](self, "setSimulateMissingMetalDevice:", 0);
  -[PXTungstenSettings setEnableMetalRenderer:](self, "setEnableMetalRenderer:", 1);
  -[PXTungstenSettings setEnableViewRenderer:](self, "setEnableViewRenderer:", 1);
  -[PXTungstenSettings setDebugExtendedColorRange:](self, "setDebugExtendedColorRange:", 0);
  -[PXTungstenSettings setDebugOpaque:](self, "setDebugOpaque:", 0);
  -[PXTungstenSettings setDebugResolution:](self, "setDebugResolution:", 0);
  -[PXTungstenSettings setDebugColorTransform:](self, "setDebugColorTransform:", 0);
  -[PXTungstenSettings setDebugSharedTextures:](self, "setDebugSharedTextures:", 0);
  -[PXTungstenSettings setDebugMipmaps:](self, "setDebugMipmaps:", 0);
  -[PXTungstenSettings setColorCachedThumbnails:](self, "setColorCachedThumbnails:", 0);
  -[PXTungstenSettings setRequestThumbnailsOnly:](self, "setRequestThumbnailsOnly:", 0);
  -[PXTungstenSettings setRequestMasterThumbsOnly:](self, "setRequestMasterThumbsOnly:", 0);
  -[PXTungstenSettings setSimulateSomeAssetsInCloud:](self, "setSimulateSomeAssetsInCloud:", 0);
  -[PXTungstenSettings setDisableLowResThumbnails:](self, "setDisableLowResThumbnails:", 0);
  -[PXTungstenSettings setThumbnailCacheSize:](self, "setThumbnailCacheSize:", 0);
  -[PXTungstenSettings setLoadThumbnailsAsync:](self, "setLoadThumbnailsAsync:", 0);
  -[PXTungstenSettings setOpportunisticPreheatRequiredIdleTime:](self, "setOpportunisticPreheatRequiredIdleTime:", 0.25);
  -[PXTungstenSettings setColorCopiedImages:](self, "setColorCopiedImages:", 0);
  -[PXTungstenSettings setLowLatency:](self, "setLowLatency:", 0);
  -[PXTungstenSettings setLowMemoryMode:](self, "setLowMemoryMode:", 0);
  -[PXTungstenSettings setInLowMemoryModePreferMasterThumb:](self, "setInLowMemoryModePreferMasterThumb:", 1);
  -[PXTungstenSettings setInactivityTimeout:](self, "setInactivityTimeout:", 0.25);
  -[PXTungstenSettings setSampleCount:](self, "setSampleCount:", 1);
  -[PXTungstenSettings setEnableColorMatching:](self, "setEnableColorMatching:", 1);
  -[PXTungstenSettings setEnableRoundedCorners:](self, "setEnableRoundedCorners:", 1);
  -[PXTungstenSettings setEnableMipmaps:](self, "setEnableMipmaps:", 0);
  -[PXTungstenSettings setSlowLayoutUpdateThreshold:](self, "setSlowLayoutUpdateThreshold:", 4.0);
  -[PXTungstenSettings setEnableFrameDebuggerCapture:](self, "setEnableFrameDebuggerCapture:", 0);
  -[PXTungstenSettings setAllowBlockingDuringScrolling:](self, "setAllowBlockingDuringScrolling:", 1);
  -[PXTungstenSettings setBlockingWhileScrollingTimeout:](self, "setBlockingWhileScrollingTimeout:", 0.0);
  -[PXTungstenSettings setBlockingWhileScrubbingTimeout:](self, "setBlockingWhileScrubbingTimeout:", 0.0);
  -[PXTungstenSettings setBlockingWhileInitialLoadTimeout:](self, "setBlockingWhileInitialLoadTimeout:", 0.0);
  -[PXTungstenSettings setAllowBlockingDueToFences:](self, "setAllowBlockingDueToFences:", 1);
  -[PXTungstenSettings setBlockOnMissingThumbnailsAtSpeedRegime:](self, "setBlockOnMissingThumbnailsAtSpeedRegime:", 3);
  -[PXTungstenSettings setVideoAllowedAtOrBelowSpeed:](self, "setVideoAllowedAtOrBelowSpeed:", 2);
  -[PXTungstenSettings setVideoAllowedAtOrBelowSpeedForLowSpec:](self, "setVideoAllowedAtOrBelowSpeedForLowSpec:", 1);
  -[PXTungstenSettings setLowSpecProcessorCountLimit:](self, "setLowSpecProcessorCountLimit:", 2);
  -[PXTungstenSettings setSlowAnimationsSpeed:](self, "setSlowAnimationsSpeed:", 0.200000003);
  -[PXTungstenSettings setTextLegibilityDimmingType:](self, "setTextLegibilityDimmingType:", 1);
  -[PXTungstenSettings setTextLegibilityDimmingStrength:](self, "setTextLegibilityDimmingStrength:", 0.7);
  -[PXTungstenSettings setMaxCornerRadius:](self, "setMaxCornerRadius:", 20.0);
  -[PXTungstenSettings setCameraZoomFactor:](self, "setCameraZoomFactor:", 1.0);
  -[PXTungstenSettings setWantsOrthogonalProjection:](self, "setWantsOrthogonalProjection:", 1);
  -[PXTungstenSettings setWantsStatsDebugHUD:](self, "setWantsStatsDebugHUD:", 0);
  -[PXTungstenSettings setWantsRectDiagnosticsDebugHUD:](self, "setWantsRectDiagnosticsDebugHUD:", 0);
  -[PXTungstenSettings setEnableAnchoringRectDiagnostics:](self, "setEnableAnchoringRectDiagnostics:", 0);
  -[PXTungstenSettings setEnableAssetsRectDiagnostics:](self, "setEnableAssetsRectDiagnostics:", 0);
  -[PXTungstenSettings setEnableFocusRectDiagnostics:](self, "setEnableFocusRectDiagnostics:", 0);
  -[PXTungstenSettings setEnableCurrentFocusRectDiagnostics:](self, "setEnableCurrentFocusRectDiagnostics:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForUndefinedSprites:](self, "setEnableRectDiagnosticsForUndefinedSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForNamedImageSprites:](self, "setEnableRectDiagnosticsForNamedImageSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForDisplayAssetSprites:](self, "setEnableRectDiagnosticsForDisplayAssetSprites:", 1);
  -[PXTungstenSettings setEnableRectDiagnosticsForTextSprites:](self, "setEnableRectDiagnosticsForTextSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForTitleSubtitleSprites:](self, "setEnableRectDiagnosticsForTitleSubtitleSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForSolidColorSprites:](self, "setEnableRectDiagnosticsForSolidColorSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForGradientSprites:](self, "setEnableRectDiagnosticsForGradientSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForShadowSprites:](self, "setEnableRectDiagnosticsForShadowSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForDecorationSprites:](self, "setEnableRectDiagnosticsForDecorationSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForViewSprites:](self, "setEnableRectDiagnosticsForViewSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForPathSprites:](self, "setEnableRectDiagnosticsForPathSprites:", 0);
  -[PXTungstenSettings setEnableRectDiagnosticsForPixelBufferSprites:](self, "setEnableRectDiagnosticsForPixelBufferSprites:", 0);
  -[PXTungstenSettings setWantsPerspectiveDebug:](self, "setWantsPerspectiveDebug:", 0);
  -[PXTungstenSettings setFullPageSnapshotMaximumNumberOfTiles:](self, "setFullPageSnapshotMaximumNumberOfTiles:", 0);
  -[PXTungstenSettings setFullPageSnapshotTileDelay:](self, "setFullPageSnapshotTileDelay:", 0.3);
  -[PXTungstenSettings setShouldShowBoundariesOfTextTextures:](self, "setShouldShowBoundariesOfTextTextures:", 0);
  -[PXTungstenSettings setLivePhotoInitialCrossfadeDuration:](self, "setLivePhotoInitialCrossfadeDuration:", 0.3);
  -[PXTungstenSettings setEnableLayoutDanglingUpdatesAssertions:](self, "setEnableLayoutDanglingUpdatesAssertions:", 1);
  -[PXTungstenSettings setEnableSublayoutUpdateCycleAssertions:](self, "setEnableSublayoutUpdateCycleAssertions:", 1);
  -[PXTungstenSettings setOffscreenTextureMaximumLifeTime:](self, "setOffscreenTextureMaximumLifeTime:", 1.0);
  -[PXTungstenSettings setEnableRenderTextureCache:](self, "setEnableRenderTextureCache:", 0);
  -[PXTungstenSettings setRenderTextureCacheCapacity:](self, "setRenderTextureCacheCapacity:", 10);
  -[PXTungstenSettings setRenderTextureCacheAgeLimit:](self, "setRenderTextureCacheAgeLimit:", 0.05);
  -[PXTungstenSettings setRenderTextureCacheSizeLimitMB:](self, "setRenderTextureCacheSizeLimitMB:", 250);
  -[PXTungstenSettings setShouldDeactivateTextureManagerWhenNotVisible:](self, "setShouldDeactivateTextureManagerWhenNotVisible:", 1);
  -[PXTungstenSettings setAllowsViewControllerTransitions:](self, "setAllowsViewControllerTransitions:", 1);
  -[PXTungstenSettings setViewControllerTransitionDuration:](self, "setViewControllerTransitionDuration:", 0.666);
  -[PXTungstenSettings setHideSummaryContentDuringTransition:](self, "setHideSummaryContentDuringTransition:", 0);
  -[PXTungstenSettings setHideDetailContentDuringTransition:](self, "setHideDetailContentDuringTransition:", 0);
  -[PXTungstenSettings setEnableTungstenKeyboardNavigation:](self, "setEnableTungstenKeyboardNavigation:", 0);
  -[PXTungstenSettings setEnableTungstenFocusEnvironmentSupport:](self, "setEnableTungstenFocusEnvironmentSupport:", 1);
  -[PXTungstenSettings setKeyboardUnselectedDimmingFactor:](self, "setKeyboardUnselectedDimmingFactor:", 0.2);
  -[PXTungstenSettings setKeyboardAnimationDuration:](self, "setKeyboardAnimationDuration:", 0.25);
  -[PXTungstenSettings setKeyboardDampingRatio:](self, "setKeyboardDampingRatio:", 0.7);
}

- (BOOL)enableXcodeCustomDebugHierarchy
{
  return self->_enableXcodeCustomDebugHierarchy;
}

- (void)setEnableXcodeCustomDebugHierarchy:(BOOL)a3
{
  self->_enableXcodeCustomDebugHierarchy = a3;
}

- (BOOL)sortSpritesInXcodeCustomDebugHierarchy
{
  return self->_sortSpritesInXcodeCustomDebugHierarchy;
}

- (void)setSortSpritesInXcodeCustomDebugHierarchy:(BOOL)a3
{
  self->_sortSpritesInXcodeCustomDebugHierarchy = a3;
}

- (BOOL)includeLayoutsLocalSpritesInDebugHierarchy
{
  return self->_includeLayoutsLocalSpritesInDebugHierarchy;
}

- (void)setIncludeLayoutsLocalSpritesInDebugHierarchy:(BOOL)a3
{
  self->_includeLayoutsLocalSpritesInDebugHierarchy = a3;
}

- (BOOL)simulateMissingMetalDevice
{
  return self->_simulateMissingMetalDevice;
}

- (void)setSimulateMissingMetalDevice:(BOOL)a3
{
  self->_simulateMissingMetalDevice = a3;
}

- (BOOL)enableMetalRenderer
{
  return self->_enableMetalRenderer;
}

- (void)setEnableMetalRenderer:(BOOL)a3
{
  self->_enableMetalRenderer = a3;
}

- (BOOL)enableViewRenderer
{
  return self->_enableViewRenderer;
}

- (void)setEnableViewRenderer:(BOOL)a3
{
  self->_enableViewRenderer = a3;
}

- (BOOL)lowLatency
{
  return self->_lowLatency;
}

- (void)setLowLatency:(BOOL)a3
{
  self->_lowLatency = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)inLowMemoryModePreferMasterThumb
{
  return self->_inLowMemoryModePreferMasterThumb;
}

- (void)setInLowMemoryModePreferMasterThumb:(BOOL)a3
{
  self->_inLowMemoryModePreferMasterThumb = a3;
}

- (double)inactivityTimeout
{
  return self->_inactivityTimeout;
}

- (void)setInactivityTimeout:(double)a3
{
  self->_inactivityTimeout = a3;
}

- (double)slowLayoutUpdateThreshold
{
  return self->_slowLayoutUpdateThreshold;
}

- (void)setSlowLayoutUpdateThreshold:(double)a3
{
  self->_slowLayoutUpdateThreshold = a3;
}

- (BOOL)enableFrameDebuggerCapture
{
  return self->_enableFrameDebuggerCapture;
}

- (void)setEnableFrameDebuggerCapture:(BOOL)a3
{
  self->_enableFrameDebuggerCapture = a3;
}

- (BOOL)enableRoundedCorners
{
  return self->_enableRoundedCorners;
}

- (void)setEnableRoundedCorners:(BOOL)a3
{
  self->_enableRoundedCorners = a3;
}

- (BOOL)enableColorMatching
{
  return self->_enableColorMatching;
}

- (void)setEnableColorMatching:(BOOL)a3
{
  self->_enableColorMatching = a3;
}

- (BOOL)enableMipmaps
{
  return self->_enableMipmaps;
}

- (void)setEnableMipmaps:(BOOL)a3
{
  self->_enableMipmaps = a3;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

- (BOOL)debugExtendedColorRange
{
  return self->_debugExtendedColorRange;
}

- (void)setDebugExtendedColorRange:(BOOL)a3
{
  self->_debugExtendedColorRange = a3;
}

- (BOOL)debugOpaque
{
  return self->_debugOpaque;
}

- (void)setDebugOpaque:(BOOL)a3
{
  self->_debugOpaque = a3;
}

- (BOOL)debugResolution
{
  return self->_debugResolution;
}

- (void)setDebugResolution:(BOOL)a3
{
  self->_debugResolution = a3;
}

- (BOOL)debugColorTransform
{
  return self->_debugColorTransform;
}

- (void)setDebugColorTransform:(BOOL)a3
{
  self->_debugColorTransform = a3;
}

- (BOOL)debugSharedTextures
{
  return self->_debugSharedTextures;
}

- (void)setDebugSharedTextures:(BOOL)a3
{
  self->_debugSharedTextures = a3;
}

- (BOOL)debugMipmaps
{
  return self->_debugMipmaps;
}

- (void)setDebugMipmaps:(BOOL)a3
{
  self->_debugMipmaps = a3;
}

- (BOOL)colorCopiedImages
{
  return self->_colorCopiedImages;
}

- (void)setColorCopiedImages:(BOOL)a3
{
  self->_colorCopiedImages = a3;
}

- (BOOL)colorCachedThumbnails
{
  return self->_colorCachedThumbnails;
}

- (void)setColorCachedThumbnails:(BOOL)a3
{
  self->_colorCachedThumbnails = a3;
}

- (BOOL)requestThumbnailsOnly
{
  return self->_requestThumbnailsOnly;
}

- (void)setRequestThumbnailsOnly:(BOOL)a3
{
  self->_requestThumbnailsOnly = a3;
}

- (BOOL)requestMasterThumbsOnly
{
  return self->_requestMasterThumbsOnly;
}

- (void)setRequestMasterThumbsOnly:(BOOL)a3
{
  self->_requestMasterThumbsOnly = a3;
}

- (BOOL)disableLowResThumbnails
{
  return self->_disableLowResThumbnails;
}

- (void)setDisableLowResThumbnails:(BOOL)a3
{
  self->_disableLowResThumbnails = a3;
}

- (BOOL)simulateSomeAssetsInCloud
{
  return self->_simulateSomeAssetsInCloud;
}

- (void)setSimulateSomeAssetsInCloud:(BOOL)a3
{
  self->_simulateSomeAssetsInCloud = a3;
}

- (BOOL)loadThumbnailsAsync
{
  return self->_loadThumbnailsAsync;
}

- (void)setLoadThumbnailsAsync:(BOOL)a3
{
  self->_loadThumbnailsAsync = a3;
}

- (int64_t)thumbnailCacheSize
{
  return self->_thumbnailCacheSize;
}

- (void)setThumbnailCacheSize:(int64_t)a3
{
  self->_thumbnailCacheSize = a3;
}

- (double)opportunisticPreheatRequiredIdleTime
{
  return self->_opportunisticPreheatRequiredIdleTime;
}

- (void)setOpportunisticPreheatRequiredIdleTime:(double)a3
{
  self->_opportunisticPreheatRequiredIdleTime = a3;
}

- (unint64_t)textLegibilityDimmingType
{
  return self->_textLegibilityDimmingType;
}

- (void)setTextLegibilityDimmingType:(unint64_t)a3
{
  self->_textLegibilityDimmingType = a3;
}

- (double)textLegibilityDimmingStrength
{
  return self->_textLegibilityDimmingStrength;
}

- (void)setTextLegibilityDimmingStrength:(double)a3
{
  self->_textLegibilityDimmingStrength = a3;
}

- (BOOL)allowBlockingDuringScrolling
{
  return self->_allowBlockingDuringScrolling;
}

- (void)setAllowBlockingDuringScrolling:(BOOL)a3
{
  self->_allowBlockingDuringScrolling = a3;
}

- (double)blockingWhileScrollingTimeout
{
  return self->_blockingWhileScrollingTimeout;
}

- (void)setBlockingWhileScrollingTimeout:(double)a3
{
  self->_blockingWhileScrollingTimeout = a3;
}

- (double)blockingWhileScrubbingTimeout
{
  return self->_blockingWhileScrubbingTimeout;
}

- (void)setBlockingWhileScrubbingTimeout:(double)a3
{
  self->_blockingWhileScrubbingTimeout = a3;
}

- (double)blockingWhileInitialLoadTimeout
{
  return self->_blockingWhileInitialLoadTimeout;
}

- (void)setBlockingWhileInitialLoadTimeout:(double)a3
{
  self->_blockingWhileInitialLoadTimeout = a3;
}

- (int64_t)blockOnMissingThumbnailsAtSpeedRegime
{
  return self->_blockOnMissingThumbnailsAtSpeedRegime;
}

- (void)setBlockOnMissingThumbnailsAtSpeedRegime:(int64_t)a3
{
  self->_blockOnMissingThumbnailsAtSpeedRegime = a3;
}

- (int64_t)videoAllowedAtOrBelowSpeed
{
  return self->_videoAllowedAtOrBelowSpeed;
}

- (void)setVideoAllowedAtOrBelowSpeed:(int64_t)a3
{
  self->_videoAllowedAtOrBelowSpeed = a3;
}

- (int64_t)videoAllowedAtOrBelowSpeedForLowSpec
{
  return self->_videoAllowedAtOrBelowSpeedForLowSpec;
}

- (void)setVideoAllowedAtOrBelowSpeedForLowSpec:(int64_t)a3
{
  self->_videoAllowedAtOrBelowSpeedForLowSpec = a3;
}

- (int64_t)lowSpecProcessorCountLimit
{
  return self->_lowSpecProcessorCountLimit;
}

- (void)setLowSpecProcessorCountLimit:(int64_t)a3
{
  self->_lowSpecProcessorCountLimit = a3;
}

- (BOOL)allowBlockingDueToFences
{
  return self->_allowBlockingDueToFences;
}

- (void)setAllowBlockingDueToFences:(BOOL)a3
{
  self->_allowBlockingDueToFences = a3;
}

- (double)slowAnimationsSpeed
{
  return self->_slowAnimationsSpeed;
}

- (void)setSlowAnimationsSpeed:(double)a3
{
  self->_slowAnimationsSpeed = a3;
}

- (double)maxCornerRadius
{
  return self->_maxCornerRadius;
}

- (void)setMaxCornerRadius:(double)a3
{
  self->_maxCornerRadius = a3;
}

- (double)cameraZoomFactor
{
  return self->_cameraZoomFactor;
}

- (void)setCameraZoomFactor:(double)a3
{
  self->_cameraZoomFactor = a3;
}

- (BOOL)wantsOrthogonalProjection
{
  return self->_wantsOrthogonalProjection;
}

- (void)setWantsOrthogonalProjection:(BOOL)a3
{
  self->_wantsOrthogonalProjection = a3;
}

- (BOOL)wantsStatsDebugHUD
{
  return self->_wantsStatsDebugHUD;
}

- (void)setWantsStatsDebugHUD:(BOOL)a3
{
  self->_wantsStatsDebugHUD = a3;
}

- (BOOL)wantsRectDiagnosticsDebugHUD
{
  return self->_wantsRectDiagnosticsDebugHUD;
}

- (void)setWantsRectDiagnosticsDebugHUD:(BOOL)a3
{
  self->_wantsRectDiagnosticsDebugHUD = a3;
}

- (BOOL)enableAnchoringRectDiagnostics
{
  return self->_enableAnchoringRectDiagnostics;
}

- (void)setEnableAnchoringRectDiagnostics:(BOOL)a3
{
  self->_enableAnchoringRectDiagnostics = a3;
}

- (BOOL)enableAssetsRectDiagnostics
{
  return self->_enableAssetsRectDiagnostics;
}

- (void)setEnableAssetsRectDiagnostics:(BOOL)a3
{
  self->_enableAssetsRectDiagnostics = a3;
}

- (BOOL)enableFocusRectDiagnostics
{
  return self->_enableFocusRectDiagnostics;
}

- (void)setEnableFocusRectDiagnostics:(BOOL)a3
{
  self->_enableFocusRectDiagnostics = a3;
}

- (BOOL)enableCurrentFocusRectDiagnostics
{
  return self->_enableCurrentFocusRectDiagnostics;
}

- (void)setEnableCurrentFocusRectDiagnostics:(BOOL)a3
{
  self->_enableCurrentFocusRectDiagnostics = a3;
}

- (BOOL)enableRectDiagnosticsForUndefinedSprites
{
  return self->_enableRectDiagnosticsForUndefinedSprites;
}

- (void)setEnableRectDiagnosticsForUndefinedSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForUndefinedSprites = a3;
}

- (BOOL)enableRectDiagnosticsForNamedImageSprites
{
  return self->_enableRectDiagnosticsForNamedImageSprites;
}

- (void)setEnableRectDiagnosticsForNamedImageSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForNamedImageSprites = a3;
}

- (BOOL)enableRectDiagnosticsForDisplayAssetSprites
{
  return self->_enableRectDiagnosticsForDisplayAssetSprites;
}

- (void)setEnableRectDiagnosticsForDisplayAssetSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForDisplayAssetSprites = a3;
}

- (BOOL)enableRectDiagnosticsForTextSprites
{
  return self->_enableRectDiagnosticsForTextSprites;
}

- (void)setEnableRectDiagnosticsForTextSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForTextSprites = a3;
}

- (BOOL)enableRectDiagnosticsForTitleSubtitleSprites
{
  return self->_enableRectDiagnosticsForTitleSubtitleSprites;
}

- (void)setEnableRectDiagnosticsForTitleSubtitleSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForTitleSubtitleSprites = a3;
}

- (BOOL)enableRectDiagnosticsForSolidColorSprites
{
  return self->_enableRectDiagnosticsForSolidColorSprites;
}

- (void)setEnableRectDiagnosticsForSolidColorSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForSolidColorSprites = a3;
}

- (BOOL)enableRectDiagnosticsForGradientSprites
{
  return self->_enableRectDiagnosticsForGradientSprites;
}

- (void)setEnableRectDiagnosticsForGradientSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForGradientSprites = a3;
}

- (BOOL)enableRectDiagnosticsForShadowSprites
{
  return self->_enableRectDiagnosticsForShadowSprites;
}

- (void)setEnableRectDiagnosticsForShadowSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForShadowSprites = a3;
}

- (BOOL)enableRectDiagnosticsForDecorationSprites
{
  return self->_enableRectDiagnosticsForDecorationSprites;
}

- (void)setEnableRectDiagnosticsForDecorationSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForDecorationSprites = a3;
}

- (BOOL)enableRectDiagnosticsForViewSprites
{
  return self->_enableRectDiagnosticsForViewSprites;
}

- (void)setEnableRectDiagnosticsForViewSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForViewSprites = a3;
}

- (BOOL)enableRectDiagnosticsForPathSprites
{
  return self->_enableRectDiagnosticsForPathSprites;
}

- (void)setEnableRectDiagnosticsForPathSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForPathSprites = a3;
}

- (BOOL)enableRectDiagnosticsForPixelBufferSprites
{
  return self->_enableRectDiagnosticsForPixelBufferSprites;
}

- (void)setEnableRectDiagnosticsForPixelBufferSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForPixelBufferSprites = a3;
}

- (BOOL)wantsPerspectiveDebug
{
  return self->_wantsPerspectiveDebug;
}

- (void)setWantsPerspectiveDebug:(BOOL)a3
{
  self->_wantsPerspectiveDebug = a3;
}

- (double)perspectiveAngle
{
  return self->_perspectiveAngle;
}

- (void)setPerspectiveAngle:(double)a3
{
  self->_perspectiveAngle = a3;
}

- (int64_t)fullPageSnapshotMaximumNumberOfTiles
{
  return self->_fullPageSnapshotMaximumNumberOfTiles;
}

- (void)setFullPageSnapshotMaximumNumberOfTiles:(int64_t)a3
{
  self->_fullPageSnapshotMaximumNumberOfTiles = a3;
}

- (double)fullPageSnapshotTileDelay
{
  return self->_fullPageSnapshotTileDelay;
}

- (void)setFullPageSnapshotTileDelay:(double)a3
{
  self->_fullPageSnapshotTileDelay = a3;
}

- (BOOL)shouldShowBoundariesOfTextTextures
{
  return self->_shouldShowBoundariesOfTextTextures;
}

- (void)setShouldShowBoundariesOfTextTextures:(BOOL)a3
{
  self->_shouldShowBoundariesOfTextTextures = a3;
}

- (double)livePhotoInitialCrossfadeDuration
{
  return self->_livePhotoInitialCrossfadeDuration;
}

- (void)setLivePhotoInitialCrossfadeDuration:(double)a3
{
  self->_livePhotoInitialCrossfadeDuration = a3;
}

- (BOOL)enableLayoutDanglingUpdatesAssertions
{
  return self->_enableLayoutDanglingUpdatesAssertions;
}

- (void)setEnableLayoutDanglingUpdatesAssertions:(BOOL)a3
{
  self->_enableLayoutDanglingUpdatesAssertions = a3;
}

- (BOOL)enableSublayoutUpdateCycleAssertions
{
  return self->_enableSublayoutUpdateCycleAssertions;
}

- (void)setEnableSublayoutUpdateCycleAssertions:(BOOL)a3
{
  self->_enableSublayoutUpdateCycleAssertions = a3;
}

- (double)offscreenTextureMaximumLifeTime
{
  return self->_offscreenTextureMaximumLifeTime;
}

- (void)setOffscreenTextureMaximumLifeTime:(double)a3
{
  self->_offscreenTextureMaximumLifeTime = a3;
}

- (BOOL)enableRenderTextureCache
{
  return self->_enableRenderTextureCache;
}

- (void)setEnableRenderTextureCache:(BOOL)a3
{
  self->_enableRenderTextureCache = a3;
}

- (unint64_t)renderTextureCacheCapacity
{
  return self->_renderTextureCacheCapacity;
}

- (void)setRenderTextureCacheCapacity:(unint64_t)a3
{
  self->_renderTextureCacheCapacity = a3;
}

- (double)renderTextureCacheAgeLimit
{
  return self->_renderTextureCacheAgeLimit;
}

- (void)setRenderTextureCacheAgeLimit:(double)a3
{
  self->_renderTextureCacheAgeLimit = a3;
}

- (unint64_t)renderTextureCacheSizeLimitMB
{
  return self->_renderTextureCacheSizeLimitMB;
}

- (void)setRenderTextureCacheSizeLimitMB:(unint64_t)a3
{
  self->_renderTextureCacheSizeLimitMB = a3;
}

- (BOOL)shouldDeactivateTextureManagerWhenNotVisible
{
  return self->_shouldDeactivateTextureManagerWhenNotVisible;
}

- (void)setShouldDeactivateTextureManagerWhenNotVisible:(BOOL)a3
{
  self->_shouldDeactivateTextureManagerWhenNotVisible = a3;
}

- (BOOL)allowsViewControllerTransitions
{
  return self->_allowsViewControllerTransitions;
}

- (void)setAllowsViewControllerTransitions:(BOOL)a3
{
  self->_allowsViewControllerTransitions = a3;
}

- (double)viewControllerTransitionDuration
{
  return self->_viewControllerTransitionDuration;
}

- (void)setViewControllerTransitionDuration:(double)a3
{
  self->_viewControllerTransitionDuration = a3;
}

- (BOOL)hideSummaryContentDuringTransition
{
  return self->_hideSummaryContentDuringTransition;
}

- (void)setHideSummaryContentDuringTransition:(BOOL)a3
{
  self->_hideSummaryContentDuringTransition = a3;
}

- (BOOL)hideDetailContentDuringTransition
{
  return self->_hideDetailContentDuringTransition;
}

- (void)setHideDetailContentDuringTransition:(BOOL)a3
{
  self->_hideDetailContentDuringTransition = a3;
}

- (BOOL)enableTungstenKeyboardNavigation
{
  return self->_enableTungstenKeyboardNavigation;
}

- (void)setEnableTungstenKeyboardNavigation:(BOOL)a3
{
  self->_enableTungstenKeyboardNavigation = a3;
}

- (BOOL)enableTungstenFocusEnvironmentSupport
{
  return self->_enableTungstenFocusEnvironmentSupport;
}

- (void)setEnableTungstenFocusEnvironmentSupport:(BOOL)a3
{
  self->_enableTungstenFocusEnvironmentSupport = a3;
}

- (double)keyboardUnselectedDimmingFactor
{
  return self->_keyboardUnselectedDimmingFactor;
}

- (void)setKeyboardUnselectedDimmingFactor:(double)a3
{
  self->_keyboardUnselectedDimmingFactor = a3;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

- (void)setKeyboardAnimationDuration:(double)a3
{
  self->_keyboardAnimationDuration = a3;
}

- (double)keyboardDampingRatio
{
  return self->_keyboardDampingRatio;
}

- (void)setKeyboardDampingRatio:(double)a3
{
  self->_keyboardDampingRatio = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_618);
  return (id)sharedInstance__sharedInstance;
}

void __36__PXTungstenSettings_sharedInstance__block_invoke()
{
  PXTungstenSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PXTungstenSettings);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
