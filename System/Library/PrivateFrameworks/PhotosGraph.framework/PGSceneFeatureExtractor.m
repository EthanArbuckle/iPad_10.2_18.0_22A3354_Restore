@implementation PGSceneFeatureExtractor

- (PGSceneFeatureExtractor)initWithError:(id *)a3
{
  return -[PGSceneFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGSceneFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  PGSceneFeatureExtractor *v7;
  objc_super v9;

  -[PGSceneFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode sceneOfMoment](PGGraphMomentNode, "sceneOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGSceneFeatureExtractor;
  v7 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v9, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Scene"), v5, v6, &__block_literal_global_53235);

  return v7;
}

- (id)labelsForVersion:(int64_t)a3
{
  id result;
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      result = &unk_1E84EA420;
      break;
    case 2:
      result = &unk_1E84EA438;
      break;
    case 3:
      result = &unk_1E84EA450;
      break;
    case 4:
      v4[0] = CFSTR("Snow");
      v4[1] = CFSTR("Sunset_Sunrise");
      v4[2] = CFSTR("Flower");
      v4[3] = CFSTR("Cityscape");
      v4[4] = CFSTR("Waterfall");
      v4[5] = CFSTR("Rainbow");
      v4[6] = CFSTR("Skateboarding");
      v4[7] = CFSTR("Forest");
      v4[8] = CFSTR("Airplane");
      v4[9] = CFSTR("Bird");
      v4[10] = CFSTR("Surfing");
      v4[11] = CFSTR("Baby");
      v4[12] = CFSTR("Coffee");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 13);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = MEMORY[0x1E0C9AA60];
      break;
  }
  return result;
}

uint64_t __49__PGSceneFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
