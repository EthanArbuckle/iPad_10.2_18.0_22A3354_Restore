@implementation PIAdjustmentConstants

- (PIAdjustmentConstants)init
{
  PIAdjustmentConstants *v2;
  PIAdjustmentConstants *v3;
  PIAdjustmentConstants *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PIAdjustmentConstants;
  v2 = -[PIAdjustmentConstants init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_PISmartToneAdjustmentKey, CFSTR("smartTone"));
    objc_storeStrong((id *)&v3->_PISmartColorAdjustmentKey, CFSTR("smartColor"));
    objc_storeStrong((id *)&v3->_PISmartBWAdjustmentKey, CFSTR("smartBlackAndWhite"));
    objc_storeStrong((id *)&v3->_PIGrainAdjustmentKey, CFSTR("grain"));
    objc_storeStrong((id *)&v3->_PIAutoEnhanceAdjustmentKey, CFSTR("autoEnhance"));
    objc_storeStrong((id *)&v3->_PIWhiteBalanceAdjustmentKey, CFSTR("whiteBalance"));
    objc_storeStrong((id *)&v3->_PIRedEyeAdjustmentKey, CFSTR("redEye"));
    objc_storeStrong((id *)&v3->_PIApertureRedEyeAdjustmentKey, CFSTR("apertureRedEye"));
    objc_storeStrong((id *)&v3->_PIRetouchAdjustmentKey, CFSTR("retouch"));
    objc_storeStrong((id *)&v3->_PIVignetteAdjustmentKey, CFSTR("vignette"));
    objc_storeStrong((id *)&v3->_PISharpenAdjustmentKey, CFSTR("sharpen"));
    objc_storeStrong((id *)&v3->_PINoiseReductionAdjustmentKey, CFSTR("noiseReduction"));
    objc_storeStrong((id *)&v3->_PIDefinitionAdjustmentKey, CFSTR("definition"));
    objc_storeStrong((id *)&v3->_PICurvesAdjustmentKey, CFSTR("curves"));
    objc_storeStrong((id *)&v3->_PILevelsAdjustmentKey, CFSTR("levels"));
    objc_storeStrong((id *)&v3->_PISelectiveColorAdjustmentKey, CFSTR("selectiveColor"));
    objc_storeStrong((id *)&v3->_PIEffectAdjustmentKey, CFSTR("effect"));
    objc_storeStrong((id *)&v3->_PIEffect3DAdjustmentKey, CFSTR("effect3D"));
    objc_storeStrong((id *)&v3->_PICropAdjustmentKey, CFSTR("cropStraighten"));
    objc_storeStrong((id *)&v3->_PITrimAdjustmentKey, CFSTR("trim"));
    objc_storeStrong((id *)&v3->_PISlomoAdjustmentKey, CFSTR("slomo"));
    objc_storeStrong((id *)&v3->_PILivePhotoKeyFrameAdjustmentKey, CFSTR("livePhotoKeyFrame"));
    objc_storeStrong((id *)&v3->_PIVideoPosterFrameAdjustmentKey, CFSTR("videoPosterFrame"));
    objc_storeStrong((id *)&v3->_PIAutoLoopAdjustmentKey, CFSTR("autoLoop"));
    objc_storeStrong((id *)&v3->_PIHighResFusionAdjustmentKey, CFSTR("highResFusion"));
    objc_storeStrong((id *)&v3->_PIMuteAdjustmentKey, CFSTR("mute"));
    objc_storeStrong((id *)&v3->_PIDepthAdjustmentKey, CFSTR("depthEffect"));
    objc_storeStrong((id *)&v3->_PIPortraitAdjustmentKey, CFSTR("portraitEffect"));
    objc_storeStrong((id *)&v3->_PIOrientationAdjustmentKey, CFSTR("orientation"));
    objc_storeStrong((id *)&v3->_PIRawAdjustmentKey, CFSTR("raw"));
    objc_storeStrong((id *)&v3->_PIRawNoiseReductionAdjustmentKey, CFSTR("rawNoiseReduction"));
    objc_storeStrong((id *)&v3->_PISourceAdjustmentKey, CFSTR("source"));
    objc_storeStrong((id *)&v3->_PIPortraitVideoAdjustmentKey, CFSTR("portraitVideo"));
    objc_storeStrong((id *)&v3->_PIVideoStabilizeAdjustmentKey, CFSTR("videoStabilize"));
    objc_storeStrong((id *)&v3->_PIVideoCrossfadeLoopAdjustmentKey, CFSTR("videoCrossfadeLoop"));
    objc_storeStrong((id *)&v3->_PISemanticEnhanceAdjustmentKey, CFSTR("semanticEnhance"));
    objc_storeStrong((id *)&v3->_PICinematicAudioAdjustmentKey, CFSTR("cinematicAudio"));
    objc_storeStrong((id *)&v3->_PISemanticStyleAdjustmentKey, CFSTR("semanticStyle"));
    v4 = v3;
  }

  return v3;
}

