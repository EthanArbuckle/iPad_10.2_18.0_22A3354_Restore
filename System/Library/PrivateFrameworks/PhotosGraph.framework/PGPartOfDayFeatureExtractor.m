@implementation PGPartOfDayFeatureExtractor

- (PGPartOfDayFeatureExtractor)initWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PGPartOfDayFeatureExtractor *v8;
  objc_super v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D4B070];
  v11[0] = *MEMORY[0x1E0D4B060];
  v11[1] = v4;
  v5 = *MEMORY[0x1E0D4B058];
  v11[2] = *MEMORY[0x1E0D4B050];
  v11[3] = v5;
  v11[4] = *MEMORY[0x1E0D4B068];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode partOfDayOfMoment](PGGraphMomentNode, "partOfDayOfMoment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PGPartOfDayFeatureExtractor;
  v8 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v10, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("PartOfDay"), v6, v7, &__block_literal_global_51252);

  return v8;
}

uint64_t __45__PGPartOfDayFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

@end
