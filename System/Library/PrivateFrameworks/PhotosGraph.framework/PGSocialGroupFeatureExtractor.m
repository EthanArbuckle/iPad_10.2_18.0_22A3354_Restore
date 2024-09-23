@implementation PGSocialGroupFeatureExtractor

- (PGSocialGroupFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PGSocialGroupFeatureExtractor *v9;
  objc_super v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("SocialGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode socialGroupInMoment](PGGraphMomentNode, "socialGroupInMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)PGSocialGroupFeatureExtractor;
  v9 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v11, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("CHILD"), v4, v8, &__block_literal_global_15652);

  return v9;
}

const __CFString *__47__PGSocialGroupFeatureExtractor_initWithError___block_invoke()
{
  __CFString *v0;

  v0 = CFSTR("SocialGroup");
  return CFSTR("SocialGroup");
}

@end
