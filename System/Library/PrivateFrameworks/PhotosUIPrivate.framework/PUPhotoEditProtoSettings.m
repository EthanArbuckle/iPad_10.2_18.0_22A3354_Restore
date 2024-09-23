@implementation PUPhotoEditProtoSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditProtoSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[PUPhotoEditProtoSettings setEnableVideoStabilizion:](self, "setEnableVideoStabilizion:", 0);
  -[PUPhotoEditProtoSettings setVideoStabilizeMaxCropFraction:](self, "setVideoStabilizeMaxCropFraction:", 0.2);
  -[PUPhotoEditProtoSettings setEnableFinalizerGesture:](self, "setEnableFinalizerGesture:", 0);
  -[PUPhotoEditProtoSettings setUseAsynchronousRenderingPhotos:](self, "setUseAsynchronousRenderingPhotos:", 0);
  -[PUPhotoEditProtoSettings setDisableAsynchronousRenderingVideos:](self, "setDisableAsynchronousRenderingVideos:", 0);
  -[PUPhotoEditProtoSettings setEnableLiveVideoRender:](self, "setEnableLiveVideoRender:", +[PUPhotoEditProtoSettings isCapableOfLivePhotoRender](PUPhotoEditProtoSettings, "isCapableOfLivePhotoRender"));
  -[PUPhotoEditProtoSettings setEnableLiveVideoRenderAtSetSize:](self, "setEnableLiveVideoRenderAtSetSize:", 0);
  -[PUPhotoEditProtoSettings setEnableDynamicVideoScaling:](self, "setEnableDynamicVideoScaling:", 0);
  -[PUPhotoEditProtoSettings setAlwaysShowPortraitV2:](self, "setAlwaysShowPortraitV2:", 0);
  -[PUPhotoEditProtoSettings setUseEditToastProgress:](self, "setUseEditToastProgress:", 1);
  -[PUPhotoEditProtoSettings setAllowSynchronousBatchRendering:](self, "setAllowSynchronousBatchRendering:", 1);
  -[PUPhotoEditProtoSettings setShowResetToolButton:](self, "setShowResetToolButton:", 0);
  -[PUPhotoEditProtoSettings setEnableSelectiveCopyEdits:](self, "setEnableSelectiveCopyEdits:", 1);
  -[PUPhotoEditProtoSettings setAllowAnyPlugin:](self, "setAllowAnyPlugin:", 0);
  -[PUPhotoEditProtoSettings setAttemptEditExtensionUndoAutoSetup:](self, "setAttemptEditExtensionUndoAutoSetup:", 0);
  -[PUPhotoEditProtoSettings setCropSideMargins:](self, "setCropSideMargins:", 10.0);
  -[PUPhotoEditProtoSettings setCropWheelSize:](self, "setCropWheelSize:", 380.0);
  -[PUPhotoEditProtoSettings setCropMaskBlurred:](self, "setCropMaskBlurred:", 1);
  -[PUPhotoEditProtoSettings setAutoCropEnabled:](self, "setAutoCropEnabled:", 1);
  -[PUPhotoEditProtoSettings setTrackBallSize:](self, "setTrackBallSize:", 100.0);
  -[PUPhotoEditProtoSettings setCropRecomposeDelay:](self, "setCropRecomposeDelay:", 1.0);
  -[PUPhotoEditProtoSettings setSimulateDownload:](self, "setSimulateDownload:", 0);
  -[PUPhotoEditProtoSettings setSimulateDownloadFailure:](self, "setSimulateDownloadFailure:", 0);
  -[PUPhotoEditProtoSettings setSkipPHContentEditingInputDisplaySizeImage:](self, "setSkipPHContentEditingInputDisplaySizeImage:", 1);
  -[PUPhotoEditProtoSettings setSimulateEditEntryError:](self, "setSimulateEditEntryError:", 0);
  -[PUPhotoEditProtoSettings setSimulatedEditingEntryErrorType:](self, "setSimulatedEditingEntryErrorType:", 0);
  -[PUPhotoEditProtoSettings setShowFileRadarButtonForEditEntryOnInternalInstalls:](self, "setShowFileRadarButtonForEditEntryOnInternalInstalls:", 1);
  -[PUPhotoEditProtoSettings setAutoStraightenMaxAngle:](self, "setAutoStraightenMaxAngle:", 10.0);
  -[PUPhotoEditProtoSettings setAutoPerspectiveMaxYaw:](self, "setAutoPerspectiveMaxYaw:", 5.0);
  -[PUPhotoEditProtoSettings setAutoPerspectiveMaxPitch:](self, "setAutoPerspectiveMaxPitch:", 20.0);
  -[PUPhotoEditProtoSettings setAutoPerspectiveMaxAngle:](self, "setAutoPerspectiveMaxAngle:", 10.0);
  -[PUPhotoEditProtoSettings setAutoPerspectiveMaxFaceSize:](self, "setAutoPerspectiveMaxFaceSize:", 0.0);
  -[PUPhotoEditProtoSettings setAutoPerspectiveDisableOnPanos:](self, "setAutoPerspectiveDisableOnPanos:", 1);
  -[PUPhotoEditProtoSettings setAutoPerspectiveDisableOnFrontFacingCameraImages:](self, "setAutoPerspectiveDisableOnFrontFacingCameraImages:", 1);
  -[PUPhotoEditProtoSettings setPerspectiveViewDebugCropEnabled:](self, "setPerspectiveViewDebugCropEnabled:", 0);
  -[PUPhotoEditProtoSettings setPreviewOriginalDuration:](self, "setPreviewOriginalDuration:", 1.25);
  -[PUPhotoEditProtoSettings setPreviewOriginalTimesOut:](self, "setPreviewOriginalTimesOut:", 1);
  -[PUPhotoEditProtoSettings setAlwaysShowDoneButton:](self, "setAlwaysShowDoneButton:", 0);
  -[PUPhotoEditProtoSettings setChangeLightingDisablesLive:](self, "setChangeLightingDisablesLive:", 0);
  -[PUPhotoEditProtoSettings setApertureSliderHasOffPosition:](self, "setApertureSliderHasOffPosition:", 1);
  -[PUPhotoEditProtoSettings setLoopBounceTrimAllowed:](self, "setLoopBounceTrimAllowed:", 0);
  -[PUPhotoEditProtoSettings setRenderPriority:](self, "setRenderPriority:", 3);
  -[PUPhotoEditProtoSettings setLightModeEditor:](self, "setLightModeEditor:", 1);
  -[PUPhotoEditProtoSettings setNewNotchButtons:](self, "setNewNotchButtons:", 1);
  -[PUPhotoEditProtoSettings setBlurToolBackgrounds:](self, "setBlurToolBackgrounds:", 1);
  -[PUPhotoEditProtoSettings setSwipeToExitEdit:](self, "setSwipeToExitEdit:", 0);
  -[PUPhotoEditProtoSettings setPauseAfterMovingPlayhead:](self, "setPauseAfterMovingPlayhead:", 1);
  -[PUPhotoEditProtoSettings setAlwaysAllowKeyPhotoEditing:](self, "setAlwaysAllowKeyPhotoEditing:", 0);
  -[PUPhotoEditProtoSettings setRequireTapToShowMakePosterFrame:](self, "setRequireTapToShowMakePosterFrame:", 0);
  -[PUPhotoEditProtoSettings setAllowMakePosterFrameForVideo:](self, "setAllowMakePosterFrameForVideo:", 0);
  -[PUPhotoEditProtoSettings setShowVideoScrubberDebugOverlay:](self, "setShowVideoScrubberDebugOverlay:", 0);
  -[PUPhotoEditProtoSettings setStrokeWidth:](self, "setStrokeWidth:", 2.0);
  -[PUPhotoEditProtoSettings setSelectionRingStrokeWidth:](self, "setSelectionRingStrokeWidth:", 2.0);
  -[PUPhotoEditProtoSettings setAdjustmentLabelPlatterAlpha:](self, "setAdjustmentLabelPlatterAlpha:", 1.0);
  -[PUPhotoEditProtoSettings setAlwaysShowValueWhenAdjustmentIsSelected:](self, "setAlwaysShowValueWhenAdjustmentIsSelected:", 0);
  -[PUPhotoEditProtoSettings setShowSuggestedKeyFrame:](self, "setShowSuggestedKeyFrame:", 0);
  -[PUPhotoEditProtoSettings setShowSmartBlackAndWhiteAdjustment:](self, "setShowSmartBlackAndWhiteAdjustment:", 0);
  -[PUPhotoEditProtoSettings setShowHDRDebugAdjustments:](self, "setShowHDRDebugAdjustments:", 0);
  -[PUPhotoEditProtoSettings setShowHDRHeadroomControl:](self, "setShowHDRHeadroomControl:", 0);
  -[PUPhotoEditProtoSettings setEnablePerfDebugHUD:](self, "setEnablePerfDebugHUD:", 0);
  -[PUPhotoEditProtoSettings setEnablePerfTTRButton:](self, "setEnablePerfTTRButton:", 1);
  -[PUPhotoEditProtoSettings setTtrButtonDurationThreshold:](self, "setTtrButtonDurationThreshold:", 2.0);
  -[PUPhotoEditProtoSettings setShowSemanticDevelopmentSwitch:](self, "setShowSemanticDevelopmentSwitch:", 0);
  -[PUPhotoEditProtoSettings setEnableSemanticDevelopmentHUD:](self, "setEnableSemanticDevelopmentHUD:", 0);
  -[PUPhotoEditProtoSettings setShowStabilizationWatermark:](self, "setShowStabilizationWatermark:", 0);
  -[PUPhotoEditProtoSettings setApplyVideoOrientationAsMetadata:](self, "setApplyVideoOrientationAsMetadata:", 1);
  -[PUPhotoEditProtoSettings setOverrideVideoEditability:](self, "setOverrideVideoEditability:", 0);
  -[PUPhotoEditProtoSettings setHideTrackersDuringPlayback:](self, "setHideTrackersDuringPlayback:", 0);
  -[PUPhotoEditProtoSettings setDebugTrackerMask:](self, "setDebugTrackerMask:", 0);
  -[PUPhotoEditProtoSettings setDisableVideoFilmstrip:](self, "setDisableVideoFilmstrip:", 0);
  -[PUPhotoEditProtoSettings setShowFrameNumberOnVideoScrubber:](self, "setShowFrameNumberOnVideoScrubber:", 0);
  -[PUPhotoEditProtoSettings setTapTimelineToSeek:](self, "setTapTimelineToSeek:", 0);
  -[PUPhotoEditProtoSettings setToolbarShadowsEnabled:](self, "setToolbarShadowsEnabled:", 1);
  -[PUPhotoEditProtoSettings setHideUIForInteractionEnabled:](self, "setHideUIForInteractionEnabled:", 1);
  -[PUPhotoEditProtoSettings setEditMenuEnabled:](self, "setEditMenuEnabled:", 1);
  -[PUPhotoEditProtoSettings setMainToolbarShadowLength:](self, "setMainToolbarShadowLength:", 140.0);
  -[PUPhotoEditProtoSettings setSecondaryToolbarShadowLength:](self, "setSecondaryToolbarShadowLength:", 240.0);
  -[PUPhotoEditProtoSettings setHideUIForInteractionFadeInDuration:](self, "setHideUIForInteractionFadeInDuration:", 0.2);
  -[PUPhotoEditProtoSettings setHideUIForInteractionFadeOutDuration:](self, "setHideUIForInteractionFadeOutDuration:", 0.5);
  -[PUPhotoEditProtoSettings setHideUIForInteractionFadeOutDelay:](self, "setHideUIForInteractionFadeOutDelay:", 0.0);
  -[PUPhotoEditProtoSettings setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:](self, "setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:", 0);
  -[PUPhotoEditProtoSettings setMaintainCropAspectLockState:](self, "setMaintainCropAspectLockState:", 1);
  -[PUPhotoEditProtoSettings setAllowDisabledTools:](self, "setAllowDisabledTools:", 0);
  -[PUPhotoEditProtoSettings setEnableSpatialMediaEditing:](self, "setEnableSpatialMediaEditing:", 1);
  -[PUPhotoEditProtoSettings setEnableSemanticStyleInEdit:](self, "setEnableSemanticStyleInEdit:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditSemanticStyleAutoCalc:](self, "setEnableEnterEditSemanticStyleAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableSemanticStyleDebugUIInEdit:](self, "setEnableSemanticStyleDebugUIInEdit:", 0);
  -[PUPhotoEditProtoSettings setShouldConstraintDpadValuesToGrid:](self, "setShouldConstraintDpadValuesToGrid:", 0);
  -[PUPhotoEditProtoSettings setEnableEnterEditSmartToneAutoCalc:](self, "setEnableEnterEditSmartToneAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditSmartColorAutoCalc:](self, "setEnableEnterEditSmartColorAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditCropAutoCalc:](self, "setEnableEnterEditCropAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditPerspectiveAutoCalc:](self, "setEnableEnterEditPerspectiveAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditDepthEffectAutoCalc:](self, "setEnableEnterEditDepthEffectAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditPortraitAutoCalc:](self, "setEnableEnterEditPortraitAutoCalc:", 1);
  -[PUPhotoEditProtoSettings setEnableEnterEditFilterThumbnailGeneration:](self, "setEnableEnterEditFilterThumbnailGeneration:", 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", &unk_1E59BABD8);

}

- (void)setVideoStabilizeMaxCropFraction:(double)a3
{
  self->_videoStabilizeMaxCropFraction = a3;
}

- (void)setUseEditToastProgress:(BOOL)a3
{
  self->_useEditToastProgress = a3;
}

- (void)setUseAsynchronousRenderingPhotos:(BOOL)a3
{
  self->_useAsynchronousRenderingPhotos = a3;
}

- (void)setTtrButtonDurationThreshold:(double)a3
{
  self->_ttrButtonDurationThreshold = a3;
}

- (void)setTrackBallSize:(double)a3
{
  self->_trackBallSize = a3;
}

- (void)setToolbarShadowsEnabled:(BOOL)a3
{
  self->_toolbarShadowsEnabled = a3;
}

- (void)setTapTimelineToSeek:(BOOL)a3
{
  self->_tapTimelineToSeek = a3;
}

- (void)setSwipeToExitEdit:(BOOL)a3
{
  self->_swipeToExitEdit = a3;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void)setSkipPHContentEditingInputDisplaySizeImage:(BOOL)a3
{
  self->_skipPHContentEditingInputDisplaySizeImage = a3;
}

- (void)setSimulatedEditingEntryErrorType:(int64_t)a3
{
  self->_simulatedEditingEntryErrorType = a3;
}

- (void)setSimulateEditEntryError:(BOOL)a3
{
  self->_simulateEditEntryError = a3;
}

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  self->_simulateDownloadFailure = a3;
}

