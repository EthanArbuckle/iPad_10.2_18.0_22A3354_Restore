@implementation PGAudioMemoryNodeFeatureExtractor

- (PGAudioMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return -[PGAudioMemoryNodeFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGAudioMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGAudioMemoryNodeFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PGAudioMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphAudioFeatureNode filter](PGGraphAudioFeatureNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGAudioMemoryNodeFeatureExtractor name](PGAudioMemoryNodeFeatureExtractor, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PGAudioMemoryNodeFeatureExtractor;
  v12 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, v11, v5, v10, &__block_literal_global_18409);

  return v12;
}

- (id)labelsForVersion:(int64_t)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v5[0] = CFSTR("ExcitementAudio");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

uint64_t __59__PGAudioMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

+ (id)name
{
  return CFSTR("Audio");
}

@end
