@implementation PFMetadataIdentifier

+ (NSString)quicktimeMetadataSpatialVideoRecommendedForImmersiveMode
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.spatial.low-motion"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataFullFrameRatePlaybackIntent
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAA0], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataCameraLensModel
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.camera.lens_model"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataCameraFocalLength35mmEquivalent
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.camera.focal_length.35mm_equivalent"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeUserDataVideoLoopingType
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("LOOP"), *MEMORY[0x1E0C8A9F0]);
}

+ (NSString)quickTimeMetadataVitalityTransitionScore
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.live-photo.transition-vitality-score.v1"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataVariationIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.photos.variation-identifier"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataStillImageTime
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0CA4CC0], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataSpatialOverCaptureGroupIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAE0], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataRenderOriginatingSignature
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.photos.render.originating.signature"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataOriginatingSignature
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.photos.originating.signature"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataLivePhotoVitalityLimitingAllowed
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.limit-still-image-transform"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataLivePhotoVitalityDisabled
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAC0], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataLivePhotoMinimumClientVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.photos.live-photo.minimum-client-version"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataKeyLocationISO6709
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAC8], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataKeyActionVideoStabilizationStrength
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.action-video.stabilization-strength"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataContentIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AA88], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataContainsSpatialOverCaptureContent
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AA80], *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataCaptureMode
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.photos.captureMode"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataCinematicVideoRendering
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.cinematic-video.rendering"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quickTimeMetadataCinematicVideoCinematography
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataSpatialAggressorsSeen
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.spatial.aggressors-seen"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataSpatialFormatVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.spatial.format-version"), *MEMORY[0x1E0C8A9E8]);
}

+ (NSString)quicktimeMetadataSmartStyleCast
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.quicktime.smartstyle.cast"), *MEMORY[0x1E0C8A9E8]);
}

@end