- (NSArray)allAdjustmentTypes
{
  __int128 v2;
  __int128 v3;
  NSString *PINoiseReductionAdjustmentKey;
  NSString *PICurvesAdjustmentKey;
  NSString *PISelectiveColorAdjustmentKey;
  NSString *PICropAdjustmentKey;
  NSString *PIAutoLoopAdjustmentKey;
  NSString *PIHighResFusionAdjustmentKey;
  NSString *PIDepthAdjustmentKey;
  NSString *PIOrientationAdjustmentKey;
  NSString *PIRawNoiseReductionAdjustmentKey;
  NSString *PICinematicAudioAdjustmentKey;
  NSString *PIVideoStabilizeAdjustmentKey;
  NSString *PISemanticEnhanceAdjustmentKey;
  __int128 v17;
  NSString *PISmartBWAdjustmentKey;
  __int128 v19;
  NSString *PIWhiteBalanceAdjustmentKey;
  __int128 v21;
  __int128 v22;
  NSString *PISharpenAdjustmentKey;
  NSString *v24;
  NSString *PIDefinitionAdjustmentKey;
  NSString *v26;
  NSString *PILevelsAdjustmentKey;
  NSString *v28;
  __int128 v29;
  NSString *v30;
  __int128 v31;
  __int128 v32;
  NSString *v33;
  NSString *v34;
  NSString *PIMuteAdjustmentKey;
  NSString *v36;
  NSString *PIPortraitAdjustmentKey;
  NSString *v38;
  NSString *PIRawAdjustmentKey;
  NSString *v40;
  NSString *PIPortraitVideoAdjustmentKey;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  NSString *PISemanticStyleAdjustmentKey;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v17 = *(_OWORD *)&self->_PISmartToneAdjustmentKey;
  v19 = *(_OWORD *)&self->_PIGrainAdjustmentKey;
  v2 = *(_OWORD *)&self->_PIRetouchAdjustmentKey;
  v21 = *(_OWORD *)&self->_PIRedEyeAdjustmentKey;
  v22 = v2;
  v29 = *(_OWORD *)&self->_PIEffectAdjustmentKey;
  v3 = *(_OWORD *)&self->_PILivePhotoKeyFrameAdjustmentKey;
  v31 = *(_OWORD *)&self->_PITrimAdjustmentKey;
  PISmartBWAdjustmentKey = self->_PISmartBWAdjustmentKey;
  PIWhiteBalanceAdjustmentKey = self->_PIWhiteBalanceAdjustmentKey;
  PINoiseReductionAdjustmentKey = self->_PINoiseReductionAdjustmentKey;
  PISharpenAdjustmentKey = self->_PISharpenAdjustmentKey;
  v24 = PINoiseReductionAdjustmentKey;
  PICurvesAdjustmentKey = self->_PICurvesAdjustmentKey;
  PIDefinitionAdjustmentKey = self->_PIDefinitionAdjustmentKey;
  v26 = PICurvesAdjustmentKey;
  PISelectiveColorAdjustmentKey = self->_PISelectiveColorAdjustmentKey;
  PILevelsAdjustmentKey = self->_PILevelsAdjustmentKey;
  v28 = PISelectiveColorAdjustmentKey;
  PICropAdjustmentKey = self->_PICropAdjustmentKey;
  v32 = v3;
  PIAutoLoopAdjustmentKey = self->_PIAutoLoopAdjustmentKey;
  PIHighResFusionAdjustmentKey = self->_PIHighResFusionAdjustmentKey;
  v30 = PICropAdjustmentKey;
  v33 = PIAutoLoopAdjustmentKey;
  v34 = PIHighResFusionAdjustmentKey;
  PIDepthAdjustmentKey = self->_PIDepthAdjustmentKey;
  PIMuteAdjustmentKey = self->_PIMuteAdjustmentKey;
  v36 = PIDepthAdjustmentKey;
  PIOrientationAdjustmentKey = self->_PIOrientationAdjustmentKey;
  PIPortraitAdjustmentKey = self->_PIPortraitAdjustmentKey;
  v38 = PIOrientationAdjustmentKey;
  PIRawNoiseReductionAdjustmentKey = self->_PIRawNoiseReductionAdjustmentKey;
  PIRawAdjustmentKey = self->_PIRawAdjustmentKey;
  v40 = PIRawNoiseReductionAdjustmentKey;
  PICinematicAudioAdjustmentKey = self->_PICinematicAudioAdjustmentKey;
  PISemanticEnhanceAdjustmentKey = self->_PISemanticEnhanceAdjustmentKey;
  PIVideoStabilizeAdjustmentKey = self->_PIVideoStabilizeAdjustmentKey;
  PIPortraitVideoAdjustmentKey = self->_PIPortraitVideoAdjustmentKey;
  v42 = PIVideoStabilizeAdjustmentKey;
  v43 = PISemanticEnhanceAdjustmentKey;
  v44 = PICinematicAudioAdjustmentKey;
  PISemanticStyleAdjustmentKey = self->_PISemanticStyleAdjustmentKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 36);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)nonVisualAdjustmentTypes
{
  __int128 v2;
  __int128 v4;
  NSString *PIMuteAdjustmentKey;
  __int128 v6;
  NSString *PICinematicAudioAdjustmentKey;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_PILivePhotoKeyFrameAdjustmentKey;
  v4 = *(_OWORD *)&self->_PITrimAdjustmentKey;
  PIMuteAdjustmentKey = self->_PIMuteAdjustmentKey;
  v6 = v2;
  PICinematicAudioAdjustmentKey = self->_PICinematicAudioAdjustmentKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 6);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)PISmartToneAdjustmentKey
{
  return self->_PISmartToneAdjustmentKey;
}