- (void)setSimulateDownload:(BOOL)a3
{
  self->_simulateDownload = a3;
}

- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3
{
  self->_showVideoScrubberDebugOverlay = a3;
}

- (void)setShowSuggestedKeyFrame:(BOOL)a3
{
  self->_showSuggestedKeyFrame = a3;
}

- (void)setShowStabilizationWatermark:(BOOL)a3
{
  self->_showStabilizationWatermark = a3;
}

- (void)setShowSmartBlackAndWhiteAdjustment:(BOOL)a3
{
  self->_showSmartBlackAndWhiteAdjustment = a3;
}

- (void)setShowSemanticDevelopmentSwitch:(BOOL)a3
{
  self->_showSemanticDevelopmentSwitch = a3;
}

- (void)setShowResetToolButton:(BOOL)a3
{
  self->_showResetToolButton = a3;
}

- (void)setShowHDRDebugAdjustments:(BOOL)a3
{
  self->_showHDRDebugAdjustments = a3;
}

- (void)setShowFrameNumberOnVideoScrubber:(BOOL)a3
{
  self->_showFrameNumberOnVideoScrubber = a3;
}

- (void)setShowFileRadarButtonForEditEntryOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonForEditEntryOnInternalInstalls = a3;
}

- (void)setSelectionRingStrokeWidth:(double)a3
{
  self->_selectionRingStrokeWidth = a3;
}

- (void)setSecondaryToolbarShadowLength:(double)a3
{
  self->_secondaryToolbarShadowLength = a3;
}

- (void)setRequireTapToShowMakePosterFrame:(BOOL)a3
{
  self->_requireTapToShowMakePosterFrame = a3;
}

- (void)setRenderPriority:(int64_t)a3
{
  self->_renderPriority = a3;
}

- (void)setPreviewOriginalTimesOut:(BOOL)a3
{
  self->_previewOriginalTimesOut = a3;
}

- (void)setPreviewOriginalDuration:(double)a3
{
  self->_previewOriginalDuration = a3;
}

- (void)setPerspectiveViewDebugCropEnabled:(BOOL)a3
{
  self->_perspectiveViewDebugCropEnabled = a3;
}

- (void)setPauseAfterMovingPlayhead:(BOOL)a3
{
  self->_pauseAfterMovingPlayhead = a3;
}

- (void)setOverrideVideoEditability:(BOOL)a3
{
  self->_overrideVideoEditability = a3;
}

- (void)setMainToolbarShadowLength:(double)a3
{
  self->_mainToolbarShadowLength = a3;
}

- (void)setLoopBounceTrimAllowed:(BOOL)a3
{
  self->_loopBounceTrimAllowed = a3;
}

- (void)setLightModeEditor:(BOOL)a3
{
  self->_lightModeEditor = a3;
}

- (void)setHideTrackersDuringPlayback:(BOOL)a3
{
  self->_hideTrackersDuringPlayback = a3;
}

- (void)setEnableVideoStabilizion:(BOOL)a3
{
  self->_enableVideoStabilizion = a3;
}

- (void)setEnableSemanticDevelopmentHUD:(BOOL)a3
{
  self->_enableSemanticDevelopmentHUD = a3;
}

- (void)setEnablePerfTTRButton:(BOOL)a3
{
  self->_enablePerfTTRButton = a3;
}

- (void)setEnablePerfDebugHUD:(BOOL)a3
{
  self->_enablePerfDebugHUD = a3;
}

