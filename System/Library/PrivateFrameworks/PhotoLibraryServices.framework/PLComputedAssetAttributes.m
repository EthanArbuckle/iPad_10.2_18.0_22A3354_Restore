@implementation PLComputedAssetAttributes

+ (id)entityName
{
  return CFSTR("ComputedAssetAttributes");
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("ComputedAssetAttributes"));
}

- (void)setPropertiesFromImageAestheticsObservation:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;

  v4 = a3;
  objc_msgSend(v4, "wellFramedSubjectScore");
  -[PLComputedAssetAttributes setWellFramedSubjectScore:](self, "setWellFramedSubjectScore:");
  objc_msgSend(v4, "tastefullyBlurredScore");
  -[PLComputedAssetAttributes setTastefullyBlurredScore:](self, "setTastefullyBlurredScore:");
  objc_msgSend(v4, "sharplyFocusedSubjectScore");
  -[PLComputedAssetAttributes setSharplyFocusedSubjectScore:](self, "setSharplyFocusedSubjectScore:");
  objc_msgSend(v4, "wellTimedShotScore");
  -[PLComputedAssetAttributes setWellTimedShotScore:](self, "setWellTimedShotScore:");
  objc_msgSend(v4, "pleasantLightingScore");
  -[PLComputedAssetAttributes setPleasantLightingScore:](self, "setPleasantLightingScore:");
  objc_msgSend(v4, "pleasantReflectionsScore");
  -[PLComputedAssetAttributes setPleasantReflectionsScore:](self, "setPleasantReflectionsScore:");
  objc_msgSend(v4, "harmoniousColorScore");
  -[PLComputedAssetAttributes setHarmoniousColorScore:](self, "setHarmoniousColorScore:");
  objc_msgSend(v4, "livelyColorScore");
  -[PLComputedAssetAttributes setLivelyColorScore:](self, "setLivelyColorScore:");
  objc_msgSend(v4, "pleasantSymmetryScore");
  -[PLComputedAssetAttributes setPleasantSymmetryScore:](self, "setPleasantSymmetryScore:");
  objc_msgSend(v4, "pleasantPatternScore");
  -[PLComputedAssetAttributes setPleasantPatternScore:](self, "setPleasantPatternScore:");
  objc_msgSend(v4, "immersivenessScore");
  -[PLComputedAssetAttributes setImmersivenessScore:](self, "setImmersivenessScore:");
  objc_msgSend(v4, "pleasantPerspectiveScore");
  -[PLComputedAssetAttributes setPleasantPerspectiveScore:](self, "setPleasantPerspectiveScore:");
  objc_msgSend(v4, "pleasantPostProcessingScore");
  -[PLComputedAssetAttributes setPleasantPostProcessingScore:](self, "setPleasantPostProcessingScore:");
  objc_msgSend(v4, "noiseScore");
  -[PLComputedAssetAttributes setNoiseScore:](self, "setNoiseScore:");
  objc_msgSend(v4, "noiseScore");
  -[PLComputedAssetAttributes setNoiseScore:](self, "setNoiseScore:");
  objc_msgSend(v4, "failureScore");
  -[PLComputedAssetAttributes setFailureScore:](self, "setFailureScore:");
  objc_msgSend(v4, "pleasantCompositionScore");
  -[PLComputedAssetAttributes setPleasantCompositionScore:](self, "setPleasantCompositionScore:");
  objc_msgSend(v4, "interestingSubjectScore");
  -[PLComputedAssetAttributes setInterestingSubjectScore:](self, "setInterestingSubjectScore:");
  objc_msgSend(v4, "intrusiveObjectPresenceScore");
  -[PLComputedAssetAttributes setIntrusiveObjectPresenceScore:](self, "setIntrusiveObjectPresenceScore:");
  objc_msgSend(v4, "pleasantCameraTiltScore");
  -[PLComputedAssetAttributes setPleasantCameraTiltScore:](self, "setPleasantCameraTiltScore:");
  objc_msgSend(v4, "lowKeyLightingScore");
  v6 = v5;

  LODWORD(v7) = v6;
  -[PLComputedAssetAttributes setLowLight:](self, "setLowLight:", v7);
}

@end