- (NSString)PISmartColorAdjustmentKey
{
  return self->_PISmartColorAdjustmentKey;
}

- (NSString)PISmartBWAdjustmentKey
{
  return self->_PISmartBWAdjustmentKey;
}

- (NSString)PIGrainAdjustmentKey
{
  return self->_PIGrainAdjustmentKey;
}

- (NSString)PIAutoEnhanceAdjustmentKey
{
  return self->_PIAutoEnhanceAdjustmentKey;
}

- (NSString)PIWhiteBalanceAdjustmentKey
{
  return self->_PIWhiteBalanceAdjustmentKey;
}

- (NSString)PIRedEyeAdjustmentKey
{
  return self->_PIRedEyeAdjustmentKey;
}

- (NSString)PIApertureRedEyeAdjustmentKey
{
  return self->_PIApertureRedEyeAdjustmentKey;
}

- (NSString)PIRetouchAdjustmentKey
{
  return self->_PIRetouchAdjustmentKey;
}

- (NSString)PIVignetteAdjustmentKey
{
  return self->_PIVignetteAdjustmentKey;
}

- (NSString)PISharpenAdjustmentKey
{
  return self->_PISharpenAdjustmentKey;
}

- (NSString)PINoiseReductionAdjustmentKey
{
  return self->_PINoiseReductionAdjustmentKey;
}