- (void)setEnableLiveVideoRenderAtSetSize:(BOOL)a3
{
  self->_enableLiveVideoRenderAtSetSize = a3;
}

- (void)setEnableLiveVideoRender:(BOOL)a3
{
  self->_enableLiveVideoRender = a3;
}

- (void)setEnableFinalizerGesture:(BOOL)a3
{
  self->_enableFinalizerGesture = a3;
}

- (void)setEnableEnterEditSmartToneAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSmartToneAutoCalc = a3;
}

- (void)setEnableEnterEditSmartColorAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSmartColorAutoCalc = a3;
}

- (void)setEnableEnterEditPortraitAutoCalc:(BOOL)a3
{
  self->_enableEnterEditPortraitAutoCalc = a3;
}

- (void)setEnableEnterEditPerspectiveAutoCalc:(BOOL)a3
{
  self->_enableEnterEditPerspectiveAutoCalc = a3;
}

- (void)setEnableEnterEditFilterThumbnailGeneration:(BOOL)a3
{
  self->_enableEnterEditFilterThumbnailGeneration = a3;
}

- (void)setEnableEnterEditDepthEffectAutoCalc:(BOOL)a3
{
  self->_enableEnterEditDepthEffectAutoCalc = a3;
}

- (void)setEnableEnterEditCropAutoCalc:(BOOL)a3
{
  self->_enableEnterEditCropAutoCalc = a3;
}

- (void)setEnableDynamicVideoScaling:(BOOL)a3
{
  self->_enableDynamicVideoScaling = a3;
}

- (void)setDisableVideoFilmstrip:(BOOL)a3
{
  self->_disableVideoFilmstrip = a3;
}

- (void)setDisableAsynchronousRenderingVideos:(BOOL)a3
{
  self->_disableAsynchronousRenderingVideos = a3;
}

- (void)setDebugTrackerMask:(BOOL)a3
{
  self->_debugTrackerMask = a3;
}

- (void)setCropWheelSize:(double)a3
{
  self->_cropWheelSize = a3;
}

- (void)setCropSideMargins:(double)a3
{
  self->_cropSideMargins = a3;
}

- (void)setCropRecomposeDelay:(double)a3
{
  self->_cropRecomposeDelay = a3;
}

- (void)setCropMaskBlurred:(BOOL)a3
{
  self->_cropMaskBlurred = a3;
}

- (void)setChangeLightingDisablesLive:(BOOL)a3
{
  self->_changeLightingDisablesLive = a3;
}

- (void)setBlurToolBackgrounds:(BOOL)a3
{
  self->_blurToolBackgrounds = a3;
}

- (void)setAutoStraightenMaxAngle:(double)a3
{
  self->_autoStraightenMaxAngle = a3;
}

- (void)setAutoPerspectiveMaxYaw:(double)a3
{
  self->_autoPerspectiveMaxYaw = a3;
}

- (void)setAutoPerspectiveMaxPitch:(double)a3
{
  self->_autoPerspectiveMaxPitch = a3;
}

- (void)setAutoPerspectiveMaxFaceSize:(double)a3
{
  self->_autoPerspectiveMaxFaceSize = a3;
}

- (void)setAutoPerspectiveMaxAngle:(double)a3
{
  self->_autoPerspectiveMaxAngle = a3;
}

- (void)setAutoPerspectiveDisableOnPanos:(BOOL)a3
{
  self->_autoPerspectiveDisableOnPanos = a3;
}

- (void)setAutoPerspectiveDisableOnFrontFacingCameraImages:(BOOL)a3
{
  self->_autoPerspectiveDisableOnFrontFacingCameraImages = a3;
}

- (void)setAutoCropEnabled:(BOOL)a3
{
  self->_autoCropEnabled = a3;
}

- (void)setAttemptEditExtensionUndoAutoSetup:(BOOL)a3
{
  self->_attemptEditExtensionUndoAutoSetup = a3;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (void)setApertureSliderHasOffPosition:(BOOL)a3
{
  self->_apertureSliderHasOffPosition = a3;
}

- (void)setAlwaysShowValueWhenAdjustmentIsSelected:(BOOL)a3
{
  self->_alwaysShowValueWhenAdjustmentIsSelected = a3;
}

- (void)setAlwaysShowPortraitV2:(BOOL)a3
{
  self->_alwaysShowPortraitV2 = a3;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (void)setAlwaysAllowKeyPhotoEditing:(BOOL)a3
{
  self->_alwaysAllowKeyPhotoEditing = a3;
}

- (void)setAllowSynchronousBatchRendering:(BOOL)a3
{
  self->_allowSynchronousBatchRendering = a3;
}

- (void)setAllowMakePosterFrameForVideo:(BOOL)a3
{
  self->_allowMakePosterFrameForVideo = a3;
}

- (void)setAllowAnyPlugin:(BOOL)a3
{
  self->_allowAnyPlugin = a3;
}

- (void)setAdjustmentLabelPlatterAlpha:(double)a3
{
  self->_adjustmentLabelPlatterAlpha = a3;
}

+ (BOOL)isCapableOfLivePhotoRender
{
  return MGGetBoolAnswer();
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)enableFinalizerGesture
{
  void *v3;
  char v4;

  if (self->_enableFinalizerGesture)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enableFinalizerGesture"));

  return v4;
}

- (BOOL)useAsynchronousRenderingPhotos
{
  void *v3;
  char v4;

  if (self->_useAsynchronousRenderingPhotos)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("useAsynchronousRenderingPhotos"));

  return v4;
}

- (BOOL)disableAsynchronousRenderingVideos
{
  void *v3;
  char v4;

  if (self->_disableAsynchronousRenderingVideos)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("disableAsynchronousRenderingVideos"));

  return v4;
}

- (BOOL)enableLiveVideoRender
{
  void *v3;
  char v4;

  if (self->_enableLiveVideoRender)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enableLiveVideoRender"));

  return v4;
}

- (BOOL)enableLiveVideoRenderAtSetSize
{
  void *v3;
  char v4;

  if (self->_enableLiveVideoRenderAtSetSize)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enableLiveVideoRenderAtSetSize"));

  return v4;
}

- (BOOL)enableDynamicVideoScaling
{
  void *v3;
  char v4;

  if (self->_enableDynamicVideoScaling)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enableDynamicVideoScaling"));

  return v4;
}

- (BOOL)alwaysShowPortraitV2
{
  void *v3;
  char v4;

  if (self->_alwaysShowPortraitV2)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("alwaysShowPortraitV2"));

  return v4;
}

- (BOOL)enableFuzzball
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "portraitDisableFuzzball") ^ 1;

  return v3;
}

- (void)setEnableFuzzball:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPortraitDisableFuzzball:", v3);

}

- (void)setDisableIOSurfacePortaitExport:(BOOL)a3
{
  self->_disableIOSurfacePortaitExport = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setDisableIOSurfacePortaitExport:");
}

- (BOOL)perspectiveViewDebugCropEnabled
{
  void *v3;
  char v4;

  if (self->_perspectiveViewDebugCropEnabled)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("perspectiveViewDebugCropEnabled"));

  return v4;
}

- (BOOL)enablePerfDebugHUD
{
  void *v3;
  char v4;

  if (self->_enablePerfDebugHUD)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enablePerfDebugHUD"));

  return v4;
}

- (BOOL)disableTimelineAnimations
{
  void *v3;
  char v4;

  if (self->_disableTimelineAnimations)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("disableTimelineAnimations"));

  return v4;
}

- (BOOL)enableEnterEditSmartToneAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditSmartToneAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditSmartToneAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditSmartColorAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditSmartColorAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditSmartColorAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditSemanticStyleAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditSemanticStyleAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditSemanticStyleAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditCropAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditCropAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditCropAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditPerspectiveAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditPerspectiveAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditPerspectiveAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditDepthEffectAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditDepthEffectAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditDepthEffectAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditPortraitAutoCalc
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditPortraitAutoCalc)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditPortraitAutoCalc"));

  return v3;
}

- (BOOL)enableEnterEditFilterThumbnailGeneration
{
  void *v2;
  char v3;

  if (!self->_enableEnterEditFilterThumbnailGeneration)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableEnterEditFilterThumbnailGeneration"));

  return v3;
}

- (void)setRunNeutrinoSynchronously:(BOOL)a3
{
  self->_runNeutrinoSynchronously = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRunNeutrinoSynchronously:");
}

- (void)setEnableNURenderJobDebug:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  self->_enableNURenderJobDebug = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebug:");
  if (v3)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("NURenderDebug/"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0D52108], "setTempDir:", v6);
  }
}

- (void)setNuRenderJobDebugCaptureCanceledJobs:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureCanceledJobs = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCaptureCanceledJobs:");
}

- (void)setNuRenderJobDebugCaptureNodeGraphs:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureNodeGraphs = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCaptureNodeGraphs:");
}

- (void)setNuRenderJobDebugCaptureNodeCache:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureNodeCache = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCaptureNodeCache:");
}

