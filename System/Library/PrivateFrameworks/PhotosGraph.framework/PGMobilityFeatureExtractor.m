@implementation PGMobilityFeatureExtractor

- (PGMobilityFeatureExtractor)initWithError:(id *)a3
{
  return -[PGMobilityFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGMobilityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  PGMobilityFeatureExtractor *v7;
  objc_super v9;

  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode mobilityOfMoment](PGGraphMomentNode, "mobilityOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGMobilityFeatureExtractor;
  v7 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForEmptyRelation:labelForTargetBlock:](&v9, sel_initWithName_featureNames_relation_labelForEmptyRelation_labelForTargetBlock_, CFSTR("Mobility"), v5, v6, CFSTR("None"), &__block_literal_global_53798);

  return v7;
}

uint64_t __52__PGMobilityFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

+ (id)_labelsForVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v8 = *MEMORY[0x1E0D4AF60];
    v12 = *MEMORY[0x1E0D4AF70];
    v13 = v8;
    v9 = *MEMORY[0x1E0D4AF78];
    v14 = *MEMORY[0x1E0D4AF68];
    v15 = v9;
    v16 = CFSTR("None");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v12;
    v7 = 5;
  }
  else
  {
    if (a3 != 1)
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
      return v10;
    }
    v3 = *MEMORY[0x1E0D4AF60];
    v17 = *MEMORY[0x1E0D4AF70];
    v18 = v3;
    v4 = *MEMORY[0x1E0D4AF78];
    v19 = *MEMORY[0x1E0D4AF68];
    v20 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v17;
    v7 = 4;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

@end