- (NSString)PIDefinitionAdjustmentKey
{
  return self->_PIDefinitionAdjustmentKey;
}

- (NSString)PICurvesAdjustmentKey
{
  return self->_PICurvesAdjustmentKey;
}

- (NSString)PILevelsAdjustmentKey
{
  return self->_PILevelsAdjustmentKey;
}

- (NSString)PISelectiveColorAdjustmentKey
{
  return self->_PISelectiveColorAdjustmentKey;
}

- (NSString)PIEffectAdjustmentKey
{
  return self->_PIEffectAdjustmentKey;
}

- (NSString)PIEffect3DAdjustmentKey
{
  return self->_PIEffect3DAdjustmentKey;
}

- (NSString)PICropAdjustmentKey
{
  return self->_PICropAdjustmentKey;
}

- (NSString)PITrimAdjustmentKey
{
  return self->_PITrimAdjustmentKey;
}

- (NSString)PISlomoAdjustmentKey
{
  return self->_PISlomoAdjustmentKey;
}

- (NSString)PILivePhotoKeyFrameAdjustmentKey
{
  return self->_PILivePhotoKeyFrameAdjustmentKey;
}

- (NSString)PIVideoPosterFrameAdjustmentKey
{
  return self->_PIVideoPosterFrameAdjustmentKey;
}

- (NSString)PIAutoLoopAdjustmentKey
{
  return self->_PIAutoLoopAdjustmentKey;
}

- (NSString)PIHighResFusionAdjustmentKey
{
  return self->_PIHighResFusionAdjustmentKey;
}

- (NSString)PIMuteAdjustmentKey
{
  return self->_PIMuteAdjustmentKey;
}

- (NSString)PIDepthAdjustmentKey
{
  return self->_PIDepthAdjustmentKey;
}

- (NSString)PIPortraitAdjustmentKey
{
  return self->_PIPortraitAdjustmentKey;
}

- (NSString)PIOrientationAdjustmentKey
{
  return self->_PIOrientationAdjustmentKey;
}

- (NSString)PIRawAdjustmentKey
{
  return self->_PIRawAdjustmentKey;
}

- (NSString)PIRawNoiseReductionAdjustmentKey
{
  return self->_PIRawNoiseReductionAdjustmentKey;
}

- (NSString)PISemanticEnhanceAdjustmentKey
{
  return self->_PISemanticEnhanceAdjustmentKey;
}

- (NSString)PIVideoStabilizeAdjustmentKey
{
  return self->_PIVideoStabilizeAdjustmentKey;
}

- (NSString)PIVideoCrossfadeLoopAdjustmentKey
{
  return self->_PIVideoCrossfadeLoopAdjustmentKey;
}

- (NSString)PIPortraitVideoAdjustmentKey
{
  return self->_PIPortraitVideoAdjustmentKey;
}

- (NSString)PICinematicAudioAdjustmentKey
{
  return self->_PICinematicAudioAdjustmentKey;
}

- (NSString)PISemanticStyleAdjustmentKey
{
  return self->_PISemanticStyleAdjustmentKey;
}

- (NSString)PISourceAdjustmentKey
{
  return self->_PISourceAdjustmentKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PISourceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISemanticStyleAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICinematicAudioAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIPortraitVideoAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoCrossfadeLoopAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoStabilizeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISemanticEnhanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRawNoiseReductionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRawAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIOrientationAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIPortraitAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIDepthAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIMuteAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIHighResFusionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIAutoLoopAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVideoPosterFrameAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PILivePhotoKeyFrameAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISlomoAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PITrimAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICropAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIEffect3DAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIEffectAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISelectiveColorAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PILevelsAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PICurvesAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIDefinitionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PINoiseReductionAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISharpenAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIVignetteAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRetouchAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIApertureRedEyeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIRedEyeAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIWhiteBalanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIAutoEnhanceAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PIGrainAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartBWAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartColorAdjustmentKey, 0);
  objc_storeStrong((id *)&self->_PISmartToneAdjustmentKey, 0);
}

@end