- (void)setNuRenderJobDebugCapturePerfStatHistory:(BOOL)a3
{
  self->_nuRenderJobDebugCapturePerfStatHistory = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCapturePerfStatHistory:");
}

- (void)setNuRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureOnlyPerfStats = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCaptureOnlyPerfStats:");
}

- (void)setNuRenderJobDebugCapture5PercentOfJobs:(BOOL)a3
{
  self->_nuRenderJobDebugCapture5PercentOfJobs = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderJobDebugCapture5PercentOfJobs:");
}

- (void)setRenderBackfillBlue:(BOOL)a3
{
  self->_renderBackfillBlue = a3;
  if (a3)
    objc_msgSend(MEMORY[0x1E0D52108], "setDebugRenderBlue:", CFSTR("zoomedToFit"));
}

- (void)setRenderZoomPurple:(BOOL)a3
{
  self->_renderZoomPurple = a3;
  if (a3)
    objc_msgSend(MEMORY[0x1E0D52108], "setDebugRenderPurple:", CFSTR("roi"));
}

- (void)setMediaViewDebugMode:(BOOL)a3
{
  self->_mediaViewDebugMode = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setViewDebugEnabled:");
}

- (void)setEnableCoreImageDebugMode:(BOOL)a3
{
  self->_enableCoreImageDebugMode = a3;
  -[PUPhotoEditProtoSettings updateCoreImageDebug](self, "updateCoreImageDebug");
}

- (void)setEnableCoreImageDebugInputs:(BOOL)a3
{
  self->_enableCoreImageDebugInputs = a3;
  -[PUPhotoEditProtoSettings updateCoreImageDebug](self, "updateCoreImageDebug");
}

- (void)setEnableCoreImageDebugOutputs:(BOOL)a3
{
  self->_enableCoreImageDebugOutputs = a3;
  -[PUPhotoEditProtoSettings updateCoreImageDebug](self, "updateCoreImageDebug");
}

- (void)setEnableCoreImageDebugIntermediates:(BOOL)a3
{
  self->_enableCoreImageDebugIntermediates = a3;
  -[PUPhotoEditProtoSettings updateCoreImageDebug](self, "updateCoreImageDebug");
}

- (void)setEnableCoreImageDebugTiming:(BOOL)a3
{
  self->_enableCoreImageDebugTiming = a3;
  -[PUPhotoEditProtoSettings updateCoreImageDebug](self, "updateCoreImageDebug");
}

- (void)updateCoreImageDebug
{
  +[PURenderDebugController setCoreImageDebugMode:dumpInputs:dumpOutputs:dumpIntermediates:dumpTiming:](PURenderDebugController, "setCoreImageDebugMode:dumpInputs:dumpOutputs:dumpIntermediates:dumpTiming:", -[PUPhotoEditProtoSettings enableCoreImageDebugMode](self, "enableCoreImageDebugMode"), -[PUPhotoEditProtoSettings enableCoreImageDebugInputs](self, "enableCoreImageDebugInputs"), -[PUPhotoEditProtoSettings enableCoreImageDebugOutputs](self, "enableCoreImageDebugOutputs"), -[PUPhotoEditProtoSettings enableCoreImageDebugIntermediates](self, "enableCoreImageDebugIntermediates"), -[PUPhotoEditProtoSettings enableCoreImageDebugTiming](self, "enableCoreImageDebugTiming"));
}

- (BOOL)lightModeEditor
{
  void *v3;
  char v4;

  if (self->_lightModeEditor)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("lightModeEditor"));

  return v4;
}

- (BOOL)showSmartBlackAndWhiteAdjustment
{
  void *v3;
  char v4;

  if (self->_showSmartBlackAndWhiteAdjustment)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showSmartBlackAndWhiteAdjustment"));

  return v4;
}

- (BOOL)showHDRDebugAdjustment
{
  void *v3;
  char v4;

  if (self->_showHDRDebugAdjustments)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showHDRDebugAdjustment"));

  return v4;
}

- (BOOL)showHDRHeadroomControl
{
  void *v3;
  char v4;

  if (self->_showHDRHeadroomControl)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showHDRHeadroomControl"));

  return v4;
}

- (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3
{
  self->_allAssetsCanUseHDRPipeline = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setAllAssetsCanUseHDRPipeline:");
}

- (void)setDisablePacked10BitPixelFormats:(BOOL)a3
{
  self->_disablePacked10BitPixelFormats = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setDisablePacked10BitPixelFormats:");
}

- (BOOL)enableDash5
{
  return objc_msgSend(MEMORY[0x1E0D52108], "enableDash5");
}

- (void)setEnableDash5:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setEnableDash5:", a3);
}

- (BOOL)disableRenderMeteorPlusAsHDR
{
  return objc_msgSend(MEMORY[0x1E0D52108], "renderMeteorPlusAsHDR") ^ 1;
}

- (void)setDisableRenderMeteorPlusAsHDR:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setRenderMeteorPlusAsHDR:", !a3);
}

- (void)setDecodeMeteorPlusAsLinear:(BOOL)a3
{
  self->_decodeMeteorPlusAsLinear = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setForceMeteorPlusLinear:");
}

- (void)setForceMeteorPlusPlus:(BOOL)a3
{
  self->_forceMeteorPlusPlus = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setForceMeteorPlusPlus:");
}

- (void)setVideoCompositorDebugMode:(unint64_t)a3
{
  self->_videoCompositorDebugMode = a3;
  objc_msgSend(MEMORY[0x1E0D52108], "setVideoCompositorDebugMode:");
}

- (void)setForceGlassesMatteOff:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_forceGlassesMatteOff = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceGlassesMatteOff:", v3);

}

- (void)setForceSpillMatteOff:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_forceSpillMatteOff = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceSpillMatteOff:", v3);

}

- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_allowSpillMatteOnOlderPortraitV2Captures = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowSpillMatteOnOlderPortraitV2Captures:", v3);

}

- (void)setDisableTimelineAnimations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disableTimelineAnimations = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("disableTimelineAnimations"));

}

- (BOOL)disableVideoFilmstrip
{
  void *v3;
  char v4;

  if (self->_disableVideoFilmstrip)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("disableVideoFilmstrip"));

  return v4;
}

- (BOOL)showFrameNumberOnVideoScrubber
{
  void *v3;
  char v4;

  if (self->_showFrameNumberOnVideoScrubber)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showFrameNumberOnVideoScrubber"));

  return v4;
}

- (BOOL)tapTimelineToSeek
{
  void *v3;
  char v4;

  if (self->_tapTimelineToSeek)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("tapTimelineToSeek"));

  return v4;
}

- (BOOL)smartCopyPasteReviewUIEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "smartCopyPasteReviewUIEnabled");

  return v3;
}

- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSmartCopyPasteReviewUIEnabled:", v3);

}

- (BOOL)smartCopyPasteCaptureTimeGating
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "smartCopyPasteGateOnCaptureTime");

  return v3;
}

- (void)setSmartCopyPasteCaptureTimeGating:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSmartCopyPasteGateOnCaptureTime:", v3);

}

- (double)smartCopyPasteSimilarityGating
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smartCopyPasteSimilarityGatingThreshold");
  v4 = v3 * 100.0;

  return v4;
}

- (void)setSmartCopyPasteSimilarityGating:(double)a3
{
  double v3;
  id v4;

  v3 = a3 / 100.0;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSmartCopyPasteSimilarityGatingThreshold:", v3);

}

- (BOOL)affectManuallyEditedSlidersOnly
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "affectManuallyEditedSlidersOnly");

  return v3;
}

- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAffectManuallyEditedSlidersOnly:", v3);

}

- (BOOL)fetchAndSendScenePrintsForSliderNet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fetchAndSendScenePrintsForSliderNet");

  return v3;
}

- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchAndSendScenePrintsForSliderNet:", v3);

}

- (BOOL)enableSpatialMediaEditing
{
  return objc_msgSend(MEMORY[0x1E0D52108], "enableSpatialMediaEditing");
}

- (void)setEnableSpatialMediaEditing:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setEnableSpatialMediaEditing:", a3);
}

- (BOOL)shouldRevertStyledOriginalIfPossible
{
  return objc_msgSend(MEMORY[0x1E0D52108], "shouldRevertStyledOriginalIfPossible");
}

- (void)setShouldRevertStyledOriginalIfPossible:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setShouldRevertStyledOriginalIfPossible:", a3);
}

- (BOOL)shouldEnableStylesForProRaw
{
  return objc_msgSend(MEMORY[0x1E0D52108], "shouldEnableStylesForProRaw");
}

- (void)setShouldEnableStylesForProRaw:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setShouldEnableStylesForProRaw:", a3);
}

- (BOOL)isStyleCaptureEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.camera"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("CAMFeatureDevelopmentAllowSmartStyles"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("CAMFeatureDevelopmentAllowSmartStyles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (int64_t)semanticStyleTemporalWindowSize
{
  return objc_msgSend(MEMORY[0x1E0D52108], "semanticStyleTemporalWindowSize");
}

- (void)setSemanticStyleTemporalWindowSize:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setSemanticStyleTemporalWindowSize:", a3);
}

