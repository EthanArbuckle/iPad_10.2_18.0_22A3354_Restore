@implementation PGPersonActivityMeaningFeatureExtractor

- (PGPersonActivityMeaningFeatureExtractor)initWithError:(id *)a3
{
  return -[PGPersonActivityMeaningFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGPersonActivityMeaningFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  PGPersonActivityMeaningFeatureExtractor *v7;
  objc_super v9;

  -[PGPersonActivityMeaningFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode personActivityMeaningOfMoment](PGGraphMomentNode, "personActivityMeaningOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGPersonActivityMeaningFeatureExtractor;
  v7 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v9, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("PersonActivityMeaning"), v5, v6, &__block_literal_global_8036);

  return v7;
}

- (id)prefix
{
  return CFSTR("PersonActivityMeaning");
}

- (id)labelsForVersion:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
    return MEMORY[0x1E0C9AA60];
  v6[0] = CFSTR("PersonBeachWater");
  v6[1] = CFSTR("PersonToys");
  v6[2] = CFSTR("PersonPlayground");
  v6[3] = CFSTR("PersonSoccer");
  v6[4] = CFSTR("PersonMartialArts");
  v6[5] = CFSTR("PersonActionSwimming");
  v6[6] = CFSTR("PersonActionPlayingOnASwing");
  v6[7] = CFSTR("PersonActionPlayingOnASlide");
  v6[8] = CFSTR("PersonActionHugging");
  v6[9] = CFSTR("PersonActionKissing");
  v6[10] = CFSTR("PersonActionJumpingOrLeaping");
  v6[11] = CFSTR("PersonActionRunningOrJogging");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__PGPersonActivityMeaningFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
