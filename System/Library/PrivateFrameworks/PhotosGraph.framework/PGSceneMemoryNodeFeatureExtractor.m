@implementation PGSceneMemoryNodeFeatureExtractor

- (PGSceneMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return -[PGSceneMemoryNodeFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGSceneMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGSceneMemoryNodeFeatureExtractor *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PGSceneMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneFeatureNode filter](PGGraphSceneFeatureNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGSceneMemoryNodeFeatureExtractor;
  v11 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v13, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Scene"), v5, v10, &__block_literal_global_107);

  return v11;
}

- (id)labelsForVersion:(int64_t)a3
{
  id result;
  _QWORD v4[18];

  v4[17] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      result = &unk_1E84EA468;
      break;
    case 2:
      result = &unk_1E84EA480;
      break;
    case 3:
      result = &unk_1E84EA498;
      break;
    case 4:
      v4[0] = CFSTR("Snow");
      v4[1] = CFSTR("SunriseSunset");
      v4[2] = CFSTR("Cityscape");
      v4[3] = CFSTR("Waterfall");
      v4[4] = CFSTR("Rainbow");
      v4[5] = CFSTR("Skateboarding");
      v4[6] = CFSTR("Forest");
      v4[7] = CFSTR("Airplane");
      v4[8] = CFSTR("Bird");
      v4[9] = CFSTR("Surfing");
      v4[10] = CFSTR("Coffee");
      v4[11] = CFSTR("Biking");
      v4[12] = CFSTR("Table");
      v4[13] = CFSTR("Cooking");
      v4[14] = CFSTR("SpringBloom");
      v4[15] = CFSTR("AutumnFoliage");
      v4[16] = CFSTR("PlayTime");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 17);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = MEMORY[0x1E0C9AA60];
      break;
  }
  return result;
}

uint64_t __59__PGSceneMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