- (BOOL)overrideSemanticStylesHardwareCheck
{
  return objc_msgSend(MEMORY[0x1E0D52108], "overrideSemanticStylesHardwareCheck");
}

- (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D52108], "setOverrideSemanticStylesHardwareCheck:", a3);
}

- (BOOL)useEngPlaceholderNames
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useEngPlaceholderNames");

  return v3;
}

- (void)setUseEngPlaceholderNames:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseEngPlaceholderNames:", v3);

}

- (BOOL)synchronousStylesCopyPaste
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "synchronousStylesCopyPaste");

  return v3;
}

- (void)setSynchronousStylesCopyPaste:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSynchronousStylesCopyPaste:", v3);

}

- (BOOL)shouldUseFlipAnimationForValuePlatter
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseFlipAnimationForValuePlatter");

  return v3;
}

- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CAE0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUseFlipAnimationForValuePlatter:", v3);

}

- (BOOL)enableNURenderJobDebug
{
  return self->_enableNURenderJobDebug;
}

- (BOOL)nuRenderJobDebugCaptureNodeGraphs
{
  return self->_nuRenderJobDebugCaptureNodeGraphs;
}

- (BOOL)nuRenderJobDebugCaptureNodeCache
{
  return self->_nuRenderJobDebugCaptureNodeCache;
}

- (BOOL)nuRenderJobDebugCaptureCanceledJobs
{
  return self->_nuRenderJobDebugCaptureCanceledJobs;
}

- (BOOL)nuRenderJobDebugCapturePerfStatHistory
{
  return self->_nuRenderJobDebugCapturePerfStatHistory;
}

- (BOOL)nuRenderJobDebugCaptureOnlyPerfStats
{
  return self->_nuRenderJobDebugCaptureOnlyPerfStats;
}

- (BOOL)nuRenderJobDebugCapture5PercentOfJobs
{
  return self->_nuRenderJobDebugCapture5PercentOfJobs;
}

- (BOOL)renderBackfillBlue
{
  return self->_renderBackfillBlue;
}

- (BOOL)renderZoomPurple
{
  return self->_renderZoomPurple;
}

- (BOOL)mediaViewDebugMode
{
  return self->_mediaViewDebugMode;
}

- (BOOL)enableCoreImageDebugMode
{
  return self->_enableCoreImageDebugMode;
}

- (BOOL)enableCoreImageDebugInputs
{
  return self->_enableCoreImageDebugInputs;
}

- (BOOL)enableCoreImageDebugOutputs
{
  return self->_enableCoreImageDebugOutputs;
}

- (BOOL)enableCoreImageDebugIntermediates
{
  return self->_enableCoreImageDebugIntermediates;
}

- (BOOL)enableCoreImageDebugTiming
{
  return self->_enableCoreImageDebugTiming;
}

- (BOOL)enableVideoStabilizion
{
  return self->_enableVideoStabilizion;
}

- (double)videoStabilizeMaxCropFraction
{
  return self->_videoStabilizeMaxCropFraction;
}

- (int64_t)renderPriority
{
  return self->_renderPriority;
}

- (BOOL)enableSemanticDevelopmentHUD
{
  return self->_enableSemanticDevelopmentHUD;
}

- (BOOL)overrideVideoEditability
{
  return self->_overrideVideoEditability;
}

- (BOOL)hideTrackersDuringPlayback
{
  return self->_hideTrackersDuringPlayback;
}

- (BOOL)debugTrackerMask
{
  return self->_debugTrackerMask;
}

- (BOOL)enablePerfTTRButton
{
  return self->_enablePerfTTRButton;
}

- (double)ttrButtonDurationThreshold
{
  return self->_ttrButtonDurationThreshold;
}

- (BOOL)forceGlassesMatteOff
{
  return self->_forceGlassesMatteOff;
}

- (BOOL)forceSpillMatteOff
{
  return self->_forceSpillMatteOff;
}

- (BOOL)allowSpillMatteOnOlderPortraitV2Captures
{
  return self->_allowSpillMatteOnOlderPortraitV2Captures;
}

- (BOOL)useEditToastProgress
{
  return self->_useEditToastProgress;
}

- (BOOL)allowSynchronousBatchRendering
{
  return self->_allowSynchronousBatchRendering;
}

- (BOOL)showAutoEnhanceAction
{
  return self->_showAutoEnhanceAction;
}

- (void)setShowAutoEnhanceAction:(BOOL)a3
{
  self->_showAutoEnhanceAction = a3;
}

- (BOOL)showRotateAction
{
  return self->_showRotateAction;
}

- (void)setShowRotateAction:(BOOL)a3
{
  self->_showRotateAction = a3;
}

- (BOOL)enableSelectiveCopyEdits
{
  return self->_enableSelectiveCopyEdits;
}

- (void)setEnableSelectiveCopyEdits:(BOOL)a3
{
  self->_enableSelectiveCopyEdits = a3;
}

- (BOOL)showResetToolButton
{
  return self->_showResetToolButton;
}

- (BOOL)allowAnyPlugin
{
  return self->_allowAnyPlugin;
}

- (BOOL)attemptEditExtensionUndoAutoSetup
{
  return self->_attemptEditExtensionUndoAutoSetup;
}

- (double)cropSideMargins
{
  return self->_cropSideMargins;
}

- (double)cropWheelSize
{
  return self->_cropWheelSize;
}

- (BOOL)cropMaskBlurred
{
  return self->_cropMaskBlurred;
}

- (BOOL)autoCropEnabled
{
  return self->_autoCropEnabled;
}

- (double)trackBallSize
{
  return self->_trackBallSize;
}

- (double)cropRecomposeDelay
{
  return self->_cropRecomposeDelay;
}

- (double)autoStraightenMaxAngle
{
  return self->_autoStraightenMaxAngle;
}

- (double)autoPerspectiveMaxYaw
{
  return self->_autoPerspectiveMaxYaw;
}

- (double)autoPerspectiveMaxPitch
{
  return self->_autoPerspectiveMaxPitch;
}

- (double)autoPerspectiveMaxAngle
{
  return self->_autoPerspectiveMaxAngle;
}

- (double)autoPerspectiveMaxFaceSize
{
  return self->_autoPerspectiveMaxFaceSize;
}

- (BOOL)autoPerspectiveDisableOnPanos
{
  return self->_autoPerspectiveDisableOnPanos;
}

- (BOOL)autoPerspectiveDisableOnFrontFacingCameraImages
{
  return self->_autoPerspectiveDisableOnFrontFacingCameraImages;
}

- (BOOL)simulateDownload
{
  return self->_simulateDownload;
}

- (BOOL)simulateDownloadFailure
{
  return self->_simulateDownloadFailure;
}

- (BOOL)skipPHContentEditingInputDisplaySizeImage
{
  return self->_skipPHContentEditingInputDisplaySizeImage;
}

- (BOOL)simulateEditEntryError
{
  return self->_simulateEditEntryError;
}

- (int64_t)simulatedEditingEntryErrorType
{
  return self->_simulatedEditingEntryErrorType;
}

- (BOOL)showFileRadarButtonForEditEntryOnInternalInstalls
{
  return self->_showFileRadarButtonForEditEntryOnInternalInstalls;
}

- (BOOL)previewOriginalTimesOut
{
  return self->_previewOriginalTimesOut;
}

