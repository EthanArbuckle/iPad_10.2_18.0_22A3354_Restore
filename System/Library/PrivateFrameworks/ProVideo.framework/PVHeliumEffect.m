@implementation PVHeliumEffect

+ (void)registerEffects
{
  +[PVMultiBlendEffect registerEffectWithID:displayName:](PVMultiBlendEffect, "registerEffectWithID:displayName:", CFSTR("3048982C-6092-44A8-9A09-80C6C992FCAA"), CFSTR("MultiBlend"));
  +[PVOrientationEffect registerEffectWithID:displayName:](PVOrientationEffect, "registerEffectWithID:displayName:", CFSTR("Orientation"), CFSTR("Orientation"));
  +[PVExposureAdjust registerEffectWithID:displayName:](PVExposureAdjust, "registerEffectWithID:displayName:", CFSTR("8F739200-ED08-45FA-9873-F2CE8677C6A3"), CFSTR("ExposureAdjust"));
  +[PVBlurEffect registerEffectWithID:displayName:](PVBlurEffect, "registerEffectWithID:displayName:", CFSTR("Helium:2B1A5740-7A1B-4AF3-9B95-2E81B81791C3"), CFSTR("Blur"));
  +[PVClearAlphaEffect registerEffectWithID:displayName:](PVClearAlphaEffect, "registerEffectWithID:displayName:", CFSTR("Helium:546F6E1C-A3D6-4E0E-BEA5-9E8E6DBD251D"), CFSTR("ClearAlpha"));
  +[PVSaturationZebraEffect registerEffectWithID:displayName:](PVSaturationZebraEffect, "registerEffectWithID:displayName:", CFSTR("Helium:A8264B76-DCDF-41FA-8D8E-90971D43549B"), CFSTR("SaturationZebra"));
  +[PVCinematicEffect registerEffectWithID:displayName:](PVCinematicEffect, "registerEffectWithID:displayName:", CFSTR("Helium:BD4D38AC-EF67-434A-832D-D1C5BE323955"), CFSTR("Cinematic"));
}

@end