- (double)previewOriginalDuration
{
  return self->_previewOriginalDuration;
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (BOOL)disableIOSurfacePortaitExport
{
  return self->_disableIOSurfacePortaitExport;
}

- (BOOL)changeLightingDisablesLive
{
  return self->_changeLightingDisablesLive;
}

- (BOOL)apertureSliderHasOffPosition
{
  return self->_apertureSliderHasOffPosition;
}

- (BOOL)loopBounceTrimAllowed
{
  return self->_loopBounceTrimAllowed;
}

- (BOOL)pauseAfterMovingPlayhead
{
  return self->_pauseAfterMovingPlayhead;
}

- (BOOL)alwaysAllowKeyPhotoEditing
{
  return self->_alwaysAllowKeyPhotoEditing;
}

- (BOOL)newNotchButtons
{
  return self->_newNotchButtons;
}

- (void)setNewNotchButtons:(BOOL)a3
{
  self->_newNotchButtons = a3;
}

- (BOOL)blurToolBackgrounds
{
  return self->_blurToolBackgrounds;
}

- (BOOL)swipeToExitEdit
{
  return self->_swipeToExitEdit;
}

- (BOOL)allowApertureRedEye
{
  return self->_allowApertureRedEye;
}

- (void)setAllowApertureRedEye:(BOOL)a3
{
  self->_allowApertureRedEye = a3;
}

- (BOOL)requireTapToShowMakePosterFrame
{
  return self->_requireTapToShowMakePosterFrame;
}

- (BOOL)allowMakePosterFrameForVideo
{
  return self->_allowMakePosterFrameForVideo;
}

- (BOOL)showVideoScrubberDebugOverlay
{
  return self->_showVideoScrubberDebugOverlay;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (double)selectionRingStrokeWidth
{
  return self->_selectionRingStrokeWidth;
}

- (double)adjustmentLabelPlatterAlpha
{
  return self->_adjustmentLabelPlatterAlpha;
}

- (BOOL)alwaysShowValueWhenAdjustmentIsSelected
{
  return self->_alwaysShowValueWhenAdjustmentIsSelected;
}

- (BOOL)showSuggestedKeyFrame
{
  return self->_showSuggestedKeyFrame;
}

- (BOOL)runNeutrinoSynchronously
{
  return self->_runNeutrinoSynchronously;
}

- (BOOL)maintainCropAspectLockState
{
  return self->_maintainCropAspectLockState;
}

- (void)setMaintainCropAspectLockState:(BOOL)a3
{
  self->_maintainCropAspectLockState = a3;
}

- (BOOL)showHDRDebugAdjustments
{
  return self->_showHDRDebugAdjustments;
}

- (void)setShowHDRHeadroomControl:(BOOL)a3
{
  self->_showHDRHeadroomControl = a3;
}

- (BOOL)allAssetsCanUseHDRPipeline
{
  return self->_allAssetsCanUseHDRPipeline;
}

- (BOOL)disablePacked10BitPixelFormats
{
  return self->_disablePacked10BitPixelFormats;
}

- (BOOL)decodeMeteorPlusAsLinear
{
  return self->_decodeMeteorPlusAsLinear;
}

- (BOOL)forceMeteorPlusPlus
{
  return self->_forceMeteorPlusPlus;
}

- (BOOL)enableFlexRange
{
  return self->_enableFlexRange;
}

- (void)setEnableFlexRange:(BOOL)a3
{
  self->_enableFlexRange = a3;
}

- (BOOL)showSemanticDevelopmentSwitch
{
  return self->_showSemanticDevelopmentSwitch;
}

- (BOOL)showStabilizationWatermark
{
  return self->_showStabilizationWatermark;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (unint64_t)videoCompositorDebugMode
{
  return self->_videoCompositorDebugMode;
}

- (BOOL)toolbarShadowsEnabled
{
  return self->_toolbarShadowsEnabled;
}

- (double)mainToolbarShadowLength
{
  return self->_mainToolbarShadowLength;
}

- (double)secondaryToolbarShadowLength
{
  return self->_secondaryToolbarShadowLength;
}

- (BOOL)editMenuEnabled
{
  return self->_editMenuEnabled;
}

- (void)setEditMenuEnabled:(BOOL)a3
{
  self->_editMenuEnabled = a3;
}

- (BOOL)hideUIForInteractionEnabled
{
  return self->_hideUIForInteractionEnabled;
}

- (void)setHideUIForInteractionEnabled:(BOOL)a3
{
  self->_hideUIForInteractionEnabled = a3;
}

- (double)hideUIForInteractionFadeInDuration
{
  return self->_hideUIForInteractionFadeInDuration;
}

- (void)setHideUIForInteractionFadeInDuration:(double)a3
{
  self->_hideUIForInteractionFadeInDuration = a3;
}

- (double)hideUIForInteractionFadeOutDuration
{
  return self->_hideUIForInteractionFadeOutDuration;
}

- (void)setHideUIForInteractionFadeOutDuration:(double)a3
{
  self->_hideUIForInteractionFadeOutDuration = a3;
}

- (double)hideUIForInteractionFadeOutDelay
{
  return self->_hideUIForInteractionFadeOutDelay;
}

- (void)setHideUIForInteractionFadeOutDelay:(double)a3
{
  self->_hideUIForInteractionFadeOutDelay = a3;
}

- (BOOL)shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation
{
  return self->_shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation;
}

- (void)setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:(BOOL)a3
{
  self->_shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation = a3;
}

- (BOOL)allowDisabledTools
{
  return self->_allowDisabledTools;
}

- (void)setAllowDisabledTools:(BOOL)a3
{
  self->_allowDisabledTools = a3;
}

- (void)setEnableEnterEditSemanticStyleAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSemanticStyleAutoCalc = a3;
}

- (BOOL)enableSemanticStyleInEdit
{
  return self->_enableSemanticStyleInEdit;
}

- (void)setEnableSemanticStyleInEdit:(BOOL)a3
{
  self->_enableSemanticStyleInEdit = a3;
}

- (BOOL)enableSemanticStyleDebugUIInEdit
{
  return self->_enableSemanticStyleDebugUIInEdit;
}

- (void)setEnableSemanticStyleDebugUIInEdit:(BOOL)a3
{
  self->_enableSemanticStyleDebugUIInEdit = a3;
}

- (BOOL)shouldConstraintDpadValuesToGrid
{
  return self->_shouldConstraintDpadValuesToGrid;
}

- (void)setShouldConstraintDpadValuesToGrid:(BOOL)a3
{
  self->_shouldConstraintDpadValuesToGrid = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_61443 != -1)
    dispatch_once(&sharedInstance_onceToken_61443, &__block_literal_global_61444);
  return (id)sharedInstance_sharedInstance_61445;
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
  id v220;
  id v221;
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
  _QWORD v293[30];
  void *v294;
  _QWORD v295[5];
  void *v296;
  _QWORD v297[3];
  _QWORD v298[5];
  _QWORD v299[8];
  _QWORD v300[3];
  _QWORD v301[3];
  _QWORD v302[6];
  _QWORD v303[5];
  _QWORD v304[6];
  _QWORD v305[8];
  void *v306;
  _QWORD v307[5];
  _QWORD v308[2];
  _QWORD v309[3];
  _QWORD v310[3];
  _QWORD v311[2];
  _QWORD v312[3];
  _QWORD v313[10];
  _QWORD v314[12];
  _QWORD v315[4];
  _QWORD v316[3];
  _QWORD v317[15];
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[4];
  _QWORD v321[2];
  _QWORD v322[8];
  _QWORD v323[7];

  v323[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Render Photo Adjustments Async"), CFSTR("useAsynchronousRenderingPhotos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v323[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Video Render Adjustments Async"), CFSTR("disableAsynchronousRenderingVideos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v323[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Live Video Render"), CFSTR("enableLiveVideoRender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v323[2] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Specify Live Video Render Size"), CFSTR("enableLiveVideoRenderAtSetSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v323[3] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Dynamic Video Scaling"), CFSTR("enableDynamicVideoScaling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v323[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v323, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v8, CFSTR("Async Save Settings"));
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  v290 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable For All Assets (SDR/OpenExr/etc)"), CFSTR("allAssetsCanUseHDRPipeline"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v322[0] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show HDR Debug Adjustments"), CFSTR("showHDRDebugAdjustments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v322[1] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show HDR Headroom Control"), CFSTR("showHDRHeadroomControl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v322[2] = v11;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Packed 10-bit Pixel Formats"), CFSTR("disablePacked10BitPixelFormats"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v322[3] = v12;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Render M+ as HDR"), CFSTR("disableRenderMeteorPlusAsHDR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v322[4] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Decode M+ as Linear"), CFSTR("decodeMeteorPlusAsLinear"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v322[5] = v14;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force M++ Gain Map"), CFSTR("forceMeteorPlusPlus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v322[6] = v15;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable HDR-5"), CFSTR("enableDash5"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v322[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v322, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "sectionWithRows:title:", v17, CFSTR("HDR Settings"));
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Fuzzball"), CFSTR("enableFuzzball"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = v19;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Aperture Slider Has Off Position"), CFSTR("apertureSliderHasOffPosition"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v321[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v321, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v21, CFSTR("Portrait Settings"));
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Override Video Editability Check"), CFSTR("overrideVideoEditability"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v320[0] = v23;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Trackers During Playback"), CFSTR("hideTrackersDuringPlayback"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v320[1] = v24;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Timeline Animations"), CFSTR("disableTimelineAnimations"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v320[2] = v25;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Debug Tracker Mask"), CFSTR("debugTrackerMask"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v320[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v320, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v27, CFSTR("CPV Settings"));
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Run Neutrino Synchronously"), CFSTR("runNeutrinoSynchronously"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v319[0] = v29;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Video Compositor Debug"), CFSTR("videoCompositorDebugMode"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "possibleValues:titles:", &unk_1E59BA4E0, &unk_1E59BA4F8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v319[1] = v31;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Render Priority"), CFSTR("renderPriority"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "possibleValues:titles:", &unk_1E59BA510, &unk_1E59BA528);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v319[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v319, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v34, CFSTR("Neutrino Settings"));
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Show 'Done' Button"), CFSTR("alwaysShowDoneButton"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v318[0] = v36;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Apply Video Orientation As Metadata"), CFSTR("applyVideoOrientationAsMetadata"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v318[1] = v37;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable IOSurface Portrait Export"), CFSTR("disableIOSurfacePortaitExport"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v318[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v318, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v39, CFSTR("Export Settings"));
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  v284 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Neutrino Debug"), CFSTR("enableNURenderJobDebug"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v317[0] = v282;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Node Graphs"), CFSTR("nuRenderJobDebugCaptureNodeGraphs"));
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v317[1] = v277;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Node Cache"), CFSTR("nuRenderJobDebugCaptureNodeCache"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v317[2] = v269;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Canceled Jobs"), CFSTR("nuRenderJobDebugCaptureCanceledJobs"));
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v317[3] = v261;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Perf Stat History"), CFSTR("nuRenderJobDebugCapturePerfStatHistory"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v317[4] = v255;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Only Perf Stats (fast)"), CFSTR("nuRenderJobDebugCaptureOnlyPerfStats"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v317[5] = v250;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture 5% of Jobs (fast)"), CFSTR("nuRenderJobDebugCapture5PercentOfJobs"));
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "conditionFormat:", CFSTR("enableNURenderJobDebug != 0"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v317[6] = v243;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Core Image Debug (Must Relaunch)"), CFSTR("enableCoreImageDebugMode"));
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v317[7] = v239;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Inputs"), CFSTR("enableCoreImageDebugInputs"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "conditionFormat:", CFSTR("enableCoreImageDebugMode != 0"));
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v317[8] = v233;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Outputs"), CFSTR("enableCoreImageDebugOutputs"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "conditionFormat:", CFSTR("enableCoreImageDebugMode != 0"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v317[9] = v228;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Intermediates (Slow)"), CFSTR("enableCoreImageDebugIntermediates"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "conditionFormat:", CFSTR("enableCoreImageDebugMode != 0"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v317[10] = v40;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("   Capture Timing"), CFSTR("enableCoreImageDebugTiming"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "conditionFormat:", CFSTR("enableCoreImageDebugMode != 0"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v317[11] = v42;
  v43 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_244_60959);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:action:", CFSTR("View"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v317[12] = v45;
  v46 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_248_60961);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:action:", CFSTR("Share"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v317[13] = v48;
  v49 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_251_60963);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:action:", CFSTR("Delete"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v317[14] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v317, 15);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "sectionWithRows:title:", v52, CFSTR("Render Debug"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Render Backfill Blue"), CFSTR("renderBackfillBlue"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v316[0] = v54;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Render Zoom Purple"), CFSTR("renderZoomPurple"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v316[1] = v55;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Media View Debug Mode"), CFSTR("mediaViewDebugMode"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v316[2] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v316, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sectionWithRows:title:", v57, CFSTR("NUMediaView Settings"));
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always show Portrait V2 Tool"), CFSTR("alwaysShowPortraitV2"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v315[0] = v59;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Glasses Matte Off (Robust Portait 2)"), CFSTR("forceGlassesMatteOff"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v315[1] = v60;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Spill Matte Off (Robust Portait 2)"), CFSTR("forceSpillMatteOff"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v315[2] = v61;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Spill Matte on older V2 Captures (Robust Portait 2)"), CFSTR("allowSpillMatteOnOlderPortraitV2Captures"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v315[3] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v315, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sectionWithRows:title:", v63, CFSTR("Portrait Settings"));
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  v278 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Light Mode Editor"), CFSTR("lightModeEditor"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v314[0] = v274;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Edit Toast progress"), CFSTR("useEditToastProgress"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v314[1] = v270;
  v64 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowSynchronousBatchRendering);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Allow synchronous batch rendering"), v266);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v314[2] = v262;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Reset Tool Button"), CFSTR("showResetToolButton"));
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v314[3] = v258;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Smart B&W Adjustment"), CFSTR("showSmartBlackAndWhiteAdjustment"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v314[4] = v65;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Semantic Development Switch"), CFSTR("showSemanticDevelopmentSwitch"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v314[5] = v66;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Maintain Crop Aspect Lock State"), CFSTR("maintainCropAspectLockState"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v314[6] = v67;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Glass Tool Backgrounds"), CFSTR("blurToolBackgrounds"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v314[7] = v68;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Swipe to Exit Edit"), CFSTR("swipeToExitEdit"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v314[8] = v69;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use New Cancel/Done Buttons"), CFSTR("newNotchButtons"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v314[9] = v70;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Spatial Media Editing"), CFSTR("enableSpatialMediaEditing"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v314[10] = v71;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow disabled tools"), CFSTR("allowDisabledTools"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v314[11] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v314, 12);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "sectionWithRows:title:", v73, CFSTR("Edit Tool Controller"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  v275 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Styles Tab in Edit"), CFSTR("enableSemanticStyleInEdit"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v313[0] = v271;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Sync Styles Copy&Paste"), CFSTR("synchronousStylesCopyPaste"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v313[1] = v267;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Eng Placeholder Names"), CFSTR("useEngPlaceholderNames"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v313[2] = v263;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Should Use Flip Animation for Platter"), CFSTR("shouldUseFlipAnimationForValuePlatter"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v313[3] = v259;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Should Constraint Pad Values to Grid"), CFSTR("shouldConstraintDpadValuesToGrid"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v313[4] = v74;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Styles Debug UI in Edit"), CFSTR("enableSemanticStyleDebugUIInEdit"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v313[5] = v75;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Style Engine Revert if Possible"), CFSTR("shouldRevertStyledOriginalIfPossible"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v313[6] = v76;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Styles for ProRaw"), CFSTR("shouldEnableStylesForProRaw"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v313[7] = v77;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Temporal Filtering Window Size"), CFSTR("semanticStyleTemporalWindowSize"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "minValue:maxValue:", 1.0, 20.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "valueStringFormatter:", &__block_literal_global_372);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v313[8] = v80;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable On All Hardware"), CFSTR("overrideSemanticStylesHardwareCheck"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v313[9] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v313, 10);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "sectionWithRows:title:", v82, CFSTR("Semantic Styles v2"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Auto Enhance Action"), CFSTR("showAutoEnhanceAction"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v312[0] = v84;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Rotate Action"), CFSTR("showRotateAction"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v312[1] = v85;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Selective Copy Edits"), CFSTR("enableSelectiveCopyEdits"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v312[2] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v312, 3);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sectionWithRows:title:", v87, CFSTR("Edit Actions"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preview Times Out"), CFSTR("previewOriginalTimesOut"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v311[0] = v89;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Preview Duration"), CFSTR("previewOriginalDuration"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "minValue:maxValue:", 1.0, 3.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v311[1] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v311, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sectionWithRows:title:", v92, CFSTR("Preview Original Tap"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Download"), CFSTR("simulateDownload"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v310[0] = v94;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Failure"), CFSTR("simulateDownloadFailure"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "conditionFormat:", CFSTR("simulateDownload != 0"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v310[1] = v96;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Skip Loading displaySizeImage (Needs Relaunch)"), CFSTR("skipPHContentEditingInputDisplaySizeImage"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v310[2] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v310, 3);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "sectionWithRows:title:", v98, CFSTR("PhotoKit Settings"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Error"), CFSTR("simulateEditEntryError"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v309[0] = v100;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Simulated Error"), CFSTR("simulatedEditingEntryErrorType"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "possibleValues:titles:", &unk_1E59BA540, &unk_1E59BA558);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "conditionFormat:", CFSTR("simulateEditEntryError != 0"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v309[1] = v103;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show File Radar Button (Internal Only)"), CFSTR("showFileRadarButtonForEditEntryOnInternalInstalls"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v309[2] = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v309, 3);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sectionWithRows:title:", v105, CFSTR("Edit Entry Error Handling"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Any Plugin"), CFSTR("allowAnyPlugin"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v308[0] = v107;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Attempt Extension Undo Auto-Setup"), CFSTR("attemptEditExtensionUndoAutoSetup"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v308[1] = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v308, 2);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "sectionWithRows:title:", v109, CFSTR("Extension Settings"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  v253 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Stroke Width"), CFSTR("strokeWidth"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "minValue:maxValue:", 0.0, 5.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v307[0] = v111;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Selection Ring Stroke"), CFSTR("selectionRingStrokeWidth"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "minValue:maxValue:", 0.0, 5.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v307[1] = v113;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Label Platter Alpha"), CFSTR("adjustmentLabelPlatterAlpha"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "minValue:maxValue:", 0.0, 1.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v307[2] = v115;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Show Adjustment Values"), CFSTR("alwaysShowValueWhenAdjustmentIsSelected"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v307[3] = v116;
  v117 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_478);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "rowWithTitle:action:", CFSTR("Clear Adjustments Pasteboard"), v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v307[4] = v119;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v307, 5);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "sectionWithRows:title:", v120, CFSTR("Adjustment Tool Settings"));
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Debug HUD"), CFSTR("enableSemanticDevelopmentHUD"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v306 = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v306, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "sectionWithRows:title:", v123, CFSTR("Semantic Development Settings"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  v248 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Auto Crop"), CFSTR("autoCropEnabled"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v305[0] = v244;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Auto Crop (Degrees)"), CFSTR("autoStraightenMaxAngle"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "minValue:maxValue:", 0.0, 10.0);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v305[1] = v237;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Crop Side Margins"), CFSTR("cropSideMargins"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "minValue:maxValue:", 0.0, 32.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v305[2] = v124;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Straighten Wheel Radius"), CFSTR("cropWheelSize"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "minValue:maxValue:", 300.0, 568.0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v305[3] = v126;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Perspective Track Ball Radius"), CFSTR("trackBallSize"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "minValue:maxValue:", 70.0, 150.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v305[4] = v128;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("New Perspective Debug Crop Rect"), CFSTR("perspectiveViewDebugCropEnabled"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v305[5] = v129;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Crop Mask Blur"), CFSTR("cropMaskBlurred"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v305[6] = v130;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Crop Recompose Delay"), CFSTR("cropRecomposeDelay"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "minValue:maxValue:", 0.0, 1.5);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v305[7] = v132;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v305, 8);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "sectionWithRows:title:", v133, CFSTR("Crop Tool Settings"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  v245 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Auto Yaw (Degrees)"), CFSTR("autoPerspectiveMaxYaw"));
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "minValue:maxValue:", 0.0, 45.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v304[0] = v134;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Auto Pitch (Degrees)"), CFSTR("autoPerspectiveMaxPitch"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "minValue:maxValue:", 0.0, 45.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v304[1] = v136;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Auto Angle (Degrees)"), CFSTR("autoPerspectiveMaxAngle"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "minValue:maxValue:", 0.0, 45.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v304[2] = v138;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Face Size (% of image)"), CFSTR("autoPerspectiveMaxFaceSize"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "minValue:maxValue:", 0.0, 100.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v304[3] = v140;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable On Panos (> 2:1 aspect)"), CFSTR("autoPerspectiveDisableOnPanos"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v304[4] = v141;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable On FFC Images"), CFSTR("autoPerspectiveDisableOnFrontFacingCameraImages"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v304[5] = v142;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v304, 6);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "sectionWithRows:title:", v143, CFSTR("Auto Perspective Settings"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("LPP: Changing lighting disables Live"), CFSTR("changeLightingDisablesLive"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v303[0] = v145;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Bounce/Loop Trim"), CFSTR("loopBounceTrimAllowed"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v303[1] = v146;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always allow key photo editing"), CFSTR("alwaysAllowKeyPhotoEditing"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v303[2] = v147;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Require tap to show Make Key/Poster Frame"), CFSTR("requireTapToShowMakePosterFrame"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v303[3] = v148;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Suggested Key Frames"), CFSTR("showSuggestedKeyFrame"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v303[4] = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v303, 5);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "sectionWithRows:title:", v150, CFSTR("Live Photo Settings"));
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  v151 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Pause after moving playhead"), CFSTR("pauseAfterMovingPlayhead"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v302[0] = v152;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Video: Allow Make Poster Frame"), CFSTR("allowMakePosterFrameForVideo"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v302[1] = v153;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Video Scrubber Debug Overlay"), CFSTR("showVideoScrubberDebugOverlay"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v302[2] = v154;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Filmstrip Thumbnails"), CFSTR("disableVideoFilmstrip"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v302[3] = v155;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Frame Number on Video Scrubber"), CFSTR("showFrameNumberOnVideoScrubber"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v302[4] = v156;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Tap Timeline to Seek"), CFSTR("tapTimelineToSeek"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v302[5] = v157;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v302, 6);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "sectionWithRows:title:", v158, CFSTR("Video Settings"));
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  v159 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Stabilization Watermark"), CFSTR("showStabilizationWatermark"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v301[0] = v160;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Stabilization Adjustment"), CFSTR("enableVideoStabilizion"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v301[1] = v161;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Stabilize Crop Fraction"), CFSTR("videoStabilizeMaxCropFraction"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "minValue:maxValue:", 0.0, 1.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v301[2] = v163;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v301, 3);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "sectionWithRows:title:", v164, CFSTR("Video Stabilization Settings"));
  v235 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Perf Debug HUD"), CFSTR("enablePerfDebugHUD"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v300[0] = v166;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Perf TTR Button"), CFSTR("enablePerfTTRButton"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v300[1] = v167;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("TTR Duration Threshold(s)"), CFSTR("ttrButtonDurationThreshold"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "minValue:maxValue:", 0.1, 5.0);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v300[2] = v169;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v300, 3);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "sectionWithRows:title:", v170, CFSTR("Edit Performance"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  v229 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable SmartTone AutoCalc"), CFSTR("enableEnterEditSmartToneAutoCalc"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v299[0] = v171;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable SmartColor AutoCalc"), CFSTR("enableEnterEditSmartColorAutoCalc"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v299[1] = v172;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable SemStyle AutoCalc"), CFSTR("enableEnterEditSemanticStyleAutoCalc"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v299[2] = v173;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Crop AutoCalc"), CFSTR("enableEnterEditCropAutoCalc"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v299[3] = v174;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Perspective AutoCalc"), CFSTR("enableEnterEditPerspectiveAutoCalc"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v299[4] = v175;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable DepthEffect AutoCalc"), CFSTR("enableEnterEditDepthEffectAutoCalc"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v299[5] = v176;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Portrait AutoCalc"), CFSTR("enableEnterEditPortraitAutoCalc"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v299[6] = v177;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Filter Thumbs"), CFSTR("enableEnterEditFilterThumbnailGeneration"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v299[7] = v178;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v299, 8);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "sectionWithRows:title:", v179, CFSTR("Misc Enter Edit Perf"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  v180 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show SCAP Review Action"), CFSTR("smartCopyPasteReviewUIEnabled"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v298[0] = v181;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("[Gating] Use Capture Time Gating"), CFSTR("smartCopyPasteCaptureTimeGating"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v298[1] = v182;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("[Gating]  Similarity Gating Threshold"), CFSTR("smartCopyPasteSimilarityGating"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "minValue:maxValue:", 0.0, 100.0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "px_increment:", 0.5);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v298[2] = v185;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Affect Manually Edited Sliders Only"), CFSTR("affectManuallyEditedSlidersOnly"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v298[3] = v186;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Send ScenePrint if available"), CFSTR("fetchAndSendScenePrintsForSliderNet"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v298[4] = v187;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v298, 5);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "sectionWithRows:title:", v188, CFSTR("Smart Copy Paste"));
  v227 = (void *)objc_claimAutoreleasedReturnValue();

  v189 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Toolbar Shadows Enabled"), CFSTR("toolbarShadowsEnabled"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v297[0] = v190;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Main Length"), CFSTR("mainToolbarShadowLength"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "minValue:maxValue:", 0.0, 500.0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v297[1] = v192;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Secondary Length"), CFSTR("secondaryToolbarShadowLength"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "minValue:maxValue:", 0.0, 500.0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v297[2] = v194;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v297, 3);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "sectionWithRows:title:", v195, CFSTR("Toolbar Shadow"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  v196 = (void *)MEMORY[0x1E0D83078];
  v197 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_editMenuEnabled);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "rowWithTitle:valueKeyPath:", CFSTR("Edit Menu Enabled"), v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v296 = v199;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v296, 1);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "sectionWithRows:title:", v200, CFSTR("Edit Menu"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();

  v222 = (void *)MEMORY[0x1E0D83078];
  v201 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_hideUIForInteractionEnabled);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v295[0] = v203;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade In"), CFSTR("hideUIForInteractionFadeInDuration"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "minValue:maxValue:", 0.0, 3.0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v295[1] = v205;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Out"), CFSTR("hideUIForInteractionFadeOutDuration"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "minValue:maxValue:", 0.0, 3.0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v295[2] = v207;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Delay"), CFSTR("hideUIForInteractionFadeOutDelay"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "minValue:maxValue:", 0.0, 4.0);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v295[3] = v209;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Should Move toolbar offscreen in Landscape"), CFSTR("shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v295[4] = v210;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v295, 5);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "sectionWithRows:title:", v211, CFSTR("Hide UI for Interaction"));
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  v212 = (void *)MEMORY[0x1E0D83078];
  v213 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "rowWithTitle:action:", CFSTR("Restore Defaults"), v214);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v294 = v215;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v294, 1);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "sectionWithRows:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();

  v220 = (id)MEMORY[0x1E0D83078];
  v293[0] = v279;
  v293[1] = v276;
  v293[2] = v272;
  v293[3] = v292;
  v293[4] = v291;
  v293[5] = v289;
  v293[6] = v288;
  v293[7] = v287;
  v293[8] = v286;
  v293[9] = v285;
  v293[10] = v283;
  v293[11] = v281;
  v293[12] = v268;
  v293[13] = v264;
  v293[14] = v260;
  v293[15] = v227;
  v293[16] = v256;
  v293[17] = v251;
  v293[18] = v249;
  v293[19] = v246;
  v293[20] = v242;
  v293[21] = v238;
  v293[22] = v235;
  v293[23] = v232;
  v293[24] = v230;
  v293[25] = v254;
  v293[26] = v225;
  v293[27] = v224;
  v293[28] = v223;
  v293[29] = v217;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v293, 30);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "moduleWithTitle:contents:", CFSTR("Photo Editing"), v218);
  v221 = (id)objc_claimAutoreleasedReturnValue();

  return v221;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_5()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearPasteboard");

  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), objc_msgSend(a2, "integerValue"));
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_3()
{
  +[PURenderDebugController deleteDebugDirectory](PURenderDebugController, "deleteDebugDirectory");
  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;

  v3 = a3;
  +[PURenderDebugController shareSheetViewController](PURenderDebugController, "shareSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;

  v3 = a3;
  +[PURenderDebugController listDebugFilesViewController](PURenderDebugController, "listDebugFilesViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

  return 1;
}

void __42__PUPhotoEditProtoSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoEditingSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_61445;
  sharedInstance_sharedInstance_61445 = v0;

}

@end
